// Automatically generated Verilog-2001
module MovingAverage2_mealyzm_1(eta_i1
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,bodyVar_o);
  input signed [7:0] eta_i1;
  input system1000;
  input system1000_rstn;
  output signed [7:0] bodyVar_o;
  wire signed [7:0] y_0;
  wire [143:0] bodyVar_1;
  wire [143:0] bodyVar_2;
  wire [135:0] x_3;
  wire [135:0] repANF_4;
  wire signed [7:0] output_5;
  wire [135:0] repANF_6;
  wire [127:0] repANF_7;
  wire signed [7:0] repANF_8;
  wire signed [7:0] repANF_9;
  wire [119:0] repANF_10;
  wire [127:0] vec_11;
  wire signed [7:0] total_12;
  wire [135:0] x_13;
  wire [135:0] tmp_14;
  wire signed [7:0] tmp_26;
  wire [119:0] tmp_28;
  assign bodyVar_o = y_0;
  
  assign y_0 = bodyVar_1[7:0];
  
  assign bodyVar_1 = bodyVar_2;
  
  assign bodyVar_2 = {repANF_4
                     ,output_5};
  
  // register begin
  reg [135:0] n_20;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_MovingAverage2_mealyzm_1_n_21
    if (~ system1000_rstn) begin
      n_20 <= {{(16) {8'sd0}},8'sd0};
    end else begin
      n_20 <= repANF_6;
    end
  end
  
  assign tmp_14 = n_20;
  // register end
  
  assign x_3 = tmp_14;
  
  assign repANF_4 = {repANF_7
                    ,output_5};
  
  assign output_5 = repANF_8 - repANF_9;
  
  assign repANF_6 = x_13;
  
  assign repANF_7 = {eta_i1
                    ,repANF_10};
  
  assign repANF_8 = total_12 + eta_i1;
  
  // last begin
  wire [127:0] n_27;
  assign n_27 = vec_11;
  
  assign tmp_26 = n_27[8-1:0];
  // last end
  
  assign repANF_9 = tmp_26;
  
  // init begin
  wire [127:0] n_29;
  assign n_29 = vec_11;
  
  assign tmp_28 = n_29[128-1 : 8];
  // init end
  
  assign repANF_10 = tmp_28;
  
  assign vec_11 = x_3[135:8];
  
  assign total_12 = x_3[7:0];
  
  assign x_13 = bodyVar_1[143:8];
endmodule
