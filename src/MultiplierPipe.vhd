library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierPipe is
	generic(n : positive := 8)
	port(
		clk : in std_logic;
		op1, op2 : in std_logic_vector(n-1 downto 0);
		result : out std_logic_vector(n-1 downto 0)
	);
end MultiplierPipe;

architecture pipe of MultiplierPipe is
begin
	process(clk)
	begin			
	end process
end architecture;