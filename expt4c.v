module jk_ff(j,k,clk,q,qb);
input clk;
input j,k;
output q,qb;
reg q;
wire qb;
always @(posedge clk)
begin
case({j,k})
2'b00:q<=q;
2'b01:q<=0;
2'b10:q<=1;
2'b11:q<=~q;

endcase
end 
assign qb=~q;
endmodule 
module jk_ff_test;
reg clk,j,k;
wire q,qb;
always 
#5 clk=~clk;
jk_ff imat(.j(j),.k(k),.clk(clk),.q(q),.qb(qb));
initial 
begin
clk=0;
j=0;
k=0;
#20
j=0;
k=1;
#30
j=1;
k=0;
#40 
j=1;
k=1;
#20
$finish;
end 
initial 
$monitor("time =%t\t INPUT VALUES: \t j=%0b k=%0b q=%0b qb=%0b",$time,j,k,q,qb);
endmodule
