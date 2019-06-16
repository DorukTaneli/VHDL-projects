----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:25 04/24/2018 
-- Design Name: 
-- Module Name:    fulladd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity fulladd is
	port (Cin, x, y	: 	in	STD_LOGIC;
			s, Cout		:	out	Std_logic 
			);
end fulladd;

Architecture Behavioral of fulladd is
begin
	s <= x xor y xor Cin;
	Cout <= (x and y) or (Cin and x) or (Cin and y);
end Behavioral;

