module hard_threshold(
input signed [7:0] Input, 
output signed [7:0] Output);
wire sel_h;
wire signed [7:0] negative_threshold = 8'b11111111; // negative threshold =-3
wire signed [7:0] positive_threshold = 8'b00000001; //  positive threshold = 3

assign sel_h = (Input >=negative_threshold && Input <= positive_threshold)?1:0;
mux2#(8) inst1(.d0(Input),.d1(8'b0),.sel(sel_h),.y(Output));
endmodule