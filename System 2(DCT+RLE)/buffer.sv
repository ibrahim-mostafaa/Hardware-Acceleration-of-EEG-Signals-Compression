module buffer( input logic clk, reset, en, input logic [11:0]din0,[11:0]din1,[11:0]din2,[11:0]din3,[11:0]din4,[11:0]din5,
[11:0]din6,[11:0]din7, 
output logic [11:0] dout);


logic [2:0]  counter = 0; 

logic [10:0] FIFO [0:7]; 
assign FIFO[0] = din0;
assign FIFO[1] = din1;
assign FIFO[2] = din2;
assign FIFO[3] = din3;
assign FIFO[4] = din4;
assign FIFO[5] = din5;
assign FIFO[6] = din6;
assign FIFO[7] = din7;

always_ff @(posedge clk)

begin 

 if (reset) begin 
counter = 0; 
dout = 11'b0;
end

 else if (en) begin 
 
dout = FIFO[counter];
 counter = counter+1;
  end 

if (counter == 8) begin 
 counter = 0 ;

end
end


endmodule
