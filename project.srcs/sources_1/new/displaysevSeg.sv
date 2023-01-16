`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2022 10:09:52 AM
// Design Name: 
// Module Name: displaysevSeg
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

module displaysevSeg(clk,constant,disp,segment,dp,en);
input logic clk;
input logic [3:0] disp [7:0];
input logic [2:0] constant;
output logic [7:0] segment;
output logic dp;
output logic [3:0] en;
logic [3:0] tempNum;

parameter N = 32;//change to 2 for simulation
logic[3:0] in3,in2,in1,in0;

logic [N-1:0] counter = 0;

always @(posedge clk)begin
    counter <=counter +1;
end

logic [4:0] value;
logic [3:0] enable;

always_comb
begin
enable = 4'b1111;
value = in0;
    case(counter[N-1:N-2])
        2'b00 :  //select first 7Seg.
        begin
         value = {1'b0, in0};
         enable = 4'b1110;
        end
        
       2'b01:  //select second 7Seg.
        begin
         value = {1'b0, in1};
         enable = 4'b1101;
        end
        
       2'b10:  //select third 7Seg.
        begin
         value = {1'b0, in2};
         enable = 4'b1011;
        end
         
       2'b11:  //select forth 7Seg.
        begin
         value = {1'b0, in3};
         enable = 4'b0111;
        end
      endcase
     end   

logic neg;
logic [7:0] leds;
always_comb
 begin 
  leds = 7'b1111111; //default
  neg = 1'b1;
  case( value)
   5'b00000 : begin neg = 1'b1; leds = 7'b1000000;end //to display 0
   5'b00001 : begin neg = 1'b1; leds = 7'b1111001;end //to display 1
   5'b00010 : begin neg = 1'b1; leds = 7'b0100100;end //to display 2
   5'b00011 : begin neg = 1'b1; leds = 7'b0110000;end //to display 3
   5'b00100 : begin neg = 1'b1; leds = 7'b0011001;end //to display 4
   5'b00101 : begin neg = 1'b1; leds = 7'b0010010;end //to display 5
   5'b00110 : begin neg = 1'b1; leds = 7'b0000010;end //to display 6
   5'b00111 : begin neg = 1'b1; leds = 7'b1111000;end //to display 7
   5'b01111 : begin neg = 1'b0; leds = 7'b1111001;end //to display -1
   5'b01110 :begin neg = 1'b0; leds = 7'b0100100;end //to display -2
   5'b01101: begin neg = 1'b0;leds = 7'b0110000;end //to display -3
   5'b01100:begin neg = 1'b0; leds = 7'b0011001;end //to display -4
   5'b01011: begin neg = 1'b0;leds = 7'b0010010;end //to display -5
   5'b01010:begin neg = 1'b0; leds = 7'b0000010; end//to display -6
   5'b01001:begin neg = 1'b0; leds = 7'b1111000; end //to display -7
   5'b01000:begin neg = 1'b0; leds = 7'b0000000; end//to display -8  
  endcase
 end
 



 logic [2:0] pointer = 3'b000;
 
 reg[31:0] counter2 = 0;
 reg clk1;
 
 always_ff @(posedge clk)begin
 counter2 <= counter2 + 1;
 if(counter2 >= 10)begin
      counter2 <= 0;
      tempNum <= disp[pointer];
                  if(pointer < constant)pointer <= pointer + 3'b001;//may be off by one
                  else pointer <= 0;

end
end

always_comb
 begin
      in3 <= constant;
      in0 <= tempNum;
 end
 
 assign dp = neg;
 assign en = enable;
 assign segment = leds;
 
endmodule
 
 
 

