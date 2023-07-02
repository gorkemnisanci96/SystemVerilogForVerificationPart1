`timescale 1ns / 1ps
//Assume generator class consists of three 8-bit data members (x,y, and z).
//Write a code to generate 20 random values for all the data members at an interval of 20 ns. 
//Random values for all data members should range from 0 to 50.

class gen_xyz;

   randc logic [7:0] x,y,z; 

   constraint c_x_y_z {
                    x inside {[0:50]};
                    y inside {[0:50]};
                    z inside {[0:50]};
                       }
                       
   function void display();
      $display("X: %0d Y:%0d Z:%0d",x,y,z);
   endfunction 

endclass 



module assignment_A62();

gen_xyz g; 


initial begin

   for(int i=0;i<20;i++)
   begin
      g = new(); 
      assert(g.randomize()) 
      else begin
         $display("Randomize Error");
         $finish(); 
      end 
      g.display();
      #20;
   end 



end 



endmodule
