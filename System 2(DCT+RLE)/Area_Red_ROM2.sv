module Area_Red_ROM2 (addr, data, cs);

input [2:0] addr; // address
input cs; // chip select
output reg [15:0] data;

always_comb
begin

if (~cs) 
data = 0;

else 
begin
 
// This is for the first row to get z1 only 	*this is the second rom*
	                                           // It must be in Fixed Point representation! 
// first bit is for +/- , then the 2nd bit either 0 for 0 or 1 for 1, negatives is the 2's compliment for the whole number
 
// c1= 0.9807852804 , c2= 0.92387953251 , c3= 0.8314696123 , c4= 0.70710678118 , c5= 0.55557023302 , c6= 0.38268343236 , c7= 0.19509032201 
 
     if (addr == 3'b000) begin data <= 16'b0101001000000011; end // 1.281457724 = 0.5(0.19509032201+0.55557023302+0.8314696123+0.9807852804)
// (x0j==0 && x1j==0 && x2j==0 && x3j==0 )  -0.5*-[c7+c5+c3+c1] negative 1111

else if (addr == 3'b001) begin data <= 16'b0001001100111110; end // 0.3006724435 = 0.5(0.19509032201+0.55557023302+0.8314696123-0.9807852804)
// (x0j==0 && x1j==0 && x2j==0 && x3j==1 ) -0.5*-[c7+c5+c3-c1] = negative 1110

else if (addr == 3'b010) begin data <= 16'b0001110011001100; end // 0.4499881116 = 0.5(0.19509032201+0.55557023302-0.8314696123+0.9807852804)
// (x0j==0 && x1j==0 && x2j==1 && x3j==0 ) -0.5*-[c7+c5-c3+c1] = negative 1101

else if (addr == 3'b011) begin data <= 16'b1101111000000111; end // -0.5307971688  = 0.5(0.19509032201+0.55557023302-0.8314696123-0.9807852804)
// (x0j==0 && x1j==0 && x2j==1 && x3j==1 ) -0.5*-[c7+c5-c3-c1] = negative 1100

else if (addr == 3'b100) begin data <= 16'b0010111001110100; end // 0.7258874908 = 0.5(0.19509032201-0.55557023302+0.8314696123+0.9807852804)
// (x0j==0 && x1j==1 && x2j==0 && x3j==0 ) -0.5*-[c7-c5+c3+c1] = negative 1011

else if (addr == 3'b101) begin data <= 16'b1110111110101111; end // -0.2548977896 = 0.5(0.19509032201-0.55557023302+0.8314696123-0.9807852804)
// (x0j==0 && x1j==1 && x2j==0 && x3j==1 ) -0.5*-[c7-c5+c3-c1] = negative 1010

else if (addr == 3'b110) begin data <= 16'b1111100100111110; end // -0.1055821215 = 0.5(0.19509032201-0.55557023302-0.8314696123+0.9807852804)
// (x0j==0 && x1j==1 && x2j==1 && x3j==0 ) -0.5*-[c7-c5-c3+c1] = negative 1001

else if (addr == 3'b111) begin data <= 16'b1011101001111000; end // -1.086367402 = 0.5(0.19509032201-0.55557023302-0.8314696123-0.9807852804)
// (x0j==0 && x1j==1 && x2j==1 && x3j==1 ) -0.5*-[c7-c5-c3-c1] = negative 1000 


end

end

endmodule
