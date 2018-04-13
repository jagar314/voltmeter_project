library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexor2_A_1 is
    Port ( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplexor2_A_1;



architecture Behavioral of Multiplexor2_A_1 is

begin

Salida <= Q0 when sel='0' else 
			 Q1 when sel='1' else
			 Q0;
	
end Behavioral;

