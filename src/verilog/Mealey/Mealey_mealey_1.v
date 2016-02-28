// Automatically generated Verilog-2001
module Mealey_mealey_1(eta_i1
                      ,// clock
                      system1000
                      ,// asynchronous reset: active low
                      system1000_rstn
                      ,bodyVar_o);
  input signed [8:0] eta_i1;
  input system1000;
  input system1000_rstn;
  output signed [8:0] bodyVar_o;
  wire signed [8:0] y_0;
  wire [17:0] bodyVar_1;
  wire signed [8:0] repANF_2;
  wire signed [8:0] x_3;
  wire signed [8:0] repANF_4;
  wire signed [8:0] x_5;
  wire signed [8:0] tmp_8;
  assign bodyVar_o = y_0;
  
  assign y_0 = bodyVar_1[8:0];
  
  assign bodyVar_1 = {repANF_2
                     ,x_3};
  
  assign repANF_2 = x_3 + eta_i1;
  
  // register begin
  reg signed [8:0] n_10;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_Mealey_mealey_1_n_11
    if (~ system1000_rstn) begin
      n_10 <= 9'sd0;
    end else begin
      n_10 <= repANF_4;
    end
  end
  
  assign tmp_8 = n_10;
  // register end
  
  assign x_3 = tmp_8;
  
  assign repANF_4 = x_5;
  
  assign x_5 = bodyVar_1[17:9];
endmodule
