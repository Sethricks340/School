`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 10:15:36 AM
// Design Name: 
// Module Name: one_hz_clk
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


module one_hz_clk(
input clk, 
input rst,
output reg clk_1Hz
);

// A 1Hz clock from 100MHz example
reg [25:0] count; // make sure the count has enough bits to count to 50,000,000
always @ (posedge clk, posedge rst)    // fclk is 100MHz
if (rst)
    begin
        count <= 0;
        clk_1Hz <= 0;
    end
else if (count < 50000000)
    count <= count +1; // keep incrementing until you hit 50,000,000
else
    begin
        count <= 0;
        clk_1Hz <= !clk_1Hz; // invert the clock every second
    end



endmodule
