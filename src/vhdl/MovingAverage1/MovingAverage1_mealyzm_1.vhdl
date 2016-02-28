-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.MovingAverage1_types.all;

entity MovingAverage1_mealyzm_1 is
  port(eta_i1          : in signed(7 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       y_o             : out signed(7 downto 0));
end;

architecture structural of MovingAverage1_mealyzm_1 is
  signal bodyVar_0 : product0;
  signal repANF_1  : signed(7 downto 0);
  signal nexts_2   : array_of_signed_8(0 to 3);
  signal a6_3      : array_of_signed_8(0 to 2);
  signal x_4       : array_of_signed_8(0 to 3);
  signal x_5       : array_of_signed_8(0 to 3);
  signal tmp_6     : signed(7 downto 0);
  signal tmp_10    : array_of_signed_8(0 to 2);
  signal tmp_13    : array_of_signed_8(0 to 3);
begin
  y_o <= bodyVar_0.product0_sel1;
  
  bodyVar_0 <= (product0_sel0 => nexts_2
               ,product0_sel1 => repANF_1);
  
  -- fold begin
  fold_n_8 : block
    -- given a level and a depth, calculate the corresponding index into the
    -- intermediate array
    function depth2Index (levels,depth : in natural) return natural is
    begin
      return (2 ** levels - 2 ** depth);
    end function;
  
    signal intermediate_n_9 : array_of_signed_8(0 to (2*4)-2);
    constant levels : natural := natural (ceil (log2 (real (4))));
  begin
    -- put input array into the first half of the intermediate array
    intermediate_n_9(0 to 4-1) <= nexts_2;
  
    -- Create the tree of instantiated components
    make_tree : if levels /= 0 generate
      tree_depth : for d in levels-1 downto 0 generate
        tree_depth_loop: for i in 0 to (natural(2**d) - 1) generate
          intermediate_n_9(depth2Index(levels+1,d+1)+i) <= intermediate_n_9(depth2Index(levels+1,d+2)+(2*i)) + intermediate_n_9(depth2Index(levels+1,d+2)+(2*i)+1);
        end generate;
      end generate;
    end generate;
  
    -- The last element of the intermediate array holds the result
    tmp_6 <= intermediate_n_9((2*4)-2);
  end block;
  -- fold end
  
  repANF_1 <= tmp_6;
  
  nexts_2 <= array_of_signed_8'(signed'(eta_i1) & a6_3);
  
  -- init begin
  init_n_11 : block
    signal n_12 : array_of_signed_8(0 to 3);
  begin
    n_12 <= x_4;
    tmp_10 <= n_12(0 to n_12'high - 1);
  end block;
  -- init end
  
  a6_3 <= tmp_10;
  
  -- register begin
  register_MovingAverage1_mealyzm_1_n_18 : block
    signal n_19 : array_of_signed_8(0 to 3);
    signal n_20 : array_of_signed_8(0 to 3);
  begin
    n_19 <= (array_of_signed_8'(0 to (4)-1 => to_signed(0,8)));
  
    process(system1000,system1000_rstn,n_19)
    begin
      if system1000_rstn = '0' then
        n_20 <= n_19;
      elsif rising_edge(system1000) then
        n_20 <= x_5;
      end if;
    end process;
  
    tmp_13 <= n_20;
  end block;
  -- register end
  
  x_4 <= tmp_13;
  
  x_5 <= bodyVar_0.product0_sel0;
end;
