`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2022 03:11:18 PM
// Design Name: 
// Module Name: debounce
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


module debounce(clk,button,signal);

input logic clk,button;
output logic signal;
logic inputSignal;
logic [24:0] counter;

parameter waitButton =2'b00;
parameter middleWait = 2'b01;
parameter waitUntilNextClock = 2'b10;

logic [1:0] state,nextState;

always_ff@(posedge clk)
    begin    
        state <= nextState;
        if(inputSignal == 1)
            counter <= 0;
        else
            counter <= counter + 1;
    end
always_comb
    case(state)
        waitButton: if(button) 
            begin //startTimer
                nextState = middleWait;    
                inputSignal = 1;
            end
            else begin nextState = waitButton; inputSignal = 0; end
        middleWait: begin nextState = waitUntilNextClock; end
        //change 40000000 to 4 for testing on simulation
        waitUntilNextClock: begin if(counter == 40000000) nextState = waitButton; else nextState = waitUntilNextClock; inputSignal = 0; end
        default: begin nextState = waitButton; inputSignal = 0; end
        endcase

assign signal = ( state ==  middleWait);

endmodule
