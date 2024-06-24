`include "dct_z0.v"
`include "dct_z1.v"
`include "dct_z2.v"
`include "dct_z3.v"

`include "dct_z4.v"
`include "dct_z5.v"
`include "dct_z6.v"
`include "dct_z7.v"

module dct_top  (input signed [7:0]input0,input1,input2,input3,input4,input5,input6,input7,

 input clk,rst_n,en,cs, 

 output signed[18:0] OUTPUT_Z0, OUTPUT_Z1, OUTPUT_Z2, OUTPUT_Z3, 
 OUTPUT_Z4, OUTPUT_Z5, OUTPUT_Z6, OUTPUT_Z7);

dct_z0 inst0(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z0);
dct_z1 inst1(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z1);
dct_z2 inst2(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z2);
dct_z3 inst3(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z3);
dct_z4 inst4(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z4);
dct_z5 inst5(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z5);
dct_z6 inst6(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z6);
dct_z7 inst7(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs,OUTPUT_Z7);

endmodule 


