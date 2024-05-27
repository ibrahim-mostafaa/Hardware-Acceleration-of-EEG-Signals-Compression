
module equal #(parameter width=8)( input logic [width-1:0] a,b, output logic y);
assign y = (a==b)?1:0;
endmodule
