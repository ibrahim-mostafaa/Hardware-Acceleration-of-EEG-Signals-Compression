`include "dwt.v"
`include "rle.v"
`include "hard_threshold.v"

module top( 
input  clk,rst_n,
input signed [7:0] input1,
input signed [7:0] input2,
output signed [8:0] Output1,
output  [7:0] Counter1,
output signed [8:0] Output2,
output  [7:0] Counter2);

wire signed [8:0] dwt_avg,dwt_diff,ht_avg,ht_diff;

dwt dwt1(.clk(clk),.rst_n(rst_n),.input1(input1),.input2(input2), .average(dwt_avg), .difference(dwt_diff));

hard_threshold h1 (.Input(dwt_avg),.Output(ht_avg)); // avg
hard_threshold h2 (.Input(dwt_diff),.Output(ht_diff)); // diff

rle r1 (.clk(clk),.rst_n(rst_n),.Input(ht_avg),.Output(Output1),.Counter(Counter1));

rle r2 (.clk(clk),.rst_n(rst_n),.Input(ht_diff),.Output(Output2),.Counter(Counter2));
//assign Output = {output1,counter1,output2,counter2};

endmodule
