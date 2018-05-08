library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity GenericCounter is
	generic(
		n : positive := 16;
		increment: positive := 1;
		q_size : positive := 4
	);
	port(
		clk, reset: in  std_logic;
		done : out std_logic;
		--q : out std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0)
		q : out std_logic_vector(q_size-1 downto 0)

	);
end GenericCounter;

architecture behavioral of GenericCounter is
signal count : std_logic_vector(q'range) := (others => '0');
begin
	process(clk, reset)
	begin
		if reset = '1' then
			count <= (others => '0');
			done <= '1';
		elsif falling_edge(clk) then
			if count >= n-1 then
				done <= '1';
			else
				count <= count + increment;
				done <= '0';
			end if;
		end if;
	end process;
q <= count;
end architecture;