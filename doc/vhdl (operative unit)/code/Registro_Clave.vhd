library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registro_8bits is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  reset : in std_logic;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end registro_8bits;

architecture Behavioral of registro_8bits is

	signal q_interna : std_logic_vector(7 downto 0):="00000000";
	
begin
	
	Q<=q_interna;
	
process(D,ce,clk,reset)
begin

	if reset='1'
		then q_interna<="00000000";
	elsif (clk'event and clk='1') then
		if ce='1' 
			then q_interna<=D;
		end if;
	end if;
end process;	

		
		




end Behavioral;

