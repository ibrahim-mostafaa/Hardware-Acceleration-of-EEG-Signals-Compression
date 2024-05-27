module adder #(parameter width = 4) (input logic signed [width-1:0]a,b,input logic signed cin, output logic signed [width:0]sum);

assign sum = a + b - cin ; 

endmodule 

