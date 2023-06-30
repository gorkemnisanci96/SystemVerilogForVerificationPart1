/* Weighted Random Numbers      */
/* Operators are 
':='  --> Equal weight to all the values inside the range 
dist {0:= 10 ; [1:3] := 60 }  == dist {0:=10; 1:=60;2:=60;3:=60;}
':/'  --> Divide weight equally between range 
dist {0:/ 10 ; [1:3] :/ 60 }  == dist {0:/10; 1:/20;2:/20;3:/20;}
*/ 



class generator;
  
  rand bit wr; // := 
  rand bit rd; // :/ 
  
  rand bit [1:0] var1;
  rand bit [1:0] var2;
  
  constraint data{
    var1 dist {0 := 30, [1:3] := 90}; // 0 = 30/300, 1,2,3 = 90/300 
    var2 dist {0 :/ 30, [1:3] :/ 90}; // 0,1,2,3 = 30/120, 
  }
  
  
  constraint cntrl {
    wr dist{ 0:= 30, 1 := 70 };
    rd dist{ 0:/ 30, 1 :/ 70 }; 
  }
  
  function void display_wr_rd();
    $display("wr:%0d rd:%0d",wr,rd);
  endfunction 
  
  function void display_var1_var2();
    $display("var1(:=):%0d var2(:/):%0d",var1,var2);
  endfunction   
  
endclass





module tb();
  
  generator g; 
  
  
  initial begin
    g = new(); 
    for(int i=0;i<20;i++)
    begin 
       g.randomize(); 
       #20;
       g.display_var1_var2();
    end 
    
  end 
  
  
  
  
  
endmodule 
