LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Cache is
	port(
		Clock, f : in std_logic;
		mode : in std_logic_vector(1 downto 0);
		address : in std_logic_vector (7 downto 0);
		RowInput: in std_logic_vector(2047 downto 0);
		Window : out std_logic_vector(199 downto 0)
	);
end Cache;

architecture ShiftingCache of Cache is
signal Row1, Row2, Row3, Row4, Row5 : std_logic_vector(2047 downto 0);
begin

	process(Clock)
	begin
		if falling_edge(clock) then
			if mode = "11" then -- Read
				if f = '1' then
					Window <= 	Row1(2047 - to_integer(unsigned(address))*8 downto 2008 - to_integer(unsigned(address))*8) &
								Row2(2047 - to_integer(unsigned(address))*8 downto 2008 - to_integer(unsigned(address))*8) &
								Row3(2047 - to_integer(unsigned(address))*8 downto 2008 - to_integer(unsigned(address))*8) &
								Row4(2047 - to_integer(unsigned(address))*8 downto 2008 - to_integer(unsigned(address))*8) &
								Row5(2047 - to_integer(unsigned(address))*8 downto 2008 - to_integer(unsigned(address))*8);
				else
					Window <= 	(199 downto 72 => '0') & 
								Row1(2047 - to_integer(unsigned(address))*8 downto 2023 - to_integer(unsigned(address))*8) &
								Row2(2047 - to_integer(unsigned(address))*8 downto 2023 - to_integer(unsigned(address))*8) &
								Row3(2047 - to_integer(unsigned(address))*8 downto 2023 - to_integer(unsigned(address))*8);
				end if;
			elsif mode = "10" then -- Shift
				Row1 <= Row2;
				Row2 <= Row3;
				Row3 <= Row4;
				Row4 <= Row5;
				Row5 <= RowInput;
			else 
				Window <= (others => 'Z');
			end if;
		end if;
	end process;
end architecture; -- Shifting Cache