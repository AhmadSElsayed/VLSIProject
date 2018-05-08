library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MultiplierPipe is
	generic(n : positive := 8);
	port(
		clock : in std_logic;
		image, filter, inverted_filter: in std_logic_vector(n-1 downto 0);
		result : out std_logic_vector(n-1 downto 0)
	);
end MultiplierPipe;

architecture pipe of MultiplierPipe is
signal f, invf, P, P_0, P_1, P_2, P_3 , P_4, P_5, P_6, P_7 : std_logic_vector(2*n downto 0);
begin
M0: entity work.MultiplierCell port map(clock, P, f, invf, P_0);
M1: entity work.MultiplierCell port map(clock, P_0, f, invf, P_1);
M2: entity work.MultiplierCell port map(clock, P_1, f, invf, P_2);
M3: entity work.MultiplierCell port map(clock, P_2, f, invf, P_3);
M4: entity work.MultiplierCell port map(clock, P_3, f, invf, P_4);
M5: entity work.MultiplierCell port map(clock, P_4, f, invf, P_5);
M6: entity work.MultiplierCell port map(clock, P_5, f, invf, P_6);
M7: entity work.MultiplierCell port map(clock, P_6, f, invf, P_7);
	f <= filter & "000000000";
	invf <= inverted_filter & "000000000";
	P <= "00000000" & image & '0' when falling_edge(clock);
	result <= P_7(n downto 1) when falling_edge(clock);
end architecture;