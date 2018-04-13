library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Biestable_RS is
    Port ( clk : in  STD_LOGIC;
           r : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           s : in  STD_LOGIC;
           q : out  STD_LOGIC);
end Biestable_RS;

architecture Behavioral of Biestable_RS is

signal q_interna : std_logic;

begin

	q<=q_interna;

process(clk,r,s)
begin

if(rising_edge(clk)) then
	if(reset='1')then
		q_interna<='0';
	elsif(r='0' and s='0')
		then q_interna<=q_interna;
	elsif(r='1' and s='0')
		then q_interna<='0';
	elsif(r='0' and s='1')
		then q_interna<='1';
	elsif(r='1' and s='1')
		then q_interna<='1';
	end if;


end if;
end process;

end Behavioral;

