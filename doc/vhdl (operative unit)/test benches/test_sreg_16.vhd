--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:20:32 11/19/2016
-- Design Name:   
-- Module Name:   C:/Users/Javi/Desktop/CEP/P6/test_sreg_16.vhd
-- Project Name:  P6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: srg_16
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
 
ENTITY test_sreg_16 IS
END test_sreg_16;
 
ARCHITECTURE behavior OF test_sreg_16 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT srg_16
    PORT(
         clk : IN  std_logic;
         en : IN  std_logic;
         reset : IN  std_logic;
         sdata : IN  std_logic;
         q_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en : std_logic := '0';
   signal reset : std_logic := '0';
   signal sdata : std_logic := '0';

 	--Outputs
   signal q_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: srg_16 PORT MAP (
          clk => clk,
          en => en,
          reset => reset,
          sdata => sdata,
          q_out => q_out
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
		sdata<='1';
		wait for clk_period*2;
		
		sdata<='0';
		wait for clk_period*2;
		
		sdata<='1';
		wait for clk_period*2;
		
		en<='0';
		wait for clk_period*2; 
		
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
