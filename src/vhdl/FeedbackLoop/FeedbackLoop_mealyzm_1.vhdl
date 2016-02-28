-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.FeedbackLoop_types.all;

entity FeedbackLoop_mealyzm_1 is
  port(eta_i1          : in signed(7 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out signed(7 downto 0));
end;

architecture structural of FeedbackLoop_mealyzm_1 is
  signal y_0         : signed(7 downto 0);
  signal bodyVar_1   : product0;
  signal nextstate_2 : signed(7 downto 0);
  signal x_3         : signed(7 downto 0);
  signal repANF_4    : signed(7 downto 0);
  signal x_5         : signed(7 downto 0);
  signal tmp_8       : signed(7 downto 0);
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product0_sel1;
  
  bodyVar_1 <= (product0_sel0 => nextstate_2
               ,product0_sel1 => nextstate_2);
  
  nextstate_2 <= x_3 + eta_i1;
  
  -- register begin
  register_FeedbackLoop_mealyzm_1_n_10 : block
    signal n_11 : signed(7 downto 0);
    signal n_12 : signed(7 downto 0);
  begin
    n_11 <= to_signed(0,8);
  
    process(system1000,system1000_rstn,n_11)
    begin
      if system1000_rstn = '0' then
        n_12 <= n_11;
      elsif rising_edge(system1000) then
        n_12 <= repANF_4;
      end if;
    end process;
  
    tmp_8 <= n_12;
  end block;
  -- register end
  
  x_3 <= tmp_8;
  
  repANF_4 <= x_5;
  
  x_5 <= bodyVar_1.product0_sel0;
end;
