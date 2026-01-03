`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 10:49:57 AM
// Design Name: 
// Module Name: tb
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

module tb( ); 
reg we, oe, clk; 
wire [15:0] data; 
reg [3:0] addr; 
reg [15:0] data_temp; 
parameter period = 10; 
SRAM u0 (.we(we), .oe(oe), .clk(clk), .data(data), .addr(addr)); 
 
assign data = we?data_temp:16'hZZ;  
always #(period/2) clk = ~clk;  
initial 
begin    clk = 0;    oe = 0;    we = 0; addr = 4'h0; data_temp = 16'h00;
     #5 we = 1'b1;    
     @(posedge clk) 
     #1          addr = 4'h0; data_temp = 16'h1A3F;   // wait 1 ns before writing
     #period     addr = 4'h1; data_temp = 16'hB72C;   // writing to memory
     #period     addr = 4'h2; data_temp = 16'h8E59;    
     #period     addr = 4'h3; data_temp = 16'h4DFA;
     #period     addr = 4'h4; data_temp = 16'hC3B1;    
     #period     addr = 4'h5; data_temp = 16'h7D92;
     #period     addr = 4'h6; data_temp = 16'h2F6E;    
     #period     addr = 4'h7; data_temp = 16'h9AC4;
     #period     addr = 4'h8; data_temp = 16'h51B7;    
     #period     addr = 4'h9; data_temp = 16'hE83D;
     #period     addr = 4'hA; data_temp = 16'h4C2A;
     #period     addr = 4'hB; data_temp = 16'hD79F;
     #period     addr = 4'hC; data_temp = 16'h36AE;
     #period     addr = 4'hD; data_temp = 16'hA1C5;
     #period     addr = 4'hE; data_temp = 16'h7F48;
     #period     addr = 4'hF; data_temp = 16'h0D93;
   
     #period     addr = 4'h0; we= 1'b0; oe = 1'b1;      // reading from memory
     #period     addr = 4'h1;    
     #period     addr = 4'h2;
     #period     addr = 4'h3;
     #period     addr = 4'h4;
     #period     addr = 4'h5;
     #period     addr = 4'h6;
     #period     addr = 4'h7;
     #period     addr = 4'h8;
     #period     addr = 4'h9;
     #period     addr = 4'hA;
     #period     addr = 4'hB;
     #period     addr = 4'hC;
     #period     addr = 4'hD;
     #period     addr = 4'hE;
     #period     addr = 4'hF;
    
     #1000 $finish;
end
endmodule
