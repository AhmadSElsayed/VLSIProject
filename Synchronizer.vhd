LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.constants.all;

entity Synchronizer is
	port(
		Clock, Reset, Start, Operation, Filter, Stride : in std_logic;
		REnable, RRW, Done: out std_logic;
		RDataIn : in std_logic_vector(39 downto 0);
		RDataOut : out std_logic_vector(7 downto 0);
		RAddress : out std_logic_vector(17 downto 0)
	);
end Synchronizer;

architecture FSM of Synchronizer is
	-- Multiplier
	signal MultiplierEnable : std_logic;
	signal MultiplierResult : std_logic_vector (7 downto 0);
	signal imageData, Filterdata : std_logic_vector(199 downto 0);
	-- Cache
	signal CacheMode : std_logic_vector(1 downto 0);
	signal CacheAddress : std_logic_vector(7 downto 0);
	Signal CacheRow : std_logic_vector(2047 downto 0);
	signal CacheWindow : std_logic_vector(199 downto 0);
	-- DMA
	signal DMAReadMode : std_logic;
	signal DMAmode : std_logic_vector(1 downto 0);
	signal read_done, write_done, f_done : std_logic;

	-- States
	signal state : std_logic_vector(3 downto 0);
	
	-- Filter State
	signal filterCount : std_logic_vector(2 downto 0);
	-- Row State
	signal GotoProcess : std_logic;
	-- Process State
	signal processFinishCount : std_logic_vector(2 downto 0);
begin
DMA: entity work.DMA port map(clock, reset, Filter, DMAReadMode, DMAmode, read_done, write_done, f_done, RAddress);
Cache: entity work.Cache port map(clock, Filter, CacheMode, CacheAddress, CacheRow, CacheWindow);
Multiplier: entity work.Multiplier port map(clock, MultiplierEnable, Filter, Operation, imageData, Filterdata, MultiplierResult);

	process(Clock, Reset, Start, state)
	begin
		if reset ='1' then
			state <= STATE_STOPPED;
			done <= '0';
			RRW <= '0';
			REnable <= '0';
			RAddress <= (others => 'Z');
			RDataOut <= (others => '0');
			CacheMode <= "00";
			filtercount<="000";
			MultiplierEnable <= '0';
			GotoProcess <= '0';
		elsif rising_edge(Clock) then
			case STATE IS 
				-- Terminal States
				when STATE_STOPPED =>
					if Start = '1' then 
						state <= State_filter_INIT; 
					end if;
				when State_DONE => REnable <= '0'; DMAMode <= "00"; CacheMode <= "00"; MultiplierEnable <='0'; done <= '1';
				-- Initialization States
				when State_filter_INIT => REnable <= '1'; RRW <='0'; DMAMode <= "01"; DMAReadMode <='0'; CacheMode <= "00"; MultiplierEnable <= '0'; filtercount<="000"; GotoProcess<= '0'; state <= State_Filter;
				when State_ROW_init => REnable <= '1'; RRW <='0'; DMAMode <= "10"; DMAReadMode <='0'; CacheMode <= "00"; MultiplierEnable <= '0'; state <= State_ROW;
				when State_PROCESS_init => REnable <= '1'; RRW <='1'; DMAMode <= "11"; DMAReadMode <='0'; CacheMode <= "11"; MultiplierEnable <= '1'; processFinishCount <= "000"; state <= State_PROCESS;
				-- Wrap Up States
				when State_ROW_Finish => CacheMode <= "10"; state <= State_PROCESS_init;
				when State_PROCESS_finish => processFinishCount <= processFinishCount +1; if processFinishCount = "111" then MultiplierEnable <= '0'; if GotoProcess = '1' then state <= State_row_init; else state <= State_PROCESS_init; end if; end if;
				-- States
				when State_Filter => if operation ='0' then if filtercount = "101" then state <= State_row_init; else FilterData(199 - to_integer(unsigned(filtercount)) * 40 downto 159 - to_integer(unsigned(filtercount)) * 40) <= RDataIn; filtercount<= filtercount +1; end if; else filterdata <= pool_filter; end if;
				when State_ROW => null;
				when State_PROCESS => if Stride = '1' then CacheAddress <= CacheAddress + 2; else CacheAddress <= CacheAddress + 1; end if; if (CacheAddress >= 252 and filter = '1') or (CacheAddress >= 254 and filter = '0') then State <= State_PROCESS_finish; end if;
				when others => null;
			end case;
		end if;
	end process;
end architecture;