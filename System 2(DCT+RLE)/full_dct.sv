module full_dct(input logic signed [7:0]input0,[7:0]input1,[7:0]input2,[7:0]input3,[7:0]input4,[7:0]input5,[7:0]input6,[7:0]input7 ,
 input logic clk,clk8,reset,buf_reset,en,buf_en,cs, output logic signed [11:0] Output,[2:0]Counter);


logic signed[17:0] fraction_z0, fraction_z1, fraction_z2,fraction_z3, fraction_z4,
 fraction_z5, fraction_z6, fraction_z7;

logic signed [11:0] integer_Z0,integer_Z1, integer_Z2, integer_Z3, integer_Z4,
 integer_Z5, integer_Z6, integer_Z7;

logic signed [11:0] dout; 
logic signed [11:0] Input; 

logic signed [11:0] neg_threshold = 11'b11111111011; // negative threshold =-5
logic signed [11:0] pos_threshold = 11'b00000000101; //  positive threshold = 5


dct_top top1(input0,input1,input2,input3,input4,input5,input6,input7,clk,clk8,reset,en,cs, 
fraction_z0, fraction_z1, fraction_z2, fraction_z3, fraction_z4, fraction_z5, fraction_z6, fraction_z7);


transform t1 ( fraction_z0, fraction_z1, fraction_z2, fraction_z3, fraction_z4,
fraction_z5, fraction_z6,fraction_z7, integer_Z0, integer_Z1, integer_Z2, integer_Z3, integer_Z4,
 integer_Z5, integer_Z6, integer_Z7);


buffer buff1(clk,buf_reset,buf_en, integer_Z0, integer_Z1, integer_Z2, integer_Z3, integer_Z4,
 integer_Z5, integer_Z6, integer_Z7, dout);

hard_threshold #(12) thresh_1 (dout,neg_threshold, pos_threshold,Input);
rle #(12)rle1(clk,reset,Input,Output,Counter);

endmodule


