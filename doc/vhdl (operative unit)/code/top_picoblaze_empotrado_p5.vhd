library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Voltimetro_P6 is
    Port ( clk : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (3 downto 0);
			  sdata_first_adc : in STD_LOGIC;
			  sdata_second_adc : in STD_LOGIC;
           sclk_both_adc : out  STD_LOGIC;
			  cs_both_adc : out STD_LOGIC;
			  lcd_db : INOUT std_logic_vector(7 downto 0));
          
end Voltimetro_P6;

architecture Behavioral of Voltimetro_P6 is

	COMPONENT picoblaze3_empotrado
	PORT(
		in_port : IN std_logic_vector(7 downto 0);
		interrupt : IN std_logic;
		reset : IN std_logic;
		clk : IN std_logic;          
		port_id : OUT std_logic_vector(7 downto 0);
		write_strobe : OUT std_logic;
		out_port : OUT std_logic_vector(7 downto 0);
		read_strobe : OUT std_logic;
		interrupt_ack : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Generador_CE_1KHz
			 Port ( 
						clk : in  STD_LOGIC;
						reset : in  STD_LOGIC;
						ce_1KHz : out  STD_LOGIC);
			  
		END COMPONENT;
	
	COMPONENT registro_8bits
	PORT(
		D : IN std_logic_vector(7 downto 0);
		ce : IN std_logic;
		clk : IN std_logic;
		reset : IN std_logic;          
		Q : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT selec_16_salidas_con_reg_y_men_esc_lec
	PORT(
		write_strobe : IN std_logic;
		reset : IN std_logic;
		clk_micro : IN std_logic;
		port_id : IN std_logic_vector(7 downto 0);
		out_port : IN std_logic_vector(7 downto 0);          
		sel_puerto_00_out : OUT std_logic;
		sel_puerto_01_out : OUT std_logic;
		sel_puerto_02_out : OUT std_logic;
		sel_puerto_03_out : OUT std_logic;
		sel_puerto_04_out : OUT std_logic;
		sel_puerto_05_out : OUT std_logic;
		sel_puerto_06_out : OUT std_logic;
		sel_puerto_07_out : OUT std_logic;
		sel_puerto_08_out : OUT std_logic;
		sel_puerto_09_out : OUT std_logic;
		sel_puerto_0A_out : OUT std_logic;
		sel_puerto_0B_out : OUT std_logic;
		sel_puerto_0C_out : OUT std_logic;
		sel_puerto_0D_out : OUT std_logic;
		sel_puerto_0E_out : OUT std_logic;
		sel_puerto_0F_out : OUT std_logic;
		sel_mem_out : OUT std_logic;
		out_port_reg : OUT std_logic_vector(7 downto 0);
		address_men : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
	COMPONENT selec_16_entradas_con_reg_y_bypass
	PORT(
		reset : IN std_logic;
		clk_micro : IN std_logic;
		puerto_00_in : IN std_logic_vector(7 downto 0);
		puerto_01_in : IN std_logic_vector(7 downto 0);
		puerto_02_in : IN std_logic_vector(7 downto 0);
		puerto_03_in : IN std_logic_vector(7 downto 0);
		puerto_04_in : IN std_logic_vector(7 downto 0);
		puerto_05_in : IN std_logic_vector(7 downto 0);
		puerto_06_in : IN std_logic_vector(7 downto 0);
		puerto_07_in : IN std_logic_vector(7 downto 0);
		puerto_08_in : IN std_logic_vector(7 downto 0);
		puerto_09_in : IN std_logic_vector(7 downto 0);
		puerto_0A_in : IN std_logic_vector(7 downto 0);
		puerto_0B_in : IN std_logic_vector(7 downto 0);
		puerto_0C_in : IN std_logic_vector(7 downto 0);
		puerto_0D_in : IN std_logic_vector(7 downto 0);
		puerto_0E_in : IN std_logic_vector(7 downto 0);
		puerto_0F_in : IN std_logic_vector(7 downto 0);
		mem_in : IN std_logic_vector(7 downto 0);
		port_id : IN std_logic_vector(7 downto 0);          
		in_port : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT gestion_2_interrupciones
	PORT(
		clk_micro : IN std_logic;
		interrupt_ack : IN std_logic;
		peticion_int_0 : IN std_logic;
		peticion_int_1 : IN std_logic;
		reset : IN std_logic;          
		interrupt : OUT std_logic;
		origen_int : OUT std_logic
		);
	END COMPONENT;
	
	
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
	
	COMPONENT frequency_divider
	PORT(
		clk50MHz : IN std_logic;
		reset : IN std_logic;          
		clk2MHz : OUT std_logic;
		clk1MHz : OUT std_logic;
		clk1kHz : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT lcd_basic_interface_8_bits
	PORT(
		clk : IN std_logic;
		clk1MHz : IN std_logic;
		reset : IN std_logic;
		initialize_lcd : IN std_logic;
		send_command : IN std_logic;
		send_data : IN std_logic;
		read_lcd_status : IN std_logic;
		read_data : IN std_logic;
		command_or_data : IN std_logic_vector(7 downto 0);    
		lcd_db : INOUT std_logic_vector(7 downto 0);      
		init_ack : OUT std_logic;
		init_done : OUT std_logic;
		send_ack : OUT std_logic;
		send_done : OUT std_logic;
		read_ack : OUT std_logic;
		read_done : OUT std_logic;
		busy : OUT std_logic;
		lcd_status_or_data : OUT std_logic_vector(7 downto 0);
		dir_74lvc4245 : OUT std_logic;
		lcd_enable : OUT std_logic;
		lcd_rs : OUT std_logic;
		lcd_rw : OUT std_logic
		);
	END COMPONENT;
			
		
	
	signal reset : std_logic := '0';
	signal interrupt, interrupt_ack : std_logic := '0';
	signal out_port, in_port, port_id : std_logic_vector(7 downto 0);
	signal write_strobe, read_strobe, end_of_conv, busy: std_logic := '0';
	
	signal sel_puerto_00_out, sel_puerto_01_out, sel_puerto_02_out : std_logic := '0';
		
	signal out_port_reg : std_logic_vector (7 downto 0); 
	
	signal clk1MHz : std_logic;
	signal initialize_lcd, send_data, send_command: std_logic;
	
	signal btn_in, btn_out, btn_out2 : std_logic_vector (7 downto 0);
	
	signal ce_1khz: std_logic := '0';
	signal data_1,data_2: std_logic_vector (11 downto 0) :="000000000000";
	signal data_1_8, data_2_8, busy_8 : std_logic_vector (7 downto 0) :="00000000";
			
	constant masa1bits : std_logic := '0';
	constant vcc1bit : std_logic := '1';
	constant masa7bits : std_logic_vector (6 downto 0) := "0000000";
	constant masa8bits : std_logic_vector (7 downto 0) := "00000000";

begin
	reset <= btn(3);
	btn_in <= ("00000" & btn(2) & btn(1) & btn(0));
	data_1_8 <= ('0' & data_1(11 downto 5));	
	data_2_8 <= ('0' & data_2(11 downto 5));
	busy_8 <= ("0000000" & busy);
	
	
		
	Inst_Generador_CE_1KHz: Generador_CE_1KHz PORT MAP(
		clk => clk,
      reset => reset,
      ce_1KHz => ce_1khz
	);
			  
			  
			  
	Inst_registro_8bits_btn_antirrebotes: registro_8bits PORT MAP(
		D => btn_in,
		ce => vcc1bit,
		--ce => ce_1khz ,
		reset => reset,
      clk => clk,
      Q => btn_out);
		
	
	Inst_registro_8bits_btn: registro_8bits PORT MAP(
		D => btn_out,
		ce => vcc1bit ,
		reset => reset,
      clk => clk,
      Q => btn_out2);
	
	
	Inst_picoblaze3_empotrado: picoblaze3_empotrado PORT MAP(
		port_id => port_id,
		write_strobe => write_strobe,
		out_port => out_port,
		read_strobe => read_strobe,
		in_port => in_port,
		interrupt => interrupt,
		interrupt_ack => interrupt_ack,
		reset => reset,
		clk => clk
	);
	
	
	
	
	
	Inst_selec_16_salidas_con_reg_y_men_esc_lec: selec_16_salidas_con_reg_y_men_esc_lec PORT MAP(
		write_strobe => write_strobe,
		reset => reset,
		clk_micro => clk,
		port_id => port_id,
		out_port => out_port,
		sel_puerto_00_out => initialize_lcd,
		sel_puerto_01_out => send_command,
		sel_puerto_02_out => send_data,
		sel_puerto_03_out => open,
		sel_puerto_04_out => open,
		sel_puerto_05_out => open,
		sel_puerto_06_out => open,
		sel_puerto_07_out => open,
		sel_puerto_08_out => open,
		sel_puerto_09_out => open,
		sel_puerto_0A_out => open,
		sel_puerto_0B_out => open,
		sel_puerto_0C_out => open,
		sel_puerto_0D_out => open,
		sel_puerto_0E_out => open,
		sel_puerto_0F_out => open,
		sel_mem_out => open,
		out_port_reg => out_port_reg,
		address_men => open
	);
	
	
	
	
	Inst_selec_16_entradas_con_reg_y_bypass: selec_16_entradas_con_reg_y_bypass PORT MAP(
		reset => reset,
		clk_micro => clk,
		puerto_00_in => masa8bits,
		puerto_01_in => data_1_8,
		puerto_02_in => data_2_8,
		puerto_03_in => busy_8,
		puerto_04_in => masa8bits,
		puerto_05_in => masa8bits,
		puerto_06_in => masa8bits,
		puerto_07_in => masa8bits,
		puerto_08_in => masa8bits,
		puerto_09_in => masa8bits,
		puerto_0A_in => masa8bits,
		puerto_0B_in => masa8bits,
		puerto_0C_in => masa8bits,
		puerto_0D_in => masa8bits,
		puerto_0E_in => masa8bits,
		puerto_0F_in => masa8bits,
		mem_in => masa8bits,
		port_id => port_id,
		in_port => in_port
	);
	
	
	
	
	Inst_gestion_2_interrupciones: gestion_2_interrupciones PORT MAP(
		clk_micro => clk,
		interrupt_ack => interrupt_ack,
		peticion_int_0 => end_of_conv,
		peticion_int_1 => masa1bits,
		reset => reset,
		interrupt => interrupt,
		origen_int => open
	);
	

	
	Inst_Periferico_Complejo: Periferico_Complejo PORT MAP(
		clk50MHz => clk,
		reset => reset,
		sdata_first_adc => sdata_first_adc,
		sdata_second_adc => sdata_second_adc,
		start_conv =>btn_out(0) ,
		sclk_both_adc => sclk_both_adc,
		cs_both_adc => cs_both_adc,
		busy => open ,
		end_of_conv => end_of_conv,
		data_out_first_adc => data_1,
		data_out_second_adc => data_2
	);
	
	Inst_frequency_divider: frequency_divider PORT MAP(
		clk50MHz => clk,
		reset => reset,
		clk2MHz => open,
		clk1MHz => clk1MHz,
		clk1kHz => open
	);
		
		
	Inst_lcd_basic_interface_8_bits: lcd_basic_interface_8_bits PORT MAP(
		clk => clk,
		clk1MHz => clk1MHz,
		reset => reset,
		initialize_lcd => initialize_lcd,
		send_command => send_command,
		send_data => send_data,
		read_lcd_status => masa1bits,
		read_data => masa1bits,
		command_or_data => out_port_reg,
		init_ack => open,
		init_done => open,
		send_ack => open,
		send_done => open,
		read_ack => open,
		read_done => open,
		busy => busy,
		lcd_status_or_data => open,
		dir_74lvc4245 => open,
		lcd_enable => open,
		lcd_rs => open,
		lcd_rw => open,
		lcd_db => lcd_db
	);
		
	

end Behavioral;

