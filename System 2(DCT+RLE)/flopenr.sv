
module flopenr#(parameter width =8)(input logic clk, reset,enable, input logic [width -1:0] d, output logic [width -1:0] q );

always_ff @(posedge clk)
if (reset) q <= 0;
else if(enable) q <= d;

endmodule 