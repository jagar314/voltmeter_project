----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:28 11/19/2016 
-- Design Name: 
-- Module Name:    ctr_5_bits - Behavioral 
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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ctr_4_bits is
    Port ( clk : in  STD_LOGIC;
			  reset: in STD_LOGIC;
           en : in  STD_LOGIC;
           cont_overflow : out  STD_LOGIC);
end ctr_4_bits;

architecture Behavioral of ctr_4_bits is
signal count: std_logic_vector (4 downto 0);
begin
process (clk,reset,en,count)
begin
	if reset='1' then
		count<="00000";
		cont_overflow<='0';
	
	elsif rising_edge(clk) then
		if en='1' then 
			count<= count + 1;
			
		else
			count<=count;
		end if;
	end if;
	if count="10000" then
		--count<="00000";
		cont_overflow<='1';
		
	else cont_overflow<='0';
	end if;
	if count="10001" then
		count<="00000";
	end if;
end process;


end Behavioral;














