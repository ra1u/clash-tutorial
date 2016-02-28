-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.MovingAverage3_types.all;

entity MovingAverage3_mealyzm_1 is
  port(eta_i1          : in signed(7 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       y_o             : out signed(7 downto 0));
end;

architecture structural of MovingAverage3_mealyzm_1 is
  signal bodyVar_0 : product0;
  signal repANF_1  : array_of_signed_8(0 to 2);
  signal repANF_2  : signed(7 downto 0);
  signal repANF_3  : array_of_signed_8(0 to 1);
  signal repANF_4  : array_of_signed_8(0 to 3);
  signal x_5       : array_of_signed_8(0 to 2);
  signal x_6       : array_of_signed_8(0 to 2);
  signal tmp_7     : signed(7 downto 0);
  signal tmp_11    : array_of_signed_8(0 to 1);
  signal tmp_15    : array_of_signed_8(0 to 2);
  signal tmp_14    : array_of_signed_8(0 to 2);
begin
  y_o <= bodyVar_0.product0_sel1;
  
  bodyVar_0 <= (product0_sel0 => repANF_1
               ,product0_sel1 => repANF_2);
  
  repANF_1 <= array_of_signed_8'(signed'(eta_i1) & repANF_3);
  
  -- fold begin
  fold_n_9 : block
    -- given a level and a depth, calculate the corresponding index into the
    -- intermediate array
    function depth2Index (levels,depth : in natural) return natural is
    begin
      return (2 ** levels - 2 ** depth);
    end function;
  
    signal intermediate_n_10 : array_of_signed_8(0 to (2*4)-2);
    constant levels : natural := natural (ceil (log2 (real (4))));
  begin
    -- put input array into the first half of the intermediate array
    intermediate_n_10(0 to 4-1) <= repANF_4;
  
    -- Create the tree of instantiated components
    make_tree : if levels /= 0 generate
      tree_depth : for d in levels-1 downto 0 generate
        tree_depth_loop: for i in 0 to (natural(2**d) - 1) generate
          intermediate_n_10(depth2Index(levels+1,d+1)+i) <= intermediate_n_10(depth2Index(levels+1,d+2)+(2*i)) + intermediate_n_10(depth2Index(levels+1,d+2)+(2*i)+1);
        end generate;
      end generate;
    end generate;
  
    -- The last element of the intermediate array holds the result
    tmp_7 <= intermediate_n_10((2*4)-2);
  end block;
  -- fold end
  
  repANF_2 <= tmp_7;
  
  -- init begin
  init_n_12 : block
    signal n_13 : array_of_signed_8(0 to 2);
  begin
    n_13 <= x_5;
    tmp_11 <= n_13(0 to n_13'high - 1);
  end block;
  -- init end
  
  repANF_3 <= tmp_11;
  
  repANF_4 <= array_of_signed_8'(signed'(eta_i1) & x_5);
  
  -- init begin
  init_n_20 : block
    signal n_21 : array_of_signed_8(0 to 3);
  begin
    n_21 <= (array_of_signed_8'(0 to (4)-1 => to_signed(0,8)));
    tmp_15 <= n_21(0 to n_21'high - 1);
  end block;
  -- init end
  
  -- register begin
  register_MovingAverage3_mealyzm_1_n_22 : block
    signal n_23 : array_of_signed_8(0 to 2);
    signal n_24 : array_of_signed_8(0 to 2);
  begin
    n_23 <= tmp_15;
  
    process(system1000,system1000_rstn,n_23)
    begin
      if system1000_rstn = '0' then
        n_24 <= n_23;
      elsif rising_edge(system1000) then
        n_24 <= x_6;
      end if;
    end process;
  
    tmp_14 <= n_24;
  end block;
  -- register end
  
  x_5 <= tmp_14;
  
  x_6 <= bodyVar_0.product0_sel0;
end;
