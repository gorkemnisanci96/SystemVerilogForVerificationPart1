`timescale 1ns / 1ps


module assignment_a24();


reg clk100,clk; 
real ton, toff;
initial begin
   clk100 = 1'b0;
   clk  = 1'b0; 
end 

always #5 clk100 = !clk100; 

task clk_gen(input real period, input real duty_cycle);
   ton  = period * duty_cycle;
   toff = period - ton;
   @(posedge clk100);
   while(1) begin
      clk = 1'b1;
      #ton;
      clk = 1'b0;
      #toff;
   end 

endtask 


initial begin
   clk_gen(.period(40), .duty_cycle(0.4));
end 

initial begin
   #200;
   $finish();
end 


endmodule