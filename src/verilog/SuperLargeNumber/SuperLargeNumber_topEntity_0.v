// Automatically generated Verilog-2001
module SuperLargeNumber_topEntity_0(eta_i1
                                   ,topLet_o);
  input signed [6:0] eta_i1;
  output [0:0] topLet_o;
  wire signed [6:0] repANF_0;
  assign repANF_0 = eta_i1 - 7'sd1;
  
  assign topLet_o = repANF_0 > 7'sd3;
endmodule
