`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 10:25:58 AM
// Design Name: 
// Module Name: test_bench
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


module test_bench();

  reg [15:0] sw;
  reg clk;
  reg btnC; 
  wire [3:0] an;
  wire [6:0] seg;
  wire dp; 
  
clock_dividers U1( 
  .sw(sw),
  .clk(clk),
  .btnC(btnC),
  .an(an),
  .seg(seg),
  .dp(dp)
  );

  always #5 clk=~clk;
  initial
  begin
    // Initialize inputs
    clk = 0;
    btnC=1;
    sw = 16'hABCD;
    #20 btnC =0;
 
 #1000;

   end
   endmodule 
   

  
  
  
  

