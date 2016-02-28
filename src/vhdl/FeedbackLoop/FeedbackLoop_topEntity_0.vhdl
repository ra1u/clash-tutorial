-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.FeedbackLoop_types.all;

entity FeedbackLoop_topEntity_0 is
  port(input_i1        : in signed(7 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       out_o           : out signed(7 downto 0));
end;

architecture structural of FeedbackLoop_topEntity_0 is
  signal x_0       : signed(7 downto 0);
  signal bodyVar_1 : signed(7 downto 0);
  signal out_o_sig : signed(7 downto 0);
  signal tmp_2     : signed(7 downto 0);
begin
  -- register begin
  register_FeedbackLoop_topEntity_0_n_4 : block
    signal n_5 : signed(7 downto 0);
    signal n_6 : signed(7 downto 0);
  begin
    n_5 <= to_signed(0,8);
  
    process(system1000,system1000_rstn,n_5)
    begin
      if system1000_rstn = '0' then
        n_6 <= n_5;
      elsif rising_edge(system1000) then
        n_6 <= out_o_sig;
      end if;
    end process;
  
    tmp_2 <= n_6;
  end block;
  -- register end
  
  x_0 <= tmp_2;
  
  bodyVar_1 <= input_i1 - x_0;
  
  FeedbackLoop_mealyzm_1_out_o_sig : entity FeedbackLoop_mealyzm_1
    port map
      (bodyVar_o       => out_o_sig
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => bodyVar_1);
  
  out_o <= out_o_sig;
end;
