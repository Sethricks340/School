`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2025 10:24:05 AM
// Design Name: 
// Module Name: pmod_ad1_reader
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

module pmod_ad1_reader(
    input clk,                // 100 MHz system clock
    output reg cs,
    output reg sclk,
    output reg mosi,
    input miso,
    output reg [11:0] adc0,
    output reg [11:0] adc1
);

    reg [15:0] shift_reg;
    reg [4:0] bit_cnt;
    reg channel = 0;           // 0 = A0, 1 = A1

    // SPI clock divider (~1 MHz)
    reg [6:0] clk_div;
    wire spi_clk = clk_div[6];
    always @(posedge clk) clk_div <= clk_div + 1;

    // SPI state machine
    reg [1:0] state;
    localparam IDLE = 0, TRANSFER = 1, DONE = 2;

    always @(posedge spi_clk) begin
        case (state)
            IDLE: begin
                cs <= 0;                 // pull CS low to start
                bit_cnt <= 0;
                shift_reg <= {1'b1, channel, 2'b00, 12'b0}; // start + channel + empty data
                state <= TRANSFER;
                sclk <= 0;
            end
            TRANSFER: begin
                sclk <= ~sclk;           // toggle SPI clock

                // On rising edge of sclk, shift out data
                if (sclk) begin
                    mosi <= shift_reg[15];
                    shift_reg <= {shift_reg[14:0], miso};
                    bit_cnt <= bit_cnt + 1;
                end

                if (bit_cnt == 16 && sclk) begin
                    cs <= 1;             // finish transaction
                    if (channel == 0)
                        adc0 <= shift_reg[11:0];
                    else
                        adc1 <= shift_reg[11:0];

                    channel <= ~channel;  // switch channel
                    state <= IDLE;        // start next channel
                end
            end
        endcase
    end

endmodule
