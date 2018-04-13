library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Registro8b is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end Registro8b;

architecture Behavioral of Registro8b is

	signal Qint : std_logic_vector (7 downto 0);

begin

	Q <= Qint;

	process(clk,reset,D)
	begin
	
		if reset='1' then
			Qint <= "00000000";
		elsif rising_edge(clk) then
			Qint <= D;
		end if;
	
	end process;

end Behavioral;

