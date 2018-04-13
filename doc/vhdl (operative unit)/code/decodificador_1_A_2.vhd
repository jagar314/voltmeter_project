library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decodificador_1_A_2 is
    Port ( dec_in : in  STD_LOGIC;
           en : in  STD_LOGIC;
           out_0 : out  STD_LOGIC;
           out_1 : out  STD_LOGIC);
end decodificador_1_A_2;

architecture Behavioral of decodificador_1_A_2 is

begin

process(dec_in,en)
begin

if en ='1' then
	if dec_in ='0' then out_0<='1'; out_1<='0';
	elsif dec_in='1' then out_1<='1'; out_0<='0';
	end if;
else
	out_0<='0'; out_1<='0';
end if;

end process;
end Behavioral;

