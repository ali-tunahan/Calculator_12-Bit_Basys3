`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 03:51:47 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//add,subtract,compare
//0-add
//1-subtract
//2-compare

module alu(a,b,select,result,lessThan);
input logic [3:0] a,b;
input logic [1:0] select;     
output logic [3:0] result;
output logic lessThan;

//account for 2s complement
 always_comb
 begin       
      case(select)  
      2'b00: result <= a + b;
      2'b01: result <= a + ((~b)+4'b0001);//subtraction
      2'b10: lessThan <= (a < b); 
      endcase  
      end
    
endmodule
