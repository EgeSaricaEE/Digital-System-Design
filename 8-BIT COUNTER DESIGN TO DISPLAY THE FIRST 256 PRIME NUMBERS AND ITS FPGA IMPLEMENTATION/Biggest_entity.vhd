----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:28 06/03/2021 
-- Design Name: 
-- Module Name:    Biggest_entity - Behavioral 
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

entity Biggest_entity is
    Port ( B_clk : in  STD_LOGIC;
           sseg_an : out  STD_LOGIC_VECTOR (3 downto 0);
           sseg_ca : out  STD_LOGIC_VECTOR (7 downto 0));
end Biggest_entity;

architecture Dataflow of Biggest_entity is

component CB8CE
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end component;


component freq_div
Port ( B_clk : in  STD_LOGIC;
           Freq_out : out  STD_LOGIC);
end component;

component my_bin_bcd
Port ( binary_in : in  STD_LOGIC_VECTOR (10 downto 0);
           ones : out  STD_LOGIC_VECTOR (3 downto 0);
           tens : out  STD_LOGIC_VECTOR (3 downto 0);
           hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
           thousands : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component my_bcd_seg
Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component nexys3_sseg_driver
port( 
		MY_CLK 	: in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

component my_bin_prime
 Port ( my_8_bit : in  STD_LOGIC_VECTOR (7 downto 0);
           prime_11_bit : out  STD_LOGIC_VECTOR (10 downto 0));
end component;


signal freq_div_out: std_logic;
signal c1o: std_logic_vector (7 downto 0);
signal ceo1, tc1: std_logic;
signal bit_11_sig: std_logic_vector (10 downto 0);

signal my_ones: std_logic_vector (3 downto 0);
signal my_tens: std_logic_vector (3 downto 0);
signal my_hundreds: std_logic_vector (3 downto 0);
signal my_thousands: std_logic_vector (3 downto 0);
signal dig0, dig1, dig2, dig3: std_logic_vector (7 downto 0);
signal ca: STD_LOGIC_VECTOR (7 downto 0);
signal an: STD_LOGIC_VECTOR (3 downto 0);



begin

c1: freq_div port map (B_clk, freq_div_out);
c2: cb8ce port map (ceo1, c1o,tc1, freq_div_out, '1', '0');
--here comes 8 bit to 11 bit prime converter
--give c1o as input and bit_11_sig as output
c6: my_bin_prime port map (c1o, bit_11_sig);

c3: my_bin_bcd port map (bit_11_sig, my_ones, my_tens, my_hundreds, my_thousands);
seg0: my_bcd_seg port map ( my_ones, dig0(6 downto 0));
seg1: my_bcd_seg port map ( my_tens, dig1(6 downto 0));
seg2: my_bcd_seg port map ( my_hundreds, dig2(6 downto 0));
seg3: my_bcd_seg port map ( my_thousands, dig3(6 downto 0));

dig0(7) <= '1';
dig1(7) <= '1';
dig2(7) <= '1';
dig3(7) <= '1';

c5: nexys3_sseg_driver port map (B_clk, dig3,dig2 , dig1, dig0, ca, an);

sseg_ca <= ca;
sseg_an <= an;





end Dataflow;



