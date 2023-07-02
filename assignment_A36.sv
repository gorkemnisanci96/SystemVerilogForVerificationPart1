`timescale 1ns / 1ps

module assignment_A36();

parameter ARRAYSIZE = 10;

int unsigned array[ARRAYSIZE];

initial begin
   for(int i=0;i<ARRAYSIZE;i++)
   begin
      array[i] = i**2;
      $display("Array[%d]:%d",i,array[i]);
   end 
end 

initial begin
   #20
   $finish;
end 


endmodule
