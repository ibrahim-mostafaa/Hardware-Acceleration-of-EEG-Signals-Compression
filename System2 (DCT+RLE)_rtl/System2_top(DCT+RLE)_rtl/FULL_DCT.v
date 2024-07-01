`include "dct_top.v"
`include "transform.v"
`include "buffer.v"
`include "hard_threshold.v"
`include "rle.v"

module full_dct(
    
input signed [7:0]input0,input1,input2,input3,input4,input5,input6,input7,
input clk,rst_n,en,buf_en,cs, 
output signed [11:0] Output,[7:0]Counter);

wire signed[18:0] fraction_z0, fraction_z1, fraction_z2,fraction_z3,
fraction_z4,fraction_z5, fraction_z6, fraction_z7;

wire signed [11:0] integer_Z0,integer_Z1, integer_Z2, integer_Z3, 
integer_Z4,integer_Z5, integer_Z6, integer_Z7;

wire signed [11:0] dout; 
wire signed [11:0] rle_Input; 

wire signed [11:0] neg_threshold = 11'b111111111011; // negative threshold =-5
wire signed [11:0] pos_threshold = 11'b000000000101; //  positive threshold = 5

//dct_top
dct_top top1(
    .input0(input0),
    .input1(input1),
    .input2(input2),
    .input3(input3),
    .input4(input4),
    .input5(input5),
    .input6(input6),
    .input7(input7),

    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .cs(cs),

    .OUTPUT_Z0(fraction_z0),
    .OUTPUT_Z1(fraction_z1),
    .OUTPUT_Z2(fraction_z2),
    .OUTPUT_Z3(fraction_z3),
    .OUTPUT_Z4(fraction_z4),
    .OUTPUT_Z5(fraction_z5),
    .OUTPUT_Z6(fraction_z6),
    .OUTPUT_Z7(fraction_z7)
    );

//transform
transform t1 ( 
.fraction_z0(fraction_z0),
.fraction_z1(fraction_z1),
.fraction_z2(fraction_z2),
.fraction_z3(fraction_z3),
.fraction_z4(fraction_z4),
.fraction_z5(fraction_z5),
.fraction_z6(fraction_z6),
.fraction_z7(fraction_z7),

.integer_Z0(integer_Z0),
.integer_Z1(integer_Z1),
.integer_Z2(integer_Z2),
.integer_Z3(integer_Z3),
.integer_Z4(integer_Z4),
.integer_Z5(integer_Z5),
.integer_Z6(integer_Z6),
.integer_Z7(integer_Z7),
);

//buffer
buffer buff1(
.clk(clk),
.rst_n(rst_n),
.en(buf_en), 
.din0(integer_Z0),
.din1(integer_Z1),
.din2(integer_Z2),
.din3(integer_Z3),
.din4(integer_Z4),
.din5(integer_Z5),
.din6(integer_Z6),
.din7(integer_Z7),
.dout(dout)
);

//hard_threshold
hard_threshold #(12) ht_1 (
.Input(dout),
.neg_threshold(neg_threshold),
.pos_threshold(pos_threshold),
.Output(rle_Input)
);

//rle 
rle #(12) rle1(
.clk(clk),
.rst_n(rst_n),
.Input(rle_Input),
.Output(Output),
.Counter(Counter)
);

endmodule


