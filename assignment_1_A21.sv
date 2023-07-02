`timescale 1ns / 1ps

module assignment_1_A21();

reg resetn,clk;

initial begin
   clk    = 1'b0;
   resetn = 1'b0;
end 


initial begin
   resetn = 1'b0;
   #60;
   resetn = 1'b1;
end 





endmodule


