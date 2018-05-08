library ieee;
use IEEE.std_logic_1164.all;

entity Initializer is 
	generic(
		AddressSize : natural := 17;
		DataSize : natural := 40
	);
	port(
		clk : in std_logic;
		data_in : in std_logic_vector(DataSize-1 downto 0);
		init_done : out std_logic := 0;
		address : out std_logic_vector(AddressSize-1 downto 0) := (others => '0');
		data_out : out std_logic_vector(DataSize-1 downto 0) := (others => '0')
	);
end entity Initializer;

architecture seq of Initializer is
signal done : std_logic;
signal address_value : std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0);
Counter : GenericCounter port map(clk, '0', done, address_value) generic map (256*5 + 5, 5);
begin
	process(clk)
	begin
		if rising_edge(clk) and done = '0' then
			address <= address_value;
			data_out <= data_in;
		end if;

	end process;
end architecture seq;
