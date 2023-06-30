
module  edge_detec (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_in,

  output    wire    RE_detected,
  output    wire    FE_detected
);

  logic a_ff; // delayed input from D Flip-Flop

  always@(posedge clk or posedge reset)
    if (reset)
      a_ff <= 1'b0;
    else
      a_ff <= a_in;

  assign RE_detected = ~a_ff & a_in; // delayed is 0, current is 1 => 0 to 1

  assign FE_detected = a_ff & ~a_in;  // delayed is 1, current is 0 => 1 to 0

endmodule
