
module d_ff_tb();
 
  logic d_in;
  logic clk;
  logic reset;
  
  logic q_no_reset;
  logic q_sync_reset;
  logic q_async_reset;
  
  d_ff dff1 (.*);
  
  
  // generate clk
  always begin
    clk = 1'b1;
    #5;
    clk = ~clk;
    #5;
  end
  
  // vary d_in and reset values at posedge of clk
  initial begin
    reset = 1'b1;
    d_in = 1'b0;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    d_in = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    reset = 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
  end
  
  initial begin
    $dumpfile("d_ff.vcd"); // to visualize waveforms
    $dumpvars(0,d_ff_tb);
  end
  
endmodule
  
