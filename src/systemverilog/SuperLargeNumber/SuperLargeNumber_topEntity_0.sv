// Automatically generated SystemVerilog-2005
import SuperLargeNumber_types::*;
module SuperLargeNumber_topEntity_0(eta_i1
                                   ,topLet_o);
  input logic signed [6:0] eta_i1;
  output logic [0:0] topLet_o;
  logic signed [6:0] repANF_0;
  assign repANF_0 = eta_i1 - 7'sd1;
  
  assign topLet_o = repANF_0 > 7'sd3;
endmodule
