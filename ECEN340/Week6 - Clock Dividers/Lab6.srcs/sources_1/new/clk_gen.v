`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 11:49:50 AM
// Design Name: 
// Module Name: clk_gen
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


module clk_gen (
    input wire clk_in,         // 100 MHz input clock
    input wire reset,
    output wire clk_out        // divided clock output
);

    reg [25:0] counter = 0;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    assign clk_out = counter[17];  // Using bit 17 for a clock around 381 Hz ish 

endmodule