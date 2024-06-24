
module hard_threshold#(parameter width = 13)(
input signed [width-1:0] Input,neg_threshold,pos_threshold, 
output signed [width-1:0] Output);

logic sel_h;
//logic signed [7:0] neg_threshold = 8?b11111101; // negative threshold =-3
//logic signed [7:0] pos_threshold = 8?b00000011; //  positive threshold = 3

assign sel_h = (Input >=neg_threshold && Input <= pos_threshold)?1:0;
mux_2#(width) mm(Input,13'b0,sel_h,Output);
endmodule


