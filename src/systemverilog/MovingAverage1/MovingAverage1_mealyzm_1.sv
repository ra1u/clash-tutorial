// Automatically generated SystemVerilog-2005
import MovingAverage1_types::*;
module MovingAverage1_mealyzm_1(eta_i1
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
  logic signed [7:0] repANF_1;
  array_of_4_signed_8 nexts_2;
  array_of_3_signed_8 a6_3;
  array_of_4_signed_8 x_4;
  array_of_4_signed_8 x_5;
  logic signed [7:0] tmp_6;
  array_of_3_signed_8 tmp_14;
  array_of_4_signed_8 tmp_16;
  assign y_o = bodyVar_0.product0_sel1;
  
  assign bodyVar_0 = '{product0_sel0: nexts_2
                      ,product0_sel1: repANF_1};
  
  // fold begin
  // put flat input array into the first half of the intermediate array
  logic signed [7:0] intermediate_n_8[0:(2*4)-2];
  assign intermediate_n_8[0:4-1] = nexts_2;
  
  // calculate the depth of the tree
  localparam levels_n_9 = $clog2(4);
  
  // given a level and a depth, calculate the corresponding index into the
  // intermediate array
  function integer depth2Index_n_10;
    input integer levels;
    input integer depth;
  
    depth2Index_n_10 = (2 ** levels) - (2 ** depth);
  endfunction
  
  // Create the tree of instantiated components
  genvar d_n_11;
  genvar i_n_12;
  generate
  if (levels_n_9 != 0) begin : make_tree_n_13
    for (d_n_11 = (levels_n_9 - 1); d_n_11 >= 0; d_n_11=d_n_11-1) begin : tree_depth
      for (i_n_12 = 0; i_n_12 < (2**d_n_11); i_n_12 = i_n_12+1) begin : tree_depth_loop
          assign intermediate_n_8[depth2Index_n_10(levels_n_9+1,d_n_11+1)+i_n_12] = intermediate_n_8[depth2Index_n_10(levels_n_9+1,d_n_11+2)+(2*i_n_12)] + intermediate_n_8[depth2Index_n_10(levels_n_9+1,d_n_11+2)+(2*i_n_12)+1];
      end
    end
  end
  endgenerate
  
  // The last element of the intermediate array holds the result
  assign tmp_6 = intermediate_n_8[(2*4)-2];
  // fold end
  
  assign repANF_1 = tmp_6;
  
  assign nexts_2 = '{eta_i1
                    ,a6_3[0]
                    ,a6_3[1]
                    ,a6_3[2]};
  
  // init begin
  array_of_4_signed_8 n_15;
  assign n_15 = x_4;
  
  assign tmp_14 = n_15[0 : $high(n_15) - 1];
  // init end
  
  assign a6_3 = tmp_14;
  
  // register begin
  array_of_4_signed_8 n_21;
  
  always_ff @(posedge system1000 or negedge system1000_rstn) begin : register_MovingAverage1_mealyzm_1_n_22
    if (~ system1000_rstn) begin
      n_21 <= ('{(4) {8'sd0}});
    end else begin
      n_21 <= x_5;
    end
  end
  
  assign tmp_16 = n_21;
  // register end
  
  assign x_4 = tmp_16;
  
  assign x_5 = bodyVar_0.product0_sel0;
endmodule
