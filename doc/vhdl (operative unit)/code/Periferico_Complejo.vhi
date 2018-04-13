
-- VHDL Instantiation Created from source file Periferico_Complejo.vhd -- 18:23:42 12/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Periferico_Complejo
	PORT(
		clk50MHz : IN std_logic;
		reset : IN std_logic;
		sdata_first_adc : IN std_logic;
		sdata_second_adc : IN std_logic;
		start_conv : IN std_logic;          
		sclk_both_adc : OUT std_logic;
		cs_both_adc : OUT std_logic;
		busy : OUT std_logic;
		end_of_conv : OUT std_logic;
		data_out_first_adc : OUT std_logic_vector(11 downto 0);
		data_out_second_adc : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	Inst_Periferico_Complejo: Periferico_Complejo PORT MAP(
		clk50MHz => ,
		reset => ,
		sdata_first_adc => ,
		sdata_second_adc => ,
		start_conv => ,
		sclk_both_adc => ,
		cs_both_adc => ,
		busy => ,
		end_of_conv => ,
		data_out_first_adc => ,
		data_out_second_adc => 
	);


