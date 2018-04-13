----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:53:08 09/22/2016 
-- Design Name: 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexor is
    Port ( P0 : in  STD_LOGIC_VECTOR (7 downto 0);
           P1 : in  STD_LOGIC_VECTOR (7 downto 0);
           P2 : in  STD_LOGIC_VECTOR (7 downto 0);
           P3 : in  STD_LOGIC_VECTOR (7 downto 0);
           P4 : in  STD_LOGIC_VECTOR (7 downto 0);
           P5 : in  STD_LOGIC_VECTOR (7 downto 0);
           P6 : in  STD_LOGIC_VECTOR (7 downto 0);
           P7 : in  STD_LOGIC_VECTOR (7 downto 0);
           P8 : in  STD_LOGIC_VECTOR (7 downto 0);
           P9 : in  STD_LOGIC_VECTOR (7 downto 0);
           P10 : in  STD_LOGIC_VECTOR (7 downto 0);
           P11 : in  STD_LOGIC_VECTOR (7 downto 0);
           P12 : in  STD_LOGIC_VECTOR (7 downto 0);
           P13 : in  STD_LOGIC_VECTOR (7 downto 0);
           P14 : in  STD_LOGIC_VECTOR (7 downto 0);
           P15 : in  STD_LOGIC_VECTOR (7 downto 0);
           Selector : in  STD_LOGIC_vector(3 downto 0);
           Salida : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplexor;

architecture Behavioral of Multiplexor is

begin

	Salida <= P0 when selector="0000" else 
				 P1 when selector="0001" else
				 p2 when selector="0010" else
				 p3 when selector="0011" else
				 p4 when selector="0100" else
				 p5 when selector="0101" else
				 p6 when selector="0110" else
				 p7 when selector="0111" else
				 p8 when selector="1000" else
				 p9 when selector="1001" else
				 p10 when selector="1010" else
				 p11 when selector="1011" else
				 p12 when selector="1100" else
				 p13 when selector="1101" else
				 p14 when selector="1110" else
				 p15 when selector="1111" else
				 p0;
				 
end Behavioral;

