--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:00:37 06/09/2009
-- Design Name:   
-- Module Name:   C:/Jacobo/Xilinx_2009/ejemplo_basico_Picoblaze_3_Spartan_3_2009/test_picoblaze_3_empotrado.vhd
-- Project Name:  ejemplo_basico_Picoblaze_3_Spartan_3_2009
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: picoblaze3_empotrado
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY test_picoblaze_3_empotrado IS
END test_picoblaze_3_empotrado;
 
ARCHITECTURE behavior OF test_picoblaze_3_empotrado IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT picoblaze3_empotrado
    PORT(
         port_id : OUT  std_logic_vector(7 downto 0);
         write_strobe : OUT  std_logic;
         out_port : OUT  std_logic_vector(7 downto 0);
         read_strobe : OUT  std_logic;
         in_port : IN  std_logic_vector(7 downto 0);
         interrupt : IN  std_logic;
         interrupt_ack : OUT  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_port : std_logic_vector(7 downto 0) := (others => '0');
   signal interrupt : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal port_id : std_logic_vector(7 downto 0);
   signal write_strobe : std_logic;
   signal out_port : std_logic_vector(7 downto 0);
   signal read_strobe : std_logic;
   signal interrupt_ack : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: picoblaze3_empotrado PORT MAP (
          port_id => port_id,
          write_strobe => write_strobe,
          out_port => out_port,
          read_strobe => read_strobe,
          in_port => in_port,
          interrupt => interrupt,
          interrupt_ack => interrupt_ack,
          reset => reset,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

	tb : PROCESS

	BEGIN

      -- Initial conditions
		reset <= '1';
		in_port <= "00000000";
		interrupt <= '0';
      WAIT FOR 20 ns;

      reset <= '0';
		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

      WAIT FOR 600 ns;
      interrupt <= '1';
		in_port <="00001000";
		wait for 460 ns;
		in_port <="00000010";

      WAIT FOR 60 ns;
      interrupt <= '0';

      WAIT FOR 2 us;

-- This sentence stops the simulation when you execute the "run -all" option in Modelsim
	assert (false) report "Fin simulacion. NO es un error" severity FAILURE;

		wait; -- will wait forever
	END PROCESS;

END;
