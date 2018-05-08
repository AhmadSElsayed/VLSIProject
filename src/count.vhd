library ieee;

use ieee.STD_LOGIC_1164.all;

use ieee.NUMERIC_STD.all;

use ieee.std_logic_unsigned.all;

entity counter is Port ( clk : in STD_LOGIC;

reset: in STD_LOGIC; ----- counter reset

data_in : in std_logic_vector(15 downto 0); ---- input data

done : out std_logic; ---- signal done

data_out : out std_logic_vector(15 downto 0); ----- output data

count : OUT std_logic_vector ( 15 downto 0));  ----- address counter 254 * 254

end counter;

architecture Behavioral of counter is 
signal l_count : std_logic_vector( 15 downto 0);   ---- address of the counter
signal store_address : std_logic_vector(15 downto 0);  --- storing address of the counter
--signal d_out : std_logic_vector(16 downto 0);

begin

process ( clk , reset )


begin 

if (reset = '1') then

l_count <= "0000000000000000";

--------------- when it comes a rising edge we increase the counter by 1
----------------Each time we generate an address equal to counter number  -------
elsif ( clk'event and clk = '1' ) then
l_count <= l_count + 1 ;
data_out <=data_in;
store_address <= l_count;





elsif ( clk'event and clk = '0' ) then
store_address <= "ZZZZZZZZZZZZZZZZ";


---------------- when counter reaches 264 we turn our circuit to an open circuit---------
---------------- by placing high impedence on the address counter -----------------------
---------------- after that we generates a signal done-----------------------------------

elsif (l_count = "1111110000000100") then
l_count <= "ZZZZZZZZZZZZZZZZ";
done <='0';
end if ;
end process;

count <= store_address ;

end Behavioral;

