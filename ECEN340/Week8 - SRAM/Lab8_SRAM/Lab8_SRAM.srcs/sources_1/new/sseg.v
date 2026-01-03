`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:21:37 AM
// Design Name: 
// Module Name: sseg_x4_top
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

//    sseg_x4_top disp (.clk(clk), .sw(disp_data), .seg(seg), .an(an), .dp(dp));

module sseg_x4_top(sw, clk, btnC, btnD, seg, an, dp);
    input [15:0] sw; 
    input clk, btnC, btnD;
    output [6:0] seg;
    output reg [3:0] an;
    output dp;
//    output [4:0] JA; 

    reg [3:0] nibble;
    wire slow_clk;
    wire [1:0] digit_index;

    assign dp = 1'b1; // Not currently using in this part
    
//    // JA for using the oscilloscope 
//    assign JA[0] = slow_clk;
//    assign JA[1] = an[0];
//    assign JA[2] = an[1];
//    assign JA[3] = an[2];
//    assign JA[4] = an[3];


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
        .seg(seg)
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


module sseg(
    input [3:0] switches,
    output reg [6:0] seg
);

    always @(*) begin
        // 7-segment pattern lookup
        case (switches)
            4'd0:  seg = 7'b1000000;
            4'd1:  seg = 7'b1111001;
            4'd2:  seg = 7'b0100100;
            4'd3:  seg = 7'b0110000;
            4'd4:  seg = 7'b0011001;
            4'd5:  seg = 7'b0010010;
            4'd6:  seg = 7'b0000010;
            4'd7:  seg = 7'b1111000;
            4'd8:  seg = 7'b0000000;
            4'd9:  seg = 7'b0011000;
            4'd10: seg = 7'b0001000;
            4'd11: seg = 7'b0000011;
            4'd12: seg = 7'b1000110;
            4'd13: seg = 7'b0100001;
            4'd14: seg = 7'b0000110;
            4'd15: seg = 7'b0001110;
            default: seg = 7'b1111111;
        endcase
    end

endmodule

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
