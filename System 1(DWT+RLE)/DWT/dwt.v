
module dwt(
input wire clk,rst_n, 
input wire signed [7:0] input1,input2, 
output wire  signed [7:0] average, difference); 

//wire [7:0]n; 
//wire clk2; 

wire signed [7:0] mid_avg,mid_diff; 
wire signed [7:0] shifted_average, shifted_difference;


//flopr#(8)ff1(clk,rst_n,Input,n); 

adder1 #(8) a1 (input1,input2,mid_avg); 
diff #(8) d1 (input1,input2,mid_diff); 

assign shifted_average = mid_avg >>> 1;
assign shifted_difference = mid_diff >>> 1; 

//clock_divide_2 m1 (clk,rst_n,clk2); 

flopr#(8) ff2 (clk, rst_n, shifted_average, average);
flopr#(8) ff3 (clk, rst_n, shifted_difference, difference);

endmodule 