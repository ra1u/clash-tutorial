// Automatically generated SystemVerilog-2005
import MovingAverage3_types::*;
module MovingAverage3_mealyzm_1(eta_i1
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,y_o);
  input logic signed [7:0] eta_i1;
  input logic system1000;
  input logic system1000_rstn;
  output logic signed [7:0] y_o;
  product0 bodyVar_0;
  array_of_3_signed_8 repANF_1;
  logic signed [7:0] repANF_2;
  array_of_2_signed_8 repANF_3;
  array_of_4_signed_8 repANF_4;
  array_of_3_signed_8 x_5;
  array_of_3_signed_8 x_6;
  logic signed [7:0] tmp_7;
  array_of_2_signed_8 tmp_15;
  array_of_3_signed_8 tmp_18;
  array_of_3_signed_8 tmp_17;
  assign y_o = bodyVar_0.product0_sel1;
  
  assign bodyVar_0 = '{product0_sel0: repANF_1
                      ,product0_sel1: repANF_2};
  
  assign repANF_1 = '{eta_i1
                     ,repANF_3[0]
                     ,repANF_3[1]};
  
  // fold begin
  // put flat input array into the first half of the intermediate array
  logic signed [7:0] intermediate_n_9[0:(2*4)-2];
  assign intermediate_n_9[0:4-1] = repANF_4;
  
  // calculate the depth of the tree
  localparam levels_n_10 = $clog2(4);
  
  // given a level and a depth, calculate the corresponding index into the
  // intermediate array
  function integer depth2Index_n_11;
    input integer levels;
    input integer depth;
  
    depth2Index_n_11 = (2 ** levels) - (2 ** depth);
  endfunction
  
  // Create the tree of instantiated components
  genvar d_n_12;
  genvar i_n_13;
  generate
  if (levels_n_10 != 0) begin : make_tree_n_14
    for (d_n_12 = (levels_n_10 - 1); d_n_12 >= 0; d_n_12=d_n_12-1) begin : tree_depth
      for (i_n_13 = 0; i_n_13 < (2**d_n_12); i_n_13 = i_n_13+1) begin : tree_depth_loop
          assign intermediate_n_9[depth2Index_n_11(levels_n_10+1,d_n_12+1)+i_n_13] = intermediate_n_9[depth2Index_n_11(levels_n_10+1,d_n_12+2)+(2*i_n_13)] + intermediate_n_9[depth2Index_n_11(levels_n_10+1,d_n_12+2)+(2*i_n_13)+1];
      end
    end
  end
  endgenerate
  
  // The last element of the intermediate array holds the result
  assign tmp_7 = intermediate_n_9[(2*4)-2];
  // fold end
  
  assign repANF_2 = tmp_7;
  
  // init begin
  array_of_3_signed_8 n_16;
  assign n_16 = x_5;
  
  assign tmp_15 = n_16[0 : $high(n_16) - 1];
  // init end
  
  assign repANF_3 = tmp_15;
  
  assign repANF_4 = '{eta_i1
                     ,x_5[0]
                     ,x_5[1]
                     ,x_5[2]};
  
  // init begin
  array_of_4_signed_8 n_23;
  assign n_23 = ('{(4) {8'sd0}});
  
  assign tmp_18 = n_23[0 : $high(n_23) - 1];
  // init end
  
  // register begin
  array_of_3_signed_8 n_24;
  
  always_ff @(posedge system1000 or negedge system1000_rstn) begin : register_MovingAverage3_mealyzm_1_n_25
    if (~ system1000_rstn) begin
      n_24 <= tmp_18;
    end else begin
      n_24 <= x_6;
    end
  end
  
  assign tmp_17 = n_24;
  // register end
  
  assign x_5 = tmp_17;
  
  assign x_6 = bodyVar_0.product0_sel0;
endmodule
