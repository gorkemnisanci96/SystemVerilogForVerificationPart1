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





module dut(
   input  logic [3:0] a,b,
   output logic [3:0] y );



assign y = a & b; 



endmodule :dut

// Constraint can be defined outside of the class. 



class generator;

   rand bit[3:0] a,b;   /// Use rand or randc 
   bit[3:0] y;     
   
   // 1 Seperate Constraint for each signal
   /*
   constraint c_a { a>3; a<7;}
   constraint c_b { b==3;}
   */
   
   // 2 
   //constraint c_a_b {a>3;a<7;b>0;}
   
   
   // 3  IN THE RANGE 
   /*constraint c_a_b {
                     a inside {[0:8],[10:11],15}; // 0 1 2 3 4 5 6 7 8 10 11 15 
                     b inside {[3:11]};           // 3 4 5 6 7 8 9 10 11
                     }*/
   
   // 4 NOT IN THE RANGE 
   /*
     constraint c_a_b {
                        !(a inside {[3:7]});
                        !(b inside {[5:9]});
                       }
   */
   
   // External Constraint 
   extern constraint c_extern; 
   
   // External Function 
   extern function void display(); 
   
endclass  


constraint generator::c_extern { 
                        !(a inside {[3:7]});
                        !(b inside {[5:9]});
                               }

function void generator::display();
   $display("VALUE a: %0d VALUE b: %0d ",a,b);
endfunction


module generator_120_tb();
   generator g;
   int i = 0; 
   int status = 0 ;
   initial begin
      
      
      
      for(i=0;i<10;i++)
      begin
         g = new();   // Even the process shown above with block diagrams doesnt complete in 10ns, 
                      // It wont give us a wrong result. 
         /*
         if(!g.randomize())   // This will generate random value for the variables defined as rand or randc 
         begin
            $display("Rondomization Failed at %0t",$time);
            $finish();
         end 
         */
         assert(g.randomize())   // This will generate random value for the variables defined as rand or randc 
         else begin
            $display("Rondomization Failed at %0t",$time);
            $finish();
         end  
         
         g.display();
         #10;
      end  
   end 

endmodule 