LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.constants.all;

entity Synchronizer is
	port(
		Clock, Reset, Start, Operation, Filter, Stride : in std_logic;
		REnable, RWR, Done: out std_logic;
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
	signal CacheAddress : std_logic_vector(1 downto 0);
	Signal CacheRow : std_logic_vector(2047 downto 0);
	signal CacheWindow : std_logic_vector(199 downto 0);
	-- DMA
	signal DMAReadMode : std_logic;
	signal DMAmode : std_logic_vector(1 downto 0);
	signal read_done, write_done, f_done : std_logic;

	-- States
	signal state : std_logic_vector(2 downto 0);
	-- Initialization State
	-- Row State
	signal row_row_count : std_logic_vector(2 downto 0);
	signal row_count : std_logic_vector(5 downto 0);
	signal init : std_logic;
	-- Process State
begin
DMA: entity work.DMA port map(clock, reset, Filter, DMAReadMode, mode, read_done, write_done, f_done, RAddress);
Cache: entity work.Cache port map(clock, Filter, CacheMode, CacheAddress, CacheRow, CacheWindow);
Multiplier: entity work.Multiplier port map(clock, MultiplierEnable, Filter, Operation, imageData, Filterdata, MultiplierResult);

	process(Clock, Reset, Start, state)
	begin
		if reset ='1' then
			state <= STATE_STOPPED;
			done <= '0';
			RWR <= '0';
			REnable <= '0';
			RAddress <= (others => 'Z');
			RDataOut <= (others => '0');
			row_count <= (others =>'0');
			init <= '0';
			row_row_count <= (others => '0');
		elsif rising_edge(Clock) then
			case STATE IS 
				when STATE_STOPPED =>
					if Start = '1' then 
						state <= STate_INIT; 
					end if;
				when State_INIT  => 
					DMA_MODE <= "01";
				when State_ROW  =>
					DMA_MODE = "10";
					CacheAddress <= (others => '1');
					CacheMode <= "00";
					if row_count = 52 then
						DMAReadMode <= '1';
					elsif row_count = 53 then
						DMAReadMode <= '0';
						if init = '0' then
							Row_count <= (others => '0');
							row_row_count <= row_row_count + 1;
						else 
							State <= STATE_PROCESS;
						end if;
					end if;
					if row_row_count = "101" then
						init = '1';
					end if;
					row_count <= row_count +1;
				when State_PROCESS  => 
					DMAmode <= "11";
					CacheMode <= "11"; 
					if Stride = '1' then 
						CacheAddress <= CacheAddress + 2;
					else 
						CacheAddress <= CacheAddress + 1;
					end if;
					if (CacheAddress >= 252 and f = '1') or (CacheAddress >= 254 and f = '0') then 
						State <= STATE_ROW;
					end if;
				when State_DONE  => done <= '1';
				when others => null;
			end case;
		end if;
	end process;
	imagedata <= CacheWindow;
	MultiplierEnable <= '1' when state= State_Process else '0';
end architecture;