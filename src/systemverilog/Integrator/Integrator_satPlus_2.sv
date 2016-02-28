// Automatically generated SystemVerilog-2005
import Integrator_types::*;
module Integrator_satPlus_2(eta_i1
                           ,eta_i2
                           ,bodyVar_o);
  input logic signed [9:0] eta_i1;
  input logic signed [9:0] eta_i2;
  output logic signed [9:0] bodyVar_o;
  logic signed [10:0] a1_0;
  logic [9:0] rzm1_1;
  logic [9:0] repANF_2;
  logic [9:0] repANF_3;
  product0 subjLet_4;
  logic [0:0] repANF_5;
  logic [0:0] repANF_6;
  logic [10:0] repANF_7;
  logic [9:0] rzm_8;
  logic [0:0] subjLet_9;
  logic [0:0] repANF_10;
  logic [0:0] repANF_11;
  logic signed [9:0] altLet_12;
  logic signed [9:0] altLet_13;
  logic [0:0] subjLet_14;
  product0 tmp_21;
  logic [0:0] tmp_23;
  logic [0:0] tmp_25;
  logic [0:0] tmp_30;
  logic [0:0] tmp_32;
  assign a1_0 = eta_i1 + eta_i2;
  
  assign rzm1_1 = subjLet_4.product0_sel1;
  
  assign repANF_2 = eta_i2;
  
  assign repANF_3 = eta_i1;
  
  // split begin
  logic [10:0] n_22;
  assign n_22 = repANF_7;
  assign tmp_21 = '{ n_22[$high(n_22) : 10]
                    , n_22[(10-1) : 0]
                    };
  // split end
  
  assign subjLet_4 = tmp_21;
  
  // msb begin
  logic [9:0] n_24;
  assign n_24 = repANF_2;
  assign tmp_23 = n_24[10-1];
  // msb end
  
  assign repANF_5 = tmp_23;
  
  // msb begin
  logic [9:0] n_26;
  assign n_26 = repANF_3;
  assign tmp_25 = n_26[10-1];
  // msb end
  
  assign repANF_6 = tmp_25;
  
  assign repANF_7 = a1_0;
  
  assign rzm_8 = rzm1_1;
  
  assign subjLet_9 = repANF_6 & repANF_5;
  
  // msb begin
  logic [9:0] n_31;
  assign n_31 = rzm_8;
  assign tmp_30 = n_31[10-1];
  // msb end
  
  assign repANF_10 = tmp_30;
  
  // msb begin
  logic [10:0] n_33;
  assign n_33 = repANF_7;
  assign tmp_32 = n_33[11-1];
  // msb end
  
  assign repANF_11 = tmp_32;
  
  assign altLet_12 = rzm_8;
  
  always_comb begin
    case(subjLet_9)
      1'b1 : altLet_13 = {1'b1, {(10-1) {1'b0}}};
      default : altLet_13 = {1'b0, {(10-1) {1'b1}}};
    endcase
  end
  
  assign subjLet_14 = repANF_11 ^ repANF_10;
  
  always_comb begin
    case(subjLet_14)
      1'b0 : bodyVar_o = altLet_12;
      default : bodyVar_o = altLet_13;
    endcase
  end
endmodule
