`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 10:16:08 AM
// Design Name: 
// Module Name: multiplier
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

module multiplier(input [15:0] sw, output [15:0] led, input clk);

    wire [7:0] A = sw[15:8];
    wire [7:0] B = sw[7:0];

    wire [15:0] PP0 = ({8{B[0]}} & A);
    wire [15:0] PP1 = ({8{B[1]}} & A) << 1;
    wire [15:0] PP2 = ({8{B[2]}} & A) << 2;
    wire [15:0] PP3 = ({8{B[3]}} & A) << 3;
    wire [15:0] PP4 = ({8{B[4]}} & A) << 4;
    wire [15:0] PP5 = ({8{B[5]}} & A) << 5;
    wire [15:0] PP6 = ({8{B[6]}} & A) << 6;
    wire [15:0] PP7 = ({8{B[7]}} & A) << 7;

    reg [15:0] S1[3:0];
    reg [15:0] S2[1:0];
    reg [15:0] P;

    always @(posedge clk) begin
        S1[0] <= PP0 + PP1;
        S1[1] <= PP2 + PP3;
        S1[2] <= PP4 + PP5;
        S1[3] <= PP6 + PP7;
    end

    always @(posedge clk) begin
        S2[0] <= S1[0] + S1[1];
        S2[1] <= S1[2] + S1[3];
    end

    always @(posedge clk) begin
        P <= S2[0] + S2[1];
    end

    assign led = P;

endmodule