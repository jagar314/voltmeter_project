library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gestion_2_interrupciones is
    Port ( clk_micro : in  STD_LOGIC;
           interrupt_ack : in  STD_LOGIC;
           peticion_int_0 : in  STD_LOGIC;
           peticion_int_1 : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           interrupt : out  STD_LOGIC;
           origen_int : out  STD_LOGIC);
end gestion_2_interrupciones;

architecture Behavioral of gestion_2_interrupciones is

component Pipeline_D 
    Port ( D : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component codificacor_2_A_1 
    Port ( Entrada : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC);
end component;

component decodificador_1_A_2 
    Port ( dec_in : in  STD_LOGIC;
           en : in  STD_LOGIC;
           out_0 : out  STD_LOGIC;
           out_1 : out  STD_LOGIC);
end component;

component Biestable_RS 
    Port ( clk : in  STD_LOGIC;
           r : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           s : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component detector_flancos
    Port ( entrada : in std_logic;
           clk : in std_logic;
           reset : in std_logic;
           fa_entrada : out std_logic; -- flanco ascendente
           fd_entrada : out std_logic -- flanco descendente
				);
end component;

	signal cod_in : std_logic_vector(1 downto 0);
	signal cod_out : std_logic;
	
	signal fa_entrada_0 : std_logic;
	signal fa_entrada_1 : std_logic;
	
	signal out_0 : std_logic;
   signal out_1 : std_logic;
	
	signal salidaNull0, salidaNull1 : std_logic;

begin

	codificador : codificacor_2_A_1 port map(cod_in,cod_out);
	detector_flancos0 : detector_flancos port map(peticion_int_0, clk_micro,reset, fa_entrada_0, salidaNull0);
	detector_flancos1 : detector_flancos port map(peticion_int_1, clk_micro,reset, fa_entrada_1, salidaNull1);
	rs_flip_flop_0 : Biestable_RS port map (clk_micro, out_0, reset, fa_entrada_0, cod_in(0));
	rs_flip_flop_1 : Biestable_RS port map (clk_micro, out_1, reset, fa_entrada_1, cod_in(1));
	decodificador : decodificador_1_A_2  port map (cod_out,interrupt_ack, out_0, out_1);
	d_flip_flop : Pipeline_D port map (cod_out, reset, clk_micro, origen_int);
	
	interrupt <= cod_in(0) or cod_in(1);


end Behavioral;

