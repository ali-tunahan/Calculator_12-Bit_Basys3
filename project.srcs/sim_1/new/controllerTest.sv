`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 09:07:58 PM
// Design Name: 
// Module Name: controllerTest
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


module controllerTest();

logic clk,rst;
logic [11:0] instruction;
logic M_we,M_re,RF_we;
logic incSignal;
logic [3:0] M_add;
logic [3:0] M_wd;
logic [2:0] RF_ad1,RF_ad2,RF_wa;
logic [3:0] RF_wd;


initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

controller dut(clk,rst,instruction,incSignal,M_add,M_we,M_re,M_wd,RF_we,RF_ad1,RF_ad2,RF_wa,RF_wd);

initial begin
rst = 0;#10;
rst = 1; #10;
rst = 0;#20;

instruction = 12'b011010000001;
#100;

end

endmodule
