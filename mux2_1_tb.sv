module mux2_1_tb();
  logic [7:0] a; // 8-bit signal of logic zeros/ones
  logic [7:0] b;
  logic sel;
  logic [7:0] out;
  
  mux2_1 m1 (.*); //wildcard syntax '.*' means that the inputs and outputs of the instantiated module are connected to signals with the same names in the testbench.
  
  initial begin
    for(int i=0; i<10;i++) //randomized testcase iterations
      begin
        a = $urandom_range(0,8'b11111111);
        b = $urandom_range(0,8'b11111111);
        sel = $random%2;        
        #5;
      end
  end
  
  initial begin
    $dumpfile("mux2_1.vcd"); // to visualize waveforms
    $dumpvars(0,mux2_1_tb);
  end
  
endmodule
  
