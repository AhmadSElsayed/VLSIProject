library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierCell is
	generic (n : integer := 8);
	port(
		inwindow : in std_logic_vector(2*n+1 downto 0);
		filter : in std_logic_vector(2*n+1 downto 0);
		filter2 : in std_logic_vector(2*n+1 downto 0);
		outwindow : out std_logic_vector(2*n+1 downto 0)
	);
end entity MultiplierCell;

architecture booth of MultiplierCell is
signal temp : std_logic_vector(2*n+2 downto 0);
begin
	process(clk)
	begin
		if inwindow(1 downto 0) = "01" then
			temp <= std_logic_vector(unsigned(inwindow) + unsigned(filter)) 
		elsif inwindow (1 downto 0)="10" then
			temp <= std_logic_vector(unsigned(inwindow) + unsigned(filter2)) 
		else 
			temp <= inwindow;
		outwindow <= temp(2*n+1)&temp(2*n+1 downto 1);
	end process;
end architecture;