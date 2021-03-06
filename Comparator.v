module comparator (a, b, alb, aeb, agb); 
input[3:0] a, b; 
output alb, aeb, agb; 
reg alb, aeb, agb; 
always@(a,b) 
begin 
if(a<b) 
begin 
alb=1'b1; aeb=1'b0; agb=1'b0; 
end 
else if (a>b) 
begin 
alb=1'b0; aeb=1'b0; agb=1'b1; 
end 
else  
begin 
alb=1'b0; aeb=1'b1; agb=1'b0; 
end 
end 
endmodule 
//testbench
module tb_comparator;
 reg[3:0]a;
 reg[3:0]b;
 wire alb,aeb,agb;
 comparator uut(.a(a), .b(b), .alb(alb), .aeb(aeb), .agb(agb));

initial begin
a=10;
b=12;
#10;
a=15;
b=11;
#10;
a=10;
b=10;
#10;
end
initial begin
$monitor("time=%t\t a=%b b=%b alb=%b aeb=%b agb=%b",$time,a,b,alb,aeb,agb);
end
endmodule
