library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity FourBitALU is
	Port (M: in STD_LOGIC;
		   S: in STD_LOGIC_VECTOR(1 downto 0);
	      V : in STD_LOGIC_VECTOR(3 downto 0);
			W : in STD_LOGIC_VECTOR(3 downto 0);
	      CarryIn: in STD_LOGIC;		
			FB: out STD_LOGIC_VECTOR(3 downto 0);
	   	Sev_Seg_Out: out STD_LOGIC_VECTOR(6 downto 0);
			CarryOut: out STD_LOGIC;
			Negative: out STD_LOGIC);
End FourBitALU;

Architecture Behavioral of FourBitALU is
	
	Component BitSliceALU 
		Port (Mode: in STD_LOGIC;
		      Sel: in STD_LOGIC_VECTOR(1 downto 0);
				A,B,Cin : in STD_LOGIC;
				F,Cout: out STD_LOGIC);
	End Component;

Signal T: STD_LOGIC_VECTOR(3 downto 1);
Signal F: STD_LOGIC_VECTOR(3 downto 0);
Signal C: STD_LOGIC;
Begin	
	ALU0:BitSliceALU port map (M, S, V(0), W(0), CarryIn, F(0), T(1));
	ALU1:BitSliceALU port map (M, S, V(1), W(1), T(1), F(1), T(2));
	ALU2:BitSliceALU port map (M, S, V(2), W(2), T(2), F(2), T(3));
	ALU3:BitSliceALU port map (M, S, V(3), W(3), T(3), F(3), C);
	CarryOut <= C;
	
	process(F,M)
	begin
	
		if(M = '0') then
			FB <= F;
		else
			FB <= "0000";
		end if;
		
		
		if(M = '1') then
			case F is
				when "0000" => Sev_Seg_Out <= "0000001";
				when "0001" => Sev_Seg_Out <= "1001111";
				when "0010" => Sev_Seg_Out <= "0010010";
				when "0011" => Sev_Seg_Out <= "0000110";
				when "0100" => Sev_Seg_Out <= "1001100";
				when "0101" => Sev_Seg_Out <= "0100100";
				when "0110" => Sev_Seg_Out <= "0100000";
				when "0111" => Sev_Seg_Out <= "0001111";
				when "1000" => Sev_Seg_Out <= "0000000";
				when "1001" => Sev_Seg_Out <= "0001111";
				when "1010" => Sev_Seg_Out <= "0100000";
				when "1011" => Sev_Seg_Out <= "0100100";
				when "1100" => Sev_Seg_Out <= "1001100";
				when "1101" => Sev_Seg_Out <= "0000110";
				when "1110" => Sev_Seg_Out <= "0010010";
				when "1111" => Sev_Seg_Out <= "1001111";
				when others => Sev_Seg_Out <= "0000001";
			end case;
		else
			Sev_Seg_Out <= "1111111";
		end if;
			
		if (F(3) = '1') then
			Negative <= '1';
		else
			Negative <= '0';
		end if;
	end process;	
					
End Behavioral;