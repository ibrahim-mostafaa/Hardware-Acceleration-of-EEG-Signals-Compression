module buffer(input clk, rst_n, en, input [12:0]din0,din1,din2,din3,din4,din5,din6,din7, 
output reg [12:0] dout);


logic [2:0]  counter = 0; 

reg [12:0] FIFO [0:7]; 
assign FIFO[0] = din0;
assign FIFO[1] = din1;
assign FIFO[2] = din2;
assign FIFO[3] = din3;
assign FIFO[4] = din4;
assign FIFO[5] = din5;
assign FIFO[6] = din6;
assign FIFO[7] = din7;

always@(posedge clk or negedge rst_n) begin 

 if (!rst_n) begin 
counter = 0; 
dout = 13'b0;
end

else if (en) begin 
dout = FIFO[counter];
counter = counter+1;
end 

if (counter == 8) begin 
counter = 0;
end

end

endmodule
