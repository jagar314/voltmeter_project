library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity codificacor_2_A_1 is
    Port ( Entrada : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC);
end codificacor_2_A_1;

architecture Behavioral of codificacor_2_A_1 is

begin

	salida<='0' when Entrada="01" else
			  '1' when Entrada="10" else
			  '0';



end Behavioral;

