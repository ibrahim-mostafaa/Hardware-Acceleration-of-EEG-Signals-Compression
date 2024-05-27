module ROM1_Z6(addr, data, cs);

input [2:0] addr; // address
input cs; // chip select
output reg [15:0] data;

always_comb
begin

if (~cs) 
data = 0;

else 
begin
// c1= 0.9807852804 , c2= 0.92387953251 , c3= 0.8314696123 , c4= 0.70710678118 , c5= 0.55557023302 , c6= 0.38268343236 , c7= 0.19509032201 
// make sure that c4 is equal 32'b01011010100000100111100110011001
// This is for the first row to get z1 only 	*this is the first rom*
    			                           // It must be in Fixed Point representation! 
// first bit is for +/- , then the 2nd bit either 0 for 0 or 1 for 1, negatives is the 2's compliment for the whole number
 
     if (addr == 3'b000) begin data <= 16'b0000000000000000; end // 0
// (x0j==0 && x1j==0 && x2j==0 && x3j==0 )  0 = -0.5[c6-c2+c2-c6] negative 1111  

else if (addr == 3'b001) begin data <= 16'b1110011110000010; end // -0.38268343236
// (x0j==0 && x1j==0 && x2j==0 && x3j==1 ) -c6 = -0.5[c6-c2+c2+c6] = negative 1110    

else if (addr == 3'b010) begin data <= 16'b0011101100100000; end // 0.92387953251
// (x0j==0 && x1j==0 && x2j==1 && x3j==0 ) c2 = -0.5[c6-c2-c2-c6] = negative 1101  
 
else if (addr == 3'b011) begin data <= 16'b0010001010100010; end //  0.5411961001 = 0.92387953251-0.38268343236
// (x0j==0 && x1j==0 && x2j==1 && x3j==1 ) c2-c6 = -0.5[c6-c2-c2+c6] = negative 1100  
  
else if (addr == 3'b100) begin data <= 16'b1100010011011111; end // -0.92387953251
// (x0j==0 && x1j==1 && x2j==0 && x3j==0 ) -c2 = -0.5[c6+c2+c2-c6] = negative 1011  

else if (addr == 3'b101) begin data <= 16'b1010110001100001; end // -1.306562965 = -0.92387953251 -0.38268343236
// (x0j==0 && x1j==1 && x2j==0 && x3j==1 ) -c6-c2 = -0.5[c6+c2+c2+c6] = negative 1010  
  
else if (addr == 3'b110) begin data <= 16'b0000000000000000; end // 0
// (x0j==0 && x1j==1 && x2j==1 && x3j==0 ) 0 = -0.5[c6+c2-c2-c6] = negative 1001  
 
else if (addr == 3'b111) begin data <= 16'b1110011110000010; end // -0.38268343236
// (x0j==0 && x1j==1 && x2j==1 && x3j==1 ) -c6 = -0.5[c6+c2-c2+c6] = negative 1000   


end

end

endmodule

