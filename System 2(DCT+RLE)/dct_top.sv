module dct_top  (input logic signed [7:0]input0,[7:0]input1,[7:0]input2,[7:0]input3,[7:0]input4,[7:0]input5,[7:0]input6,[7:0]input7 ,
 input logic clk,clk8,reset,en,cs, output logic signed[17:0] OUTPUT_Z0,[17:0] OUTPUT_Z1,[17:0] OUTPUT_Z2,[17:0] OUTPUT_Z3,[17:0] OUTPUT_Z4,
[17:0] OUTPUT_Z5,[17:0] OUTPUT_Z6,[17:0] OUTPUT_Z7);

dct_z0 inst0(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z0);
dct_z1 inst1(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z1);
dct_z2 inst2(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z2);
dct_z3 inst3(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z3);
dct_z4 inst4(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z4);
dct_z5 inst5(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z5);
dct_z6 inst6(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z6);
dct_z7 inst7(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs,OUTPUT_Z7);

endmodule 


