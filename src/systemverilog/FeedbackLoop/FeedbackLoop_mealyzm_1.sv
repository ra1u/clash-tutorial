// Automatically generated SystemVerilog-2005
import FeedbackLoop_types::*;
module FeedbackLoop_mealyzm_1(eta_i1
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
  logic signed [7:0] nextstate_2;
  logic signed [7:0] x_3;
  logic signed [7:0] repANF_4;
  logic signed [7:0] x_5;
  logic signed [7:0] tmp_8;
  assign bodyVar_o = y_0;
  
  assign y_0 = bodyVar_1.product0_sel1;
  
  assign bodyVar_1 = '{product0_sel0: nextstate_2
                      ,product0_sel1: nextstate_2};
  
  assign nextstate_2 = x_3 + eta_i1;
  
  // register begin
  logic signed [7:0] n_10;
  
  always_ff @(posedge system1000 or negedge system1000_rstn) begin : register_FeedbackLoop_mealyzm_1_n_11
    if (~ system1000_rstn) begin
      n_10 <= 8'sd0;
    end else begin
      n_10 <= repANF_4;
    end
  end
  
  assign tmp_8 = n_10;
  // register end
  
  assign x_3 = tmp_8;
  
  assign repANF_4 = x_5;
  
  assign x_5 = bodyVar_1.product0_sel0;
endmodule
