library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bin2Hex is
    Port ( inX : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC;
           out0 : out  STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
           out5 : out  STD_LOGIC;
           out6 : out  STD_LOGIC;
           out7 : out  STD_LOGIC;
           out8 : out  STD_LOGIC;
           out9 : out  STD_LOGIC;
           outA : out  STD_LOGIC;
           outB : out  STD_LOGIC;
           outC : out  STD_LOGIC;
           outD : out  STD_LOGIC;
           outE : out  STD_LOGIC;
           outF : out  STD_LOGIC);
end Bin2Hex;

architecture Behavioral of Bin2Hex is

	signal salida : std_logic_vector(0 to 15);

begin

	out0 <= salida(0);
	out1 <= salida(1);
	out2 <= salida(2);
	out3 <= salida(3);
	out4 <= salida(4);
	out5 <= salida(5);
	out6 <= salida(6);
	out7 <= salida(7);
	out8 <= salida(8);
	out9 <= salida(9);
	outA <= salida(10);
	outB <= salida(11);
	outC <= salida(12);
	outD <= salida(13);
	outE <= salida(14);
	outF <= salida(15);
	
	salida <= "0000000000000000" when en='0' else
				 "1000000000000000" when (inX="0000" and en='1') else
				 "0100000000000000" when (inX="0001" and en='1') else
				 "0010000000000000" when (inX="0010" and en='1') else
				 "0001000000000000" when (inX="0011" and en='1') else
				 "0000100000000000" when (inX="0100" and en='1') else
				 "0000010000000000" when (inX="0101" and en='1') else
				 "0000001000000000" when (inX="0110" and en='1') else
				 "0000000100000000" when (inX="0111" and en='1') else
				 "0000000010000000" when (inX="1000" and en='1') else
				 "0000000001000000" when (inX="1001" and en='1') else
				 "0000000000100000" when (inX="1010" and en='1') else
				 "0000000000010000" when (inX="1011" and en='1') else
				 "0000000000001000" when (inX="1100" and en='1') else
				 "0000000000000100" when (inX="1101" and en='1') else
				 "0000000000000010" when (inX="1110" and en='1') else
				 "0000000000000001" when (inX="1111" and en='1') else
				 "0000000000000000";


end Behavioral;

