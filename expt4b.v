module dff(d, rst, clk, q, qb); 
input d, rst, clk; 
output q, qb; 
reg q, qb; 
always @(posedge clk or negedge rst) 
begin 
if (rst == 1'b1) 
begin 
q <= 1'b0; 
assign qb = ~q;
end  
else 
begin  
q <= d; 
assign qb = ~q;
end 
end 
endmodule 

module dff_tb;
 reg clk,d,rst;
 wire q,qb;
dff df1(.q(q), .clk(clk), .rst(rst), .d(d), .qb(qb));
initial
clk = 1'b0;
always #10 clk = ~clk; 
initial
begin
d = 1'b0;
rst = 1'b1;
#20 rst = 1'b0;
#10 d = 1'b1;
#20 rst = 1'b0;
#10 d = 1'b0;
#20 rst = 1'b1;
#10 d = 1'b0;
#20 rst = 1'b1;
#10 d = 1'b1;
#10 ;
end always
#5 $display($time,"clk=%b rst=%b d=%b q=%b qb=%b ", clk, rst, d, q, qb);
initial
#100 $finish;
endmodule
