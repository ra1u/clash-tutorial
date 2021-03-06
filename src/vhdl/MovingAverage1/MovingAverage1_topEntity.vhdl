-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.MovingAverage1_types.all;

entity MovingAverage1_topEntity is
  port(input_0         : in signed(7 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       output_0        : out signed(7 downto 0));
end;

architecture structural of MovingAverage1_topEntity is
begin
  MovingAverage1_topEntity_0_inst : entity MovingAverage1_topEntity_0
    port map
      (eta_i1          => input_0
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,topLet_o        => output_0);
end;
