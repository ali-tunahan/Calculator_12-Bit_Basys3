`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 07:46:27 PM
// Design Name: 
// Module Name: controller
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

module controller(clk,rst,instruction,M_add,M_we,M_re,RF_we,RF_ad1,RF_ad2,RF_wa,aluSelector,muxSelector,constant,userInputAdd,userDef,dispAdd,loadNext,isexternal);
input logic loadNext,isexternal;
output logic [2:0] constant;
input logic clk,rst,userDef;
input logic [11:0] instruction;
output logic M_we,M_re,RF_we;
output logic [3:0] M_add;
output logic [2:0] RF_ad1,RF_ad2,RF_wa;
output logic [1:0] aluSelector;
output logic [1:0] muxSelector;
input logic [2:0] userInputAdd;
output logic [3:0] dispAdd [7:0];

parameter load = 4'b0000;
parameter loadNow = 4'b1011;
parameter store = 4'b0001;
parameter sub = 4'b0010;
parameter add = 4'b0011;
parameter asc = 4'b0100;
parameter des = 4'b0101;
parameter disp = 4'b0110;
parameter fetch = 4'b0111;
parameter userInput = 4'b1111;
parameter storeNow = 4'b1100;
parameter mfdesertPower = 4'b1010;//wait
logic [3:0] state,nextstate;

always_ff @(posedge clk, posedge rst)
        if(rst) state<=fetch;
        else state <= nextstate;
        always_comb
        case(state)
            mfdesertPower: begin//easter egg, actually wait state

                            RF_we = 0;
                            M_re = 1;
                            M_we = 0;
            if(loadNext | isexternal) nextstate <=fetch;
            else if(userDef) nextstate <= userInput;
            else nextstate <= mfdesertPower;
            end
            fetch: begin
                RF_we = 0;
                M_re = 1;
                M_we = 0;
                RF_wa = userInputAdd;
                if(userDef)nextstate<=userInput;
                else nextstate <= {1'b0,instruction[11:9]};
                end
            load: begin

                RF_wa = instruction[6:4];
                M_add = instruction[3:0];
                M_re = 1;
                RF_we = 1;

                nextstate <= loadNow;
                end
            loadNow: begin
                muxSelector = 2'b00;//for memory
                RF_we = 1;
                if(userDef)nextstate<=userInput;
                else nextstate <= mfdesertPower;
                                
            end
            store: begin
                RF_we = 0;
                M_we = 1;
                M_add = instruction[3:0];
                RF_ad1 = instruction[6:4];
                nextstate <= storeNow;
                end
            storeNow: begin
            M_we = 1;
            if(userDef)nextstate<=userInput;
            else nextstate <= mfdesertPower;
            end
            sub:begin

            RF_we = 1;
            RF_wa = instruction[8:6];
            RF_ad1 = instruction[5:3];
            RF_ad2 = instruction[2:0];
            aluSelector = 2'b01;
            muxSelector = 2'b01;//for alu
            if(userDef)nextstate<=userInput;
            else nextstate <= mfdesertPower;
            end
            add: begin
                    RF_we = 1;
                    RF_wa = instruction[8:6];
                    RF_ad1 = instruction[5:3];
                    RF_ad2 = instruction[2:0];
                    aluSelector = 2'b00;
                    muxSelector = 2'b01;//for alu
                    if(userDef)nextstate<=userInput;
                    else nextstate <= mfdesertPower;
                    end
            disp: begin
                    constant <= instruction[2:0];
                    RF_we = 0;
                    for(int i = 0; i<instruction[2:0] + 1;i++)begin
                        dispAdd[i] <= i + instruction[5:3];
                        end
                        if(userDef)nextstate<=userInput;
                        else nextstate <= mfdesertPower;
                    end
            userInput: begin
                    muxSelector = 2'b10;//for userInput
                    RF_wa = userInputAdd;
                    RF_we = 1;
                    if(userDef)nextstate<=userInput;
                    else nextstate <= {1'b0,instruction[11:9]};
                    end   
         endcase
endmodule
