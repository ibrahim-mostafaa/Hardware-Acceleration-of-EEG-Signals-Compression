`include "dct_top.v"
`include "transform.v"

module full_dct_transform(input signed [7:0]input0,input1,input2,input3,input4,input5,input6,input7,
 input clk,rst_n,en,cs, output signed [11:0] integer_Z0, integer_Z1, integer_Z2, integer_Z3, integer_Z4,
 integer_Z5, integer_Z6, integer_Z7);

wire signed[17:0] fraction_z0, fraction_z1, fraction_z2,fraction_z3, fraction_z4,
 fraction_z5, fraction_z6, fraction_z7;

dct_top top1(input0,input1,input2,input3,input4,input5,input6,input7,clk,rst_n,en,cs, 
fraction_z0, fraction_z1, fraction_z2, fraction_z3, fraction_z4, fraction_z5, fraction_z6, fraction_z7);

transform t1 ( fraction_z0, fraction_z1, fraction_z2, fraction_z3, fraction_z4,
fraction_z5, fraction_z6,fraction_z7, integer_Z0, integer_Z1, integer_Z2, integer_Z3, integer_Z4,
 integer_Z5, integer_Z6, integer_Z7);

endmodule


