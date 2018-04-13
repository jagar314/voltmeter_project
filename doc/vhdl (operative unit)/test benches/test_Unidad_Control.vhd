--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:57:33 11/19/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P6/test_Unidad_Control.vhd
-- Project Name:  P6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_Control
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
 
ENTITY test_Unidad_Control IS
END test_Unidad_Control;
 
ARCHITECTURE behavior OF test_Unidad_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_Control
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_conv : IN  std_logic;
         cont_overflow : IN  std_logic;
         end_of_conv : OUT  std_logic;
         busy : OUT  std_logic;
         control_reg_sal : OUT  std_logic;
         cs_both_adc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start_conv : std_logic := '0';
   signal cont_overflow : std_logic := '0';

 	--Outputs
   signal end_of_conv : std_logic;
   signal busy : std_logic;
   signal control_reg_sal : std_logic;
   signal cs_both_adc : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_Control PORT MAP (
          clk => clk,
          reset => reset,
          start_conv => start_conv,
          cont_overflow => cont_overflow,
          end_of_conv => end_of_conv,
          busy => busy,
          control_reg_sal => control_reg_sal,
          cs_both_adc => cs_both_adc
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		reset<='1';
		wait for clk_period*3;
		
		reset<='0';
		start_conv<='1';
		wait for clk_period;
		
		--start_conv<='0';
		wait for clk_period*16;
		
		cont_overflow<='1';
		wait for clk_period;
		
		cont_overflow<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
