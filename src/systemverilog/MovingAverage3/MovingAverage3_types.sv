package MovingAverage3_types;
  typedef logic signed [7:0] array_of_3_signed_8 [0:2];
  typedef struct {
    array_of_3_signed_8 product0_sel0;
    logic signed [7:0] product0_sel1;
  } product0;
  typedef logic signed [7:0] array_of_4_signed_8 [0:3];
  typedef logic signed [7:0] array_of_2_signed_8 [0:1];
  function logic [7:0] signed_8_to_lv(logic signed [7:0] i);
    signed_8_to_lv = i;
  endfunction
  function logic [23:0] array_of_3_signed_8_to_lv(array_of_3_signed_8 i);
    array_of_3_signed_8_to_lv = {signed_8_to_lv(i[0])
                                ,signed_8_to_lv(i[1])
                                ,signed_8_to_lv(i[2])};
  endfunction
  function logic [31:0] product0_to_lv(product0 i);
    product0_to_lv = {array_of_3_signed_8_to_lv(i.product0_sel0)
                     ,signed_8_to_lv(i.product0_sel1)};
  endfunction
  function logic [31:0] array_of_4_signed_8_to_lv(array_of_4_signed_8 i);
    array_of_4_signed_8_to_lv = {signed_8_to_lv(i[0])
                                ,signed_8_to_lv(i[1])
                                ,signed_8_to_lv(i[2])
                                ,signed_8_to_lv(i[3])};
  endfunction
  function logic [0:0] logic_vector_1_to_lv(logic [0:0] i);
    logic_vector_1_to_lv = i;
  endfunction
  function logic [15:0] array_of_2_signed_8_to_lv(array_of_2_signed_8 i);
    array_of_2_signed_8_to_lv = {signed_8_to_lv(i[0])
                                ,signed_8_to_lv(i[1])};
  endfunction
endpackage : MovingAverage3_types
