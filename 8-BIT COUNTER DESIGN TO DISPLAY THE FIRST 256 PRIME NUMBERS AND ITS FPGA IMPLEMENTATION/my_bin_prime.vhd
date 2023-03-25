----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:13 06/03/2021 
-- Design Name: 
-- Module Name:    my_bin_prime - Dataflow 
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

entity my_bin_prime is
    Port ( my_8_bit : in  STD_LOGIC_VECTOR (7 downto 0);
           prime_11_bit : out  STD_LOGIC_VECTOR (10 downto 0));
end my_bin_prime;

architecture Dataflow of my_bin_prime is

--signal my_8_bit: std_logic_vector (7 downto 0);
signal my_prime: std_logic_vector (10 downto 0);

begin


my_prime <= "00000000010" when my_8_bit<="00000000" else
				"00000000011" when my_8_bit<="00000001" else
				"00000000101" when my_8_bit<="00000010" else
				"00000000111" when my_8_bit<="00000011" else
				"00000001011" when my_8_bit<="00000100" else
				"00000001101" when my_8_bit<="00000101" else
				"00000010001" when my_8_bit<="00000110" else
				"00000010011" when my_8_bit<="00000111" else
				"00000010111" when my_8_bit<="00001000" else
				"00000011101" when my_8_bit<="00001001" else
				"00000011111" when my_8_bit<="00001010" else
				"00000100101" when my_8_bit<="00001011" else
				"00000101001" when my_8_bit<="00001100" else
				"00000101011" when my_8_bit<="00001101" else
				"00000101111" when my_8_bit<="00001110" else
				"00000110101" when my_8_bit<="00001111" else
				"00000111011" when my_8_bit<="00010000" else
				"00000111101" when my_8_bit<="00010001" else
				"00001000011" when my_8_bit<="00010010" else
				"00001000111" when my_8_bit<="00010011" else
				"00001001001" when my_8_bit<="00010100" else
				"00001001111" when my_8_bit<="00010101" else
				"00001010011" when my_8_bit<="00010110" else
				"00001011001" when my_8_bit<="00010111" else
				"00001100001" when my_8_bit<="00011000" else
				"00001100101" when my_8_bit<="00011001" else
				"00001100111" when my_8_bit<="00011010" else
				"00001101011" when my_8_bit<="00011011" else
				"00001101101" when my_8_bit<="00011100" else
				"00001110001" when my_8_bit<="00011101" else
				"00001111111" when my_8_bit<="00011110" else
				"00010000011" when my_8_bit<="00011111" else
				"00010001001" when my_8_bit<="00100000" else
				"00010001011" when my_8_bit<="00100001" else
				"00010010101" when my_8_bit<="00100010" else
				"00010010111" when my_8_bit<="00100011" else
				"00010011101" when my_8_bit<="00100100" else
				"00010100011" when my_8_bit<="00100101" else
				"00010100111" when my_8_bit<="00100110" else
				"00010101101" when my_8_bit<="00100111" else
				"00010110011" when my_8_bit<="00101000" else
				"00010110101" when my_8_bit<="00101001" else
				"00010111111" when my_8_bit<="00101010" else
				"00011000001" when my_8_bit<="00101011" else
				"00011000101" when my_8_bit<="00101100" else
				"00011000111" when my_8_bit<="00101101" else
				"00011010011" when my_8_bit<="00101110" else
				"00011011111" when my_8_bit<="00101111" else
				"00011100011" when my_8_bit<="00110000" else
				"00011100101" when my_8_bit<="00110001" else
				"00011101001" when my_8_bit<="00110010" else
				"00011101111" when my_8_bit<="00110011" else
				"00011110001" when my_8_bit<="00110100" else
				"00011111011" when my_8_bit<="00110101" else
				"00100000001" when my_8_bit<="00110110" else
				"00100000111" when my_8_bit<="00110111" else
				"00100001101" when my_8_bit<="00111000" else
				"00100001111" when my_8_bit<="00111001" else
				"00100010101" when my_8_bit<="00111010" else
				"00100011001" when my_8_bit<="00111011" else
				"00100011011" when my_8_bit<="00111100" else
				"00100100101" when my_8_bit<="00111101" else
				"00100110011" when my_8_bit<="00111110" else
				"00100110111" when my_8_bit<="00111111" else
				"00100111001" when my_8_bit<="01000000" else
				"00100111101" when my_8_bit<="01000001" else
				"00101001011" when my_8_bit<="01000010" else
				"00101010001" when my_8_bit<="01000011" else
				"00101011011" when my_8_bit<="01000100" else
				"00101011101" when my_8_bit<="01000101" else
				"00101100001" when my_8_bit<="01000110" else
				"00101100111" when my_8_bit<="01000111" else
				"00101101111" when my_8_bit<="01001000" else
				"00101110101" when my_8_bit<="01001001" else
				"00101111011" when my_8_bit<="01001010" else
				"00101111111" when my_8_bit<="01001011" else
				"00110000101" when my_8_bit<="01001100" else
				"00110001101" when my_8_bit<="01001101" else
				"00110010001" when my_8_bit<="01001110" else
				"00110011001" when my_8_bit<="01001111" else
				"00110100011" when my_8_bit<="01010000" else
				"00110100101" when my_8_bit<="01010001" else
				"00110101111" when my_8_bit<="01010010" else
				"00110110001" when my_8_bit<="01010011" else
				"00110110111" when my_8_bit<="01010100" else
				"00110111011" when my_8_bit<="01010101" else
				"00111000001" when my_8_bit<="01010110" else
				"00111001001" when my_8_bit<="01010111" else
				"00111001101" when my_8_bit<="01011000" else
				"00111001111" when my_8_bit<="01011001" else
				"00111010011" when my_8_bit<="01011010" else
				"00111011111" when my_8_bit<="01011011" else
				"00111100111" when my_8_bit<="01011100" else
				"00111101011" when my_8_bit<="01011101" else
				"00111110011" when my_8_bit<="01011110" else
				"00111110111" when my_8_bit<="01011111" else
				"00111111101" when my_8_bit<="01100000" else
				"01000001001" when my_8_bit<="01100001" else
				"01000001011" when my_8_bit<="01100010" else
				"01000011101" when my_8_bit<="01100011" else
				"01000100011" when my_8_bit<="01100100" else
				"01000101101" when my_8_bit<="01100101" else
				"01000110011" when my_8_bit<="01100110" else
				"01000111001" when my_8_bit<="01100111" else
				"01000111011" when my_8_bit<="01101000" else
				"01001000001" when my_8_bit<="01101001" else
				"01001001011" when my_8_bit<="01101010" else
				"01001010001" when my_8_bit<="01101011" else
				"01001010111" when my_8_bit<="01101100" else
				"01001011001" when my_8_bit<="01101101" else
				"01001011111" when my_8_bit<="01101110" else
				"01001100101" when my_8_bit<="01101111" else
				"01001101001" when my_8_bit<="01110000" else
				"01001101011" when my_8_bit<="01110001" else
				"01001110111" when my_8_bit<="01110010" else
				"01010000001" when my_8_bit<="01110011" else
				"01010000011" when my_8_bit<="01110100" else
				"01010000111" when my_8_bit<="01110101" else
				"01010001101" when my_8_bit<="01110110" else
				"01010010011" when my_8_bit<="01110111" else
				"01010010101" when my_8_bit<="01111000" else
				"01010100001" when my_8_bit<="01111001" else
				"01010100101" when my_8_bit<="01111010" else
				"01010101011" when my_8_bit<="01111011" else
				"01010110011" when my_8_bit<="01111100" else
				"01010111101" when my_8_bit<="01111101" else
				"01011000101" when my_8_bit<="01111110" else
				"01011001111" when my_8_bit<="01111111" else
				"01011010111" when my_8_bit<="10000000" else
				"01011011101" when my_8_bit<="10000001" else
				"01011100011" when my_8_bit<="10000010" else
				"01011100111" when my_8_bit<="10000011" else
				"01011101111" when my_8_bit<="10000100" else
				"01011110101" when my_8_bit<="10000101" else
				"01011111001" when my_8_bit<="10000110" else
				"01100000001" when my_8_bit<="10000111" else
				"01100000101" when my_8_bit<="10001000" else
				"01100010011" when my_8_bit<="10001001" else
				"01100011101" when my_8_bit<="10001010" else
				"01100101001" when my_8_bit<="10001011" else
				"01100101011" when my_8_bit<="10001100" else
				"01100110101" when my_8_bit<="10001101" else
				"01100110111" when my_8_bit<="10001110" else
				"01100111011" when my_8_bit<="10001111" else
				"01100111101" when my_8_bit<="10010000" else
				"01101000111" when my_8_bit<="10010001" else
				"01101010101" when my_8_bit<="10010010" else
				"01101011001" when my_8_bit<="10010011" else
				"01101011011" when my_8_bit<="10010100" else
				"01101011111" when my_8_bit<="10010101" else
				"01101101101" when my_8_bit<="10010110" else
				"01101110001" when my_8_bit<="10010111" else
				"01101110011" when my_8_bit<="10011000" else
				"01101110111" when my_8_bit<="10011001" else
				"01110001011" when my_8_bit<="10011010" else
				"01110001111" when my_8_bit<="10011011" else
				"01110010111" when my_8_bit<="10011100" else
				"01110100001" when my_8_bit<="10011101" else
				"01110101001" when my_8_bit<="10011110" else
				"01110101101" when my_8_bit<="10011111" else
				"01110110011" when my_8_bit<="10100000" else
				"01110111001" when my_8_bit<="10100001" else
				"01111000111" when my_8_bit<="10100010" else
				"01111001011" when my_8_bit<="10100011" else
				"01111010001" when my_8_bit<="10100100" else
				"01111010111" when my_8_bit<="10100101" else
				"01111011111" when my_8_bit<="10100110" else
				"01111100101" when my_8_bit<="10100111" else
				"01111110001" when my_8_bit<="10101000" else
				"01111110101" when my_8_bit<="10101001" else
				"01111111011" when my_8_bit<="10101010" else
				"01111111101" when my_8_bit<="10101011" else
				"10000000111" when my_8_bit<="10101100" else
				"10000001001" when my_8_bit<="10101101" else
				"10000001111" when my_8_bit<="10101110" else
				"10000011001" when my_8_bit<="10101111" else
				"10000011011" when my_8_bit<="10110000" else
				"10000100101" when my_8_bit<="10110001" else
				"10000100111" when my_8_bit<="10110010" else
				"10000101101" when my_8_bit<="10110011" else
				"10000111111" when my_8_bit<="10110100" else
				"10001000011" when my_8_bit<="10110101" else
				"10001000101" when my_8_bit<="10110110" else
				"10001001001" when my_8_bit<="10110111" else
				"10001001111" when my_8_bit<="10111000" else
				"10001010101" when my_8_bit<="10111001" else
				"10001011101" when my_8_bit<="10111010" else
				"10001100011" when my_8_bit<="10111011" else
				"10001101001" when my_8_bit<="10111100" else
				"10001111111" when my_8_bit<="10111101" else
				"10010000001" when my_8_bit<="10111110" else
				"10010001011" when my_8_bit<="10111111" else
				"10010010011" when my_8_bit<="11000000" else
				"10010011101" when my_8_bit<="11000001" else
				"10010100011" when my_8_bit<="11000010" else
				"10010101001" when my_8_bit<="11000011" else
				"10010110001" when my_8_bit<="11000100" else
				"10010111101" when my_8_bit<="11000101" else
				"10011000001" when my_8_bit<="11000110" else
				"10011000111" when my_8_bit<="11000111" else
				"10011001101" when my_8_bit<="11001000" else
				"10011001111" when my_8_bit<="11001001" else
				"10011010101" when my_8_bit<="11001010" else
				"10011100001" when my_8_bit<="11001011" else
				"10011101011" when my_8_bit<="11001100" else
				"10011111101" when my_8_bit<="11001101" else
				"10011111111" when my_8_bit<="11001110" else
				"10100000011" when my_8_bit<="11001111" else
				"10100001001" when my_8_bit<="11010000" else
				"10100001011" when my_8_bit<="11010001" else
				"10100010001" when my_8_bit<="11010010" else
				"10100010101" when my_8_bit<="11010011" else
				"10100010111" when my_8_bit<="11010100" else
				"10100011011" when my_8_bit<="11010101" else
				"10100100111" when my_8_bit<="11010110" else
				"10100101001" when my_8_bit<="11010111" else
				"10100101111" when my_8_bit<="11011000" else
				"10101010001" when my_8_bit<="11011001" else
				"10101010111" when my_8_bit<="11011010" else
				"10101011101" when my_8_bit<="11011011" else
				"10101100101" when my_8_bit<="11011100" else
				"10101110111" when my_8_bit<="11011101" else
				"10110000001" when my_8_bit<="11011110" else
				"10110001111" when my_8_bit<="11011111" else
				"10110010011" when my_8_bit<="11100000" else
				"10110010101" when my_8_bit<="11100001" else
				"10110011001" when my_8_bit<="11100010" else
				"10110011111" when my_8_bit<="11100011" else
				"10110100111" when my_8_bit<="11100100" else
				"10110101011" when my_8_bit<="11100101" else
				"10110101101" when my_8_bit<="11100110" else
				"10110110011" when my_8_bit<="11100111" else
				"10110111111" when my_8_bit<="11101000" else
				"10111001001" when my_8_bit<="11101001" else
				"10111001011" when my_8_bit<="11101010" else
				"10111001111" when my_8_bit<="11101011" else
				"10111010001" when my_8_bit<="11101100" else
				"10111010101" when my_8_bit<="11101101" else
				"10111011011" when my_8_bit<="11101110" else
				"10111100111" when my_8_bit<="11101111" else
				"10111110011" when my_8_bit<="11110000" else
				"10111111011" when my_8_bit<="11110001" else
				"11000000111" when my_8_bit<="11110010" else
				"11000001101" when my_8_bit<="11110011" else
				"11000010001" when my_8_bit<="11110100" else
				"11000010111" when my_8_bit<="11110101" else
				"11000011111" when my_8_bit<="11110110" else
				"11000100011" when my_8_bit<="11110111" else
				"11000101011" when my_8_bit<="11111000" else
				"11000101111" when my_8_bit<="11111001" else
				"11000111101" when my_8_bit<="11111010" else
				"11001000001" when my_8_bit<="11111011" else
				"11001000111" when my_8_bit<="11111100" else
				"11001001001" when my_8_bit<="11111101" else
				"11001001101" when my_8_bit<="11111110" else
				"11001010011" when my_8_bit<="11111111";


prime_11_bit <=my_prime;


end Dataflow;

