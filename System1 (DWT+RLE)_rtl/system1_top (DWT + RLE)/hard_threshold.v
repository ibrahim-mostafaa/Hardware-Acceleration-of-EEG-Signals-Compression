module hard_threshold(
input signed [8:0] Input, 
output signed [8:0] Output);
wire sel_h;
wire signed [8:0] negative_threshold = 9'b111111111; // negative threshold =-3
wire signed [8:0] positive_threshold = 9'b000000001; //  positive threshold = 3

assign sel_h = (Input >=negative_threshold && Input <= positive_threshold)?1:0;
mux2#(9) inst1(.d0(Input),.d1(9'b0),.sel(sel_h),.y(Output));
endmodule