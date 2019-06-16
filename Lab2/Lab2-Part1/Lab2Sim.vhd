--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:03:56 03/01/2018
-- Design Name:   
-- Module Name:   G:/Lab2/Lab2Sim.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MComparator
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
 
ENTITY Lab2Sim IS
END Lab2Sim;
 
ARCHITECTURE behavior OF Lab2Sim IS 
 
    COMPONENT MComparator
    PORT(
         a3 : IN  std_logic;
         a2 : IN  std_logic;
         a1 : IN  std_logic;
         a0 : IN  std_logic;
         b3 : IN  std_logic;
         b2 : IN  std_logic;
         b1 : IN  std_logic;
         b0 : IN  std_logic;
         E : OUT  std_logic;
         Gab : OUT  std_logic;
         Gba : OUT  std_logic
        );
    END COMPONENT;
    
	 
   signal a3 : std_logic := '0';
   signal a2 : std_logic := '0';
   signal a1 : std_logic := '0';
   signal a0 : std_logic := '0';
   signal b3 : std_logic := '0';
   signal b2 : std_logic := '0';
   signal b1 : std_logic := '0';
   signal b0 : std_logic := '0';

   signal E : std_logic;
   signal Gab : std_logic;
   signal Gba : std_logic;
 
   constant Clock_period : time := 10 ns;
 
BEGIN

   uut: MComparator PORT MAP (
          a3 => a3,
          a2 => a2,
          a1 => a1,
          a0 => a0,
          b3 => b3,
          b2 => b2,
          b1 => b1,
          b0 => b0,
          E => E,
          Gab => Gab,
          Gba => Gba
        );

   stim_proc: process
	begin
		a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
		b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0';
		wait for Clock_period;
		a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0';
		b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0';
		wait for Clock_period;
		a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
		b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '0';
		wait for Clock_period;
		a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
		b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0';
		wait;
   end process;

END;
