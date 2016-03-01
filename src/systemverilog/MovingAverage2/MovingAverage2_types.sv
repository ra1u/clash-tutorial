package MovingAverage2_types;
  typedef logic signed [7:0] array_of_16_signed_8 [0:15];
  typedef logic signed [7:0] array_of_15_signed_8 [0:14];
  typedef struct {
    array_of_16_signed_8 product1_sel0;
    logic signed [7:0] product1_sel1;
  } product1;
  typedef struct {
    product1 product0_sel0;
    logic signed [7:0] product0_sel1;
  } product0;
  function logic [7:0] signed_8_to_lv(logic signed [7:0] i);
    signed_8_to_lv = i;
  endfunction
  function logic [127:0] array_of_16_signed_8_to_lv(array_of_16_signed_8 i);
    array_of_16_signed_8_to_lv = {signed_8_to_lv(i[0])
                                 ,signed_8_to_lv(i[1])
                                 ,signed_8_to_lv(i[2])
                                 ,signed_8_to_lv(i[3])
                                 ,signed_8_to_lv(i[4])
                                 ,signed_8_to_lv(i[5])
                                 ,signed_8_to_lv(i[6])
                                 ,signed_8_to_lv(i[7])
                                 ,signed_8_to_lv(i[8])
                                 ,signed_8_to_lv(i[9])
                                 ,signed_8_to_lv(i[10])
                                 ,signed_8_to_lv(i[11])
                                 ,signed_8_to_lv(i[12])
                                 ,signed_8_to_lv(i[13])
                                 ,signed_8_to_lv(i[14])
                                 ,signed_8_to_lv(i[15])};
  endfunction
  function logic [119:0] array_of_15_signed_8_to_lv(array_of_15_signed_8 i);
    array_of_15_signed_8_to_lv = {signed_8_to_lv(i[0])
                                 ,signed_8_to_lv(i[1])
                                 ,signed_8_to_lv(i[2])
                                 ,signed_8_to_lv(i[3])
                                 ,signed_8_to_lv(i[4])
                                 ,signed_8_to_lv(i[5])
                                 ,signed_8_to_lv(i[6])
                                 ,signed_8_to_lv(i[7])
                                 ,signed_8_to_lv(i[8])
                                 ,signed_8_to_lv(i[9])
                                 ,signed_8_to_lv(i[10])
                                 ,signed_8_to_lv(i[11])
                                 ,signed_8_to_lv(i[12])
                                 ,signed_8_to_lv(i[13])
                                 ,signed_8_to_lv(i[14])};
  endfunction
  function logic [0:0] logic_vector_1_to_lv(logic [0:0] i);
    logic_vector_1_to_lv = i;
  endfunction
  function logic [135:0] product1_to_lv(product1 i);
    product1_to_lv = {array_of_16_signed_8_to_lv(i.product1_sel0)
                     ,signed_8_to_lv(i.product1_sel1)};
  endfunction
  function logic [143:0] product0_to_lv(product0 i);
    product0_to_lv = {product1_to_lv(i.product0_sel0)
                     ,signed_8_to_lv(i.product0_sel1)};
  endfunction
endpackage : MovingAverage2_types
