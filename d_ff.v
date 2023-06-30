
module d_ff(input logic d_in, input logic clk, input logic reset, output logic q_no_reset, output logic q_sync_reset, output logic q_async_reset);
  
  // no reset
  always@(posedge clk) //can also use always_ff if only non-blocking assignments are used
    q_no_reset <= d_in;
    
  // sync reset
  always@(posedge clk)
    if(reset)
      q_sync_reset <= 1'b0;
  else
    q_sync_reset <= d_in;
    
  //async reset
  always@(posedge clk or posedge reset) //negedge if reset_n
    if(reset)
      q_async_reset <= 1'b0;
  	else
    q_async_reset <= d_in;
endmodule

      