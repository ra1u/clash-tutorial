// Automatically generated SystemVerilog-2005
import SuperLargeNumber_types::*;
module SuperLargeNumber_testbench(done);
  output logic [0:0] done;
  logic [0:0] finished;
  logic signed [6:0] eta_i1;
  logic [0:0] topLet_o;
  assign done = finished;
  
  // pragma translate_off
  always_comb begin
    if (finished == 1'b1) begin
      $finish;
    end
  end
  // pragma translate_on
  
  
  SuperLargeNumber_topEntity_0 totest
  (.eta_i1 (eta_i1)
  ,.topLet_o (topLet_o));
  
  assign eta_i1 = {7 {1'bx}};
  
  always begin
  // pragma translate_off
    finished <= 1'b0;
    #100
  // pragma translate_on
    finished = 1'b1;
  end
endmodule
