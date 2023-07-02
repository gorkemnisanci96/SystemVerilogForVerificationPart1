`timescale 1ns / 1ps
// Assume generator class consists of three 8-bit data members (x,y, and z). 
// Write a code to generate 20 random values for all the data members at an interval of 20 ns.


class gen;

   rand logic [7:0] x;
   rand logic [7:0] y;
   rand logic [7:0] z; 



endclass 



module assignment_A61( );

gen g;

initial begin

 for(int i=0;i<20;i++)
 begin
  g = new();    
  assert(g.randomize())
  else begin
     $display("Rondomization Failed at %0t",$time);
     $finish();
  end  
         
  $display("%0d: X:%0d Y:%0d Z:%0d time:%0t",i,g.x,g.y,g.z,$time);
  #20;
 end 
 
end 


initial begin
   #300 
   $finish;
end 


endmodule :assignment_A61
