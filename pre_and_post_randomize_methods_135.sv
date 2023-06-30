`timescale 1ns / 1ps
//  
//   obj(g)  --> Driver  -->   D 
//                             U      
//   Checker <-- Monitor <--   T 
//  


class generator;

   randc bit[3:0] a,b;   /// Use rand or randc 
   bit[3:0] y;     
   int min;
   int max; 
   
   function void pre_randomize(input int min, input int max); 
      this.min = min; 
      this.max = max; 
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
      g = new();   // Even the process shown above with block diagrams doesnt complete in 10ns, 
                   // It wont give us a wrong result.  
      $display("SPACE 1");
      g.pre_randomize(3,8);
      for(i=0;i<10;i++)
      begin
        g.randomize();
        #10;
      end 
     $display("SPACE 2");
     g.pre_randomize(1,3);
      for(i=0;i<10;i++)
      begin
        g.randomize();
        #10;
      end 

   end 

endmodule 
