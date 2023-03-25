----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:41 05/27/2021 
-- Design Name: 
-- Module Name:    color - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity color_generator is
	port(
	clock: in std_logic; --port to get clock signal of the circ.
	reset: in std_logic; --port to get reset signal of the circ.
	colors: out std_logic_vector (7 downto 0) --port to output R2R1R0G2G1G0B1B0 color signal (high to low priority)
	);
end color_generator;

architecture structural of color_generator is

--declares a t FF component to create a counter
component my_t_flip_flop
				port(
							my_clk : in  std_logic;
	 						reset: in std_logic;
							control_in : in  std_logic;
							q_out : out  std_logic
				);
end component;

signal intermediate_values: std_logic_vector (7 downto 0); --this signal stores the intermediate signals between the FF's that are implemented below

begin

--8 FF's are used due to 8 bit counting sim.
m1: my_t_flip_flop port map (clock, reset, '1' , intermediate_values(0));
m2: my_t_flip_flop port map (intermediate_values(0), reset, '1' , intermediate_values(1));
m3: my_t_flip_flop port map (intermediate_values(1), reset, '1' , intermediate_values(2));
m4: my_t_flip_flop port map (intermediate_values(2), reset, '1' , intermediate_values(3));
m5: my_t_flip_flop port map (intermediate_values(3), reset, '1' , intermediate_values(4));
m6: my_t_flip_flop port map (intermediate_values(4), reset, '1' , intermediate_values(5));
m7: my_t_flip_flop port map (intermediate_values(5), reset, '1' , intermediate_values(6));
m8: my_t_flip_flop port map (intermediate_values(6), reset, '1' , intermediate_values(7));

colors <= intermediate_values; --assigns the output value appropriately



end structural;



