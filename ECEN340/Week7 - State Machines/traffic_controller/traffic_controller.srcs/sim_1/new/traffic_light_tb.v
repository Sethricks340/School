`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 11:09:43 AM
// Design Name: 
// Module Name: traffic_light_tb
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


module traffic_light_tb();


reg clk;
reg btnC;
wire [5:0]led ;

traffic_light UUT(

    .clk(clk),
    .btnC(btnC),
    .led(led)
    );

always  #5 clk = ~clk;

initial begin
    clk = 0; 
    btnC = 0;
    #100 btnC = 1;
    #50  btnC = 0;
    #20000;
    #20000;
    #20000;
    $finish;
end

  






endmodule
