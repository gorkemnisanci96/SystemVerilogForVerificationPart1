`timescale 1ns / 1ps


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|
//                                     Hardware                   Variable                                                  Simulation                          |
//                                      /  \                     /        \                                                 fixed point time    : time          |
//                                     /    \                   /          \                                                floating point time : realtime      |
//                                   reg    wire             Fixed         Floating                                                                             |
//                                     \    /                 /     \       real -> 64-bit double point precision                                               |
//                                      \ /                  /        \                                                                                         |
//                                     logic                /           \ 
//                                                         /              \ 
//                                                     (0,1)2-state        4-state (0,1,x,z)
//                                                     /    \              integer --> 32-bit signed 
//                                                    /      \
//                                                   /        \
//                                                  /          \
//                                              signed         unsigned
//                                     byte      -> 8-bit      bit[7:0]    
//                                     shortint  -> 16-bit     bit[15:0]
//                                     int       -> 32-bit     bit[31:0], int unsigned 
//                                     longint   -> 64-bit     
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





module data_types_28();
// 2-state initial value is 0 
// 4-state initial value is x 

///////////////////////////////////////////////////////
bit a = 0;

initial begin
   a = 1'b0;

end 

///////////////////////////////////////////////////////
byte b = 0; 
shortint c = 0;
int d = 0; 
longint e = 0; 

bit [7:0]  f = 8'd0;
bit [15:0] g = 16'h0;

real h = 0;
shortint v3 = 0;


///////////////////////////////////////////////////////
byte v = -226;   /// -128 --- 127 
bit [7:0] v2 = 130;


initial begin 
   #10; 
   $display("Value of V: %0d V2:%0d ",v,v2);
end 
///////////////////////////////////////////////////////




///////////////////////////////////////////////////////
time      fix_time  = 0;     ////// $time();      --> Return Current Simulation Time in fixed point Format. 
realtime  real_time = 0;     ////// $realtime();  --> Return Current Simulation Time in Floating Point Format. 


initial begin
   #12.67; 
   fix_time = $time;
   $display("FIX TIME : %0t", fix_time); 
   #12 
   real_time = $realtime(); 
   $display("FIX TIME : %0t", real_time); 
end 
//////////////////////////////////////////////////////









endmodule
