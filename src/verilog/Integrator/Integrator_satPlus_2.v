// Automatically generated Verilog-2001
module Integrator_satPlus_2(eta_i1
                           ,eta_i2
                           ,bodyVar_o);
  input signed [9:0] eta_i1;
  input signed [9:0] eta_i2;
  output signed [9:0] bodyVar_o;
  wire signed [10:0] a1_0;
  wire [9:0] rzm1_1;
  wire [9:0] repANF_2;
  wire [9:0] repANF_3;
  wire [10:0] subjLet_4;
  wire [0:0] repANF_5;
  wire [0:0] repANF_6;
  wire [10:0] repANF_7;
  wire [9:0] rzm_8;
  wire [0:0] subjLet_9;
  wire [0:0] repANF_10;
  wire [0:0] repANF_11;
  wire signed [9:0] altLet_12;
  wire signed [9:0] altLet_13;
  wire [0:0] subjLet_14;
  wire [0:0] tmp_23;
  wire [0:0] tmp_25;
  wire [0:0] tmp_30;
  wire [0:0] tmp_32;
  assign a1_0 = eta_i1 + eta_i2;
  
  assign rzm1_1 = subjLet_4[9:0];
  
  assign repANF_2 = eta_i2;
  
  assign repANF_3 = eta_i1;
  
  assign subjLet_4 = repANF_7;
  
  // msb begin
  wire [9:0] n_24;
  assign n_24 = repANF_2;
  assign tmp_23 = n_24[10-1];
  // msb end
  
  assign repANF_5 = tmp_23;
  
  // msb begin
  wire [9:0] n_26;
  assign n_26 = repANF_3;
  assign tmp_25 = n_26[10-1];
  // msb end
  
  assign repANF_6 = tmp_25;
  
  assign repANF_7 = a1_0;
  
  assign rzm_8 = rzm1_1;
  
  assign subjLet_9 = repANF_6 & repANF_5;
  
  // msb begin
  wire [9:0] n_31;
  assign n_31 = rzm_8;
  assign tmp_30 = n_31[10-1];
  // msb end
  
  assign repANF_10 = tmp_30;
  
  // msb begin
  wire [10:0] n_33;
  assign n_33 = repANF_7;
  assign tmp_32 = n_33[11-1];
  // msb end
  
  assign repANF_11 = tmp_32;
  
  assign altLet_12 = rzm_8;
  
  reg signed [9:0] altLet_13_reg;
  always @(*) begin
    case(subjLet_9)
      1'b1 : altLet_13_reg = {1'b1, {(10-1) {1'b0}}};
      default : altLet_13_reg = {1'b0, {(10-1) {1'b1}}};
    endcase
  end
  assign altLet_13 = altLet_13_reg;
  
  assign subjLet_14 = repANF_11 ^ repANF_10;
  
  reg signed [9:0] bodyVar_o_reg;
  always @(*) begin
    case(subjLet_14)
      1'b0 : bodyVar_o_reg = altLet_12;
      default : bodyVar_o_reg = altLet_13;
    endcase
  end
  assign bodyVar_o = bodyVar_o_reg;
endmodule
