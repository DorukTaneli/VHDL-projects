--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:15:26 03/15/2018
-- Design Name:   
-- Module Name:   G:/lab3/lab3Sim.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitALU
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
 
ENTITY lab3sim IS
END lab3sim;
 
ARCHITECTURE behavior OF lab3sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitALU
    PORT(
         M : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         V : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic_vector(3 downto 0);
         CarryIn : IN  std_logic;
         FB : OUT  std_logic_vector(3 downto 0);
         Sev_Seg_Out : OUT  std_logic_vector(6 downto 0);
         CarryOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal M : std_logic := '0';
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal V : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic_vector(3 downto 0) := (others => '0');
   signal CarryIn : std_logic := '0';

 	--Outputs
   signal FB : std_logic_vector(3 downto 0) := (others => '0');
   signal Sev_Seg_Out : std_logic_vector(6 downto 0) := (others => '0');
   signal CarryOut : std_logic := '0';
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitALU PORT MAP (
          M => M,
          S => S,
          V => V,
          W => W,
          CarryIn => CarryIn,
          FB => FB,
          Sev_Seg_Out => Sev_Seg_Out,
          CarryOut => CarryOut
        );

   -- Stimulus process
   stim_proc: process
   begin		
			M <= '1' ; V <= "0010"; W <= "0000"; S<= "00"; CarryIn <= '0';
		wait for Clock_period;
			M <= '1' ; V <= "1010"; W <= "1001"; S<= "10"; CarryIn <= '1';
		wait for Clock_period;
			M <= '1' ; V <= "1110"; W <= "1101"; S<= "01"; CarryIn <= '0';
		wait for Clock_period;
			M <= '1' ; V <= "1110"; W <= "1101"; S<= "11"; CarryIn <= '1';
		wait for Clock_period;
			M <= '0' ; V <= "1010"; W <= "1001"; S<= "10";
		wait for Clock_period;
			M <= '0' ; V <= "1110"; W <= "1101"; S<= "01";
		wait for Clock_period;
			M <= '0' ; V <= "1110"; W <= "1101"; S<= "11";
		wait for Clock_period;
			M <= '0' ; V <= "0000"; W <= "0000"; S<= "00";     
		wait;
   end process;

END;

