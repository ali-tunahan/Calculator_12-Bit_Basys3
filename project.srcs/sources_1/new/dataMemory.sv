`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 03:43:24 PM
// Design Name: 
// Module Name: dataMemory
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


//16 slots
module dataMemory(clk,rst,M_add,M_we,M_re,M_wd,M_rd);

input logic clk,rst,M_we,M_re;
input logic [3:0] M_add;
input logic [3:0] M_wd;
output logic [3:0] M_rd;

logic [3:0] mem [15:0];

always_ff @(posedge clk)
    begin
    if(rst) begin  
                mem[0] <= 4'b1000;
                mem[1] <= 4'b0000;
                mem[2] <= 4'b0000;
                mem[3] <= 4'b0000;
                mem[4] <= 4'b0000;
                mem[5] <= 4'b0000;
                mem[6] <= 4'b0000;
                mem[7] <= 4'b0000;
                mem[8] <= 4'b0000;
                mem[9] <= 4'b0000;
                mem[10] <= 4'b0000;
                mem[11] <= 4'b0000;
                mem[12] <= 4'b0000;
                mem[13] <= 4'b0000;
                mem[14] <= 4'b0000;
                mem[15] <= 4'b0000;
           end  
    else
        if (M_we) mem[M_add] <= M_wd; 
    end
assign M_rd =mem[M_add];
endmodule
