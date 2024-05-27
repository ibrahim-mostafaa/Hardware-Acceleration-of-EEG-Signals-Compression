module transform(input logic signed[17:0] fraction_z0, fraction_z1, fraction_z2, fraction_z3, fraction_z4,
 fraction_z5,fraction_z6, fraction_z7, 
output logic signed [11:0] integer_Z0, integer_Z1, integer_Z2, integer_Z3, integer_Z4,
 integer_Z5, integer_Z6, integer_Z7);


assign integer_Z0 =  fraction_z0[17:6];
assign integer_Z1 =  fraction_z1[17:6];
assign integer_Z2 =  fraction_z2[17:6];
assign integer_Z3 =  fraction_z3[17:6];
assign integer_Z4 =  fraction_z4[17:6];
assign integer_Z5 =  fraction_z5[17:6];
assign integer_Z6 =  fraction_z6[17:6];
assign integer_Z7 =  fraction_z7[17:6];


endmodule

