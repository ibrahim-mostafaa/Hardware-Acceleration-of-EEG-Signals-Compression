

module flopr#(parameter width =8)(input logic clk, reset, input logic [width -1:0] d, output logic [width -1:0] q );

always_ff @(posedge clk)
if (reset) q <= 0;
else q <= d;

endmodule 
