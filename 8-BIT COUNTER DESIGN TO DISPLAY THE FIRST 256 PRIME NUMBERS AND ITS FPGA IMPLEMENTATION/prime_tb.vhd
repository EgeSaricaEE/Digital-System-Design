--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:29:51 06/04/2021
-- Design Name:   
-- Module Name:   C:/Xilinx/ES/E6/prime_tb.vhd
-- Project Name:  E6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: my_bin_prime
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
 
ENTITY prime_tb IS
END prime_tb;
 
ARCHITECTURE behavior OF prime_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my_bin_prime
    PORT(
         my_8_bit : IN  std_logic_vector(7 downto 0);
         prime_11_bit : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal my_8_bit : std_logic_vector(7 downto 0);-- := (others => '0');

 	--Outputs
   signal prime_11_bit : std_logic_vector(10 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my_bin_prime PORT MAP (
          my_8_bit => my_8_bit,
          prime_11_bit => prime_11_bit
        );

   -- Clock process definitions
   tb :process
   begin
		my_8_bit <="00000000",
						"00000001" after 50 ns,
						"00000010" after 100 ns,
						"00000011" after 150 ns,
						"00000100" after 200 ns,
						"00000101" after 250 ns,
						"00000110" after 300 ns,
						"00000111" after 350 ns,
						"00001000" after 400 ns,
						"00001001" after 450 ns,
						"00001010" after 500 ns,
						"00001011" after 550 ns,
						"00001100" after 600 ns;
						WAIT; -- will wait forever
   end process;
 

   

END;
