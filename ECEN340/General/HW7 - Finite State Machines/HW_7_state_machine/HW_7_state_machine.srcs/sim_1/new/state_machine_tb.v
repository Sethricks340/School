`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:15:27 PM
// Design Name: 
// Module Name: state_machine_tb
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


module state_machine_tb();

reg A, clk;
wire B;
reg [8:0] sequence = 9'b010101101;

state_machine U1(.A(A), .B(B), .clk(clk));

always #5 clk=~clk;

integer i;

initial begin 
    #10;
    clk = 0; A = 0;
    
    for (i = 0; i < 9; i = i + 1) begin
        A = sequence[8-i];
        #25;
    end

    #10;
$finish;
end
endmodule
