module sd_mealy( input wire clk, 
                 input wire rst,
                 input wire sequence,
                 output reg tick);

localparam a = 2'b00;
localparam b = 2'b01;
localparam c = 2'b10;

reg [1:0] presentState, nextState;

always@(posedge clk, posedge rst) begin
if(rst) presentState <= a;
else if(clk) presentState <= nextState;
end

always@(posedge clk) begin
presentState = nextState;
tick = 1'b0;
case(presentState)
a: if(sequence) nextState = b;
b: begin
   if(~sequence) nextState = c;
   else nextState = b;
   end
c: begin 
   if(sequence) begin
   tick = 1'b1;
   nextState = b; end
   else nextState = a;
   end
default: begin
         tick = 1'b0;
         nextState = a;
	 end
endcase
end
endmodule

//TESTBENCH
module sd_mealy_tb();

reg clk, rst;
reg sequence;
wire z;

sd_mealy uut(.clk(clk), .rst(rst), .sequence(sequence), .tick(z));

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
