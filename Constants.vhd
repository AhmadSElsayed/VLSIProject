LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package Constants is
	constant State_Filter_init		: std_logic_vector(3 downto 0):="0001";
	constant State_ROW_init			: std_logic_vector(3 downto 0):="0010";
	constant State_PROCESS_init		: std_logic_vector(3 downto 0):="0011";
	constant STATE_STOPPED			: std_logic_vector(3 downto 0):="0101";
	constant State_Filter			: std_logic_vector(3 downto 0):="0110";
	constant State_ROW				: std_logic_vector(3 downto 0):="0111";
	constant State_PROCESS			: std_logic_vector(3 downto 0):="1000";
	constant State_DONE				: std_logic_vector(3 downto 0):="1001";
	constant State_ROW_finish		: std_logic_vector(3 downto 0):="1010";
	constant State_PROCESS_finish	: std_logic_vector(3 downto 0):="1011";
	constant pool_filter			: std_logic_vector(199 downto 0) := "00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001";
end package;