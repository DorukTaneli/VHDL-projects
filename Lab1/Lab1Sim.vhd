--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:00:35 02/21/2018
-- Design Name:   
-- Module Name:   G:/Lab1/Lab1Sim.vhd
-- Project Name:  Lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab1Code
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
 
ENTITY Lab1Sim IS
END Lab1Sim;
 
ARCHITECTURE behavior OF Lab1Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Lab1Code
    PORT(
         X : IN  std_logic;
         Y : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal X : std_logic := '0';
   signal Y : std_logic := '0';

 	--Outputs
   signal Z : std_logic;
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab1Code PORT MAP (
          X => X,
          Y => Y,
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		
					X <= '0'; Y <= '0';
		wait for Clock_period;
					X <= '1'; Y <= '0';
		wait for Clock_period;
					X <= '0'; Y <= '1';
		wait for Clock_period;
					X <= '1'; Y <= '1';
		wait for Clock_period;
					X <= '0'; Y <= '0';
      wait;
   end process;
END;
