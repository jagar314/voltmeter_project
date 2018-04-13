library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity selec_16_salidas_con_reg_y_men_esc_lec is
    Port ( write_strobe : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk_micro : in  STD_LOGIC;
           port_id : in  STD_LOGIC_VECTOR (7 downto 0);
           out_port : in  STD_LOGIC_VECTOR (7 downto 0);
           sel_puerto_00_out : out  STD_LOGIC;
           sel_puerto_01_out : out  STD_LOGIC;
           sel_puerto_02_out : out  STD_LOGIC;
           sel_puerto_03_out : out  STD_LOGIC;
           sel_puerto_04_out : out  STD_LOGIC;
           sel_puerto_05_out : out  STD_LOGIC;
           sel_puerto_06_out : out  STD_LOGIC;
           sel_puerto_07_out : out  STD_LOGIC;
           sel_puerto_08_out : out  STD_LOGIC;
           sel_puerto_09_out : out  STD_LOGIC;
           sel_puerto_0A_out : out  STD_LOGIC;
           sel_puerto_0B_out : out  STD_LOGIC;
           sel_puerto_0C_out : out  STD_LOGIC;
           sel_puerto_0D_out : out  STD_LOGIC;
           sel_puerto_0E_out : out  STD_LOGIC;
           sel_puerto_0F_out : out  STD_LOGIC;
           sel_mem_out : out  STD_LOGIC;
           out_port_reg : out  STD_LOGIC_VECTOR (7 downto 0);
           address_men : out  STD_LOGIC_VECTOR (6 downto 0));
end selec_16_salidas_con_reg_y_men_esc_lec;


architecture Behavioral of selec_16_salidas_con_reg_y_men_esc_lec is

	-- DECLARACIÓN DE COMPONENTES Y VARIABLES --

	component BiestableD
		Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	end component;
	
	component Bin2Hex
		Port ( inX : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC;
           out0 : out  STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
           out5 : out  STD_LOGIC;
           out6 : out  STD_LOGIC;
           out7 : out  STD_LOGIC;
           out8 : out  STD_LOGIC;
           out9 : out  STD_LOGIC;
           outA : out  STD_LOGIC;
           outB : out  STD_LOGIC;
           outC : out  STD_LOGIC;
           outD : out  STD_LOGIC;
           outE : out  STD_LOGIC;
           outF : out  STD_LOGIC);
	end component;
	
	component PuertaAnd
		Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           outX : out  STD_LOGIC);
	end component;
	
	component Registro8b
		Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal en_port_00 : std_logic;
	signal en_port_01 : std_logic;
	signal en_port_02 : std_logic;
	signal en_port_03 : std_logic;
	signal en_port_04 : std_logic;
	signal en_port_05 : std_logic;
	signal en_port_06 : std_logic;
	signal en_port_07 : std_logic;
	signal en_port_08 : std_logic;
	signal en_port_09 : std_logic;
	signal en_port_0A : std_logic;
	signal en_port_0B : std_logic;
	signal en_port_0C : std_logic;
	signal en_port_0D : std_logic;
	signal en_port_0E : std_logic;
	signal en_port_0F : std_logic;
	
	signal reg_port_00 : std_logic;
	signal reg_port_01 : std_logic;
	signal reg_port_02 : std_logic;
	signal reg_port_03 : std_logic;
	signal reg_port_04 : std_logic;
	signal reg_port_05 : std_logic;
	signal reg_port_06 : std_logic;
	signal reg_port_07 : std_logic;
	signal reg_port_08 : std_logic;
	signal reg_port_09 : std_logic;
	signal reg_port_0A : std_logic;
	signal reg_port_0B : std_logic;
	signal reg_port_0C : std_logic;
	signal reg_port_0D : std_logic;
	signal reg_port_0E : std_logic;
	signal reg_port_0F : std_logic;
	
	signal reg_mem : std_logic;
	
	signal port_id_3_0 : std_logic_vector (3 downto 0);
	signal enn : std_logic;

