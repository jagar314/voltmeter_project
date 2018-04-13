--Generador de señal 5 veces más lenta

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divider5 is
    Port ( clkin : in std_logic;
           clkout : out std_logic;
			  reset: in std_logic
			  );
end divider5;

architecture Behavioral of divider5 is

signal count: integer range 0 to 4:=0;
signal clkout_aux: std_logic:='0';

begin



process (reset, clkin)
begin
	if reset = '1' then 	
		clkout_aux <='0';
		count <= 0;
 	elsif rising_edge(clkin) then
			if (count = 4) then 
				clkout_aux <= not clkout_aux;
				count<=0;
			else count <= count+1;
			end if;
	end if;
end process;
clkout <= clkout_aux;

end Behavioral;
