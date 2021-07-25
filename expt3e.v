module bin_to_gray(B,G); 
input [3:0] B; 
output [3:0] G; 
assign G[0] = B[1]^B[0]; 
assign G[1] = B[2]^B[1]; 
assign G[2] = B[3]^B[2]; 
assign G[3] = B[3]; 
endmodule
//testbech
module tb_bin_to_gray;
reg [3:0] B;
wire [3:0] G;
bin_to_gray uut(.B(B), .G(G));
always begin
B<=0; #10;
B<=1; #10;
B<=2; #10;
B<=3; #10;
B<=4; #10;
B<=5; #10;
B<=6; #10;
B<=7; #10;
B<=8; #10;
B<=9; #10;
B<=10; #10;
B<=11; #10;
B<=12; #10;
B<=13; #10;
B<=14; #10;
B<=15; #10;
#200;
$stop;
end
  initial begin
    $monitor("time=%t\t B=%b, G=%b",$time,B,G);
  end

endmodule


