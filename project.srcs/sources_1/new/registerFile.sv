`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 03:27:57 PM
// Design Name: 
// Module Name: registerFile
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

//8 slots
module registerFile(clk,rst,RF_we,RF_ad1,RF_ad2,RF_wa,RF_wd,RF_d1,RF_d2,memory);

input logic clk,rst,RF_we;
input logic [2:0] RF_ad1,RF_ad2,RF_wa;
input logic [3:0] RF_wd;
output logic [3:0] RF_d1,RF_d2;
//don't remove below
output logic [3:0] memory [7:0];
 always_ff @(posedge clk)
    begin
    if(rst) begin
                    memory[0] <= 4'b0000;
                    memory[1] <= 4'b0000;
                    memory[2] <= 4'b0000;
                    memory[3] <= 4'b0000;
                    memory[4] <= 4'b0000;
                    memory[5] <= 4'b0000;
                    memory[6] <= 4'b0000;
                    memory[7] <= 4'b0000;
             end
    else
        if(RF_we)
            memory[RF_wa] <= RF_wd;
    end
assign RF_d1 = memory[RF_ad1];
assign RF_d2 = memory[RF_ad2];

endmodule
