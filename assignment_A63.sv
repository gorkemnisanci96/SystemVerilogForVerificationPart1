/*For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5.
Also, add logic to store the number of times randomization failed. Print values of variables during each iteration and error count after generating 20 random values for a and b.
Add Constraint Code and Testbench top code to  the Design.*/
class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  constraint c_a {a inside {[0:8]};}
  constraint c_b {b inside {[0:5]};}
  
  function void post_randomize();
    $display("a: %0d b: %0d",a,b);
  endfunction
  
  
endclass



int fail_cnt = 0;


module tb();
  
  generator g; 
  
  
  initial begin
    g = new(); 
    for(int i=0;i<20;i++)
    begin
        
       assert(g.randomize()) else begin
          fail_cnt++;  
       end 
    #20;
      
    end 
    
    $display("Number of Randomization Failure: %0d",fail_cnt);
  end 
  
  
  
  
  
endmodule 
