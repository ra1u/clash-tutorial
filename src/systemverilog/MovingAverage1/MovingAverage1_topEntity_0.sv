// Automatically generated SystemVerilog-2005
import MovingAverage1_types::*;
module MovingAverage1_topEntity_0(eta_i1
                                 ,// clock
                                 system1000
                                 ,// asynchronous reset: active low
                                 system1000_rstn
                                 ,topLet_o);
  input logic signed [7:0] eta_i1;
  input logic system1000;
  input logic system1000_rstn;
  output logic signed [7:0] topLet_o;
  MovingAverage1_mealyzm_1 MovingAverage1_mealyzm_1_topLet_o
  (.y_o (topLet_o)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.eta_i1 (eta_i1));
endmodule
