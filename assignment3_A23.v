`timescale 1ns / 1ps

module assignment3_A23();


reg clk9MHZ; 


initial begin
   clk9MHZ = 1'b0;
end 

always #55.555 clk9MHZ = !clk9MHZ; 


initial begin
   #1000;
   $finish;
end 



endmodule
