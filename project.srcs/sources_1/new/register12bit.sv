`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 03:03:22 PM
// Design Name: 
// Module Name: register12bit
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


module register12bit(clk,rst,load,isexternal,I,I2,Q);
input [11:0] I,I2;
input clk,rst,load,isexternal;
output [11:0] Q;
reg [11:0] Q;

always_ff @(posedge clk, posedge rst)
begin
if(rst)begin
 Q<=12'b111000000000;
 end
else if(load) Q <= I;
else if(isexternal) Q <= I2;
end
endmodule
