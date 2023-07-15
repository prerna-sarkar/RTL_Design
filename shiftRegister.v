// 8-bit Shift Register
// Rising edge clock and Active high clock enable

module shift_register (clk, clken, SI, SO);
parameter WIDTH = 32; // Parameter defining the width of the shift register

input clk, clken, SI; // Input ports: clock, clock enable, serial input
output SO; // Output port: serial output

reg [WIDTH-1:0] shreg; // Register to store the shift register contents

always @(posedge clk)
begin
  if (clken) // Clock enable condition
    shreg = {shreg[WIDTH-2:0], SI}; // appending SI to the right
end

assign SO = shreg[WIDTH-1]; // Assign the most significant bit of shreg as SO

endmodule
