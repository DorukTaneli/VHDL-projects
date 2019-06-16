----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:58 03/26/2018 
-- Design Name: 
-- Module Name:    Lab4Code - Behavioral 
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

entity Lab4Code is
	Generic (N : INTEGER:=50*10**6); --50*10**6 50*10ˆ6 Hz Clock
	Port (MCLK : in STD_LOGIC;
			left_catch : in STD_LOGIC; --Push button input
			right_catch : in STD_LOGIC;
			LEDs : out STD_LOGIC_VECTOR(9 downto 0);
			
			CH : out STD_LOGIC;
			CL : out STD_LOGIC;
			
			Sev_Seg_Out: out STD_LOGIC_VECTOR(6 downto 0));
end Lab4Code;

architecture Behavioral of Lab4Code is
	signal CLK_DIV : STD_LOGIC;
	type states is (one,two_r,two_l,three_r,three_l,four_r,four_l,
			five_r,five_l,six_r,six_l,seven_r,seven_l,eight_r,eight_l,nine_r,nine_l,ten);
	signal current_state, next_state: states;
	
begin

CH <= CLK_DIV;
CL <= not CLK_DIV;


--Clock divider
process(MCLK)
variable Counter : INTEGER range 0 to N;
begin
	if rising_edge(MCLK) then
		Counter := Counter + 1;
		if (Counter = N/2-1) then
			Counter := 0;
			CLK_DIV <= not CLK_DIV;
		end if;
	end if;
end process;


--LED shifter
process(CLK_DIV, current_state, right_catch, left_catch)
variable cnt : INTEGER range 0 to 9;
begin
	if rising_edge(CLK_DIV) then
		current_state <= next_state;
	end if;
	
	if falling_edge(CLK_DIV) then
		if (current_state = one) then
			if(left_catch = '1') then
				cnt := cnt + 1;
			end if;
		end if;
		if (current_state = ten) then
			if(right_catch = '1') then
				cnt := cnt + 1;
			end if;
		end if;
	end if;
	
	case(cnt) is
		when 0 => Sev_Seg_Out <= "0000001";
		when 1 => Sev_Seg_Out <= "1001111";
		when 2 => Sev_Seg_Out <= "0010010";
		when 3 => Sev_Seg_Out <= "0000110";
		when 4 => Sev_Seg_Out <= "1001100";
		when 5 => Sev_Seg_Out <= "0100100";
		when 6 => Sev_Seg_Out <= "0100000";
		when 7 => Sev_Seg_Out <= "0001111";
		when 8 => Sev_Seg_Out <= "0000000";
		when 9 => Sev_Seg_Out <= "0000100";
		when others => Sev_Seg_Out <= "1111110";
	end case;
	
end process;


process(current_state)
begin
	case(current_state) is	
		when one => next_state <= two_r;
				LEDs <= "1000000000";
		when two_r => next_state <= three_r;
				LEDs <= "0100000000";
		when three_r => next_state <= four_r;
				LEDs <= "0010000000";
		when four_r => next_state <= five_r;
				LEDs <= "0001000000";
		when five_r => next_state <= six_r;
				LEDs <= "0000100000";
		when six_r => next_state <= seven_r;
				LEDs <= "0000010000";
		when seven_r => next_state <= eight_r;
				LEDs <= "0000001000";
		when eight_r => next_state <= nine_r;
				LEDs <= "0000000100";
		when nine_r => next_state <= ten;
				LEDs <= "0000000010";
		when ten => next_state <= nine_l;
				LEDs <= "0000000001";
		when nine_l => next_state <= eight_l;
				LEDs <= "0000000010";
		when eight_l => next_state <= seven_l;
				LEDs <= "0000000100";
		when seven_l => next_state <= six_l;
				LEDs <= "0000001000";
		when six_l => next_state <= five_l;
				LEDs <= "0000010000";
		when five_l => next_state <= four_l;
				LEDs <= "0000100000";
		when four_l => next_state <= three_l;
				LEDs <= "0001000000";
		when three_l => next_state <= two_l;
				LEDs <= "0010000000";
		when two_l => next_state <= one;
				LEDs <= "0100000000";
	end case;
		
	
end process;	
end Behavioral;

