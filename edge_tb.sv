module edge_detec_tb ();

  logic    clk;
  logic    reset;

  logic    a_in;

  logic    RE_detected;
  logic    FE_detected;

  edge_detec RE_FE1 (.*);

  // clk
  always begin
    clk = 1'b1;
    #5;
    clk = ~clk;
    #5;
  end

  // Vary input signal a_in
  initial begin
    
    reset <= 1'b1;
    a_in <= 1'b1;
    
    @(posedge clk); // wait for posedge of clock
    reset <= 1'b0;
    
    @(posedge clk); // wait for posedge of clock
    
    for (int i=0; i<32; i++)
      begin
      		a_in <= $random%2;
        	@(posedge clk); // wait for posedge of clock
    	end
    
    $finish();
    
  end

  // Dump VCD
  initial begin
    $dumpfile("edge_detec.vcd");
    $dumpvars(0, edge_detec_tb);
  end

endmodule
