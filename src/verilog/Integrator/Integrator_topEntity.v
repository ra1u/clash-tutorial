// Automatically generated Verilog-2001
module Integrator_topEntity(input_0
                           ,// clock
                           system1000
                           ,// asynchronous reset: active low
                           system1000_rstn
                           ,output_0);
  input signed [9:0] input_0;
  input system1000;
  input system1000_rstn;
  output signed [9:0] output_0;
  Integrator_topEntity_0 Integrator_topEntity_0_inst
  (.signal_i1 (input_0)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.topLet_o (output_0));
endmodule
