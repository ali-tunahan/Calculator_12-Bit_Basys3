`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2022 09:25:23 PM
// Design Name: 
// Module Name: counter3bit
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


module counter3bit(input clk, input rst, input inc,input lower, output logic[2:0] out);
always_ff @(posedge clk) begin
    if(rst)
        out <= 3'b000;
    else begin
        if(inc & out < 7) out <= out + 1;
        else if(lower & out > 0) out <= out - 1;
    end
end
endmodule
