/* Weighted Random Numbers      */
/*
Take the help of pseudo-random number generator to generate values for wr and rst signal. 
rst should be low for apprx. 30% of time whie wr should be high for apprx. 50% of time. 
Verify your code for 20 iterations by sending values of both wr and rst on a console.
*/ 



class generator;
  
  rand bit wr; 
  rand bit rst;
  

  constraint cntrl {
    wr  dist{ 0:= 30, 1:= 70 };
    rst dist{ 0:= 50, 1:= 50 }; 
  }
  
  function void display();
    $display("wr:%0d rst:%0d",wr,rst);
  endfunction 
  

  
endclass





module tb();
  
  generator g; 
  parameter ITER = 20;

  
  initial begin
    g = new(); 
    for(int i=0;i<ITER;i++)
    begin 
       g.randomize(); 
       #20;
       g.display();
    end 
    
  end 
  
  
  
  
  
endmodule 
