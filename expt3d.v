module demux1_8(I,S,D); 
input I; 
input [2:0] S; 
output [7:0]D; 
reg [7:0]D; 
always @(I,S) 
begin 
D=8'b0; 
 case (S) 
 3'd0 : D[0]=I; 
 3'd1 : D[1]=I; 
 3'd2 : D[2]=I; 
 3'd3 : D[3]=I; 
 3'd4 : D[4]=I; 
 3'd5 : D[5]=I; 
 3'd6 : D[6]=I; 
 3'd7 : D[7]=I; 
default: D=8'B00000000; 
endcase 
end 
endmodule
 
module demux1_8_tb;

wire [7:0]D;
reg I;
reg[2:0] S;


demux1_8 name(.I(I), .D(D), .S(S));
initial
begin
S=3'b000;
I=1'b1;
#50 $finish;
end

always @(S)
 $monitor("time==%0t \tINPUT VALUES:\t I=%b S=%b \t OUTPUT VALUES D=%b",$time,I,S,D);
always #6 S=S+3'b001;
endmodule

//log -r *= recurssive