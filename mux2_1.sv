
module mux2_1(input wire [7:0] a,input wire [7:0] b,input wire sel,output reg [7:0] out);
      assign out = sel? b:a;
endmodule

      
