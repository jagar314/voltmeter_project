----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:26 11/19/2016 
-- Design Name: 
-- Module Name:    reg_16_bits - Behavioral 
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

entity reg_16_bits is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           en : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (11 downto 0));
end reg_16_bits;

architecture Behavioral of reg_16_bits is
signal q_interna : std_logic_vector (11 downto 0);

begin

	data_out <= q_interna;

	process(reset,clk,data_in,q_interna)
	begin
	
		
		if rising_edge(clk) then
			if reset='1' then
			q_interna <= "000000000000";
			elsif (en='1') then
			q_interna <= data_in (11 downto 0) ;
			else
			q_interna<=q_interna;
			end if;
		end if;
	
	end process;


end Behavioral;

