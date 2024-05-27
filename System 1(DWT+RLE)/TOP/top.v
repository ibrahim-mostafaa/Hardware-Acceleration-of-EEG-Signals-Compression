module top( 
input  clk,rst_n,
input signed [7:0] input1,
input signed [7:0] input2,
output signed [7:0] Output1,
output  [7:0] Counter1,
output signed [7:0] Output2,
output  [7:0] Counter2);

wire [7:0] n1,n2,n3,n4;
//wire [7:0] output1, output2;
//wire [7:0] counter1, counter2;

dwt dwt1(.clk(clk),.rst_n(rst_n),.input1(input1), 
.input2(input2), .average(n1), .difference(n2));

hard_threshold h1 (.Input(n1),.Output(n3)); // avg
hard_threshold h2 (.Input(n2),.Output(n4)); // diff

rle r1 (.clk(clk),.rst_n(rst_n),.Input(n3),
.Output(Output1), .Counter(Counter1));

rle r2 (.clk(clk),.rst_n(rst_n),.Input(n4),
.Output(Output2), .Counter(Counter2));
//assign Output = {output1,counter1,output2,counter2};

endmodule
