module sd_moore(input clk,
		input rst,
		input sequence,
		output reg z);

localparam a = 2'b00;
localparam b = 2'b01;
localparam c = 2'b10;
localparam d = 2'b11;

reg [1:0] presentState, nextState;

always@(posedge clk, posedge rst) begin
if(rst) presentState <= a;
else if(clk) presentState <= nextState;
end

always@(posedge clk) begin
presentState = nextState;
z = 1'b0;
case(presentState)
a: begin
   if(sequence) nextState = b;
   else nextState = a;
   end
b: begin
   if(~sequence) nextState = c;
   else nextState = b;
   end
c: begin
   if(sequence) nextState = d;
   else nextState = a;
   end
d: begin
   if(~sequence) begin
   z = 1'b1;
   nextState = c;
   end
   else nextState = b;
   end 
default: begin
         z = 1'b0;
         nextState = a;
	 end
endcase
end
endmodule

//TETSBENCH
module sd_moore_tb();

reg clk, rst;
reg sequence;
wire z;

sd_moore uut(.clk(clk), .rst(rst), .sequence(sequence), .z(z));

initial begin
sequence = 1'b0;
clk = 1'b0;
end

always #5 clk = ~clk;

initial begin
rst = 1'b1;
#10 rst = 1'b0;
end

initial begin
#15 sequence = 1'b1;
#10 sequence = 1'b1;
#10 sequence = 1'b0;
#10 sequence = 1'b1;

end

initial $monitor($time,"sequence = %b, z = %b", sequence, z);
initial #200 $finish;

endmodule
