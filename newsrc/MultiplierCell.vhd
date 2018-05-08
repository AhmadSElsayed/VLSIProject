library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierCell is
	generic (n : integer := 8);
	port(
		clock : in std_logic;
		P : in std_logic_vector(2*n downto 0);
		A : in std_logic_vector(2*n downto 0);
		S : in std_logic_vector(2*n downto 0);
		result : out std_logic_vector(2*n downto 0)
	);
end entity MultiplierCell;

architecture booth of MultiplierCell is
begin
	process(clock)
	variable temp : std_logic_vector(2*n downto 0);
	begin
		if rising_edge(clock) then
			case P(1 downto 0) is
				when "01" => temp := std_logic_vector(unsigned(P) + unsigned(A));
				when "10" => temp := std_logic_vector(unsigned(P) + unsigned(S));
				when others => temp := P;
			end case;
			result <= temp(2*n) & temp(2*n downto 1);
		end if;
	end process;
end architecture;