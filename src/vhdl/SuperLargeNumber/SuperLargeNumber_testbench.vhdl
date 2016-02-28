-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.SuperLargeNumber_types.all;

entity SuperLargeNumber_testbench is
  port(done : out boolean);
end;

architecture structural of SuperLargeNumber_testbench is
  signal finished : boolean;
  signal eta_i1   : signed(6 downto 0);
  signal topLet_o : boolean;
begin
  done <= finished;
  
  totest : entity SuperLargeNumber_topEntity_0
    port map
      (eta_i1   => eta_i1
      ,topLet_o => topLet_o);
  
  eta_i1 <= (others => 'X');
  
  finished <=
  -- pragma translate_off
              false,
  -- pragma translate_on
              true
  -- pragma translate_off
              after 100 ns
  -- pragma translate_on
              ;
end;
