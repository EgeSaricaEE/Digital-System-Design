----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:39 05/27/2021 
-- Design Name: 
-- Module Name:    freq_div - Behavioral 
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

entity freq_div is
    Port ( B_clk : in  STD_LOGIC;
           Freq_out : out  STD_LOGIC);
end freq_div;

architecture Dataflow of freq_div is

component CB16CE 
port (
CEO : out STD_LOGIC;
Q : out STD_LOGIC_VECTOR(15 downto 0);
TC : out STD_LOGIC;
C : in STD_LOGIC;
CE : in STD_LOGIC;
CLR : in STD_LOGIC
);
end component;

--For c1: cb16ce use entity work.CB16CE(Behavioral);
--For c2: cb16ce use entity work.CB16CE(Behavioral);

signal c1o, c2o: std_logic_vector (15 downto 0);
signal ceo1, ceo2, tc1, tc2: std_logic;

begin


c1: cb16ce port map (ceo1, c1o,tc1, B_clk, '1', '0');
c2: cb16ce port map (ceo2, c2o, tc2, c1o(15), '1', '0');

Freq_out <= c2o(10);	

end Dataflow;

