
module mux_2 #(parameter width =8 )(input logic [width-1:0] d0,d1, input logic sel, output logic [width-1:0] y);

assign y=sel?d1:d0;

endmodule