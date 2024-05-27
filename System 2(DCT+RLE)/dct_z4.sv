module dct_z4  (input logic signed [7:0]input0,[7:0]input1,[7:0]input2,[7:0]input3,[7:0]input4,[7:0]input5,[7:0]input6,[7:0]input7 ,
 input logic clk,clk8,reset,en,cs, output logic signed[17:0] OUTPUT_Z4);

logic signed [15:0] var1,var2,var1_not,var2_not,B1,B2;
//logic signed [16:0] B1_extended,B2_extended;
logic signed [16:0] B;
logic signed [17:0] B_extended;
logic signed [17:0] A,D,Q;
logic n1,n2,n3,n4,n5,n6;
logic signed s1,s2;


logic signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7;
//logic [7:0]x0,[7:0]x1,[7:0]x2,[7:0]x3,[7:0]x4,[7:0]x5,[7:0]x6,[7:0]x7; 

Right_shifter r1 (clk,reset,en,input0,x0);
Right_shifter r2 (clk,reset,en,input1,x1);
Right_shifter r3 (clk,reset,en,input2,x2);
Right_shifter r4 (clk,reset,en,input3,x3);
Right_shifter r5 (clk,reset,en,input4,x4);
Right_shifter r6 (clk,reset,en,input5,x5);
Right_shifter r7 (clk,reset,en,input6,x6);
Right_shifter r8 (clk,reset,en,input7,x7);


xor_gate  xor1(x0[0],x1[0],n1);
xor_gate  xor2(x0[0],x2[0],n2);
xor_gate  xor3(x0[0],x3[0],n3);

xor_gate  xor4(x4[0],x5[0],n4);
xor_gate  xor5(x4[0],x6[0],n5);
xor_gate  xor6(x4[0],x7[0],n6);

xor_gate  xor8(x0[0],0,s1);
xor_gate  xor9(x4[0],0,s2);


ROM1_Z4 rom1({n1,n2,n3},var1,cs);

not_gate #(16)  not1(var1,var1_not);
mux_2 #(16)  mux1 (var1,var1_not,s1, B1);


ROM2_Z4 rom2({n4,n5,n6},var2,cs);
not_gate #(16) not2(var2,var2_not);
mux_2 #(16) mux2 (var2,var2_not,s2, B2);


adder #(16) add1(B1,B2,s1,B);

assign B_extended = {B[16],B[16:0]}; 
addr #(18) add2(B_extended,A,s2,D);

flopr #(18) f1 (clk, reset, D,Q);
assign A = {Q[17],Q[17:1]};

flopr #(18)  f2 (clk8,reset,Q,OUTPUT_Z4);

endmodule  