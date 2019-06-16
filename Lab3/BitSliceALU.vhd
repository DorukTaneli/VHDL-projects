library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity BitSliceALU is
	Port (	Mode: in STD_LOGIC;
				Sel: in STD_LOGIC_VECTOR(1 downto 0);
				A,B,Cin : in STD_LOGIC;
				F,Cout : out STD_LOGIC);
End BitSliceALU;

Architecture Behavioral of BitSliceALU is
	
	Component OneBitFullAdder
		Port (X,Y, CarryIn : in STD_LOGIC;
		      CarryOut,Sum : out STD_LOGIC);
	End Component;
	
	signal LogicOut : STD_LOGIC;
	signal ArithOut : STD_LOGIC_VECTOR (1 downto 0);
	signal FuncOut  : STD_LOGIC_VECTOR (1 downto 0);
	
	signal Arg      : STD_LOGIC_VECTOR (1 downto 0);
Begin
	
	FA: OneBitFullAdder port map (Arg(1),Arg(0),Cin, ArithOut(1),ArithOut(0));
	
	with Mode select
		FuncOut <= 	('0' & LogicOut) 	when '0', 
						ArithOut 			when '1',
				      "00" 					when others;
	
	with Sel select
	    LogicOut <= 	(A and B)  when "00",
							(A or B)   when "01",
							(A xor B)  when "10",
							(A xnor B) when "11",
							'0' 		  when others;
	
	with Sel select
	      Arg <= (A & '0')   when "00", 
			(A, B)    			 when "01", 
			(A, not B) 			 when "10",
			(not A, B) 		 	 when "11",
		    "00"      			 when others;
	
	Cout <= FuncOut(1);
	F <= FuncOut(0);
End Behavioral;

