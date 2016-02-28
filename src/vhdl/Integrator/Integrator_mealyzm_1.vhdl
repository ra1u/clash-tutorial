-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.Integrator_types.all;

entity Integrator_mealyzm_1 is
  port(eta_i1          : in signed(9 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out signed(9 downto 0));
end;

architecture structural of Integrator_mealyzm_1 is
  signal y_0       : signed(9 downto 0);
  signal bodyVar_1 : product1;
  signal a44_2     : signed(9 downto 0);
  signal x_3       : signed(9 downto 0);
  signal repANF_4  : signed(9 downto 0);
  signal x_5       : signed(9 downto 0);
  signal tmp_6     : signed(9 downto 0);
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product1_sel1;
  
  bodyVar_1 <= (product1_sel0 => a44_2
               ,product1_sel1 => a44_2);
  
  Integrator_satPlus_2_a44_2 : entity Integrator_satPlus_2
    port map
      (bodyVar_o => a44_2
      ,eta_i1    => x_3
      ,eta_i2    => eta_i1);
  
  -- register begin
  register_Integrator_mealyzm_1_n_11 : block
    signal n_12 : signed(9 downto 0);
    signal n_13 : signed(9 downto 0);
  begin
    n_12 <= (shift_left(to_signed(0,10),to_integer(to_signed(8,64))));
  
    process(system1000,system1000_rstn,n_12)
    begin
      if system1000_rstn = '0' then
        n_13 <= n_12;
      elsif rising_edge(system1000) then
        n_13 <= repANF_4;
      end if;
    end process;
  
    tmp_6 <= n_13;
  end block;
  -- register end
  
  x_3 <= tmp_6;
  
  repANF_4 <= x_5;
  
  x_5 <= bodyVar_1.product1_sel0;
end;
