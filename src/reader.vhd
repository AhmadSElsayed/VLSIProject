library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;    
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.math_real.all;


entity Reader is port
  (	
	clk:       in std_logic; 

	dataOut:   out std_logic_vector(39 downto 0);  
	readerDone:out std_logic
   );
end Reader;

architecture My_Reader of Reader is
------------------------------------- COUNTER declaration

component GenericCounter is
  generic(
		n : positive := 10;
		increment: positive := 2
  );
  port(
		clk, reset: in  std_logic;
		done : out std_logic;
		q : out std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0)
	);
end component;
------------------------------------- MEMORY declaration 

component Memory is port    
  (	
	enable: in std_logic;
	address:in std_logic_vector(4 downto 0); --TODO address = 17 bit i guess

	dataOut:out std_logic_vector(39 downto 0) 
   );
end component;
------------------------------------- SIGNALS
signal done,reset,enable: std_logic;
signal addressOut: std_logic_vector (4 downto 0); --TODO change to 17 bit i guess
signal memData: std_logic_vector (39 downto 0);
-- my_reader arch begins --

begin

	readerCounter: GenericCounter  generic map(n =>31,increment => 5) PORT MAP (clk,reset,done,addressOut);---counter TODO change n =>65560
	theMemory: Memory PORT MAP (enable,addressOut,memData); --NOTE1: assign the clk to the enable, so it changes with the counter.

	process(clk) 
	
	begin
	
		if(clk'event and clk = '1' )then
			dataOut <= memData;	--BUG: there is a bug in this ..dataOut should be equal to memdata, it doesn't happen		
		Else 
			dataOut <=  (others=>'Z');
		End if;

			readerDone <= done;
	end process;

end My_Reader;
-- read from 0 -> 256 *256 +24  = 65560
--my step is 5