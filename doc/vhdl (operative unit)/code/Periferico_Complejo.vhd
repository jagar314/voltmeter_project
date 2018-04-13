----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:52 11/19/2016 
-- Design Name: 
-- Module Name:    Periferico_Complejo - Behavioral 
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

entity Periferico_Complejo is
    Port ( clk50MHz : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sdata_first_adc : in  STD_LOGIC;
           sdata_second_adc : in  STD_LOGIC;
           start_conv : in  STD_LOGIC;
           sclk_both_adc : out  STD_LOGIC;
           cs_both_adc : out  STD_LOGIC;
           busy : out  STD_LOGIC;
           end_of_conv : out  STD_LOGIC;
           data_out_first_adc : out  STD_LOGIC_VECTOR (11 downto 0);
           data_out_second_adc : out  STD_LOGIC_VECTOR (11 downto 0));
end Periferico_Complejo;

architecture Behavioral of Periferico_Complejo is

	COMPONENT Unidad_Control
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		start_conv : IN std_logic;
		cont_overflow : IN std_logic;          
		end_of_conv : OUT std_logic;
		busy : OUT std_logic;
		control_reg_sal : OUT std_logic;
		cs_both_adc : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Unidad_Operativa
	PORT(
		clk50MHz : IN std_logic;
		reset : IN std_logic;
		sdata_first_adc : IN std_logic;
		sdata_second_adc : IN std_logic;
		control_reg_sal : IN std_logic;          
		data_out_first_adc : OUT std_logic_vector(11 downto 0);
		data_out_second_adc : OUT std_logic_vector(11 downto 0);
		cont_overflow : OUT std_logic;
		sclk_both_adc : OUT std_logic;
		cs_both_adc : in STD_LOGIC);
	END COMPONENT;

signal cont_overflow, control_reg_sal, cs: std_logic;

begin
	cs_both_adc<=cs;

	Inst_Unidad_Control: Unidad_Control PORT MAP(
		clk => clk50MHz,
		reset => reset,
		start_conv => start_conv,
		cont_overflow => cont_overflow,
		end_of_conv => end_of_conv,
		busy => busy,
		control_reg_sal => control_reg_sal,
		cs_both_adc =>cs
	);
	
	Inst_Unidad_Operativa: Unidad_Operativa PORT MAP(
		clk50MHz => clk50MHz,
		reset => reset,
		sdata_first_adc => sdata_first_adc,
		sdata_second_adc => sdata_second_adc,
		data_out_first_adc => data_out_first_adc,
		data_out_second_adc => data_out_second_adc,
		cont_overflow => cont_overflow,
		control_reg_sal => control_reg_sal,
		sclk_both_adc => sclk_both_adc,
		cs_both_adc => cs
	);


end Behavioral;

