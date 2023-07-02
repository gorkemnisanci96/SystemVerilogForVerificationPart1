`timescale 1ns / 1ps


module half_adder( input  logic a,b,
                   output logic sout,cout);
                   
assign sout = a ^ b;
assign cout = a & b; 

  
endmodule 



module full_adder( input  logic a, b, cin, 
                   output logic s,c );
                   
          
          
logic t1,t2,t3;          
                   
half_adder h0(.a(a), .b(b), .sout(t1), .cout(t2) );                   
half_adder h1(.a(t1), .b(cin), .sout(s), .cout(t3) );                   
                   
assign c = t2 | t3;  
                   
endmodule :full_adder 
