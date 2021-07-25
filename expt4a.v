module SR_ff(q,qbar,s,r,clk); output q,qbar;
input clk,s,r; reg tq;
always @(posedge clk or tq) begin
if (s == 1'b0 && r == 1'b0) tq <= tq;
else if (s == 1'b0 && r == 1'b1) tq <= 1'b0;
else if (s == 1'b1 && r == 1'b0) tq <= 1'b1;
else if (s == 1'b1 && r == 1'b1) tq <= 1'bx;
end
assign q = tq; assign qbar = ~tq; 
endmodule

//TESTBENCH

module SR_ff_test; 
reg clk,s,r;
wire q,qbar; wire s1,r1,clk1;
SR_ff sr1(q,qbar,s,r,clk); assign s1=s;
assign r1=r; assign clk1=clk; initial
clk = 1'b0; always
#10 clk = ~clk; initial
begin
s = 1'b0; r = 1'b0;
#30 s = 1'b1;
#29 s = 1'b0;
#1 r = 1'b1;
#30 s = 1'b1;
#30 r = 1'b0;
#20 s = 1'b0;
#19 s = 1'b1;
#20 s = 1'b1; r = 1'b1;
#50 s = 1'b0; r = 1'b0;
#50 s = 1'b1; r = 1'b0;
#10 ;
end always
#5 $display($time," clk=%b s=%b r=%b",clk,s,r); initial
#100 $finish; 
endmodule
