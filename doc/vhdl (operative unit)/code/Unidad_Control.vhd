----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:13 11/19/2016 
-- Design Name: 
-- Module Name:    Unidad_Control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Unidad_Control is
    Port ( clk: in STD_LOGIC;
			  reset: in STD_LOGIC;
			  start_conv : in  STD_LOGIC;
           cont_overflow : in  STD_LOGIC;
           end_of_conv : out  STD_LOGIC;
           busy : out  STD_LOGIC;
           control_reg_sal : out  STD_LOGIC;
           cs_both_adc : out  STD_LOGIC);
end Unidad_Control;

architecture Behavioral of Unidad_Control is

type tipo_estado is (s0,s1,s2,s3);
signal actual,siguiente: tipo_estado;

begin
process1: process(clk,reset)
begin
	if (reset='1') then
		actual<=s0;
	elsif rising_edge(clk) then
		actual<=siguiente;
	end if;
end process;

process2: process (actual,start_conv,cont_overflow)
begin
	case actual is
		when s0 =>
			if start_conv='1' then
				siguiente <= s1;
			else siguiente <= s0;
			end if;
		
		when s1 =>
			if cont_overflow='1' then
				siguiente <= s2;
			else siguiente <= s1;
			end if;
			
		when s2 =>
			siguiente <= s3;
			
		when s3 =>
			siguiente <= s0;
			
		when others =>
			siguiente <=s0;
		
		end case;

end process;

process3: process (actual)
begin
	case actual is
		when s0 =>
			cs_both_adc<='1';
			end_of_conv<='0';
			control_reg_sal<='0';
			busy<='0';
			
		when s1 => 
			cs_both_adc<= '0';
			end_of_conv<='0';
			control_reg_sal<='0';
			busy<='1';

		when s2 =>
			cs_both_adc <= '1';
			end_of_conv <= '0';
			control_reg_sal <= '1';
			busy <= '0';
		
		when s3 =>
			end_of_conv <= '1';
		end case;

end process;

end Behavioral;

