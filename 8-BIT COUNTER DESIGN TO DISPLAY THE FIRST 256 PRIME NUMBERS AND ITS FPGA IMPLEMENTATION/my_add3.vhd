----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:18 05/28/2021 
-- Design Name: 
-- Module Name:    my_add3 - Behavioral 
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

entity my_add3 is
    Port ( adin : in  STD_LOGIC_VECTOR (3 downto 0);
           adout : out  STD_LOGIC_VECTOR (3 downto 0));
end my_add3;

architecture Dataflow of my_add3 is

begin

adout <= "1100" when adin="1001" else
			"1011" when adin="1000" else
			"1010" when adin="0111" else
			"1001" when adin="0110" else
			"1000" when adin="0101" else
			"0100" when adin="0100" else
			"0011" when adin="0011" else
			"0010" when adin="0010" else
			"0001" when adin="0001" else
			"0000" when adin="0000" ;

end Dataflow;

