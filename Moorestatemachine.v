module  state_machine_mealy (clk,  reset,  in,  out); 
  input  clk,  reset,  in;  
  output  out;
  reg  out, state, next_state; 
  parameter zero=0, one=1;
//Implement  the  state  register 
always@(posedge clk, posedge reset) begin
 if (reset) 
    state <= zero; 
 else 
     state <= next_state; 
end
always  @(in or state) 
  case  (state)
  zero:  begin
  //  last  input  was  a  zero
     out=0;
    if  (in)  
       next_state  =  one;
    else 
       next_state  =  zero;  
	end
  one: begin //seen one
  if (in) begin
    next_state  =  one;
    out=1;
  end else begin
    next_state = zero;
    out=0;
  end
 end
endcase
endmodule



//Test bench


`timescale 1ns/1ps

module  state_machine_mealy_tb ; 
  reg clk, reset, in;
  integer i;
  wire out; 
  
  // instantiate state machine 
  state_machine_mealy DUT (clk,  reset,  in,  out);
  initial 
    forever #5 clk = ~clk; 
  
   initial begin 
    reset = 1'b1;
    clk = 1'b0;
    in = 0; 
    #6;
    reset = 1'b0; 
    for ( i=0; i< 10; i=i+1) begin 
      @(negedge clk); #1;
      in = $random;
       if (out == 1'b1)
        $display ("PASS : Sequence 1 detected i=%d", i);
       end 
       #50;
       $finish;
  end 
endmodule
