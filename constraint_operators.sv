// Constraint Operators
//1- Implication ->   
// (x==1) -> (y==1) 
// - Whenever x is 1, y should be 1. 
// - When x is 0 , y can be 0 or 1 
//2- Equivalence <-> 
// 
// 
//3- IF else
// if(){
//
//}
//4-Constraint ON/OFF


class generator;
  randc bit[3:0] a;
  rand  bit      ce;
  rand  bit      rst; 
  rand  bit      wr;   
  rand  bit      oe;   // Output Enable 
  randc bit [3:0] raddr,waddr;
  
  constraint control_rst{
    rst dist {0:= 80, 1:=20};
  }
  
  constraint control_ce {
    ce dist {1:=80, 0:=20};
  }
  

  // 1- Implication Operator 
  // Whenever rst is 0, ce must be 1. 
  // When rst is 1, ce can be 0 or 1. 
  constraint control_rst_ce{
    (rst == 0) -> (ce==1);
  }
  
  constraint c_wr{
    wr dist {0:= 50, 1:=50};
  }
  
  constraint c_oe {
    oe dist {1:=50, 0:=50};
  }
  
  // 2- Equivalence Operator 
  // 
  // Whenever the wr is 1, oe must be 0. 
  // Whenever the oe is 0, wr must be 1
  constraint c_wr_oe{
    (wr == 1) <-> (oe ==0);
  }
  
   
  // 3- IF ELSE Constraint 
  // 
  constraint c_write_read {
  
    if(wr == 1)
    {
      waddr inside {[11:15]};
      raddr == 0;  // No read addr during write  
    } 
    else 
    {
      waddr == 0; // No Write addr during read 
      raddr inside {[11:15]};   
    }
  
  
  
  
  }
  
  
  
  
  
  
endclass 




module tb();
  
  generator g; 
  int status = 0;
  localparam ITER = 20;
  
  
  
  initial begin
    g = new();   
    
    //
    // TURN ON and OFF Constraint 
    //
    g.c_wr_oe.constraint_mode(0); // 1--> Constraint is ON // 0 --> constraint is OFF. 
    $display("Constraint Status c_wr_oe: %0d",g.c_wr_oe.constraint_mode());   
 
    
    
    
    for(int i=0;i<ITER;i++)
    begin
      assert(g.randomize()) else $display("Randomization Failed");
      $display("rst: %0d ce:%0d wr:%0d oe:%0d WADDR:%0d RADDR:%0d",g.rst,g.ce,g.wr,g.oe,g.waddr,g.raddr);
    end 
    
  end 
  
  
endmodule 

