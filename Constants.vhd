LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package Constants is
	constant STATE_STOPPED		: std_logic_vector(2 downto 0):="000";
	constant State_INIT			: std_logic_vector(2 downto 0):="001";
	constant State_ROW			: std_logic_vector(2 downto 0):="010";
	constant State_PROCESS		: std_logic_vector(2 downto 0):="011";
	constant State_DONE			: std_logic_vector(2 downto 0):="100";
end package;