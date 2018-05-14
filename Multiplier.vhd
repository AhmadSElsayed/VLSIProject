LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplier is
	port (
		clock, enable, f, operation : in std_logic;
		image, filter: in std_logic_vector(199 downto 0);
		Result : out std_logic_vector(7 downto 0)
	);
end Multiplier;

architecture pipelined of Multiplier is
signal temp_0, temp_1, temp_2, temp_3, temp_4, temp_5, temp_6, temp_7, temp_8, temp_9, temp_10, temp_11, temp_12, temp_13, temp_14, temp_15, temp_16, temp_17, temp_18, temp_19, temp_20, temp_21, temp_22, temp_23, temp_24, temp_sum : std_logic_vector(15 downto 0);
signal e : std_logic;
begin
	pipe_00: entity work.MultiplierPipe port map(e, image(007 downto 000), filter(007 downto 000), temp_0);
	pipe_01: entity work.MultiplierPipe port map(e, image(015 downto 008), filter(015 downto 008), temp_1);
	pipe_02: entity work.MultiplierPipe port map(e, image(023 downto 016), filter(023 downto 016), temp_2);
	pipe_03: entity work.MultiplierPipe port map(e, image(031 downto 024), filter(031 downto 024), temp_3);
	pipe_04: entity work.MultiplierPipe port map(e, image(039 downto 032), filter(039 downto 032), temp_4);
	pipe_05: entity work.MultiplierPipe port map(e, image(047 downto 040), filter(047 downto 040), temp_5);
	pipe_06: entity work.MultiplierPipe port map(e, image(055 downto 048), filter(055 downto 048), temp_6);
	pipe_07: entity work.MultiplierPipe port map(e, image(063 downto 056), filter(063 downto 056), temp_7);
	pipe_08: entity work.MultiplierPipe port map(e, image(071 downto 064), filter(071 downto 064), temp_8);
	pipe_09: entity work.MultiplierPipe port map(e, image(079 downto 072), filter(079 downto 072), temp_9);
	pipe_10: entity work.MultiplierPipe port map(e, image(087 downto 080), filter(087 downto 080), temp_10);
	pipe_11: entity work.MultiplierPipe port map(e, image(095 downto 088), filter(095 downto 088), temp_11);
	pipe_12: entity work.MultiplierPipe port map(e, image(103 downto 096), filter(103 downto 096), temp_12);
	pipe_13: entity work.MultiplierPipe port map(e, image(111 downto 104), filter(111 downto 104), temp_13);
	pipe_14: entity work.MultiplierPipe port map(e, image(119 downto 112), filter(119 downto 112), temp_14);
	pipe_15: entity work.MultiplierPipe port map(e, image(127 downto 120), filter(127 downto 120), temp_15);
	pipe_16: entity work.MultiplierPipe port map(e, image(135 downto 128), filter(135 downto 128), temp_16);
	pipe_17: entity work.MultiplierPipe port map(e, image(143 downto 136), filter(143 downto 136), temp_17);
	pipe_18: entity work.MultiplierPipe port map(e, image(151 downto 144), filter(151 downto 144), temp_18);
	pipe_19: entity work.MultiplierPipe port map(e, image(159 downto 152), filter(159 downto 152), temp_19);
	pipe_20: entity work.MultiplierPipe port map(e, image(167 downto 160), filter(167 downto 160), temp_20);
	pipe_21: entity work.MultiplierPipe port map(e, image(175 downto 168), filter(175 downto 168), temp_21);
	pipe_22: entity work.MultiplierPipe port map(e, image(183 downto 176), filter(183 downto 176), temp_22);
	pipe_23: entity work.MultiplierPipe port map(e, image(191 downto 184), filter(191 downto 184), temp_23);
	pipe_24: entity work.MultiplierPipe port map(e, image(199 downto 192), filter(199 downto 192), temp_24);
	
	temp_sum <= std_logic_vector(
		unsigned(temp_0)+
		unsigned(temp_1)+
		unsigned(temp_2)+
		unsigned(temp_3)+
		unsigned(temp_4)+
		unsigned(temp_5)+
		unsigned(temp_6)+
		unsigned(temp_7)+
		unsigned(temp_8)+
		unsigned(temp_9)+
		unsigned(temp_10)+
		unsigned(temp_11)+
		unsigned(temp_12)+
		unsigned(temp_13)+
		unsigned(temp_14)+
		unsigned(temp_15)+
		unsigned(temp_16)+
		unsigned(temp_17)+
		unsigned(temp_18)+
		unsigned(temp_19)+
		unsigned(temp_20)+
		unsigned(temp_21)+
		unsigned(temp_22)+
		unsigned(temp_23)+
		unsigned(temp_24)
		) when f = '1'
	else
	std_logic_vector(
		unsigned(temp_0)+
		unsigned(temp_1)+
		unsigned(temp_2)+
		unsigned(temp_3)+
		unsigned(temp_4)+
		unsigned(temp_5)+
		unsigned(temp_6)+
		unsigned(temp_7)+
		unsigned(temp_8)
		);
	Result <= temp_sum(7 downto 0) when operation = '0' 
		else temp_sum(12 downto 5) when f = '1'
		else temp_sum(10 downto 3);
		
	e <= clock and enable;
end architecture;