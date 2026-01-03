`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 03:46:50 PM
// Design Name: 
// Module Name: gray_counter_top
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


module gray_counter_top(btnC, led, clk, sw);

input btnC, clk;
input [2:0] sw;
output wire [2:0] led;
wire slow_clk;
wire [2:0] count;

assign led = count;

clock_gen clk_gen(.clk_in(clk), .reset(btnC), .clk_out(slow_clk));

gray_counter counter(.clk(slow_clk), .reset(btnC), .led(count), .sw(sw));


endmodule


