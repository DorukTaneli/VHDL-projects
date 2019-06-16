----------------------------------------------------------------------------------
-- Create Date:    13:25:07 04/04/2018 
-- Design Name:    4-bit unsigned division
-- Module Name:    Lab5Tutorial - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 4-bit inputs A and B are received from switches, and  
-- 4-bit result A/B is displayed on the LEDs
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab5Tutorial is
	Generic (N : INTEGER:=50*10**6); -- 50*10^6 Hz Clock
    Port ( MCLK : in  STD_LOGIC;
			  inp : in  STD_LOGIC_VECTOR(7 downto 0);
			  Start : in STD_LOGIC;
			  Bsub : in  STD_LOGIC;
			  Badd : in  STD_LOGIC;
			  Bxor : in  STD_LOGIC;
			  Bneg : in  STD_LOGIC;
			  Bor : in  STD_LOGIC;
			  Band : in  STD_LOGIC;
			  Anodes : out  STD_LOGIC_VECTOR (7 downto 0);
			  SevenSegOut: out STD_LOGIC_VECTOR(6 downto 0);
           outp : out  STD_LOGIC_VECTOR(7 downto 0));
end Lab5Tutorial;

architecture Behavioral of Lab5Tutorial is

--	component adder8 is
--		port (Cin		:	In	Std_logic;
--				X : in STD_LOGIC_VECTOR(7 downto 0);
--				Y : in STD_LOGIC_VECTOR(7 downto 0);
--				R : out STD_LOGIC_VECTOR(7 downto 0);		
--				Cout		:	Out	Std_logic
--		);	
--	end component;


signal CLK_DIV : STD_LOGIC;
signal accum: STD_LOGIC_VECTOR(7 downto 0);
signal nextAccum: STD_LOGIC_VECTOR(7 downto 0);

--local signals
signal Linp: STD_LOGIC_VECTOR(7 downto 0);
signal Laccum: STD_LOGIC_VECTOR(7 downto 0);

--signal Cadd: STD_LOGIC_VECTOR(7 downto 0);
--signal Csub: STD_LOGIC_VECTOR(7 downto 0);
--signal overflow1 : STD_LOGIC;
--signal overflow2 : STD_LOGIC;

-- FSM with 3 states
constant init: STD_LOGIC_VECTOR(2 downto 0) := "001";
constant compute: STD_LOGIC_VECTOR(2 downto 0) := "010";
constant done: STD_LOGIC_VECTOR(2 downto 0) := "100";
-- State variable with 3 flip-flops
signal State: STD_LOGIC_VECTOR(2 downto 0) := "001";  


--to_bcd function
--function to_bcd ( bin : unsigned(7 downto 0) ) return unsigned is
--        variable i : integer:=0;
--        variable bcd : unsigned(11 downto 0) := (others => '0');
--        variable bint : unsigned(7 downto 0) := bin;

--       begin
--        for i in 0 to 7 loop  -- repeating 8 times.
--        bcd(11 downto 1) := bcd(10 downto 0);  --shifting the bits.
--        bcd(0) := bint(7);
--        bint(7 downto 1) := bint(6 downto 0);
--        bint(0) :='0';


--       if(i < 7 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
--        bcd(3 downto 0) := bcd(3 downto 0) + "0011";
--        end if;

--        if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
--        bcd(7 downto 4) := bcd(7 downto 4) + "0011";
--        end if;

--        if(i < 7 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
--        bcd(11 downto 8) := bcd(11 downto 8) + "0011";
--        end if;

--    end loop;
--    return bcd;
--end to_bcd;

begin
--Calc1 : adder8 port map ('0', inp, accum, Cadd, overflow1);
--Calc2 : adder8 port map ('0', not inp, accum, Csub, overflow2);

--seven segment part
process(accum)
begin

case accum is
when "00000000" =>
SevenSegOut <= "0000001"; ---0
when "00000001" =>
SevenSegOut <= "1001111"; ---1
when "00000010" =>
SevenSegOut <= "0010010"; ---2
when "00000011" =>
SevenSegOut <= "0000110"; ---3
when "00000100" =>
SevenSegOut <= "1001100"; ---4
when "00000101" =>
SevenSegOut <= "0100100"; ---5
when "00000110" =>
SevenSegOut <= "0100000"; ---6
when "00000111" =>
SevenSegOut <= "0001111"; ---7
when "00001000" =>
SevenSegOut <= "0000000"; ---8
when "00001001" =>
SevenSegOut <= "0000100"; ---9
when others =>
SevenSegOut <= "1111111"; ---null
end case;

Anodes <= "11111110";

end process;


-- Clock
process(MCLK)
variable Counter : INTEGER range 0 to N;
begin	
		if rising_edge(MCLK) then
			Counter := Counter + 1;
			 -- Clock frequency 1000/2 = 500Hz
			 if (Counter = N/1000-1) then 
					Counter := 0;
					CLK_DIV <= not CLK_DIV;				
			 end if;
		end if;
end process;

-- FSM
process(CLK_DIV)
begin 	
		if rising_edge(CLK_DIV) then			
			case State is
				when init =>
					--transfer inputs to local signals
					Laccum <= accum;
					Linp <= inp;
					if ((Badd = '1') or (Bsub = '1') or (Bneg = '1') or
						 (Bxor = '1') or (Bor = '1')  or (Band = '1')) and (Start = '1') 		then
								State <= compute;
					else
								State <= init;
					end if;
				when compute =>
					if (Badd ='1') then
						nextAccum <= std_logic_vector(signed(Laccum) + signed(Linp));
					elsif (Bsub='1') then
						nextAccum <= std_logic_vector(signed(Laccum) - signed(Linp));
					elsif (Bneg='1') then
						nextAccum <= std_logic_vector(signed(not Laccum) + 1);
					elsif (Bxor='1') then
						nextAccum <= Linp xor Laccum;
					elsif (Bor='1') then
						nextAccum <= Linp or Laccum;
					elsif (Band='1')then
						nextAccum <= Linp and Laccum;	
					end if;
					State <= done;
					
				when done =>
					accum <= nextAccum;
					outp <= accum;
					if Start = '1' then
						State <= done;
					else
						State <= init;
					end if;
					
				when others =>
					State <= init;
					
			end case;
		end if;	
end process;
end Behavioral;

