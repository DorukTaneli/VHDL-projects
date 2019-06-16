----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:14 03/01/2018 
-- Design Name: 
-- Module Name:    MComparator - Behavioral 
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

entity MComparator is
    Port ( a3 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           b3 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           E : out  STD_LOGIC;
           Gab : out  STD_LOGIC;
           Gba : out  STD_LOGIC);
end MComparator;

architecture Behavioral of MComparator is
		signal x3 : STD_LOGIC;
		signal x2 : STD_LOGIC;
		signal x1 : STD_LOGIC;
		signal x0 : STD_LOGIC;
		
		signal na3 : STD_LOGIC;
		signal na2 : STD_LOGIC;
		signal na1 : STD_LOGIC;
		signal na0 : STD_LOGIC;
		
		signal nb3 : STD_LOGIC;
		signal nb2 : STD_LOGIC;
		signal nb1 : STD_LOGIC;
		signal nb0 : STD_LOGIC;
		
		signal a3nb3 : STD_LOGIC;
		signal x3a2nb2 : STD_LOGIC;
		signal x3x2a1nb1 : STD_LOGIC;
		signal x3x2x1a0nb0 : STD_LOGIC;		
		
		signal na3b3 : STD_LOGIC;
		signal x3na2b2 : STD_LOGIC;
		signal x3x2na1b1 : STD_LOGIC;
		signal x3x2x1na0b0 : STD_LOGIC;			

begin
		x3 <= a3 xnor b3;
		x2 <= a2 xnor b2;
		x1 <= a1 xnor b1;
		x0 <= a0 xnor b0;
		
		na3 <= not a3;
		na2 <= not a2;
		na1 <= not a1;
		na0 <= not a0;
		
		nb3 <= not b3;
		nb2 <= not b2;
		nb1 <= not b1;
		nb0 <= not b0;
		
		a3nb3 <= a3 and nb3;
		x3a2nb2 <= x3 and a2 and nb2;
		x3x2a1nb1 <= x3 and x2 and a1 and nb1;
		x3x2x1a0nb0 <= x3 and x2 and x1 and a0 and nb0;
		
		na3b3 <= na3 and b3;
		x3na2b2 <= x3 and na2 and b2;
		x3x2na1b1 <= x3 and x2 and na1 and b1;
		x3x2x1na0b0 <= x3 and x2 and x1 and na0 and b0;		
		
		E <= x3 and x2 and x1 and x0;
		Gab <= a3nb3 or x3a2nb2 or x3x2a1nb1 or x3x2x1a0nb0;
		Gba <= na3b3 or x3na2b2 or x3x2na1b1 or x3x2x1na0b0;

end Behavioral;

