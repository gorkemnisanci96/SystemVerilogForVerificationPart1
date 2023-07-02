`timescale 1ns / 1ps
//  
//   obj(g)  --> Driver  -->   D 
//                             U      
//   Checker <-- Monitor <--   T 
//  
//  
//  
//  
//  
//  
//  





module dut1(
   input  logic [3:0] a,b,
   output logic [3:0] y );



assign y = a & b; 



endmodule :dut1

// Constraint can be defined outside of the class. 



class generator;

   rand bit[3:0] a,b;   /// Use rand or randc 
   bit[3:0] y;     
   int min = 3;
   int max = 10; 
   
   function void pre_randomize(input int min); 
      $display("This will be called before the randomize");
   endfunction 
    
    
    constraint data{
       a inside {[min:max]};
       b inside {[min:max]};
                   }

   function void post_randomize();
      $display("Valud of a: %0d and b %0d",a,b);
   endfunction

   


endclass  



module pre_and_post_randomize_135();
   generator g;
   int i = 0; 
   int status = 0 ;
   initial begin
      
      
      
      for(i=0;i<10;i++)
      begin
         g = new();   // Even the process shown above with block diagrams doesnt complete in 10ns, 
                      // It wont give us a wrong result. 
         assert(g.randomize())   // This will generate random value for the variables defined as rand or randc 
         else begin
            $display("Rondomization Failed at %0t",$time);
            $finish();
         end  

         #10;
      end  
   end 

endmodule 