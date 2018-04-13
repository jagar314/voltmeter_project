----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:15 11/19/2016 
-- Design Name: 
-- Module Name:    Unidad_Operativa - Behavioral 
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

entity Unidad_Operativa is
    Port ( clk50MHz : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sdata_first_adc : in  STD_LOGIC;
           sdata_second_adc : in  STD_LOGIC;
           data_out_first_adc : out  STD_LOGIC_VECTOR (11 downto 0);
           data_out_second_adc : out  STD_LOGIC_VECTOR (11 downto 0);
           cont_overflow : out  STD_LOGIC;
           control_reg_sal : in  STD_LOGIC;
			  sclk_both_adc : out STD_LOGIC;
			  cs_both_adc : in STD_LOGIC);
end Unidad_Operativa;

architecture Behavioral of Unidad_Operativa is

	COMPONENT ctr_4_bits
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		en : IN std_logic;          
		cont_overflow : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT detector_flancos
	PORT(
		entrada : IN std_logic;
		clk : IN std_logic;
		reset : IN std_logic;          
		fa_entrada : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT divider5
	PORT(
		clkin : IN std_logic;
		reset : IN std_logic;          
		clkout : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT reg_16_bits
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		data_in : IN std_logic_vector(15 downto 0);
		en : IN std_logic;          
		data_out : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
	
	COMPONENT srg_16
	PORT(
		clk : IN std_logic;
		en : IN std_logic;
		reset : IN std_logic;
		sdata : IN std_logic;          
		q_out : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
signal clk10MHz,sclk: std_logic;
signal enable,res_cont: std_logic;
signal data16_1, data16_2: std_logic_vector(15 downto 0);

begin
	--sclk<= clk10MHz or cs_both_adc;
	res_cont<=reset or cs_both_adc;

	Inst_ctr_4_bits: ctr_4_bits PORT MAP(
		clk => clk50MHz ,
		reset => res_cont,
		en => enable,
		cont_overflow =>cont_overflow 
	);
	
	Inst_detector_flancos: detector_flancos PORT MAP(
		--entrada => sclk,
		entrada => clk10MHz,
		clk => clk50MHz,
		reset => reset ,
		fa_entrada => enable
	);
	
	Inst_divider5: divider5 PORT MAP(
		clkin => clk50MHz,
		clkout => clk10MHz,
		reset =>reset 
	);
	
	Inst_reg_16_bits_1: reg_16_bits PORT MAP(
		clk => clk50MHz,
		reset =>reset ,
		data_in => data16_1,
		en =>control_reg_sal,
		data_out => data_out_first_adc
	);
	
	Inst_reg_16_bits_2: reg_16_bits PORT MAP(
		clk =>clk50MHz ,
		reset => reset,
		data_in => data16_2,
		en => control_reg_sal,
		data_out => data_out_second_adc
	);
	
	Inst_srg_16_1: srg_16 PORT MAP(
		clk => clk50MHz,
		en => enable,
		reset => reset,
		sdata => sdata_first_adc,
		q_out => data16_1
	);
	
	Inst_srg_16_2: srg_16 PORT MAP(
		clk => clk50MHz,
		en => enable,
		reset => reset,
		sdata => sdata_second_adc,
		q_out => data16_2
	);
	
	--sclk_both_adc <= sclk;
	sclk_both_adc <= clk10MHz;

end Behavioral;

