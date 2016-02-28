// Automatically generated Verilog-2001
module MovingAverage3_mealyzm_1(eta_i1
                               ,// clock
                               system1000
                               ,// asynchronous reset: active low
                               system1000_rstn
                               ,y_o);
  input signed [7:0] eta_i1;
  input system1000;
  input system1000_rstn;
  output signed [7:0] y_o;
  wire [31:0] bodyVar_0;
  wire [23:0] repANF_1;
  wire signed [7:0] repANF_2;
  wire [15:0] repANF_3;
  wire [31:0] repANF_4;
  wire [23:0] x_5;
  wire [23:0] x_6;
  wire signed [7:0] tmp_7;
  wire [15:0] tmp_20;
  wire [23:0] tmp_23;
  wire [23:0] tmp_22;
  assign y_o = bodyVar_0[7:0];
  
  assign bodyVar_0 = {repANF_1
                     ,repANF_2};
  
  assign repANF_1 = {eta_i1
                    ,repANF_3};
  
  // fold begin
  // put flat input array into the first half of the intermediate array
  wire signed [7:0] intermediate_n_9 [0:(2*4)-2];
  wire [31:0] vecflat_n_10;
  assign vecflat_n_10 = repANF_4;
  genvar n_11;
  generate
  for (n_11=0; n_11 < 4; n_11=n_11+1) begin : array_n_12
    assign intermediate_n_9[(4-1)-n_11] = vecflat_n_10[n_11*8+:8];
  end
  endgenerate
  
  // calculate the depth of the tree
  function integer log2_n_13;
    input integer value;
    begin
      value = value-1;
      for (log2_n_13=0; value>0; log2_n_13=log2_n_13+1)
        value = value>>1;
    end
  endfunction
  
  localparam levels_n_14 = log2_n_13(4);
  
  // given a level and a depth, calculate the corresponding index into the
  // intermediate array
  function integer depth2Index_n_15;
    input integer levels;
    input integer depth;
  
    depth2Index_n_15 = (2 ** levels) - (2 ** depth);
  endfunction
  
  // Create the tree of instantiated components
  genvar d_n_16;
  genvar i_n_17;
  generate
  if (levels_n_14 != 0) begin : make_tree_n_18
    for (d_n_16 = (levels_n_14 - 1); d_n_16 >= 0; d_n_16=d_n_16-1) begin : tree_depth
      for (i_n_17 = 0; i_n_17 < (2**d_n_16); i_n_17 = i_n_17+1) begin : tree_depth_loop
        wire signed [7:0] n_15;
        wire signed [7:0] n_13;
        wire signed [7:0] n_19;
  
        assign n_15 = intermediate_n_9[depth2Index_n_15(levels_n_14+1,d_n_16+2)+(2*i_n_17)];
        assign n_13 = intermediate_n_9[depth2Index_n_15(levels_n_14+1,d_n_16+2)+(2*i_n_17)+1];
        assign n_19 = n_15 + n_13;
        assign intermediate_n_9[depth2Index_n_15(levels_n_14+1,d_n_16+1)+i_n_17] = n_19;
      end
    end
  end
  endgenerate
  
  // The last element of the intermediate array holds the result
  assign tmp_7 = intermediate_n_9[(2*4)-2];
  // fold end
  
  assign repANF_2 = tmp_7;
  
  // init begin
  wire [23:0] n_21;
  assign n_21 = x_5;
  
  assign tmp_20 = n_21[24-1 : 8];
  // init end
  
  assign repANF_3 = tmp_20;
  
  assign repANF_4 = {eta_i1,x_5};
  
  // init begin
  wire [31:0] n_28;
  assign n_28 = ({(4) {8'sd0}});
  
  assign tmp_23 = n_28[32-1 : 8];
  // init end
  
  // register begin
  reg [23:0] n_29;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_MovingAverage3_mealyzm_1_n_30
    if (~ system1000_rstn) begin
      n_29 <= tmp_23;
    end else begin
      n_29 <= x_6;
    end
  end
  
  assign tmp_22 = n_29;
  // register end
  
  assign x_5 = tmp_22;
  
  assign x_6 = bodyVar_0[31:8];
endmodule
