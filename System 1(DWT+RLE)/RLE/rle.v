module rle(
input clk, rst_n,
input signed [7:0] Input, 
output signed [7:0] Output, 
output [7:0] Counter);


wire [7:0]n;
wire sel,en;
wire x1,sel2; 
wire [7:0] Icounter,out1;
wire signed [7:0] Ioutput,out2;

flopr ff4(.clk(clk),.rst_n(rst_n),.d(Input),.q(n));
equal eq1 (.a(Input), .b(n), .y(sel));

assign en = ~sel;

mux2#(8) m1(.d0(8'b0000_0001), .d1(Icounter+1), .sel(sel),.y(out1));
flopr#(8) ff5(.clk(clk),.rst_n(rst_n),.d(out1),.q(Icounter));
flopenr #(8) ff6(.clk(clk),.rst_n(rst_n),.en(en),.d(Icounter),.q(Counter));

mux2#(8) m2(.d0(Input), .d1(Ioutput), .sel(sel),.y(out2));
flopr#(8) ff7(.clk(clk),.rst_n(rst_n),.d(out2),.q(Ioutput));
flopenr #(8) ff8(.clk(clk),.rst_n(rst_n),.en(en),.d(Ioutput),.q(Output));

//flopr #(1) ff5(.clk(clk),.rst_n(rst_n),.d(sel),.q(x1));
//xor_1bit xor1(.a(sel), .b(x1), .y(sel2);


endmodule 