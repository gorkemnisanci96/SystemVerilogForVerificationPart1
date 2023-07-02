`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Usage of initial block 10 
// Usage of always Block  14 
//////////////////////////////////////////////////////////////////////////////////


module usage_of_initial_block_10();


logic clk,clk2,clk3, rst; 
logic [3:0] temp; 


//1- Initialize Global Variables 
initial begin
   clk  = 1'b0;
   clk2 = 1'b0;
   clk3 = 1'b0; 
end 

// 1- always Usage 
always #5   clk  = ~clk; 
always #10  clk2 = ~clk2; 
always #20  clk3 = ~clk3; 


//2- Assign values to  
initial begin
   temp = 4'b0000; 
   #10; 
   temp = 4'b0011; 
   #10; 
   temp = 4'b1100; 
end 


///////3- System Tasks at the start of simulation 
initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
end 


//////4- Monitoring a variable; 
initial begin
   $monitor("Temp: %10d at time %0t",temp,$time);
end 


////4- Stop simulation by forcefully Calling finish() 
initial begin
   #200;
   $finish();
end 

////5- Generate Reset 
initial begin
   rst = 1'b1; 
   #30; 
   rst = 1'b0; 
end 


endmodule
