----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:39 03/01/2018 
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
           Gcd : out  STD_LOGIC;
           E : out  STD_LOGIC;
           Gdc : out  STD_LOGIC);
end SComparator;

architecture Behavioral of SComparator is
		signal x3 : STD_LOGIC;
		signal x2 : STD_LOGIC;
		signal x1 : STD_LOGIC;
		signal x0 : STD_LOGIC;
		
		signal nc3 : STD_LOGIC;
		signal nc2 : STD_LOGIC;
		signal nc1 : STD_LOGIC;
		signal nc0 : STD_LOGIC;
		
		signal nd3 : STD_LOGIC;
		signal nd2 : STD_LOGIC;
		signal nd1 : STD_LOGIC;
		signal nd0 : STD_LOGIC;
begin
		x3 <= c3 xnor d3;
		x2 <= c2 xnor d2;
		x1 <= c1 xnor d1;
		x0 <= c0 xnor d0;
		
		nc3 <= not c3;
		nc2 <= not c2;
		nc1 <= not c1;
		nc0 <= not c0;
		
		nd3 <= not d3;
		nd2 <= not d2;
		nd1 <= not d1;
		nd0 <= not d0;
		
		E <= x3 and x2 and x1 and x0;
		Gcd <= (nc3 and d3) or (x3 and c2 and nd2) or (x3 and x2 and c1 and nd1) or (x3 and x2 and x1 and c0 and nd0);
		Gdc <= (c3 and nd3) or (x3 and nc2 and d2) or (x3 and x2 and nc1 and d1) or (x3 and x2 and x1 and nc0 and d0);

end Behavioral;

