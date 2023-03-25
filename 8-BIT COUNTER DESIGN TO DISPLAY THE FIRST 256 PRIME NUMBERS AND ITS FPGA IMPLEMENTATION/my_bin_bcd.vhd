----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:56 05/28/2021 
-- Design Name: 
-- Module Name:    my_bin_bcd - Dataflow 
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

entity my_bin_bcd is
    Port ( binary_in : in  STD_LOGIC_VECTOR (10 downto 0);
           ones : out  STD_LOGIC_VECTOR (3 downto 0);
           tens : out  STD_LOGIC_VECTOR (3 downto 0);
           hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
           thousands : out  STD_LOGIC_VECTOR (3 downto 0));
end my_bin_bcd;

architecture Dataflow of my_bin_bcd is

component 
my_add3 PORT ( adin : in  STD_LOGIC_VECTOR (3 downto 0);
           adout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;


signal bcd_end: STD_LOGIC_VECTOR (15 downto 0) ;
signal Ad12: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad23: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad34: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad45: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad56: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad67: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad78: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad910: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad1011: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad1112: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad1213: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad1415: STD_LOGIC_VECTOR (3 downto 0) ;
signal shift1, shift2, shift3, shift4, shift5, shift6, shift7, shift8, shift9, shift10, shift11, shift12, shift13, shift14, shift15 : STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad8: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad13: STD_LOGIC_VECTOR (3 downto 0) ;
signal Ad15: STD_LOGIC_VECTOR (3 downto 0) ;

begin


shift1(3) <= '0';
shift1(2 downto 0) <= binary_in(10 downto 8);



ma1: my_add3 PORT MAP(shift1 ,Ad12);
shift2(3 downto 1) <= Ad12(2 downto 0);
shift2(0) <= binary_in(7);



ma2: my_add3 PORT MAP(shift2 ,Ad23);
shift3(3 downto 1) <= Ad23(2 downto 0);
shift3(0) <= binary_in(6);



ma3: my_add3 PORT MAP(shift3 ,Ad34);
shift4(3 downto 1) <= Ad34(2 downto 0);
shift4(0) <= binary_in(5);


ma4: my_add3 PORT MAP(shift4 ,Ad45);  
shift10(0) <= Ad45(3);
shift5(3 downto 1) <= Ad45(2 downto 0);
shift5(0) <= binary_in(4);

 
ma5: my_add3 PORT MAP(shift5 ,Ad56);    
shift11(0) <= Ad56(3);
shift6(3 downto 1) <= Ad56(2 downto 0);
shift6(0) <= binary_in(3);


ma6: my_add3 PORT MAP(shift6 ,Ad67);  
shift12(0) <= Ad67(3);
shift7(3 downto 1) <= Ad67(2 downto 0);
shift7(0) <= binary_in(2);


 ma7: my_add3 PORT MAP(shift7 ,Ad78);  
shift13(0) <= Ad78(3);
shift8(3 downto 1) <= Ad78(2 downto 0);
shift8(0) <= binary_in(1);

ma8: my_add3 PORT MAP(shift8 ,Ad8);
shift9(3) <= '0';
shift9(0) <= Ad34(3);
shift9(1) <= Ad23(3);
shift9(2) <= Ad12(3);    



ma9: my_add3 PORT MAP(shift9 ,Ad910);
shift10(3 downto 1) <= Ad910(2 downto 0);

  
ma10: my_add3 PORT MAP(shift10 ,Ad1011);
shift11(3 downto 1) <= Ad1011(2 downto 0);



ma11: my_add3 PORT MAP(shift11 ,Ad1112);
shift12(3 downto 1) <= Ad1112(2 downto 0);


 ma12: my_add3 PORT MAP(shift12 ,Ad1213);  
shift15(0) <= Ad1213(3);
shift13(3 downto 1) <= Ad1213(2 downto 0);

ma13: my_add3 PORT MAP(shift13 ,Ad13);	
shift14(1) <= Ad1011(3);
shift14(0) <= Ad1112(3);
shift14(2) <= Ad910(3);
shift14(3) <= '0';

ma14: my_add3 PORT MAP(shift14 ,Ad1415);
shift15(3 downto 1) <= Ad1415(2 downto 0);


ma15: my_add3 PORT MAP(shift15 ,Ad15);


bcd_end(15) <= '0';
bcd_end(14) <= '0';
bcd_end(13) <= Ad1415(3);
bcd_end(12 downto 9) <= Ad15;
bcd_end(8 downto 5) <= Ad13;
bcd_end(4 downto 1) <= Ad8;
bcd_end(0) <= binary_in(0);





thousands <= bcd_end(15 downto 12);
hundreds <= bcd_end(11 downto 8);
tens <= bcd_end(7 downto 4);
ones <= bcd_end(3 downto 0);





end Dataflow;

