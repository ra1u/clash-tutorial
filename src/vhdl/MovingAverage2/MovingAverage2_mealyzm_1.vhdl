-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.MovingAverage2_types.all;

entity MovingAverage2_mealyzm_1 is
  port(eta_i1          : in signed(7 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out signed(7 downto 0));
end;

architecture structural of MovingAverage2_mealyzm_1 is
  signal y_0       : signed(7 downto 0);
  signal bodyVar_1 : product0;
  signal bodyVar_2 : product0;
  signal x_3       : product1;
  signal repANF_4  : product1;
  signal output_5  : signed(7 downto 0);
  signal repANF_6  : product1;
  signal repANF_7  : array_of_signed_8(0 to 15);
  signal repANF_8  : signed(7 downto 0);
  signal repANF_9  : signed(7 downto 0);
  signal repANF_10 : array_of_signed_8(0 to 14);
  signal vec_11    : array_of_signed_8(0 to 15);
  signal total_12  : signed(7 downto 0);
  signal x_13      : product1;
  signal tmp_14    : product1;
  signal tmp_27    : signed(7 downto 0);
  signal tmp_30    : array_of_signed_8(0 to 14);
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product0_sel1;
  
  bodyVar_1 <= bodyVar_2;
  
  bodyVar_2 <= (product0_sel0 => repANF_4
               ,product0_sel1 => output_5);
  
  -- register begin
  register_MovingAverage2_mealyzm_1_n_20 : block
    signal n_21 : product1;
    signal n_22 : product1;
  begin
    n_21 <= (product1_sel0 => array_of_signed_8'(0 to (16)-1 => to_signed(0,8)),product1_sel1 => to_signed(0,8));
  
    process(system1000,system1000_rstn,n_21)
    begin
      if system1000_rstn = '0' then
        n_22 <= n_21;
      elsif rising_edge(system1000) then
        n_22 <= repANF_6;
      end if;
    end process;
  
    tmp_14 <= n_22;
  end block;
  -- register end
  
  x_3 <= tmp_14;
  
  repANF_4 <= (product1_sel0 => repANF_7
              ,product1_sel1 => output_5);
  
  output_5 <= repANF_8 - repANF_9;
  
  repANF_6 <= x_13;
  
  repANF_7 <= array_of_signed_8'(signed'(eta_i1) & repANF_10);
  
  repANF_8 <= total_12 + eta_i1;
  
  -- last begin
  last_n_28 : block
    signal n_29 : array_of_signed_8(0 to 15);
  begin
    n_29 <= vec_11;
    tmp_27 <= n_29(n_29'high);
  end block;
  -- last end
  
  repANF_9 <= tmp_27;
  
  -- init begin
  init_n_31 : block
    signal n_32 : array_of_signed_8(0 to 15);
  begin
    n_32 <= vec_11;
    tmp_30 <= n_32(0 to n_32'high - 1);
  end block;
  -- init end
  
  repANF_10 <= tmp_30;
  
  vec_11 <= x_3.product1_sel0;
  
  total_12 <= x_3.product1_sel1;
  
  x_13 <= bodyVar_1.product0_sel0;
end;
