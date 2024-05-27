`timescale 1ns / 100ps

module top_tb(); 
// inputs & outputs 
reg clk, rst_n; 
reg signed [7:0] input1,input2; 

// wire outputs
wire signed [7:0] Output1,Output2; 
wire [7:0] Counter1,Counter2; 

//reg i, and testvectors
reg [4:0]i;   // 32 counts
reg [7:0] testvectors [0:31];

// instantiate dut
top dut(.clk(clk), .rst_n(rst_n), 
.input1(input1),.input2(input2)
, .Output1(Output1), .Counter1(Counter1),
.Output2(Output2),.Counter2(Counter2)); 

// generate clk
always begin 
clk = 1'b1; #5 clk = 1'b0; #5; 
end 


// store inputs in testvectors and put reset values.  
initial begin
i=0;
$readmemb("txtfile.txt",testvectors); 
rst_n = 1'b0; 
@(negedge clk); rst_n = 1'b1;   // TO AVOID 
//TIMING VIOLTION DUE TO ASSERTION OF RST_N SIGNAL 
//NEAR ACTIVE EDGE OF CLK. 
end

// read inputs @ posedge clk
always@(posedge clk) begin 
#1; input1 = testvectors[i];
input2 = testvectors[i+1];
end

// check outputs @ negedge clk
always@(negedge clk) begin 
i = i+2; 
if(testvectors[i] === 8'bx) begin 
$display("Test ended"); 
$stop; 
end 
end 

endmodule 