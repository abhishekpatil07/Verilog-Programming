module encode_wp (I,D);
input [7:0] I;
output [2:0] D;
reg [2:0] D;
always @ (I)
begin
if (I[7]==1'B1) D=3'B111;
else if (I[6]==1'B1) D=3'B110;
else if (I[5]==1'B1) D=3'B101;
else if (I[4]==1'B1) D=3'B100;
else if (I[3]==1'B1) D=3'B011;
else if (I[2]==1'B1) D=3'B010;
else if (I[1]==1'B1) D=3'B001;
else if (I[0]==1'B1) D=3'B000;
else D=3'BZZZ;
end
endmodule

//testbench
module encode_wp_tb;
    reg [7:0] I;    
    wire [2:0] D;
    
    encoder_wp uut(
        .D(D), 
        .I(I) 
        
    );
    initial begin
        // Initialize Inputs
        
        
 #10 I = 8'b00000001;
 #10 I = 8'b0000001x;
 #10 I = 8'b000001xx;
 #10 I = 8'b00001xxx;
 #10 I = 8'b0001xxxx;
 #10 I = 8'b001xxxxx;
 #10 I = 8'b01xxxxxx;
 #10 I = 8'b1xxxxxxx;
 #10;
 end 
 initial begin
 $monitor("time=",$time, "I=%b : D=%b ",I,D); 
 end      
endmodule
