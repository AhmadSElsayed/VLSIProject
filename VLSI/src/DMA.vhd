library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DMA is
	port (
		clock, reset : in std_logic;
		mode : in std_logic_vector(1 downto 0);
		read_done, write_done, f_done : out std_logic;
		address : out std_logic_vector(17 downto 0)
	);
end DMA;

architecture seq of DMA is
signal read_clock, write_clock, f_clock : std_logic;
signal f_pointer: std_logic_vector(17 downto 0);
signal read_pointer: std_logic_vector(17 downto 0);
signal write_pointer: std_logic_vector(17 downto 0);
begin
f_counter : entity work.GenericCounter generic map (5, 1, 18) port map(f_clock, reset, f_done, f_pointer);
read_counter : entity work.GenericCounter generic map (65535, 5, 18) port map(read_clock, reset, read_done, read_pointer);
write_counter : entity work.GenericCounter generic map (65535 , 1, 18) port map(write_clock, reset, write_done, write_pointer);
	
	read_clock <= clock and (not mode(0)) and mode(1);
	write_clock <= clock and mode(0) and mode(1);
	f_clock <= clock and mode(0) and (not mode(1));
	address <= (read_pointer + 5) when mode = "10"
	else (write_pointer + 256*256+5) when mode = "11"
	else f_pointer when mode = "01";
	else (others => '0');
end architecture;