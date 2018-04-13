--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:42:07 11/19/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P6/test_Periferico_Complejo.vhd
-- Project Name:  P6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Periferico_Complejo
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
 
ENTITY test_Periferico_Complejo IS
END test_Periferico_Complejo;
 
ARCHITECTURE behavior OF test_Periferico_Complejo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Periferico_Complejo
    PORT(
         clk50MHz : IN  std_logic;
         reset : IN  std_logic;
         sdata_first_adc : IN  std_logic;
         sdata_second_adc : IN  std_logic;
         start_conv : IN  std_logic;
         sclk_both_adc : OUT  std_logic;
         cs_both_adc : OUT  std_logic;
         busy : OUT  std_logic;
         end_of_conv : OUT  std_logic;
         data_out_first_adc : OUT  std_logic_vector(11 downto 0);
         data_out_second_adc : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk50MHz : std_logic := '0';
   signal reset : std_logic := '0';
   signal sdata_first_adc : std_logic := '0';
   signal sdata_second_adc : std_logic := '0';
   signal start_conv : std_logic := '0';

 	--Outputs
   signal sclk_both_adc : std_logic;
   signal cs_both_adc : std_logic;
   signal busy : std_logic;
   signal end_of_conv : std_logic;
   signal data_out_first_adc : std_logic_vector(11 downto 0);
   signal data_out_second_adc : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk50MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Periferico_Complejo PORT MAP (
          clk50MHz => clk50MHz,
          reset => reset,
          sdata_first_adc => sdata_first_adc,
          sdata_second_adc => sdata_second_adc,
          start_conv => start_conv,
          sclk_both_adc => sclk_both_adc,
          cs_both_adc => cs_both_adc,
          busy => busy,
          end_of_conv => end_of_conv,
          data_out_first_adc => data_out_first_adc,
          data_out_second_adc => data_out_second_adc
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
		--wait for clk50MHz_period*2;
		
		start_conv<='1';
		wait for clk50MHz_period;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		start_conv<='0';
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
		
		-------------------------------
		wait for clk50MHz_period*20;
		
		start_conv<='1';
		wait for clk50MHz_period;
		
		sdata_first_adc<='0';
		sdata_second_adc<='0';
		start_conv<='0';
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
		
      wait for clk50MHz_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
