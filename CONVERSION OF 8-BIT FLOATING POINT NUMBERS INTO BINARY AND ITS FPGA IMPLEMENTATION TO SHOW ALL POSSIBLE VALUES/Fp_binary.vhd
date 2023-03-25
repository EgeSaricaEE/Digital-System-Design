----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:38 05/27/2021 
-- Design Name: 
-- Module Name:    Fp_binary - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;










--biggest entity:
entity Fp_binary is
    Port ( B_clk : in  STD_LOGIC;
           sseg_ca: out std_logic_vector(7 downto 0);
				sseg_an: out std_logic_vector(3 downto 0));
end Fp_binary;

architecture Dataflow of Fp_binary is
--declaring freq divider
component freq_div 
port ( B_clk : in  STD_LOGIC;
           Freq_out : out  STD_LOGIC);
end component;

--declaring 8 bit counter
component cb8ce 
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end component;

component float_conv
port (float : in  STD_LOGIC_VECTOR (6 downto 0);
      binary : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

component my_bin_bcd
port ( binary_in : in  STD_LOGIC_VECTOR (10 downto 0);
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
    PORT ( my_clk  : in  STD_LOGIC;
           digit0  : in  STD_LOGIC_VECTOR (7 downto 0);
           digit1  : in  STD_LOGIC_VECTOR (7 downto 0);
           digit2  : in  STD_LOGIC_VECTOR (7 downto 0);
           digit3  : in  STD_LOGIC_VECTOR (7 downto 0);
           sseg_ca : out  STD_LOGIC_VECTOR (7 downto 0);
           sseg_an : out  STD_LOGIC_VECTOR (3 downto 0));
end component;



signal c1o: std_logic_vector (7 downto 0);
signal ceo1, tc1: std_logic;
signal fo: std_logic;
signal fco: std_logic_vector (10 downto 0);
signal my_ones: std_logic_vector (3 downto 0);
signal my_tens: std_logic_vector (3 downto 0);
signal my_hundreds: std_logic_vector (3 downto 0);
signal my_thousands: std_logic_vector (3 downto 0);
signal dig0, dig1, dig2, dig3: std_logic_vector (7 downto 0);
signal ca: STD_LOGIC_VECTOR (7 downto 0);
signal an: STD_LOGIC_VECTOR (3 downto 0);


begin

c5: freq_div port map (B_clk, fo);
c1: cb8ce port map (ceo1, c1o,tc1, fo, '1', '0');
c3: float_conv port map (c1o(6 downto 0),fco);
c4: my_bin_bcd port map (fco, my_ones, my_tens, my_hundreds, my_thousands);
seg0: my_bcd_seg port map ( my_ones, dig0(6 downto 0));
seg1: my_bcd_seg port map ( my_tens, dig1(6 downto 0));
seg2: my_bcd_seg port map ( my_hundreds, dig2(6 downto 0));
seg3: my_bcd_seg port map ( my_thousands, dig3(6 downto 0));

dig0(7) <= '1';
dig1(7) <= '1';
dig2(7) <= '1';
dig3(7) <= '1';

c2: nexys3_sseg_driver port map (B_clk, dig3,dig2 , dig1, dig0, ca, an);

sseg_ca <= ca;
sseg_an <= an;


end Dataflow;

