`timescale 1ps / 1ps


module assignment_2_A22();


reg clk;

initial clk = 1'b0;


always #20000 clk = !clk;

initial begin
   #1000000 
   $finish();
end 

endmodule
