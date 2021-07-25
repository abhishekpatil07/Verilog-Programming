module mycounter ( q,reset,clk); 
input wire reset, clk;
output reg [3:0] q;
 always @(posedge clk) begin 
if (reset | q==4'b1001) //(reset)
q <= 4'b0000; 
else
q <= q + 4'b0001; 
end
endmodule



module mycounter_t ;

 wire [3:0] q;
reg reset,clk; initial
clk = 1'b0; always
#5 clk = ~clk;
mycounter m1 ( q,reset,clk); 
initial
begin
reset = 1'b0 ;
#15 reset =1'b1;
#30 reset =1'b0;
#300 $finish; end
initial
$monitor ($time, "Output count = %b ",q ); 
endmodule
