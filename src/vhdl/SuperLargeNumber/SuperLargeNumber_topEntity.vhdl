-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.SuperLargeNumber_types.all;

entity SuperLargeNumber_topEntity is
  port(input_0  : in signed(6 downto 0);
       output_0 : out boolean);
end;

architecture structural of SuperLargeNumber_topEntity is
begin
  SuperLargeNumber_topEntity_0_inst : entity SuperLargeNumber_topEntity_0
    port map
      (eta_i1   => input_0
      ,topLet_o => output_0);
end;
