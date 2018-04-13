--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:03:41 11/19/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P6/test_divider5.vhd
-- Project Name:  P6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divider5
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
 
ENTITY test_divider5 IS
END test_divider5;
 
ARCHITECTURE behavior OF test_divider5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider5
    PORT(
         clkin : IN  std_logic;
         clkout : OUT  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clkin : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal clkout : std_logic;

   -- Clock period definitions
   constant clkin_period : time := 10 ns;
   constant clkout_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider5 PORT MAP (
          clkin => clkin,
          clkout => clkout,
          reset => reset
        );

   -- Clock process definitions
   clkin_process :process
   begin
		clkin <= '0';
		wait for clkin_period/2;
		clkin <= '1';
		wait for clkin_period/2;
   end process;
 
   clkout_process :process
   begin
		clkout <= '0';
		wait for clkout_period/2;
		clkout <= '1';
		wait for clkout_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		reset<='1';
		wait for clkin_period*3;
		
		reset<='0';
		wait for clkin_period*50;
      wait for clkin_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
