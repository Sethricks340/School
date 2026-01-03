`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 10:43:03 AM
// Design Name: 
// Module Name: memory
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


module memory(
    input wire we, oe, clk,
    inout wire [15:0] data,
    input wire[3:0] addr
    );
    
    reg [15:0] mem [15:0];
    
    // If output enable and not write enable, get the data at addr. Otherwise, high impedance
    assign data = (oe && !we) ? mem[addr]: 16'hzz; 
    always @(posedge clk) begin
        if(we) mem[addr] <= data; // Write the data into memory if write enable
        end
endmodule
