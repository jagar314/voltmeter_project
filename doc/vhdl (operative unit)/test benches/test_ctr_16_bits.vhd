--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:27:25 11/19/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P6/test_ctr_4_bits.vhd
-- Project Name:  P6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ctr_4_bits
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
 
ENTITY test_ctr_4_bits IS
END test_ctr_4_bits;
 
ARCHITECTURE behavior OF test_ctr_4_bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ctr_4_bits
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
         cont_overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal cont_overflow : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ctr_4_bits PORT MAP (
          clk => clk,
          reset => reset,
          en => en,
          cont_overflow => cont_overflow
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
		en<='1';
		wait for clk_period*50;
		
		en<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
