module logicgates (a, b, y);
   input a,b;
   output [6:0]y;
   assign y[0]= ~a;
   assign y[1]= a&b;
   assign y[2]= a|b;
   assign y[3]= ~(a&b);
   assign y[4]= ~(a|b);
   assign y[5]= a^b;
   assign y[6]= ~(a^b);
endmodule

//test bench;
module tb_logicgateas;
  reg a,b;
  wire y;
  logicgates DUT (a, b, y);
initial
  begin
      $monitor ($time, "a=%b, b=%b, y=%b",a,b,y);
       #5 a=0;b=0;
       #5 a=0;b=1;
       #5 a=1;b=0;
       #5 a=1;b=1;
  end
endmodule
