`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 11:28:09 AM
// Design Name: 
// Module Name: digit_selector
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

// Used to select the current 7 seg led in rotation
module digit_selector(
    input slow_clk,
    input btnC,
    output reg [1:0] digit_index
);

    always @(posedge slow_clk or posedge btnC) begin
        if (btnC)
            // reset counter if button pushed 
            digit_index <= 0;
        else
            // This will change the index by one, moving on to the next led anode 
            digit_index <= digit_index + 1;
    end

endmodule
