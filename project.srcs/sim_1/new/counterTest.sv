`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2022 09:33:17 PM
// Design Name: 
// Module Name: counterTest
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


module counterTest();
logic clk,rst,inc;
logic [2:0] out;

initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

counter3bit dut(clk,rst,inc,out);
initial begin
rst = 0; inc = 0;#10;
rst = 1; #10;
rst = 0; inc = 1; #20;
end
endmodule
