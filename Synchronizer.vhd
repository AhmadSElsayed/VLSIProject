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
	--signal MultiplierResult : std_logic_vector (7 downto 0);
	signal Filterdata : std_logic_vector(199 downto 0);
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
	signal row_count : std_logic_vector(5 downto 0);
	signal row_row_count : std_logic_vector(2 downto 0);
	-- Process State
	signal processFinishCount : std_logic_vector(2 downto 0);
begin
DMA: entity work.DMA port map(clock, reset, Filter, DMAReadMode, DMAmode, read_done, write_done, f_done, RAddress);
Cache: entity work.Cache port map(clock, Filter, CacheMode, CacheAddress, CacheRow, CacheWindow);
Multiplier: entity work.Multiplier port map(clock, MultiplierEnable, Filter, Operation, CacheWindow, Filterdata, RDataOut);

	process(Clock, Reset, Start, state)
	begin
		if reset ='1' then
			state <= STATE_STOPPED;
			done <= '0';
			RRW <= '0';
			REnable <= '0';
			RAddress <= (others => 'Z');
			--RDataOut <= (others => '0');
			CacheMode <= "00";
			filtercount<="000";
			MultiplierEnable <= '0';
			GotoProcess <= '0';
			row_count <= (others =>'0');
			row_row_count <= (others => '0');
			cacheaddress <= (others =>'0');
			cacherow <= (others =>'0');
			processFinishCount <= "000";
			filterdata <= (others =>'0');
		elsif rising_edge(Clock) then
			case STATE IS 
				-- Terminal States
				when STATE_STOPPED =>
					if Start = '1' then 
						state <= State_filter_INIT; 
					end if;
				when State_DONE => REnable <= '0'; DMAMode <= "00"; CacheMode <= "00"; MultiplierEnable <='0'; done <= '1';
				-- Initialization States
				when State_filter_INIT => REnable <= '1'; RRW <='0'; DMAMode <= "01"; DMAReadMode <='0'; CacheMode <= "00"; MultiplierEnable <= '0'; filtercount<="000"; GotoProcess<= '0'; row_row_count <= "000"; state <= State_Filter;
				when State_ROW_init => REnable <= '1'; RRW <='0'; DMAMode <= "10"; DMAReadMode <='1'; CacheMode <= "00"; MultiplierEnable <= '0'; row_count <= (others =>'0'); state <= State_ROW;
				when State_PROCESS_init => REnable <= '1'; RRW <='1'; DMAMode <= "11"; DMAReadMode <='0'; CacheMode <= "11"; MultiplierEnable <= '1'; processFinishCount <= "000"; state <= State_PROCESS;
				-- Wrap Up States
				when State_ROW_Finish => CacheMode <= "10"; row_row_count <= row_row_count +1; if row_row_count = "011" then GotoProcess <= '1'; state <= State_PROCESS_init;  end if; if GotoProcess = '1' then state <= State_PROCESS_init; else state <=State_ROW_init; end if;
				when State_PROCESS_finish => processFinishCount <= processFinishCount +1; if processFinishCount = "111" then MultiplierEnable <= '0'; if GotoProcess = '1' then state <= State_row_init; else state <= State_PROCESS_init; end if; end if; if read_done = '1' then state <= State_done; end if;
				-- States
				when State_Filter => if operation ='0' then if filtercount = "100" then state <= State_row_init; else FilterData(199 - to_integer(unsigned(filtercount)) * 40 downto 160 - to_integer(unsigned(filtercount)) * 40) <= RDataIn; filtercount<= filtercount +1; end if; else filterdata <= pool_filter; end if;
				when State_ROW =>  row_count <= row_count +1; if row_count ="000000" then DMAReadMode <= '0'; CacheRow(2047 downto 2040) <= RDataIn(39 downto 32); else CacheRow(2079 - to_integer(unsigned(row_count)) * 40 downto 2040 - to_integer(unsigned(row_count)) * 40) <= RDataIn; if row_count >= "110010" then state <= State_ROW_Finish; end if; end if;
				when State_PROCESS => if Stride = '1' then CacheAddress <= CacheAddress + 2; else CacheAddress <= CacheAddress + 1; end if; if (CacheAddress >= 250 and filter = '1') or (CacheAddress >= 252 and filter = '0') then State <= State_PROCESS_finish; CacheMode <= "00"; end if;
				when others => null;
			end case;
		end if;
	end process;
end architecture;