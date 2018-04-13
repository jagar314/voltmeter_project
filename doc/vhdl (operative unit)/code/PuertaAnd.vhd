library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PuertaAnd is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           outX : out  STD_LOGIC);
end PuertaAnd;

architecture Behavioral of PuertaAnd is

begin

	outX <= in1 and in2;

end Behavioral;

