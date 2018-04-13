library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BiestableD is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end BiestableD;

architecture Behavioral of BiestableD is

	signal Qint : std_logic;

begin

	Q <= Qint;

	process(reset,clk,D)
	begin
	
		if reset='1' then
			Qint <= '0';
		elsif rising_edge(clk) then
			Qint <= D;
		end if;
	
	end process;

end Behavioral;

