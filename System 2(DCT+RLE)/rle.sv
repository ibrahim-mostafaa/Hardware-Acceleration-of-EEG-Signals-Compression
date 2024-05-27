
module rle #(parameter width =8)(input logic clk, reset,input logic [width-1:0] Input, output logic [width-1:0] Output, output logic [2:0] Counter);
logic [width-1:0]n;
logic  sel,enable;
logic  [2:0] Icounter,out1;
logic signed [width-1:0] Ioutput,out2;
initial begin #5; Icounter = 0; out1 = 1; out2 = Input;  end
flopr #(width) ff4(clk,reset,Input,n);
equal#(width) eq1(Input,n,sel);
assign enable = ~sel;
mux_2 #(3) m1(3'b001, Icounter+1, sel, out1);
flopr#(3) ff5(clk,reset,out1,Icounter);
flopenr #(3) ff6(clk,reset,enable,Icounter,Counter);
mux_2#(width) m2(Input, n, sel,out2);
flopr#(width) ff7(clk,reset,out2,Ioutput);
flopenr#(width) ff8(clk,reset,enable,Ioutput,Output);
endmodule 

