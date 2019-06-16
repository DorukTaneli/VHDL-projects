--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:06:59 03/29/2018
-- Design Name:   
-- Module Name:   G:/Lab4.2/Lab4Sim.vhd
-- Project Name:  Lab4.2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab4Code
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
 
ENTITY Lab4Sim IS
END Lab4Sim;
 
ARCHITECTURE behavior OF Lab4Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab4Code
    PORT(
         MCLK : IN  std_logic;
         left_catch : IN  std_logic;
         right_catch : IN  std_logic;
         LEDs : OUT  std_logic_vector(9 downto 0);
			
			CH : OUT std_logic;
			CL : OUT std_logic;
			
         Sev_Seg_Out : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MCLK : std_logic := '0';
   signal left_catch : std_logic := '0';
   signal right_catch : std_logic := '0';

 	--Outputs
   signal LEDs : std_logic_vector(9 downto 0);
   signal Sev_Seg_Out : std_logic_vector(6 downto 0);
	
	signal CH : std_logic;
	signal CL : std_logic;
	
	
   -- Clock period definitions
   constant MCLK_period : time := 2 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab4Code PORT MAP (
          MCLK => MCLK,
          left_catch => left_catch,
          right_catch => right_catch,
          LEDs => LEDs,
          Sev_Seg_Out => Sev_Seg_Out,
			 
			 CH => CH,
			 CL => CL
        );

   -- Clock process definitions
   MCLK_process :process
   begin
		MCLK <= '0';
		wait for MCLK_period/2;
		MCLK <= '1';
		wait for MCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ps;	
			left_catch <= '1'; right_catch <= '1';
      wait for MCLK_period*10;
			left_catch <= '0'; right_catch <= '0';
      -- insert stimulus here 
      wait;
   end process;

END;
