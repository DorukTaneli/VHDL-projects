library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity OneBitFullAdder is
      Port (X,Y,CarryIn : in STD_LOGIC;
				CarryOut,Sum : out STD_LOGIC);
End OneBitFullAdder;

Architecture Behavioral of OneBitFullAdder is
Begin
	Sum      <=  X xor Y xor CarryIn;
	CarryOut <= ((X XOR Y) AND CarryIn) OR (X AND Y);
End Behavioral;
