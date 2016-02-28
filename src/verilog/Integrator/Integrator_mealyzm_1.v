// Automatically generated Verilog-2001
module Integrator_mealyzm_1(eta_i1
                           ,// clock
                           system1000
                           ,// asynchronous reset: active low
                           system1000_rstn
                           ,bodyVar_o);
  input signed [9:0] eta_i1;
  input system1000;
  input system1000_rstn;
  output signed [9:0] bodyVar_o;
  wire signed [9:0] y_0;
  wire [19:0] bodyVar_1;
  wire signed [9:0] a44_2;
  wire signed [9:0] x_3;
  wire signed [9:0] repANF_4;
  wire signed [9:0] x_5;
  wire signed [9:0] tmp_6;
  assign bodyVar_o = y_0;
  
  assign y_0 = bodyVar_1[9:0];
  
  assign bodyVar_1 = {a44_2
                     ,a44_2};
  
  Integrator_satPlus_2 Integrator_satPlus_2_a44_2
  (.bodyVar_o (a44_2)
  ,.eta_i1 (x_3)
  ,.eta_i2 (eta_i1));
  
  // register begin
  reg signed [9:0] n_11;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_Integrator_mealyzm_1_n_12
    if (~ system1000_rstn) begin
      n_11 <= (10'sd0 <<< (64'sd8));
    end else begin
      n_11 <= repANF_4;
    end
  end
  
  assign tmp_6 = n_11;
  // register end
  
  assign x_3 = tmp_6;
  
  assign repANF_4 = x_5;
  
  assign x_5 = bodyVar_1[19:10];
endmodule
