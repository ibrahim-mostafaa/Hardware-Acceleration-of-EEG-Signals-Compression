module flopenr#(parameter width =8)(
input wire clk, rst_n,en, 
input wire  [width -1:0] d, 
output reg [width -1:0] q );

always @(posedge clk)
if (!rst_n) q <= 0;
else if(en) q <= d;

endmodule 