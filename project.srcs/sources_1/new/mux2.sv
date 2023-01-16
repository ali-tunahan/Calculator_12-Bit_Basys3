`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 10:55:15 AM
// Design Name: 
// Module Name: mux2
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


module mux2(s,a,b,c,y);
input logic [1:0]s;
input logic [3:0] a,b,c;
output logic [3:0] y;
always_comb begin
if(s[1] & ~s[0]) y = c;
else if(~s[1] & s[0]) y = b;
else if (~s[1] & ~s[0]) y = a;
end

//assign y = a*(~s[1]*~s[0]) + b*(~s[1] * s[0]) + c*(s[1]*~s[0]);
endmodule
