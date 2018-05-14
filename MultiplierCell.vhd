LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MultiplierCell is
	generic (n : integer := 8);
	port(
		clock : in std_logic;
		MultiplicandIn : in std_logic_vector(n-1 downto 0);
		StateIn : in std_logic_vector(2*n-1 downto 0);
		StateOut : out std_logic_vector(2*n-1 downto 0)
	);
end entity MultiplierCell;

architecture booth of MultiplierCell is
signal temp : std_logic_vector(2*n downto 0);
begin
	temp <= (('0' & MultiplicandIn & "00000000") + ('0' & StateIn));
	process(clock)
	begin
		if falling_edge(clock) then
			if StateIn(0) = '0' then
				StateOut <= '0' & StateIn(2*n-1 downto 1);
			else
				StateOut <= temp(2*n downto 1);
			end if;
		end if;
	end process;
end architecture;