begin

	-- DECODIFICADOR BINARIO A HEXADECIMAL --
	
	port_id_3_0 <= port_id(3)&port_id(2)&port_id(1)&port_id(0);
	enn <= not port_id(7);

	decodif: Bin2Hex Port Map (
		inX => port_id_3_0,
		en => enn,
		out0 => en_port_00,
		out1 => en_port_01,
		out2 => en_port_02,
		out3 => en_port_03,
		out4 => en_port_04,
		out5 => en_port_05,
		out6 => en_port_06,
		out7 => en_port_07,
		out8 => en_port_08,
		out9 => en_port_09,
		outA => en_port_0A,
		outB => en_port_0B,
		outC => en_port_0C,
		outD => en_port_0D,
		outE => en_port_0E,
		outF => en_port_0F);
		
	-- REGISTRO DE 8 BITS --
		
	pipelineXX: Registro8b Port Map (
		D => out_port,
		reset => reset,
		clk => clk_micro,
		Q => out_port_reg);
		
	-- BIESTABLES D --
		
	pipeline00: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_00,
		Q => reg_port_00);
		
	pipeline01: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_01,
		Q => reg_port_01);
		
	pipeline02: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_02,
		Q => reg_port_02);
		
	pipeline03: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_03,
		Q => reg_port_03);
		
	pipeline04: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_04,
		Q => reg_port_04);
		
	pipeline05: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_05,
		Q => reg_port_05);
		
	pipeline06: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_06,
		Q => reg_port_06);
		
	pipeline07: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_07,
		Q => reg_port_07);
		
	pipeline08: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_08,
		Q => reg_port_08);
		
	pipeline09: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_09,
		Q => reg_port_09);
		
	pipeline0A: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_0A,
		Q => reg_port_0A);
		
	pipeline0B: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_0B,
		Q => reg_port_0B);
		
	pipeline0C: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_0C,
		Q => reg_port_0C);
		
	pipeline0D: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_0D,
		Q => reg_port_0D);
		
	pipeline0E: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_0E,
		Q => reg_port_0E);
		
	pipeline0F: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => en_port_0F,
		Q => reg_port_0F);
		
	-- PUERTAS AND --
	
	pand00: PuertaAnd Port Map (
		in1 => reg_port_00,
		in2 => write_strobe,
		outX => sel_puerto_00_out);
		
	pand01: PuertaAnd Port Map (
		in1 => reg_port_01,
		in2 => write_strobe,
		outX => sel_puerto_01_out);
		
	pand02: PuertaAnd Port Map (
		in1 => reg_port_02,
		in2 => write_strobe,
		outX => sel_puerto_02_out);
		
	pand03: PuertaAnd Port Map (
		in1 => reg_port_03,
		in2 => write_strobe,
		outX => sel_puerto_03_out);
		
	pand04: PuertaAnd Port Map (
		in1 => reg_port_04,
		in2 => write_strobe,
		outX => sel_puerto_04_out);
		
	pand05: PuertaAnd Port Map (
		in1 => reg_port_05,
		in2 => write_strobe,
		outX => sel_puerto_05_out);
		
	pand06: PuertaAnd Port Map (
		in1 => reg_port_06,
		in2 => write_strobe,
		outX => sel_puerto_06_out);
		
	pand07: PuertaAnd Port Map (
		in1 => reg_port_07,
		in2 => write_strobe,
		outX => sel_puerto_07_out);
		
	pand08: PuertaAnd Port Map (
		in1 => reg_port_08,
		in2 => write_strobe,
		outX => sel_puerto_08_out);
		
	pand09: PuertaAnd Port Map (
		in1 => reg_port_09,
		in2 => write_strobe,
		outX => sel_puerto_09_out);
		
	pand0A: PuertaAnd Port Map (
		in1 => reg_port_0A,
		in2 => write_strobe,
		outX => sel_puerto_0A_out);
		
	pand0B: PuertaAnd Port Map (
		in1 => reg_port_0B,
		in2 => write_strobe,
		outX => sel_puerto_0B_out);
		
	pand0C: PuertaAnd Port Map (
		in1 => reg_port_0C,
		in2 => write_strobe,
		outX => sel_puerto_0C_out);
		
	pand0D: PuertaAnd Port Map (
		in1 => reg_port_0D,
		in2 => write_strobe,
		outX => sel_puerto_0D_out);
		
	pand0E: PuertaAnd Port Map (
		in1 => reg_port_0E,
		in2 => write_strobe,
		outX => sel_puerto_0E_out);
		
	pand0F: PuertaAnd Port Map (
		in1 => reg_port_0F,
		in2 => write_strobe,
		outX => sel_puerto_0F_out);
		
	-- UBICACIÓN MEMORIA --
	
	address_men <= port_id(6)&port_id(5)&port_id(4)&port_id(3)&port_id(2)&port_id(1)&port_id(0);
	
	-- BIESTABLE D --
	
	pipelineYY: BiestableD Port Map (
		reset => reset,
		clk => clk_micro,
		D => port_id(7),
		Q => reg_mem); 
		
	pandYY: PuertaAnd Port Map (
		in1 => reg_mem,
		in2 => write_strobe,
		outX => sel_mem_out);
		
		
end Behavioral;
