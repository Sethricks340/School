`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2025
// Module Name: pmod_ad1_reader
//////////////////////////////////////////////////////////////////////////////////

module pmod_ad1_reader(
    input clk,                   // 100 MHz system clock
    output reg cs,               // Chip select → connect to JB0 pin
    output reg sclk,             // SPI clock → connect to JB1 pin
    input miso0,                 // ADC channel 0 → connect to JB2 pin
    input miso1,                 // ADC channel 1 → connect to JB3 pin
    output reg [11:0] adc0 = 0,  // Channel 0 data
    output reg [11:0] adc1 = 0   // Channel 1 data
);

    reg [3:0] bit_cnt;           // Counts 12 bits per ADC
    reg [11:0] shift0, shift1;   // Shift registers for ADCs
    reg [6:0] clk_div;
    wire spi_clk = clk_div[6];   // ~1 MHz SPI clock

    // Clock divider
    always @(posedge clk) clk_div <= clk_div + 1;

    // SPI read FSM
    reg [1:0] state = 0; // Initialize state as IDLE
    // Three states to Moore machine
    localparam IDLE = 0, TRANSFER = 1, DONE = 2;

    always @(posedge spi_clk) begin
        case(state)
            IDLE: begin
                cs <= 1;           // CS high while idle
                bit_cnt <= 0;      // Reset the bit count
                state <= TRANSFER; // Activate next state
            end
            TRANSFER: begin
                cs <= 0;          // CS low to start conversion
                sclk <= ~sclk;    // Toggle SPI clock

                if (sclk) begin
                    shift0 <= {shift0[10:0], miso0};  // Shift the new data into the staged output
                    shift1 <= {shift1[10:0], miso1};  // Shift the new data into the staged output
                    bit_cnt <= bit_cnt + 1;           // Increase bit count

                    if (bit_cnt == 11) state <= DONE; // When read all bits (12), Activate Next State
                end
            end
            DONE: begin
                adc0 <= {shift0[10:0], miso0};
                adc1 <= {shift1[10:0], miso1};
                cs <= 1;          // End frame
                sclk <= 0;        // Start clock over
                bit_cnt <= 0;     // Reset the bit count again
                state <= IDLE;    // Activate Next State
            end
        endcase
    end

endmodule

