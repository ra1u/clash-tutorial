library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package MovingAverage1_types is
  type array_of_signed_8 is array (integer range <>) of signed(7 downto 0);
  type product0 is record
    product0_sel0 : array_of_signed_8(0 to 3);
    product0_sel1 : signed(7 downto 0);
  end record;
  function toSLV (s : in signed) return std_logic_vector;
  function toSLV (value :  array_of_signed_8) return std_logic_vector;
  function toSLV (p : product0) return std_logic_vector;
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
end;

package body MovingAverage1_types is
  function toSLV (s : in signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end;
  function toSLV (value :  array_of_signed_8) return std_logic_vector is
    alias ivalue    : array_of_signed_8(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 8);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 8) + 1 to i*8) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function toSLV (p : product0) return std_logic_vector is
  begin
    return (toSLV(p.product0_sel0) & toSLV(p.product0_sel1));
  end;
  function toSLV (b : in boolean) return std_logic_vector is
  begin
    if b then
      return "1";
    else
      return "0";
    end if;
  end;
  function fromSLV (sl : in std_logic_vector) return boolean is
  begin
    if sl = "1" then
      return true;
    else
      return false;
    end if;
  end;
end;
