----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:47 11/19/2016 
-- Design Name: 
-- Module Name:    srg_16 - Behavioral 
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

entity srg_16 is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sdata : in  STD_LOGIC;
           q_out : out  STD_LOGIC_VECTOR (15 downto 0));
end srg_16;

architecture Behavioral of srg_16 is
signal q_interna: std_logic_vector(15 downto 0);
begin


	q_out <= q_interna;

		process(q_interna,clk,sdata,reset,en)

		begin

			if (clk'event and clk = '1') then

				if (reset='1') then

					q_interna <= "0000000000000000";

				elsif (en='1') then

					q_interna <= q_interna(14 downto 0) & sdata;

				else

					q_interna <= q_interna;

				end if;

			end if;

		end process;


end Behavioral;

