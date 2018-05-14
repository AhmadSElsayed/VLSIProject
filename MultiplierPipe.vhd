library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierPipe is
	generic(n : positive := 8);
	port(
		clock : in std_logic;
		image, filter: in std_logic_vector(n-1 downto 0);
		result : out std_logic_vector(2*n-1 downto 0)
	);
end MultiplierPipe;

architecture pipe of MultiplierPipe is
signal f, P, P_0, P_1, P_2, P_3 , P_4, P_5, P_6, P_7 : std_logic_vector(2*n-1 downto 0);
begin
M0: entity work.MultiplierCell port map(clock, filter, P,   P_0);
M1: entity work.MultiplierCell port map(clock, filter, P_0, P_1);
M2: entity work.MultiplierCell port map(clock, filter, P_1, P_2);
M3: entity work.MultiplierCell port map(clock, filter, P_2, P_3);
M4: entity work.MultiplierCell port map(clock, filter, P_3, P_4);
M5: entity work.MultiplierCell port map(clock, filter, P_4, P_5);
M6: entity work.MultiplierCell port map(clock, filter, P_5, P_6);
M7: entity work.MultiplierCell port map(clock, filter, P_6, P_7);
	P <= "00000000"& image;
	result <= P_7;
end architecture;