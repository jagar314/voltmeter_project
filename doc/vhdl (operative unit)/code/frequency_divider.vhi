
-- VHDL Instantiation Created from source file frequency_divider.vhd -- 18:32:48 12/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT frequency_divider
	PORT(
		clk50MHz : IN std_logic;
		reset : IN std_logic;          
		clk2MHz : OUT std_logic;
		clk1MHz : OUT std_logic;
		clk1kHz : OUT std_logic
		);
	END COMPONENT;

	Inst_frequency_divider: frequency_divider PORT MAP(
		clk50MHz => ,
		reset => ,
		clk2MHz => ,
		clk1MHz => ,
		clk1kHz => 
	);


