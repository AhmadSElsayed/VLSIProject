library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Multiplier is
	port (
		clock : in std_logic;
		mode : in std_logic_vector(1 downto 0);
		data_in : in std_logic(39 downto 0);
		Result : out std_logic(7 downto 0)
	);
end Multiplier;

architecture pipelined of Multiplier is
begin



end architecture;