`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2025 04:07:07 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,         // 100 MHz Clock
    inout [7:0] JB,    // JB[0]=CS, JB[1]=DO, JB[2]=D1, JB[3]=CLK
    output [15:0] led,  // For Joystick Visualization
    
    input  wire btnC,
    input wire btnD,
      input wire btnU,
    input wire btnR,
    input wire btnL,
    output wire Hsync,
    output wire Vsync,
    output wire [3:0] vgaRed,
    output wire [3:0] vgaGreen,
    output wire [3:0] vgaBlue
    
    
);

    // break out directions on the JB bus
    wire miso0 = JB[1];   // DO  -> FPGA input (1 bit)
    wire miso1 = JB[2];   // D1  -> FPGA input (1 bit)
    wire cs;              // Chip select, pull low to start
    wire sclk;
    
    
    wire clk_148;
    

    // drive outputs onto JB
    assign JB[0] = cs;    // CS  <- FPGA output
    assign JB[3] = sclk;  // CLK <- FPGA output
    
    wire [11:0] adc0;     // ADC Output 1
    wire [11:0] adc1;     // ADC Output 1
    
    // Hold joystick with wires down
    // A0 = VRY
    // A1 = VRX
    wire LEFT  = (adc0[11:4] == 5'b00000);
    wire RIGHT = (adc0[11:4] == 5'b11111);
    wire UP    = (adc1[11:4] == 5'b11111);
    wire DOWN  = (adc1[11:4] == 5'b00000);
    
    // LEDs for direction visualization
    assign led[15] = LEFT;
    assign led[0]  = RIGHT;
    assign led[10] = UP;
    assign led[5]  = DOWN;
    
    // instantiate reader
    pmod_ad1_reader u (
        .clk(clk),
        .cs(cs),
        .sclk(sclk),
        .miso0(miso0),
        .miso1(miso1),
        .adc0(adc0),
        .adc1(adc1)
       
    );
    
    square top_square(
    
        .clk(clk_148), 
        .btnC(btnC),
        .Hsync(Hsync),
        .Vsync(Vsync),
        .vgaRed(vgaRed),
        .vgaBlue(vgaBlue),
        .vgaGreen(vgaGreen),
        .LEFT(LEFT),
        .RIGHT(RIGHT),
        .UP(UP),
        .DOWN(DOWN),
        .btnD(btnD),
        .btnU(btnU),
        .btnL(btnL),
        .btnR(btnR)
        
        );
        
    clk_wiz_0 clk_wiz_inst(
        .clk_out1(clk_148),
        .clk_in1(clk),
        .reset(1'b0)
    );
        

endmodule

