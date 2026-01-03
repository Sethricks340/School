`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 03:48:39 PM
// Design Name: 
// Module Name: gray_counter
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


module gray_counter(clk, reset, led, sw);
input clk;
input reset;
input [1:0] sw;
output [2:0] led;

reg A, B, C;
reg A_next, B_next, C_next;

// First sequence (assigned in class):           // 7, 3, 2, 6, 4, 0, 1, 5
// Second sequence (extra credit):               // 7, 6, 2, 3, 1, 0, 4, 5
// Third sequence (mirror of 1 - extra credit):  // 7, 5, 1, 0, 4, 6, 2, 3
// Fourth sequence (mirror of 2 - extra credit): // 0, 1, 3, 2, 6, 7, 5, 4

assign led = {A, B, C};

always @(*) begin
    case (sw)
        2'd0: begin  // 7, 3, 2, 6, 4, 0, 1, 5
            A_next <= (B ^ C);
            B_next <= (~A & B) | (A & C);
            C_next <= (~A & ~B) | (A & C); end
        2'd1: begin  // 7, 6, 2, 3, 1, 0, 4, 5
            A_next <= (A & C) | (~B & ~C);
            B_next <= (B & ~C) | (A & C);
            C_next <= (A ^ B); end
        2'd2: begin // 7, 5, 1, 0, 4, 6, 2, 3
            A_next <= (B & C) | (~B & ~C);
            B_next <= (A & ~C) | (~A & B);
            C_next <= (A & C) | (~A & B); end
        2'd3: begin // 0, 1, 3, 2, 6, 7, 5, 4
            A_next <= (A & C) | (B & ~C);
            B_next <= (~A & C) | (B & ~C);
            C_next <= (A & B) |(~A & ~B); end
        default: begin
            A_next = A;
            B_next = B;
            C_next = C; end
        endcase end 

always @ (posedge clk or posedge reset) begin 
    if (reset) begin
        A <= 1'b1;
        B <= 1'b1;
        C <= 1'b1; end
        
    else begin 
        A <= A_next;
        B <= B_next;
        C <= C_next; end
    end 
        
endmodule 