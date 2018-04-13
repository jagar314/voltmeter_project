library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity selec_16_entradas_con_reg_y_bypass is
    Port ( reset : in  STD_LOGIC;
           clk_micro : in  STD_LOGIC;
           puerto_00_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_01_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_02_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_03_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_04_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_05_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_06_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_07_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_08_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_09_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_0A_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_0B_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_0C_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_0D_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_0E_in : in  STD_LOGIC_VECTOR (7 downto 0);
           puerto_0F_in : in  STD_LOGIC_VECTOR (7 downto 0);
           mem_in : in  STD_LOGIC_VECTOR (7 downto 0);
           port_id : in  STD_LOGIC_VECTOR (7 downto 0);
           in_port : out  STD_LOGIC_VECTOR (7 downto 0));
end selec_16_entradas_con_reg_y_bypass;

architecture Behavioral of selec_16_entradas_con_reg_y_bypass is

Component Multiplexor2_A_1
		Port	( Q0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

Component Multiplexor
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
end component;

component Pipeline_D
 Port ( D : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component registro_8bits
 Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  reset : in std_logic;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component dual_port_dedicated_bram_sync_read
Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           write_addr : in  STD_LOGIC_VECTOR (6 downto 0);
           read_addr : in  STD_LOGIC_VECTOR (6 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
	
	
	signal salida_mux :std_logic_vector(7 downto 0);
	signal salida_registro :std_logic_vector(7 downto 0);
	signal salida_D :std_logic;
	signal salida_ram: std_logic_vector(7 downto 0);
	
begin

	MultiplexorG : Multiplexor port Map(puerto_00_in, puerto_01_in, puerto_02_in, puerto_03_in, puerto_04_in, puerto_05_in,
													puerto_06_in, puerto_07_in, puerto_08_in, puerto_09_in, puerto_0A_in, puerto_0B_in,
													puerto_0C_in, puerto_0D_in, puerto_0E_in, puerto_0F_in, port_id(3 downto 0),salida_mux);
	registro : registro_8bits port Map(salida_mux, '1', clk_micro, reset,salida_registro );
	biestable_D : pipeline_D port Map (port_id(7), reset, clk_micro, salida_D);
	multiplexorM : Multiplexor2_a_1 port Map(salida_registro, mem_in, salida_D, in_port);
	--RAM : dual_port_dedicated_bram_sync_read port Map(clk_micro, '1', port_id(6 downto 0),port_id(6 downto 0),  salida_mux, salida_ram);

end Behavioral;

