--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:14:27 11/19/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P6/test_Unidad_Operativa.vhd
-- Project Name:  P6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_Operativa
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_Unidad_Operativa IS
END test_Unidad_Operativa;
 
ARCHITECTURE behavior OF test_Unidad_Operativa IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_Operativa
    PORT(
         clk50MHz : IN  std_logic;
         reset : IN  std_logic;
         sdata_first_adc : IN  std_logic;
         sdata_second_adc : IN  std_logic;
         data_out_first_adc : OUT  std_logic_vector(11 downto 0);
         data_out_second_adc : OUT  std_logic_vector(11 downto 0);
         cont_overflow : OUT  std_logic;
         control_reg_sal : IN  std_logic;
         sclk_both_adc : OUT  std_logic;
			cs_both_adc: IN std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50MHz : std_logic := '0';
   signal reset : std_logic := '0';
   signal sdata_first_adc : std_logic := '0';
   signal sdata_second_adc : std_logic := '0';
   signal control_reg_sal : std_logic := '0';
	signal cs_both_adc : std_logic := '0';

 	--Outputs
   signal data_out_first_adc : std_logic_vector(11 downto 0);
   signal data_out_second_adc : std_logic_vector(11 downto 0);
   signal cont_overflow : std_logic;
   signal sclk_both_adc : std_logic;

   -- Clock period definitions
   constant clk50MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_Operativa PORT MAP (
          clk50MHz => clk50MHz,
          reset => reset,
          sdata_first_adc => sdata_first_adc,
          sdata_second_adc => sdata_second_adc,
          data_out_first_adc => data_out_first_adc,
          data_out_second_adc => data_out_second_adc,
          cont_overflow => cont_overflow,
          control_reg_sal => control_reg_sal,
          sclk_both_adc => sclk_both_adc,
			 cs_both_adc => cs_both_adc
        );

   -- Clock process definitions
   clk50MHz_process :process
   begin
		clk50MHz <= '0';
		wait for clk50MHz_period/2;
		clk50MHz <= '1';
		wait for clk50MHz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		reset<='1';
		wait for clk50MHz_period*3;
		
		reset<='0';
		
		cs_both_adc<='0';
		wait for clk50MHz_period;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		cs_both_adc<='1';
		control_reg_sal<='1';
		
		-------------------------------
		wait for clk50MHz_period*20;
		
		cs_both_adc<='0';
		wait for clk50MHz_period;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk50MHz_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='0';
		wait for clk50MHz_period*10;
		
		cs_both_adc<='1';
		control_reg_sal<='1';
		
		--sdata_first_adc<='1';
		--sdata_second_adc<='1';
		--control_reg_sal<='1';
		--wait for clk50MHz_period*100;
		
      wait for clk50MHz_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
