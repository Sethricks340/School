`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:21:37 AM
// Design Name: 
// Module Name: clock_dividers
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

module clock_dividers(sw, clk, btnC, btnD, seg, an, dp, JA);
    input [15:0] sw; 
    input clk, btnC, btnD;
    output [6:0] seg;
    output reg [3:0] an;
    output dp;
    output [4:0] JA; 

    reg [3:0] nibble;
    wire slow_clk;
    wire [1:0] digit_index;

    assign dp = 1'b1; // Not currently using in this part
    
    // JA for using the oscilloscope 
    assign JA[0] = slow_clk;
    assign JA[1] = an[0];
    assign JA[2] = an[1];
    assign JA[3] = an[2];
    assign JA[4] = an[3];


    // Clock divider
    clk_gen clock_slow (
        .clk_in(clk),
        .reset(btnC),
        .clk_out(slow_clk)
    );

    // Digit selector
    digit_selector digit_sel (
        .slow_clk(slow_clk),
        .btnC(btnC),
        .digit_index(digit_index)
    );
    
    sseg display_unit (
        .switches(nibble),
        .led_layout(seg)
    );

    // Update LED layout and anode based off of the digit index, any time the digit index changes 
    always @(*) begin
        case (digit_index)
        
            2'd0: begin
            if (btnC)
                an = 4'b1111;
                
             else begin
                nibble = sw[3:0];
                an = 4'b1110;
                end
            end
            2'd1: begin
                nibble = sw[7:4];
                an = 4'b1101;
            end
            2'd2: begin
                nibble = sw[11:8];
                an = 4'b1011;
            end
            2'd3: begin
                nibble = sw[15:12];
                an = 4'b0111;
        end 
        endcase
        
       if (btnD) nibble = ~nibble; 
    end

endmodule
