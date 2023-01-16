`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2022 02:45:10 PM
// Design Name: 
// Module Name: sevsegTest
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


module sevsegTest();
logic [3:0] a,b,result;
logic [3:0] disp [7:0];
logic [3:0] sorted [7:0];
logic [2:0] constant;
logic [1:0] select;


logic [6:0] segment;
logic dp;
logic [3:0] en;
logic [3:0]tempNum;
logic clk,clk1;

logic [2:0] counter;
initial begin
    clk = 0;
    forever #1 clk = ~clk;
end
logic[3:0] in0;
logic [6:0] leds;
logic [4:0] value;
logic [3:0] enable;
logic [2:0]pointer = 0;
reg[31:0] counter2;
displaysevSeg dut(clk,a,b,result,sorted,constant,disp,select,segment,dp,en,tempNum,value,enable,leds,pointer,in0);



initial begin
a = 4'b0001;
b = 4'b0001;
result = 4'b0010;
select = 2'b00;
#100;
constant = 3'b011;
sorted[0] = 4'b0000;
sorted[1] = 4'b0001;
sorted[2] = 4'b0010;
select = 2'b01;
#100;
end
endmodule
