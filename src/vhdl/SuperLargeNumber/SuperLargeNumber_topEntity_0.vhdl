-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.SuperLargeNumber_types.all;

entity SuperLargeNumber_topEntity_0 is
  port(eta_i1   : in signed(6 downto 0);
       topLet_o : out boolean);
end;

architecture structural of SuperLargeNumber_topEntity_0 is
  signal repANF_0 : signed(6 downto 0);
begin
  repANF_0 <= eta_i1 - to_signed(1,7);
  
  topLet_o <= repANF_0 > to_signed(3,7);
end;
