-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/ECS/data/hdlMacro/vhdl/cb16ce.vhd,v 1.5 2012/08/30 17:45:42 robh Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 2006 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : J.23
--  \   \         Description : Xilinx HDL Macro Library
--  /   /                       16-Bit Cascadable Binary Counter with Clock Enable and Asynchronous Clear
-- /___/   /\     Filename    : CB16CE.vhd
-- \   \  /  \    Timestamp   : Fri Jul 28 2006
--  \___\/\___\
--
-- Revision:
-- 07/28/06 - Initial version.
-- End Revision

----- CELL CB16CE -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CE is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB16CE;

architecture Behavioral of CB16CE is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;

