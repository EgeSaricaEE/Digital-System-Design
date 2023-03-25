----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:26 05/27/2021 
-- Design Name: 
-- Module Name:    horizontal - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL ;
use IEEE.STD_LOGIC_ARITH.ALL ;

entity horizontal_sync_generator is
	port(
		clock: in std_logic;
		reset: in std_logic;
		hsync: out std_logic; --a port to output horizontal synchronization as described in the lab manual
		communicate_vsync: out std_logic; --a port to output the signal that shows a period of hsync has been completed
		display_enable_H: out std_logic -- a port to output the signal that will enable color counter while the time is on T_disp duration
	);
end horizontal_sync_generator;

architecture Behavioral of horizontal_sync_generator is
	
	signal resulting: std_logic := '1'; --a signal stores the current value for the output hsync signal, operates on and finally assign this value to hsync
	signal temp: integer range 0 to 800 := 0; -- a signal to count from 0 to 800 to monitor and to manage the output signal according to the wanted properties
begin
	process(reset,clock)
	begin
		if(reset = '1') then --initializes the variables
			temp <= 0; --count is 0
			resulting <= '1'; --the hsync output signal is 1
			display_enable_H <= '0'; --the color display is disabled initially
		elsif(rising_edge(clock)) then
			if(temp = 0) then --this if statement will result in the pulse width duration of the horizontal synchronization
			resulting <= '0'; 
			communicate_vsync <='0'; -- decreases 0 again to increase 1 at the end of the whole signal period (further explaination check temp == 800)
			elsif(temp = 96) then --back porch duration starts with this elsif statement
			resulting <= '1';
			elsif(temp = 144) then --with this elsif statement T_display starts ,note that display_enable signal rises to 1
			display_enable_H <= '1';
			elsif (temp = 784) then --with this elsif statement T_display ends and front porch period starts, note that display_enable signal decreases to 0			display_enable_H<= '0';
			display_enable_H<='0';
			end if;
			temp <= temp + 1; -- increments the count (just like while index argument )
			
			if (temp = 800) then -- ends the signal period when the specified count is reached
			temp <= 0;
			communicate_vsync <= '1'; -- notifies the vsync that the period of hsync is finished
			end if;
			
		end if;
	end process;
	hsync <= resulting; --assigns the resulting hysnc signal to appropriate port

end Behavioral;



