module asyncbcd (clk, rst, q); 
input clk, rst; 
output [3:0]q; 
reg [3:0]q; 
initial q = 4'b0000; 
always @ (posedge clk or posedge rst) 
begin 
if (rst == 1'b1)
q = 4'b0000; 
else if (q== 4'b1001) 
q = 4'b0000; 
else  
q=q+1; 
end 
endmodule 

module asyncbcd_tb;
wire [3:0]q;
reg rst, clk;
initial clk=1'b0;
always
#5 clk=~clk;
asyncbcd uut(clk,rst,q);
initial begin
rst=1'b0;
#15 rst=1'b0;
#30 rst=1'b0; 
#115 rst=1'b1;
#5 rst=1'b0;
#200 $finish;
end
initial
$monitor($time,"Output count= %b ",q);
endmodule


