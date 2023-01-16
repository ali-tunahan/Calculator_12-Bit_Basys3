`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 06:34:25 PM
// Design Name: 
// Module Name: mainTest
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


module mainTest();
logic [3:0] memory [7:0];
logic loadNext,rst,clk;
logic centerButton,rightButton,upperButton,lowerButton,leftButton,userDef;
logic [15:0] switches;
logic [6:0] segment;
logic dp;
logic [3:0] en;
logic [3:0] disp [7:0];
logic [3:0] state;
logic ext,next;
logic [3:0] M_rd;
logic M_we,M_re,RF_we;
logic [2:0] RF_wa;
logic[3:0] aluResult;
logic  [3:0] sortedOut[7:0];
logic [3:0] in [7:0];
initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

logic [3:0] datamemo [15:0];
logic [3:0] M_add;

main dut(clk,leftButton,switches,centerButton,rightButton,upperButton,lowerButton,segment,dp,en);

initial begin
//reset
lowerButton = 0; #10;lowerButton = 1; #10;lowerButton = 0; #20;upperButton = 0;
switches[15:0] = 0;
#10;

////load data
//switches[15:9] = 7'b0000000;
//#5;upperButton = 1;
//#10;upperButton =0;
//#10;switches[15:9] = 7'b1001001;#5;upperButton = 1;
//#10
//upperButton = 0;
//#10;switches[15:9] = 7'b0011010;//done
//#5;
//upperButton = 1;
//#10;upperButton = 0;
//#10;
//#20;switches[11:0] = 12'b110_000_000_011;rightButton = 1;
//#20;rightButton = 0;
//#20;switches[11:0] = 12'b011_100_010_010;
//rightButton = 1;
//#20;
//rightButton = 0;
//#20;
//switches[11:0] = 12'b110_000_000_101;
//rightButton = 1;#20;rightButton = 0;#20;
//switches[11:0] = 12'b001_001_000_000;
//rightButton = 1;#20;rightButton = 0;#20;
//switches[11:0] = 12'b000_001_010_000;
//rightButton = 1;#20;rightButton = 0;#20;
//#20;rightButton = 0;#10;
switches[15:9] = 7'b0010000;
#10;
upperButton = 1;
#10;
upperButton = 0;
switches[15:9] = 7'b0000001;
#10;
upperButton = 1;
#10;
upperButton = 0;
switches[15:9] = 7'b0110010;
#10;
upperButton = 1;
#10;
upperButton = 0;
switches[11:0] = 12'b100_011_000_010;
#10;
rightButton = 1;
#10;
rightButton = 0;
//#10;
//switches[11:0] = 12'b000_00_001_0000;
//#10;
//rightButton = 1;
//#10;
//rightButton = 0;
//#10;
//switches[11:0] = 12'b110_000_000_011;
//rightButton = 1;
//#10;
//rightButton = 0;
//#10;
#1000;end
endmodule
