--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:50:06 03/01/2018
-- Design Name:   
-- Module Name:   G:/lab2part2/SComparatorSim.vhd
-- Project Name:  lab2part2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SComparator
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SComparatorSim IS
END SComparatorSim;
 
ARCHITECTURE behavior OF SComparatorSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SComparator
    PORT(
         c3 : IN  std_logic;
         c2 : IN  std_logic;
         c1 : IN  std_logic;
         c0 : IN  std_logic;
         d3 : IN  std_logic;
         d2 : IN  std_logic;
         d1 : IN  std_logic;
         d0 : IN  std_logic;
         Gcd : OUT  std_logic;
         E : OUT  std_logic;
         Gdc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal c3 : std_logic := '0';
   signal c2 : std_logic := '0';
   signal c1 : std_logic := '0';
   signal c0 : std_logic := '0';
   signal d3 : std_logic := '0';
   signal d2 : std_logic := '0';
   signal d1 : std_logic := '0';
   signal d0 : std_logic := '0';

 	--Outputs
   signal Gcd : std_logic;
   signal E : std_logic;
   signal Gdc : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: SComparator PORT MAP (
          c3 => c3,
          c2 => c2,
          c1 => c1,
          c0 => c0,
          d3 => d3,
          d2 => d2,
          d1 => d1,
          d0 => d0,
          Gcd => Gcd,
          E => E,
          Gdc => Gdc
        );

   -- Stimulus process
   stim_proc: process
   begin		
		c3 <= '0'; c2 <= '0'; c1 <= '0'; c0 <= '0';
		c3 <= '0'; c2 <= '0'; d1 <= '0'; d0 <= '0';
		wait for Clock_period;
		c3 <= '0'; c2 <= '1'; c1 <= '0'; c0 <= '0';
		d3 <= '0'; d2 <= '0'; d1 <= '0'; d0 <= '0';
		wait for Clock_period;
		c3 <= '0'; c2 <= '0'; c1 <= '0'; c0 <= '0';
		d3 <= '0'; d2 <= '0'; d1 <= '1'; d0 <= '0';
		wait for Clock_period;
		c3 <= '1'; c2 <= '0'; c1 <= '0'; c0 <= '0';
		d3 <= '0'; d2 <= '0'; d1 <= '0'; d0 <= '0';
		wait for Clock_period;
		c3 <= '0'; c2 <= '0'; c1 <= '0'; c0 <= '0';
		d3 <= '1'; d2 <= '0'; d1 <= '0'; d0 <= '0';
		wait for Clock_period;
		c3 <= '0'; c2 <= '0'; c1 <= '0'; c0 <= '0';
		d3 <= '0'; d2 <= '0'; d1 <= '0'; d0 <= '0';
      wait;
   end process;

END;
