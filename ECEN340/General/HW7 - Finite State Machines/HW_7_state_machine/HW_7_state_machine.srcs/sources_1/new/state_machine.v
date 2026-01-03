`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 04:55:05 PM
// Design Name: 
// Module Name: state_machine
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


module state_machine(A, B, clk);


input A, clk; output reg B;
parameter INIT   = 2'b00;
parameter GOT1   = 2'b01;
parameter GOT10  = 2'b10;
parameter GOT101 = 2'b11;
reg [1:0] current_state, next_state;

always@(*)begin 
    case(current_state)
        INIT:    next_state = (A) ? GOT1   : INIT;
        GOT1:    next_state = (A) ? GOT1   : GOT10;
        GOT10:   next_state = (A) ? GOT101 : INIT;
        GOT101:  next_state = (A) ? GOT1   : GOT10;
        default: next_state = INIT;
    endcase
end

always@(posedge clk)begin 
    current_state <= next_state; 
end

always@(*)begin
    case(current_state)
        INIT:    B = 0;
        GOT1:    B = 0;
        GOT10:   B = 0;
        GOT101:  B = 1;
        default: B = 0;
    endcase
end
endmodule
