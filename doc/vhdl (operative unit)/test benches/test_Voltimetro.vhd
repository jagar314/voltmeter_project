--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:00:36 12/12/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P7/test_Voltimetro.vhd
-- Project Name:  P7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Voltimetro_P6
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
 
ENTITY test_Voltimetro IS
END test_Voltimetro;
 
ARCHITECTURE behavior OF test_Voltimetro IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Voltimetro_P6
    PORT(
         clk : IN  std_logic;
         btn : IN  std_logic_vector(3 downto 0);
         sdata_first_adc : IN  std_logic;
         sdata_second_adc : IN  std_logic;
         sclk_both_adc : OUT  std_logic;
         cs_both_adc : OUT  std_logic;
         lcd_db : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal sdata_first_adc : std_logic := '0';
   signal sdata_second_adc : std_logic := '0';

	--BiDirs
   signal lcd_db : std_logic_vector(7 downto 0);

 	--Outputs
   signal sclk_both_adc : std_logic;
   signal cs_both_adc : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Voltimetro_P6 PORT MAP (
          clk => clk,
          btn => btn,
          sdata_first_adc => sdata_first_adc,
          sdata_second_adc => sdata_second_adc,
          sclk_both_adc => sclk_both_adc,
          cs_both_adc => cs_both_adc,
          lcd_db => lcd_db
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

      btn(3)<='1';
		wait for clk_period*3;
		
		btn(3)<='0';
		--wait for clk_period*2;
		
		btn(0)<='1';
		wait for clk_period;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
--		btn(0)<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk_period*10;
	-------------------------------	
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='1';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
	------------------------------------	
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk_period*10;
		
		sdata_first_adc<='1';
		sdata_second_adc<='1';
		wait for clk_period*10;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
