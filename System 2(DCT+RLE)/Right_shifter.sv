module Right_shifter #(parameter width = 8) (input logic clk, reset,en,input logic [width-1:0]din,output logic [width-1:0]q);

always_ff @(posedge clk,posedge reset)
if (reset) q <= 0;
else if (en) q <= din;
else q <= {0,q[width-1:1]};

endmodule
