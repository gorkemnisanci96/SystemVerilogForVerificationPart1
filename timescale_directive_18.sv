`timescale 1ns / 1ps
// `timescale "time unit" / "time precision" 
// 1- Calculate the Ratio time_unit/time_scale = 1**n. 
// 2- The "n" represents the number of precision digits we have. 
// 3- 1ns/1ps = 10**3, so we can add 3 digits after the dot. e.g 10.1, 10.23, 10.331 --> these are ok, 10.3514 --> this will be round to 10.351. 




module timescale_directive_18();


reg clk16MHZ;
reg clk8MHZ; 


initial begin
   clk16MHZ = 1'b0;
   clk8MHZ  = 1'b0;
end 


always #31.25 clk16MHZ = !clk16MHZ;
always #62.5  clk8MHZ  = !clk8MHZ; 





initial begin
   #500; 
   $finish();
end 



endmodule
