module t_ff(q,qbar,clk,tin,rst);  

output q,qbar; 

input clk,tin,rst;  

reg tq; 

always @(posedge clk or negedge rst) begin 

if(!rst) 

tq <= 1'b0; else 

begin if (tin) 

tq <= ~tq; end 

end 

assign q = tq; assign qbar = ~q; 

 endmodule 

 

//TESTBENCH 

 

module t_ff_test;  

reg clk,tin,rst;  

wire q,qbar; 

t_ff t1(q,qbar,clk,tin,rst); 

 initial 

clk = 1'b0; always 

#10 clk = ~clk; initial 

begin 

  

 

rst = 1'b0; tin = 1'b0; 

#10 rst = 1'b1; 

#20 tin = 1'b0; 

#30 tin = 1'b1; 

#45 tin = 1'b0; 

#10 tin = 1'b1; 

end 

always #15 rst=~rst; 

always @(t) 

$monitor("time=%t clk=%b rst=%b t=%b q=%b qb=%b",$time,clk,rst,tin,q,qbar); 

initial #300 $finish; 

 endmodule 
