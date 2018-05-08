
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;    
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Memory is port
  (	
	data:in std_logic_vector(7 downto 0);
	clk:in std_logic; 
	address : in std_logic_vector();
   );

end Reader;

architecture My_Reader of Reader is

------------------------------------- RAM declaration 
type ram is array(127 downto 0) of std_logic_vector(7 downto 0);	
signal addressOut: unsigned(15 downto 0);
signal ram1_1 : ram;	

------------------------------------- COUNTER declararion 
	component Counter is port
  	(	
		clk:in std_logic;
		 q:out unsigned (15 downto 0) 
	);
	end component Counter;
------------------------------------- READER arch begins

begin
	 ReaderCounter:Counter PORT MAP (clk,addressOut);  ---counter 

	process(clk)
	begin
	
		if(clk'event and clk = '1' )then
	
			-- get data from ram & sends to chache
		dataOut <= ram1_1(to_integer(unsigned(address))) 
			& ram1_1(to_integer(arrr))
			& ram1_1(to_integer(addressOut+2))
			& ram1_1(to_integer(addressOut+3))
			& ram1_1(to_integer(addressOut+4) );	
	
		Else 
			dataOut <=  (others=>'Z');

		End if;

	end process;

end My_Reader;
