library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DMA is
	port (
		clock, reset, filter, readmode : in std_logic;
		mode : in std_logic_vector(1 downto 0);
		read_done, write_done, f_done : out std_logic;
		address : out std_logic_vector(17 downto 0)
	);
end DMA;

architecture seq of DMA is
signal f_pointer: std_logic_vector(17 downto 0);
signal read_pointer: std_logic_vector(17 downto 0);
signal write_pointer: std_logic_vector(17 downto 0);
signal temp_address : std_logic_vector(17 downto 0);
begin
	process (clock, reset)
	begin
		if reset = '1' then 
			f_pointer <= (others => '0');
			read_pointer <= (others => '0');
			write_pointer <= (others => '0');
			read_done <= '0';
			write_done <= '0';
			f_done <= '0';
			address <= (others => 'Z');
		elsif falling_edge(clock) then 
			case mode is
				when "01" => temp_address <= f_pointer; f_pointer <= f_pointer + 5;
				when "10" => temp_address <= read_pointer; if readmode = '0' then read_pointer <= read_pointer + 5; else read_pointer <= read_pointer + 1; end if;
				when "11" => temp_address <= write_pointer; write_pointer <= write_pointer + 1;
				when others => null;
			end case;
		end if;
	end process;

	f_done <= '1'		when f_pointer >= 20 else '0';
	read_done <= '1'	when read_pointer >= 65536 else '0';
	write_done <= '1'	when write_pointer >= 65536 else '0';

	address <=
				(temp_address + 5) when mode = "10"
		else	(temp_address + 256*256+5) when mode = "11"
		else	temp_address when mode = "01"
		else	(others => '0');
end architecture;