// Automatically generated SystemVerilog-2005
import FeedbackLoop_types::*;
module FeedbackLoop_testbench(done);
  output logic [0:0] done;
  logic [0:0] finished;
  logic system1000;
  logic system1000_rstn;
  logic signed [7:0] input_i1;
  logic signed [7:0] out_o;
  assign done = finished;
  
  // pragma translate_off
  always_comb begin
    if (finished == 1'b1) begin
      $finish;
    end
  end
  // pragma translate_on
  
  
  // pragma translate_off
  always begin
    system1000 = 0;
    #3 forever begin
      system1000 = ~ system1000;
      #500;
      system1000 = ~ system1000;
      #500;
    end
  end
  // pragma translate_on
  
  // pragma translate_off
  initial begin
    system1000_rstn = 0;
    #2 system1000_rstn = 1;
  end
  // pragma translate_on
  
  FeedbackLoop_topEntity_0 totest
  (.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.input_i1 (input_i1)
  ,.out_o (out_o));
  
  assign input_i1 = {8 {1'bx}};
  
  always begin
  // pragma translate_off
    finished <= 1'b0;
    #100
  // pragma translate_on
    finished = 1'b1;
  end
endmodule
