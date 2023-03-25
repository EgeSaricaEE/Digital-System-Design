----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:22 05/27/2021 
-- Design Name: 
-- Module Name:    float_conv - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity float_conv is
    Port ( float : in  STD_LOGIC_VECTOR (6 downto 0);
           binary : out  STD_LOGIC_VECTOR (10 downto 0));
end float_conv;

architecture Dataflow of float_conv is

component my_multiplier port (a: in std_logic_vector (4 downto 0);
b: in std_logic_vector (8 downto 0);
mult: out std_logic_vector (13 downto 0));
end component;

signal mantissa : std_logic_vector (4 downto 0);
signal exponent : std_logic_vector (8 downto 0);
signal bin : std_logic_vector ( 13 downto 0);



begin

mantissa(4) <= '0';
mantissa(3 downto 0) <= float( 3 downto 0);
exponent <= "010000000" when float(6)='1' and float(5)='1' and float(4)='1' else
				"001000000" when float(6)='1' and float(5)='1' and float(4)='0' else
				"000100000" when float(6)='1' and float(5)='0' and float(4)='1' else
				"000010000" when float(6)='1' and float(5)='0' and float(4)='0' else
				"000001000" when float(6)='0' and float(5)='1' and float(4)='1' else
				"000000100" when float(6)='0' and float(5)='1' and float(4)='0' else
				"000000010" when float(6)='0' and float(5)='0' and float(4)='1' else
				"000000001" when float(6)='0' and float(5)='0' and float(4)='0';
				
m1: my_multiplier port map (mantissa, exponent, bin);

binary <= bin(10 downto 0);



end Dataflow;

