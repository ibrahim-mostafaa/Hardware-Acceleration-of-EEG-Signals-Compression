`timescale 1ns / 1ps

module rle_tb();
reg clk, rst_n;
reg [7:0] Input;
wire [7:0] Output;
wire [7:0] Counter;
reg [7:0] i;
reg [7:0] testvectors [0:15];
//instantiate device under test
rle dut(clk,rst_n,Input,Output,Counter);
// generate clk 
always 
begin
clk = 1; #5; clk = 0; #5;
end
// initial values 
initial begin
$readmemb("rle_values.txt",testvectors); 
i = 0; rst_n = 0; #6; rst_n = 1;
end
// at posedge clk, read the input
always @(posedge clk) begin
Input = testvectors[i];
end
// at negedge clk, (check outputs) and increment i
always @(negedge clk) 
i = i+1;
endmodule