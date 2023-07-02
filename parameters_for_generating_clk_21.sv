`timescale 1ns / 1ps

module parameters_for_generating_clk_21();

reg clk100;
reg clk50; 


initial begin
   clk100 = 1'b0;
   clk50 = 1'b0;
end 

always #10 clk100 = ~clk100;


real phase; 
real ton; 
real toff; 

task calc(input real freq_hz, input real duty_cycle, input real phase, output real pout, output real ton, output real toff);
   pout = phase; 
   ton  = (1.0 / freq_hz) * duty_cycle * 1_000_000_000;  
   toff = (1_000_000_000 /freq_hz) - ton; 
endtask 




task clk_gen(input real phase, input real ton, input real toff);
   @(posedge clk100);
   #phase; 
   while(1) begin
   clk50 = 1'b1; 
   #ton; 
   clk50 = 1'b0; 
   #toff;
   end 
endtask


initial begin
   calc(100_000_000, 0.5, 2, phase, ton, toff);
   clk_gen(.phase(phase), .ton(ton), .toff(toff)); 
end 



initial begin
   #200; 
   $finish();
end 



endmodule 
