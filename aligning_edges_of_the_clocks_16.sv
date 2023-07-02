`timescale 1ns / 1ps


module aligning_edges_of_the_clocks_16();


logic clk100,clk50; 


initial begin
   clk100  = 1'b0;
   clk50  = 1'b0;
end 


always #5   clk100 = ~clk100; 

always begin 
   #5;
   clk50 = 1'b1;
   #10; 
   clk50 = 1'b0;
   #5; 
end 





////4- Stop simulation by forcefully Calling finish() 
initial begin
   #200;
   $finish();
end 



endmodule
