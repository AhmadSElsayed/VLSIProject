library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memory is
	port (
		clk, enable, rw : in std_logic;
		address : in std_logic_vector(17 downto 0);
		data_out : out std_logic_vector(39 downto 0);
		data_in : in std_logic_vector(7 downto 0)
	);
end Memory;

architecture seq of Memory is
type ram is array(0 to 256*256*2+4) of std_logic_vector(7 downto 0);
signal mem : ram; 
begin
	process(clk, enable)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				if rw = '0' then
					data_out <= mem(to_integer(unsigned(address))) & mem(to_integer(unsigned(address))+1) & mem(to_integer(unsigned(address))+2) & mem(to_integer(unsigned(address))+3) & mem(to_integer(unsigned(address))+4);
				else
					mem(to_integer(unsigned(address))) <= data_in;
				end if;
			else
				data_out <= (others => 'Z');
			end if;
		end if;
	end process;
end architecture;