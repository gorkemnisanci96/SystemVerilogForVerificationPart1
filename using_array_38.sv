`timescale 1ns / 1ps



module using_array_38();

// 2-way of declearing an array. 
bit array0[8];             // size of array0: 8 
bit array1[] = {1,0,1,1};  // size of array1: 4 

initial begin
   $display("size of array0: %0d ",$size(array0));
   $display("size of array1: %0d ",$size(array1));
   
   $display("Array0[0]:%0d",array0[0]);
   array0[0] = 1'b1;
   $display("After Update Array0[0]:%0d",array0[0]);
   
   $display("Value of all elements of array1 %0p",array1);
   
end 

// Array Initialization 
// 1- Unit Values 
bit array2[] = '{1,2,3,4};
// 2- Repetitive Values 
bit array3[6] = '{6{1'b0}};
// 3- Default Values
bit array4[10] = '{default:2}; 
//
int array5[5] = '{1,2,3,4,5}; 

initial begin 
   #40
   $display("Value of all elements of array2 %0p",array2);
   $display("Value of all elements of array3 %0p",array3);
   $display("Value of all elements of array4 %0p",array4);
   $display("Value of all elements of array5 %0p",array5);
end 











endmodule
