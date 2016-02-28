// Automatically generated Verilog-2001
module MovingAverage1_mealyzm_1(eta_i1
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,y_o);
  input signed [7:0] eta_i1;
  input system1000;
  input system1000_rstn;
  output signed [7:0] y_o;
  wire [39:0] bodyVar_0;
  wire signed [7:0] repANF_1;
  wire [31:0] nexts_2;
  wire [23:0] a6_3;
  wire [31:0] x_4;
  wire [31:0] x_5;
  wire signed [7:0] tmp_6;
  wire [23:0] tmp_19;
  wire [31:0] tmp_21;
  assign y_o = bodyVar_0[7:0];
  
  assign bodyVar_0 = {nexts_2
                     ,repANF_1};
  
  // fold begin
  // put flat input array into the first half of the intermediate array
  wire signed [7:0] intermediate_n_8 [0:(2*4)-2];
  wire [31:0] vecflat_n_9;
  assign vecflat_n_9 = nexts_2;
  genvar n_10;
  generate
  for (n_10=0; n_10 < 4; n_10=n_10+1) begin : array_n_11
    assign intermediate_n_8[(4-1)-n_10] = vecflat_n_9[n_10*8+:8];
  end
  endgenerate
  
  // calculate the depth of the tree
  function integer log2_n_12;
    input integer value;
    begin
      value = value-1;
      for (log2_n_12=0; value>0; log2_n_12=log2_n_12+1)
        value = value>>1;
    end
  endfunction
  
  localparam levels_n_13 = log2_n_12(4);
  
  // given a level and a depth, calculate the corresponding index into the
  // intermediate array
  function integer depth2Index_n_14;
    input integer levels;
    input integer depth;
  
    depth2Index_n_14 = (2 ** levels) - (2 ** depth);
  endfunction
  
  // Create the tree of instantiated components
  genvar d_n_15;
  genvar i_n_16;
  generate
  if (levels_n_13 != 0) begin : make_tree_n_17
    for (d_n_15 = (levels_n_13 - 1); d_n_15 >= 0; d_n_15=d_n_15-1) begin : tree_depth
      for (i_n_16 = 0; i_n_16 < (2**d_n_15); i_n_16 = i_n_16+1) begin : tree_depth_loop
        wire signed [7:0] n_14;
        wire signed [7:0] n_12;
        wire signed [7:0] n_18;
  
        assign n_14 = intermediate_n_8[depth2Index_n_14(levels_n_13+1,d_n_15+2)+(2*i_n_16)];
        assign n_12 = intermediate_n_8[depth2Index_n_14(levels_n_13+1,d_n_15+2)+(2*i_n_16)+1];
        assign n_18 = n_14 + n_12;
        assign intermediate_n_8[depth2Index_n_14(levels_n_13+1,d_n_15+1)+i_n_16] = n_18;
      end
    end
  end
  endgenerate
  
  // The last element of the intermediate array holds the result
  assign tmp_6 = intermediate_n_8[(2*4)-2];
  // fold end
  
  assign repANF_1 = tmp_6;
  
  assign nexts_2 = {eta_i1,a6_3};
  
  // init begin
  wire [31:0] n_20;
  assign n_20 = x_4;
  
  assign tmp_19 = n_20[32-1 : 8];
  // init end
  
  assign a6_3 = tmp_19;
  
  // register begin
  reg [31:0] n_26;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_MovingAverage1_mealyzm_1_n_27
    if (~ system1000_rstn) begin
      n_26 <= ({(4) {8'sd0}});
    end else begin
      n_26 <= x_5;
    end
  end
  
  assign tmp_21 = n_26;
  // register end
  
  assign x_4 = tmp_21;
  
  assign x_5 = bodyVar_0[39:8];
endmodule
