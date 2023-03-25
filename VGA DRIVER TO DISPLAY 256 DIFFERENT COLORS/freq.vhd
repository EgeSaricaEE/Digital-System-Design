----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:43 05/27/2021 
-- Design Name: 
-- Module Name:    freq - Behavioral 
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

entity freq_divider is
	port(
	board_clock : in std_logic; 
	reset: in std_logic;
	divided_clock: out std_logic
	);
end freq_divider;

architecture structural of freq_divider is

--the flip flop (will be used to divide the freq.) declaration here
component my_t_flip_flop
				port(
							my_clk : in  std_logic;
							reset: in std_logic;
							control_in : in  std_logic;
							q_out : out  std_logic
				);
end component;


signal intermediate_clock: std_logic; --stores the intermediate signal between the FF's, which corresponds to the 50 MHz clock signal

begin
	--following two gates divides the input freq by 4 in total (2 per gate)
	g1: my_t_flip_flop port map (board_clock, reset, '1', intermediate_clock);
	g2: my_t_flip_flop port map (intermediate_clock, reset, '1', divided_clock);

end structural;

