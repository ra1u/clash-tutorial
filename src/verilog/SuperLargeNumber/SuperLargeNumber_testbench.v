// Automatically generated Verilog-2001
module SuperLargeNumber_testbench(done);
  output [0:0] done;
  wire [0:0] finished;
  wire signed [6:0] eta_i1;
  wire [0:0] topLet_o;
  assign done = finished;
  
  // pragma translate_off
  always @(*) begin
    if (finished == 1'b1) begin
      $finish;
    end
  end
  // pragma translate_on
  
  
  SuperLargeNumber_topEntity_0 totest
  (.eta_i1 (eta_i1)
  ,.topLet_o (topLet_o));
  
  assign eta_i1 = {7 {1'bx}};
  
  reg [0:0] n_0;
  always begin
  // pragma translate_off
    n_0 <= 1'b0;
    #100
  // pragma translate_on
    n_0 = 1'b1;
  end
  assign finished = n_0;
endmodule
