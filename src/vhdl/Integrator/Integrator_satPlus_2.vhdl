-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.Integrator_types.all;

entity Integrator_satPlus_2 is
  port(eta_i1    : in signed(9 downto 0);
       eta_i2    : in signed(9 downto 0);
       bodyVar_o : out signed(9 downto 0));
end;

architecture structural of Integrator_satPlus_2 is
  signal a1_0       : signed(10 downto 0);
  signal rzm1_1     : std_logic_vector(9 downto 0);
  signal repANF_2   : std_logic_vector(9 downto 0);
  signal repANF_3   : std_logic_vector(9 downto 0);
  signal subjLet_4  : product0;
  signal repANF_5   : std_logic_vector(0 downto 0);
  signal repANF_6   : std_logic_vector(0 downto 0);
  signal repANF_7   : std_logic_vector(10 downto 0);
  signal rzm_8      : std_logic_vector(9 downto 0);
  signal subjLet_9  : std_logic_vector(0 downto 0);
  signal repANF_10  : std_logic_vector(0 downto 0);
  signal repANF_11  : std_logic_vector(0 downto 0);
  signal altLet_12  : signed(9 downto 0);
  signal altLet_13  : signed(9 downto 0);
  signal subjLet_14 : std_logic_vector(0 downto 0);
  signal tmp_20     : product0;
  signal tmp_24     : std_logic_vector(0 downto 0);
  signal tmp_27     : std_logic_vector(0 downto 0);
  signal tmp_33     : std_logic_vector(0 downto 0);
  signal tmp_36     : std_logic_vector(0 downto 0);
begin
  a1_0 <= resize(eta_i1,11) + resize(eta_i2,11);
  
  rzm1_1 <= subjLet_4.product0_sel1;
  
  repANF_2 <= std_logic_vector(eta_i2);
  
  repANF_3 <= std_logic_vector(eta_i1);
  
  -- split begin
  split_n_22: block
    signal n_23 : std_logic_vector(10 downto 0);
  begin
    n_23 <= repANF_7;
    tmp_20 <= ( n_23(tmp_20.product0_sel0'left + tmp_20.product0_sel1'length downto
                 tmp_20.product0_sel0'right + tmp_20.product0_sel1'length)
               , n_23(tmp_20.product0_sel1'left downto tmp_20.product0_sel1'right)
               );
  end block;
  -- split end
  
  subjLet_4 <= tmp_20;
  
  -- msb begin
  msb_n_25 : block
    signal n_26 : std_logic_vector(9 downto 0);
  begin
    n_26 <= repANF_2;
    tmp_24 <= n_26(n_26'high downto n_26'high);
  end block;
  -- msb end
  
  repANF_5 <= tmp_24;
  
  -- msb begin
  msb_n_28 : block
    signal n_29 : std_logic_vector(9 downto 0);
  begin
    n_29 <= repANF_3;
    tmp_27 <= n_29(n_29'high downto n_29'high);
  end block;
  -- msb end
  
  repANF_6 <= tmp_27;
  
  repANF_7 <= std_logic_vector(a1_0);
  
  rzm_8 <= rzm1_1;
  
  subjLet_9 <= repANF_6 and repANF_5;
  
  -- msb begin
  msb_n_34 : block
    signal n_35 : std_logic_vector(9 downto 0);
  begin
    n_35 <= rzm_8;
    tmp_33 <= n_35(n_35'high downto n_35'high);
  end block;
  -- msb end
  
  repANF_10 <= tmp_33;
  
  -- msb begin
  msb_n_37 : block
    signal n_38 : std_logic_vector(10 downto 0);
  begin
    n_38 <= repANF_7;
    tmp_36 <= n_38(n_38'high downto n_38'high);
  end block;
  -- msb end
  
  repANF_11 <= tmp_36;
  
  altLet_12 <= signed(rzm_8);
  
  with (subjLet_9) select
    altLet_13 <= signed'(0 => '1', 1 to 10-1 => '0') when "1",
                 signed'(0 => '0', 1 to 10-1  => '1') when others;
  
  subjLet_14 <= repANF_11 xor repANF_10;
  
  with (subjLet_14) select
    bodyVar_o <= altLet_12 when "0",
                 altLet_13 when others;
end;
