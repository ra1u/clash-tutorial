// Automatically generated SystemVerilog-2005
import MovingAverage_types::*;
module MovingAverage_mealyzm_1(eta_i1
                              ,// clock
                              system1000
                              ,// asynchronous reset: active low
                              system1000_rstn
                              ,bodyVar_o);
  input logic signed [7:0] eta_i1;
  input logic system1000;
  input logic system1000_rstn;
  output logic signed [7:0] bodyVar_o;
  logic signed [7:0] y_0;
  product0 bodyVar_1;
  product0 bodyVar_2;
  product1 x_3;
  product1 repANF_4;
  logic signed [7:0] output_5;
  product1 repANF_6;
  array_of_16_signed_8 repANF_7;
  logic signed [7:0] repANF_8;
  logic signed [7:0] repANF_9;
  array_of_15_signed_8 repANF_10;
  array_of_16_signed_8 vec_11;
  logic signed [7:0] total_12;
  product1 x_13;
  product1 tmp_14;
  logic signed [7:0] tmp_26;
  array_of_15_signed_8 tmp_28;
  assign bodyVar_o = y_0;
  
  assign y_0 = bodyVar_1.product0_sel1;
  
  assign bodyVar_1 = bodyVar_2;
  
  assign bodyVar_2 = '{product0_sel0: repANF_4
                      ,product0_sel1: output_5};
  
  // register begin
  product1 n_20;
  
  always_ff @(posedge system1000 or negedge system1000_rstn) begin : register_MovingAverage_mealyzm_1_n_21
    if (~ system1000_rstn) begin
      n_20 <= '{product1_sel0: '{(16) {8'sd0}},product1_sel1: 8'sd0};
    end else begin
      n_20 <= repANF_6;
    end
  end
  
  assign tmp_14 = n_20;
  // register end
  
  assign x_3 = tmp_14;
  
  assign repANF_4 = '{product1_sel0: repANF_7
                     ,product1_sel1: output_5};
  
  assign output_5 = repANF_8 - repANF_9;
  
  assign repANF_6 = x_13;
  
  assign repANF_7 = '{eta_i1
                     ,repANF_10[0]
                     ,repANF_10[1]
                     ,repANF_10[2]
                     ,repANF_10[3]
                     ,repANF_10[4]
                     ,repANF_10[5]
                     ,repANF_10[6]
                     ,repANF_10[7]
                     ,repANF_10[8]
                     ,repANF_10[9]
                     ,repANF_10[10]
                     ,repANF_10[11]
                     ,repANF_10[12]
                     ,repANF_10[13]
                     ,repANF_10[14]};
  
  assign repANF_8 = total_12 + eta_i1;
  
  // last begin
  array_of_16_signed_8 n_27;
  assign n_27 = vec_11;
  
  assign tmp_26 = n_27[$high(n_27)];
  // last end
  
  assign repANF_9 = tmp_26;
  
  // init begin
  array_of_16_signed_8 n_29;
  assign n_29 = vec_11;
  
  assign tmp_28 = n_29[0 : $high(n_29) - 1];
  // init end
  
  assign repANF_10 = tmp_28;
  
  assign vec_11 = x_3.product1_sel0;
  
  assign total_12 = x_3.product1_sel1;
  
  assign x_13 = bodyVar_1.product0_sel0;
endmodule
