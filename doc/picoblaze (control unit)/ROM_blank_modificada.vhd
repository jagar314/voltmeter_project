-- Ken Chapman (Xilinx Ltd) October 2002

-- This is the VHDL template file for the KCPSM assembler.

-- Adapted for pBlazIDE by Henk van Kampen, www.mediatronix.com, March 2003

-- It is used to configure a Virtex(E, II) and Spartan-II(E, 3) block RAM to act as 
-- a single port program ROM.

-- This VHDL file is not valid as input directly into a synthesis or simulation tool.
-- The assembler will read this template and insert the data required to complete the 
-- definition of program ROM and write it out to a new '.vhd' file as specified by the
-- '.psm' file being assembled.

-- The assembler identifies all text enclosed by {} characters, and replaces these
-- character strings. All templates should include these {} character strings for 
-- the assembler to work correctly. 

-- The next line is used to determine where the template actually starts and must exist.

{begin template}

-- Modificado por Luis Jacobo Álvarez Ruiz de Ojeda el 7/7/2005 para evitar los errores que se
-- producían al intentar la simulación funcional (y la temporal en ocasiones), debidos a la
-- definición del paquete "constants"

-- Modificado por Luis Jacobo Álvarez Ruiz de Ojeda el 17/10/2005 para evitar los avisos ("warnings" que se
-- producían al realizar la sintesis en Foundation ISE 7.1

library IEEE ;
use IEEE.STD_LOGIC_1164.all ;

package	constants is
	type TPicoType is ( pbtI, pbtII, pbt3, pbtS ) ;
	constant PicoType : TPicoType := {pico} ;
	function ADDRSIZE return natural ;
	function INSTSIZE return natural ;
	function JADDRSIZE return natural ;
	function JDATASIZE return natural ;
end package ;

package body constants is
	function ADDRSIZE return natural is
	begin
		case PicoType is
		when pbtI => return 8 ;
		when pbtII => return 10 ;
		when pbt3 => return 10 ;
		when pbtS => return 10 ;
		end case ;
	end ;
	function INSTSIZE return natural is 
	begin
		case PicoType is
		when pbtI => return 16 ;
		when pbtII => return 18 ;
		when pbt3 => return 18 ;
		when pbtS => return 18 ;
		end case ;
	end ;
	function JADDRSIZE return natural is
	begin
		case PicoType is
		when pbtI => return 9 ;
		when pbtII => return 11 ;
		when pbt3 => return 11 ;
		when pbtS => return 10 ;
		end case ;
	end ;
	function JDATASIZE return natural is
	begin
		case PicoType is
		when pbtI => return 8 ;
		when pbtII => return 9 ;
		when pbt3 => return 9 ;
		when pbtS => return 20 ;
		end case ;
	end ;
end package body ;


library IEEE ;
use IEEE.STD_LOGIC_1164.all ;
use IEEE.STD_LOGIC_ARITH.all ;
use IEEE.STD_LOGIC_UNSIGNED.all ;

-- La primera modificación es poner la declaración del uso del paquete "constants" antes de la de
-- la biblioteca "unisim", e indicar expresamente que el paquete pertenece a la biblioteca "work"
-- Este cambio es el que soluciona los problemas que se producían al intentar hacer
-- la simulación temporal ("Post Map" y "Post Place & Route")
library work;
use work.constants.all;

library unisim ;
use unisim.vcomponents.all ;

entity {name} is
    port ( 
        clk : in std_logic ;
-- La segunda modificación es eliminar la declaración de la señal de salida "reset", que en realidad no se utiliza
-- en este fichero sino en el correspondiente a la memoria de programa que se puede modificar via "Boundary Scan"	 
--        reset : out std_logic ;
        address : in std_logic_vector( ADDRSIZE - 1 downto 0 ) ;
        instruction : out std_logic_vector( INSTSIZE - 1 downto 0 )
    ) ;
end entity {name} ;

architecture mix of {name} is
    
-- La tercera modificación es eliminar la declaración del componente "jtag_shifter" que no se usa en
-- este fichero sino en el correspondiente a la memoria de programa que se puede modificar via "Boundary Scan"	 
--	 component jtag_shifter is
--        port ( 
--			clk : in std_logic ;
--			user1 : out std_logic ;
--            write : out std_logic ;
--            addr : out std_logic_vector( JADDRSIZE - 1 downto 0 ) ;
--            data : out std_logic_vector( JDATASIZE - 1 downto 0 )
--        ) ;
--    end component ;

    signal jaddr : std_logic_vector( JADDRSIZE - 1 downto 0 ) ;
    signal jdata : std_logic_vector( JDATASIZE - 1 downto 0 ) ;
    signal juser1 : std_logic ;
    signal jwrite : std_logic ;

-- La cuarta modificacion (del 17/10/2005) es eliminar la declaracion y asignacion de valores a todos los atributos
-- de inicializacion de las memorias BRAM, pues en Foundation ISE 7.1 se inicializan mediante el uso de "generic"
-- Ya no he dejado dichas líneas en este fichero

begin

-- La quinta modificación es sustituir en toda la descripción de la arquitectura las llamadas
-- a las funciones del paquete "constants" por los valores concretos que deben tomar en cada caso
-- Este cambio es el que soluciona los errores qe se producían al intentar hacer la simulación funcional ("Behavioral")

	I18 : if (PicoType = pbtII) or (PicoType = pbt3) generate
	begin
	    bram : component RAMB16_S9_S18
	        generic map (
					-- Modificación del 8/3/2007
					-- Aqui hubo que añadir estos parámetros para que no diese warnings en la versión ISE 8.2
					INIT_A => ('0' & X"00"), --  Value of output RAM registers on Port A at startup
					INIT_B => ("00" & X"0000"), --  Value of output RAM registers on Port B at startup
					SRVAL_A => ('0' & X"00"), --  Port A ouput value upon SSR assertion
					SRVAL_B => ("00" & X"0000"), --  Port B ouput value upon SSR assertion
					WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
					WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
					SIM_COLLISION_CHECK => "ALL", -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 			  
					-- Fin de la modificación del 8/3/2007
	            INIT_00 => X"{INIT_00}",
	            INIT_01 => X"{INIT_01}",
	            INIT_02 => X"{INIT_02}",
	            INIT_03 => X"{INIT_03}",
	            INIT_04 => X"{INIT_04}",
	            INIT_05 => X"{INIT_05}",
	            INIT_06 => X"{INIT_06}",
	            INIT_07 => X"{INIT_07}",
	            INIT_08 => X"{INIT_08}",
	            INIT_09 => X"{INIT_09}",
	            INIT_0A => X"{INIT_0A}",
	            INIT_0B => X"{INIT_0B}",
	            INIT_0C => X"{INIT_0C}",
	            INIT_0D => X"{INIT_0D}",
	            INIT_0E => X"{INIT_0E}",
	            INIT_0F => X"{INIT_0F}",
	            INIT_10 => X"{INIT_10}",
	            INIT_11 => X"{INIT_11}",
	            INIT_12 => X"{INIT_12}",
	            INIT_13 => X"{INIT_13}",
	            INIT_14 => X"{INIT_14}",
	            INIT_15 => X"{INIT_15}",
	            INIT_16 => X"{INIT_16}",
	            INIT_17 => X"{INIT_17}",
	            INIT_18 => X"{INIT_18}",
	            INIT_19 => X"{INIT_19}",
	            INIT_1A => X"{INIT_1A}",
	            INIT_1B => X"{INIT_1B}",
	            INIT_1C => X"{INIT_1C}",
	            INIT_1D => X"{INIT_1D}",
	            INIT_1E => X"{INIT_1E}",
	            INIT_1F => X"{INIT_1F}",
	            INIT_20 => X"{INIT_20}",
	            INIT_21 => X"{INIT_21}",
	            INIT_22 => X"{INIT_22}",
	            INIT_23 => X"{INIT_23}",
	            INIT_24 => X"{INIT_24}",
	            INIT_25 => X"{INIT_25}",
	            INIT_26 => X"{INIT_26}",
	            INIT_27 => X"{INIT_27}",
	            INIT_28 => X"{INIT_28}",
	            INIT_29 => X"{INIT_29}",
	            INIT_2A => X"{INIT_2A}",
	            INIT_2B => X"{INIT_2B}",
	            INIT_2C => X"{INIT_2C}",
	            INIT_2D => X"{INIT_2D}",
	            INIT_2E => X"{INIT_2E}",
	            INIT_2F => X"{INIT_2F}",
	            INIT_30 => X"{INIT_30}",
	            INIT_31 => X"{INIT_31}",
	            INIT_32 => X"{INIT_32}",
	            INIT_33 => X"{INIT_33}",
	            INIT_34 => X"{INIT_34}",
	            INIT_35 => X"{INIT_35}",
	            INIT_36 => X"{INIT_36}",
	            INIT_37 => X"{INIT_37}",
	            INIT_38 => X"{INIT_38}",
	            INIT_39 => X"{INIT_39}",
	            INIT_3A => X"{INIT_3A}",
	            INIT_3B => X"{INIT_3B}",
	            INIT_3C => X"{INIT_3C}",
	            INIT_3D => X"{INIT_3D}",
	            INIT_3E => X"{INIT_3E}",
	            INIT_3F => X"{INIT_3F}",
	            INITP_00 => X"{INITP_00}",
	            INITP_01 => X"{INITP_01}",
	            INITP_02 => X"{INITP_02}",
	            INITP_03 => X"{INITP_03}",
	            INITP_04 => X"{INITP_04}",
	            INITP_05 => X"{INITP_05}",
	            INITP_06 => X"{INITP_06}",
	            INITP_07 => X"{INITP_07}"
	        )
	        port map (
	            DIB => "0000000000000000",
	            DIPB => "00",
	            ENB => '1',
	            WEB => '0',
	            SSRB => '0',
	            CLKB => clk,
	            ADDRB => address,
	            DOB => instruction( 18 - 3 downto 0 ),		-- Aquí se sustituyó la función por su valor concreto
	            DOPB => instruction( 18 - 1 downto 18 - 2 ),		-- Aquí se sustituyó la función por su valor concreto
	            DIA => jdata( 9 - 2 downto 0 ),		-- Aquí se sustituyó la función por su valor concreto
	            DIPA => jdata( 9 - 1 downto 9 - 1 ),		-- Aquí se sustituyó la función por su valor concreto
	            ENA => juser1,
	            WEA => jwrite,
	            SSRA => '0',
	            CLKA => clk,
	            ADDRA => jaddr,
	            DOA => open,
	            DOPA => open 
	        ) ;
	end generate ;

	I16 : if PicoType = pbtI generate
	begin
	    bram : component RAMB4_S8_S16
	        generic map (
	            INIT_00 => X"{INIT_00}",
	            INIT_01 => X"{INIT_01}",
	            INIT_02 => X"{INIT_02}",
	            INIT_03 => X"{INIT_03}",
	            INIT_04 => X"{INIT_04}",
	            INIT_05 => X"{INIT_05}",
	            INIT_06 => X"{INIT_06}",
	            INIT_07 => X"{INIT_07}",
	            INIT_08 => X"{INIT_08}",
	            INIT_09 => X"{INIT_09}",
	            INIT_0A => X"{INIT_0A}",
	            INIT_0B => X"{INIT_0B}",
	            INIT_0C => X"{INIT_0C}",
	            INIT_0D => X"{INIT_0D}",
	            INIT_0E => X"{INIT_0E}",
	            INIT_0F => X"{INIT_0F}"
	        )
			port map (
				DIB => "0000000000000000",  
				ENB => '1', 
				WEB => '0',
				RSTB =>	'0',
				CLKB => clk,
				ADDRB => address,
				DOB => instruction( 16 - 1 downto 0 ),  		-- Aquí se sustituyó la función por su valor concreto
				DIA => jdata( 8 - 1 downto 0 ),   		-- Aquí se sustituyó la función por su valor concreto
				ENA => juser1, 
				WEA => jwrite,
				RSTA => '0',
				CLKA => clk,
				ADDRA => jaddr,
				DOA => open  
			) ; 
	end generate ;

	I20 : if PicoType = pbtS generate
		signal data_out : std_logic_vector( 3 downto 0 ) ;
	begin
	    ram_1 : component RAMB4_S4_S4
	        generic map (
				INIT_00 => X"{INIT1_0}",
				INIT_01 => X"{INIT1_1}",
				INIT_02 => X"{INIT1_2}",
				INIT_03 => X"{INIT1_3}",
				INIT_04 => X"{INIT1_4}",
				INIT_05 => X"{INIT1_5}",
				INIT_06 => X"{INIT1_6}",
				INIT_07 => X"{INIT1_7}",
				INIT_08 => X"{INIT1_8}",
				INIT_09 => X"{INIT1_9}",
				INIT_0A => X"{INIT1_A}",
				INIT_0B => X"{INIT1_B}",
				INIT_0C => X"{INIT1_C}",
				INIT_0D => X"{INIT1_D}",
				INIT_0E => X"{INIT1_E}",
				INIT_0F => X"{INIT1_F}"
	        )
			port map (
				DIA => "0000",  
				ENA => '1', 
				WEA => '0',
				RSTA =>	'0',
				CLKA => clk,
				ADDRA => address,
				DOA => data_out,  
				DIB => jdata( 20 - 1 downto 16 ),   		-- Aquí se sustituyó la función por su valor concreto
				ENB => juser1, 
				WEB => jwrite,
				RSTB => '0',
				CLKB => clk,
				ADDRB => jaddr,
				DOB => open  
			) ; 
			-- loose top 2 bits
			instruction( 17 downto 16 ) <= data_out( 1 downto 0 ) ;

	    ram_2 : component RAMB4_S4_S4
	        generic map (
				INIT_00 => X"{INIT2_0}",
				INIT_01 => X"{INIT2_1}",
				INIT_02 => X"{INIT2_2}",
				INIT_03 => X"{INIT2_3}",
				INIT_04 => X"{INIT2_4}",
				INIT_05 => X"{INIT2_5}",
				INIT_06 => X"{INIT2_6}",
				INIT_07 => X"{INIT2_7}",
				INIT_08 => X"{INIT2_8}",
				INIT_09 => X"{INIT2_9}",
				INIT_0A => X"{INIT2_A}",
				INIT_0B => X"{INIT2_B}",
				INIT_0C => X"{INIT2_C}",
				INIT_0D => X"{INIT2_D}",
				INIT_0E => X"{INIT2_E}",
				INIT_0F => X"{INIT2_F}"
	        )
			port map (
				DIA => "0000",  
				ENA => '1', 
				WEA => '0',
				RSTA =>	'0',
				CLKA => clk,
				ADDRA => address,
				DOA => instruction( 15 downto 12 ),  
				DIB => jdata( 15 downto 12 ),   
				ENB => juser1, 
				WEB => jwrite,
				RSTB => '0',
				CLKB => clk,
				ADDRB => jaddr,
				DOB => open  
			) ; 

	    ram_3 : component RAMB4_S4_S4
	        generic map (
				INIT_00 => X"{INIT3_0}",
				INIT_01 => X"{INIT3_1}",
				INIT_02 => X"{INIT3_2}",
				INIT_03 => X"{INIT3_3}",
				INIT_04 => X"{INIT3_4}",
				INIT_05 => X"{INIT3_5}",
				INIT_06 => X"{INIT3_6}",
				INIT_07 => X"{INIT3_7}",
				INIT_08 => X"{INIT3_8}",
				INIT_09 => X"{INIT3_9}",
				INIT_0A => X"{INIT3_A}",
				INIT_0B => X"{INIT3_B}",
				INIT_0C => X"{INIT3_C}",
				INIT_0D => X"{INIT3_D}",
				INIT_0E => X"{INIT3_E}",
				INIT_0F => X"{INIT3_F}"
	        )
			port map (
				DIA => "0000",  
				ENA => '1', 
				WEA => '0',
				RSTA =>	'0',
				CLKA => clk,
				ADDRA => address,
				DOA => instruction( 11 downto 8 ),  
				DIB => jdata( 11 downto 8 ),   
				ENB => juser1, 
				WEB => jwrite,
				RSTB => '0',
				CLKB => clk,
				ADDRB => jaddr,
				DOB => open  
			) ; 

	    ram_4 : component RAMB4_S4_S4
	        generic map (
				INIT_00 => X"{INIT4_0}",
				INIT_01 => X"{INIT4_1}",
				INIT_02 => X"{INIT4_2}",
				INIT_03 => X"{INIT4_3}",
				INIT_04 => X"{INIT4_4}",
				INIT_05 => X"{INIT4_5}",
				INIT_06 => X"{INIT4_6}",
				INIT_07 => X"{INIT4_7}",
				INIT_08 => X"{INIT4_8}",
				INIT_09 => X"{INIT4_9}",
				INIT_0A => X"{INIT4_A}",
				INIT_0B => X"{INIT4_B}",
				INIT_0C => X"{INIT4_C}",
				INIT_0D => X"{INIT4_D}",
				INIT_0E => X"{INIT4_E}",
				INIT_0F => X"{INIT4_F}"
	        )
			port map (
				DIA => "0000",  
				ENA => '1', 
				WEA => '0',
				RSTA =>	'0',
				CLKA => clk,
				ADDRA => address,
				DOA => instruction( 7 downto 4 ),  
				DIB => jdata( 7 downto 4 ),   
				ENB => juser1, 
				WEB => jwrite,
				RSTB => '0',
				CLKB => clk,
				ADDRB => jaddr,
				DOB => open  
			) ; 

	    ram_5 : component RAMB4_S4_S4
	        generic map (
				INIT_00 => X"{INIT5_0}",
				INIT_01 => X"{INIT5_1}",
				INIT_02 => X"{INIT5_2}",
				INIT_03 => X"{INIT5_3}",
				INIT_04 => X"{INIT5_4}",
				INIT_05 => X"{INIT5_5}",
				INIT_06 => X"{INIT5_6}",
				INIT_07 => X"{INIT5_7}",
				INIT_08 => X"{INIT5_8}",
				INIT_09 => X"{INIT5_9}",
				INIT_0A => X"{INIT5_A}",
				INIT_0B => X"{INIT5_B}",
				INIT_0C => X"{INIT5_C}",
				INIT_0D => X"{INIT5_D}",
				INIT_0E => X"{INIT5_E}",
				INIT_0F => X"{INIT5_F}"
	        )
			port map (
				DIA => "0000",  
				ENA => '1', 
				WEA => '0',
				RSTA =>	'0',
				CLKA => clk,
				ADDRA => address,
				DOA => instruction( 3 downto 0 ),  
				DIB => jdata( 3 downto 0 ),   
				ENB => juser1, 
				WEB => jwrite,
				RSTB => '0',
				CLKB => clk,
				ADDRB => jaddr,
				DOB => open  
			) ; 
	end generate ;

	jdata <= ( others => '0' ) ;
	jaddr <= ( others => '0' ) ;
	juser1 <= '0' ;
	jwrite <= '0' ;
end architecture mix ;
