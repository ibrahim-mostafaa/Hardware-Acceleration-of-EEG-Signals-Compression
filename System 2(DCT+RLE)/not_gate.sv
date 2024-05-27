
module not_gate #(parameter width =8 )(input logic [width-1:0] a, output logic [width-1:0] y);

assign y=~a;

endmodule