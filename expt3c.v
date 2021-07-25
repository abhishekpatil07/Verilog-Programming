module mux(I, S, Y);

input [7:0]I;
input [2:0]S;
output reg Y;

always @(*)
begin
case(S)
3'b000 : Y=I[0];
3'b001 : Y=I[1];
3'b010 : Y=I[2];
3'b011 : Y=I[3];
3'b100 : Y=I[4];
3'b101 : Y=I[5];
3'b110 : Y=I[6];
3'b111 : Y=I[7];
default : Y=1'b0;
endcase
end

endmodule

module mux_tb();

reg [2:0]S; reg [7:0]I;
wire Y;
integer i;

mux m(.S(S), .I(I), .Y(Y));

initial begin
I= 8'b00000011;
S= 3'b000;
end

initial begin 
for(i=0; i<8; i=i+1)
begin
S=i;
#10;
end end

initial $monitor("time=%d, I=%b, S=%b, Y=%b", $time, I, S, Y);

initial #100 $finish;
endmodule
