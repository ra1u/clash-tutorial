-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.Mealey_types.all;

entity Mealey_topEntity_0 is
  port(eta_i1          : in signed(8 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       topLet_o        : out signed(8 downto 0));
end;

architecture structural of Mealey_topEntity_0 is
begin
  Mealey_mealey_1_topLet_o : entity Mealey_mealey_1
    port map
      (bodyVar_o       => topLet_o
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => eta_i1);
end;
