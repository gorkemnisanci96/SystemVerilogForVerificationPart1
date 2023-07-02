// TEST BENCH FOR FIFO 
//                |      |
//  clk        -->|      |--> rdata[7:0]
//  rst        -->| fifo |--> full
//  wreq       -->|      |--> empty
//  rreq       -->|      |
//  wdata[7:0] -->|      |
//                |      |
//
//
//
//
//
//
//
//
// Code your design here
module fifo(
  input logic        clk, 
  input logic        rst,
  input logic        wreq,
  input logic        rreq,
  input logic  [7:0] wdata,
  output logic [7:0] rdata, 
  output logic       full, 
  output logic       empty
);
  
  
  
  
  
endmodule 

class generator;
  
  
  logic clk,rst; 
  rand logic       wreq,rreq;  // Active High 
  rand logic [7:0] wdata; 
  logic [7:0]      rdata;
  logic            full;
  logic            empty;
  
  
  
  constraint c_wreq{
    wrea dist {0:=30; 1:=70}; 
  }
  
  
  constraint c_rreq{
    rreq dist {0 := 30; 1:= 70;};
  }
  
  constraint c_wreq_rreq{
     wreq != rreq; 
  }
  
  
  function void post_randomize();
    $display("Wreq:%0d Rreq:%0d wdata:%0d rdata:%0d",wreq,rreq,wdata,rdata);
  endfunction
  
  
  
endclass 


module fifo_tb();
  
  generator g; 
  localparam ITER = 20; 
  
  
  initial begin
    g = new(); 
    
    for(int i=0;i<ITER;i++)
    begin
        
        
    end 
    
    
  end 
  
  
  
  
  
endmodule 
