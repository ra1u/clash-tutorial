// Automatically generated SystemVerilog-2005
import MovingAverage_types::*;
module MovingAverage_topEntity(input_0
                              ,// clock
                              system1000
                              ,// asynchronous reset: active low
                              system1000_rstn
                              ,output_0);
  input logic signed [7:0] input_0;
  input logic system1000;
  input logic system1000_rstn;
  output logic signed [7:0] output_0;
  MovingAverage_topEntity_0 MovingAverage_topEntity_0_inst
  (.eta_i1 (input_0)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.topLet_o (output_0));
endmodule
