`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2025 10:04:47 AM
// Design Name: 
// Module Name: joystick_main
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

module joystick_main(
    input clk,               // 100 MHz system clock
    inout [4:0] JB,          // JB[0]=CS, JB[1]=MISO, JB[2]=MOSI, JB[3]=CLK
    output [3:0] led         // top 4 bits of X for demo
);

    // SPI signals
    wire cs   = JB[0];
    wire miso = JB[1];
    wire mosi = JB[2];
    wire sclk = JB[3];

    wire [11:0] adc0;
    wire [11:0] adc1;

    // Instantiate the ADC reader
    pmod_ad1_reader ADC (
        .clk(clk),
        .cs(cs),
        .sclk(sclk),
        .mosi(mosi),
        .miso(miso),
        .adc0(adc0),
        .adc1(adc1)
    );

    // Map X to top 8 LEDs, Y to bottom 8 LEDs
    assign led[15:8] = adc0[11:4];  // X axis
    assign led[7:0]  = adc1[11:4];  // Y axis
    
endmodule

