`timescale 1ns / 1ps
//Assume you have four variables ( a, b,c, and d )  in your testbench top. a and b are of the 8-bit reg type, while c and d are of the integer type. initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively. 
//Add a code to print the values of all the variables after 12 nSec.
module assignment_A31();

reg [7:0] a,b;
integer c,d;

initial begin
   a = 12; 
   b = 34; 
   c = 67;
   d = 255; 
end 



initial begin
   #12 
   $display("a:%d b:%d c:%d d:%d ",a,b,c,d);
end 

endmodule
