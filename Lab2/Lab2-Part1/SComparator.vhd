----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:42 03/01/2018 
-- Design Name: 
-- Module Name:    SComparator - Behavioral 
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

entity SComparator is
    Port ( c3 : in  STD_LOGIC;
           c2 : in  STD_LOGIC;
           c1 : in  STD_LOGIC;
           c0 : in  STD_LOGIC;
           d3 : in  STD_LOGIC;
           d2 : in  STD_LOGIC;
           d1 : in  STD_LOGIC;
           d0 : in  STD_LOGIC;
           E : out  STD_LOGIC;
           Gcd : out  STD_LOGIC;
           Gdc : out  STD_LOGIC);
end SComparator;

architecture Behavioral of SComparator is
		signal x3 : STD_LOGIC;
		signal x2 : STD_LOGIC;
		signal x1 : STD_LOGIC;
		signal x0 : STD_LOGIC;
begin
		x3 <= a3 xnor b3;
		x2 <= a2 xnor b2;
		x1 <= a1 xnor b1;
		x0 <= a0 xnor b0;
		
		E <= x3 and x2 and x1 and x0;
		

end Behavioral;

