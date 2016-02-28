// Automatically generated Verilog-2001
module FeedbackLoop_topEntity_0(input_i1
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,out_o);
  input signed [7:0] input_i1;
  input system1000;
  input system1000_rstn;
  output signed [7:0] out_o;
  wire signed [7:0] x_0;
  wire signed [7:0] bodyVar_1;
  wire signed [7:0] out_o_sig;
  wire signed [7:0] tmp_2;
  // register begin
  reg signed [7:0] n_4;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_FeedbackLoop_topEntity_0_n_5
    if (~ system1000_rstn) begin
      n_4 <= 8'sd0;
    end else begin
      n_4 <= out_o_sig;
    end
  end
  
  assign tmp_2 = n_4;
  // register end
  
  assign x_0 = tmp_2;
  
  assign bodyVar_1 = input_i1 - x_0;
  
  FeedbackLoop_mealyzm_1 FeedbackLoop_mealyzm_1_out_o_sig
  (.bodyVar_o (out_o_sig)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.eta_i1 (bodyVar_1));
  
  assign out_o = out_o_sig;
endmodule
