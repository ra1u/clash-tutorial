package Integrator_types;
  typedef struct {
    logic signed [9:0] product1_sel0;
    logic signed [9:0] product1_sel1;
  } product1;
  typedef struct {
    logic [0:0] product0_sel0;
    logic [9:0] product0_sel1;
  } product0;
  function logic [9:0] signed_10_to_lv(logic signed [9:0] i);
    signed_10_to_lv = i;
  endfunction
  function logic [19:0] product1_to_lv(product1 i);
    product1_to_lv = {signed_10_to_lv(i.product1_sel0)
                     ,signed_10_to_lv(i.product1_sel1)};
  endfunction
  function logic [0:0] logic_vector_1_to_lv(logic [0:0] i);
    logic_vector_1_to_lv = i;
  endfunction
  function logic [10:0] signed_11_to_lv(logic signed [10:0] i);
    signed_11_to_lv = i;
  endfunction
  function logic [9:0] logic_vector_10_to_lv(logic [9:0] i);
    logic_vector_10_to_lv = i;
  endfunction
  function logic [10:0] product0_to_lv(product0 i);
    product0_to_lv = {logic_vector_1_to_lv(i.product0_sel0)
                     ,logic_vector_10_to_lv(i.product0_sel1)};
  endfunction
  function logic [10:0] logic_vector_11_to_lv(logic [10:0] i);
    logic_vector_11_to_lv = i;
  endfunction
endpackage : Integrator_types
