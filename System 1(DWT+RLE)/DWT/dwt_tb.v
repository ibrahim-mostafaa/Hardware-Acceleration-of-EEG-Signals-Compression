
module dwt_tb(); 
// inputs & outputs 
reg clk, rst_n; 
reg signed [7:0] input1,input2; 
wire signed [7:0] average, difference;

reg [4:0]i; 
reg [7:0] testvectors [0:8];
// instantiate dut
dwt dut(.clk(clk), .rst_n(rst_n), .input1(input1), .input2(input2), .average(average), .difference(difference)); 

// generate clk
always begin 
clk = 1'b1; #5 clk = 1'b0; #5; 
end 


// store inputs in testvectors and put reset values.  
initial begin
i=0;
$readmemh("dwt_values.txt",testvectors); 
rst_n = 1'b0; 
@(negedge clk); rst_n = 1'b1;  
end

// read inputs @ posedge clk
always@(posedge clk) begin 
#1; input1 = testvectors[i];
input2 = testvectors [i+1];
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