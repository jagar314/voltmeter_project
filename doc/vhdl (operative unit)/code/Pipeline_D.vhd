library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pipeline_D is
    Port ( D : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end Pipeline_D;

architecture Behavioral of Pipeline_D is

	signal q_interna : std_logic;

begin
	q<=q_interna;
	
process(D,reset,clk)
begin
	
	if(reset='1') then 
			q_interna<='0';
	elsif(rising_edge(clk))then
		
		if (D='0') then
			q_interna<='0';
		elsif (D='1') then
			q_interna<='1';
		end if;
			
	
	end if;
end process;
end Behavioral;

