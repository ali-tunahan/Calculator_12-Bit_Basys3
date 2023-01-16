`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2022 10:11:01 PM
// Design Name: 
// Module Name: instructionmemory
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

module instructionmemory(clk,rst,shift, we,wa,wd,readData);
input logic clk,rst,we,shift;
input logic [2:0] wa;
input logic [11:0] wd;
logic [11:0] instructions[7:0];  
output logic [11:0] readData;

always_ff @(posedge clk)begin
    if(rst) begin
                    instructions[0] <= 12'b111000000000;
                    instructions[1] <= 12'b111000000000;
                    instructions[2] <= 12'b111000000000;
                    instructions[3] <= 12'b111000000000;
                    instructions[4] <= 12'b111000000000;
                    instructions[5] <= 12'b111000000000;
                    instructions[6] <= 12'b111000000000;
                    instructions[7] <= 12'b111000000000;
                    readData <= 12'b111000000000;
             end
    else if(we) instructions[wa] <= wd;
    else if (shift) begin
        readData =instructions[0];
        for(int i=0;i<7;i++)instructions[i]=instructions[i+1]; 

        instructions[7] <= 12'b111_000_000_000;
    end
        
        
 end

 endmodule
