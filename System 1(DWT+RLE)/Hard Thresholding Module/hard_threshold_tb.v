
module hard_threshold_tb(); 
// inputs & outputs 
reg [7:0] Input; 
 
// wire outputs
wire signed [7:0] Output;

//reg i, and testvectors
reg clk;
reg [3:0]i;  // 8 values 
reg [7:0] testvectors [0:8];
// instantiate dut
hard_threshold dut(.Input(Input), .Output(Output)); 

// generate clk
always begin 
clk = 1'b1; #5 clk = 1'b0; #5; 
end 


// store inputs in testvectors and put reset values.  
initial begin
i=0;
$readmemb("txtfile.txt",testvectors);  
end

// read inputs @ posedge clk
always@(posedge clk) begin 
#1; Input = testvectors[i];
end

// check outputs @ negedge clk
always@(negedge clk) begin 
i = i+1; 
if(testvectors[i] === 8'bx) begin 
$display("Test ended"); 
$stop; 
end 
end 

endmodule 