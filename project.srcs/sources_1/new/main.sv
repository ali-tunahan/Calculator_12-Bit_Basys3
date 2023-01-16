`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 09:06:16 AM
// Design Name: 
// Module Name: main
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


module main(clk,leftButton,switches,centerButton,rightButton,upperButton,lowerButton,segment,dp,en);
input logic leftButton,clk;
input logic [15:0] switches;
logic [3:0] c;
assign c = switches[15:12];
input logic centerButton,rightButton,upperButton,lowerButton;
logic loadNext,rst;
logic [3:0] sortAdd [7:0];

logic [3:0] memory [7:0];
logic [11:0] readData;
logic [11:0] instructionRegData;
logic inc;
logic[2:0] out;
logic [3:0] RF_d1,RF_d2;
logic [3:0] M_rd;
logic M_we,M_re,RF_we;
logic [3:0] M_add;
logic [2:0] RF_ad1,RF_ad2,RF_wa;
 logic [1:0] aluSelector;
logic [1:0] muxSelector;
logic [3:0] muxResult;
logic [3:0] aluResult;
logic lessThan;

logic [3:0] disp [7:0];

logic [2:0] constant;
logic [1:0] selectDisplay;
logic [3:0] dispAdd [7:0];
output logic [6:0] segment;
output logic dp;
output logic [3:0] en;
logic [3:0] in[7:0];
logic [2:0] count;
logic isexternal,writeInstruction,userDefined;

//debounce buttons
debounce loadNextDebounced(clk,leftButton,loadNext);
debounce isexternalDebounced(clk,rightButton,isexternal);
debounce lowerButtonDebounced(clk,lowerButton,rst);
debounce centerButtonDebounced(clk,centerButton,writeInstruction);
debounce upperButtonDebounced(clk,upperButton,userDefined);



counter3bit pc(clk, rst,writeInstruction ,loadNext, out);

instructionmemory insMemory(clk,rst,loadNext, writeInstruction,out,switches[11:0],readData);

register12bit instructionregister(clk,rst,loadNext,isexternal,readData,switches[11:0],instructionRegData);

controller controler(clk,rst,instructionRegData,M_add,M_we,M_re,RF_we,RF_ad1,RF_ad2,RF_wa,aluSelector,muxSelector,constant,switches[11:9],userDefined,dispAdd,loadNext,isexternal);

dataMemory datamemory(clk,rst,M_add,M_we,M_re,RF_d1,M_rd);

registerFile rf(clk,rst,RF_we,RF_ad1,RF_ad2,RF_wa,muxResult,RF_d1,RF_d2,memory);

alu alu1(RF_d1,RF_d2,aluSelector,aluResult,lessThan);
mux2 mux2bit(muxSelector,M_rd,aluResult,switches[15:12],muxResult);
displaysevSeg sevseg(clk,constant,disp,segment,dp,en);

endmodule







