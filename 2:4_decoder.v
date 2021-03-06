module decoder(I,D);
input [1:0] I;
output [3:0] D;
reg [3:0] D;
always @(I)
begin
if (I==2'B00) D=4'B0001;
else if (I==2'B01) D=4'B0010;
else if (I==2'B10) D=4'B0100;
else if (I==2'B11) D=4'B1000;
else D=4'BZZZZ;
end
endmodule

//testbench
module decoder_tb;
    reg [1:0] I;
    
    wire [3:0] D;
    decoder uut(
        .D(D), 
        .I(I) );

    initial begin
        // Initialize Inputs
        
        I=2'b00; #20;
        I = 2'b01; #20;
        I = 2'b10; #20;
        I = 2'b11; #20;
    end
    initial begin
       $monitor("%t| I=%b | D=%b",$time,I,D);
       $display("%t| I=%b | D=%b",$time,I,D);
    end
endmodule
