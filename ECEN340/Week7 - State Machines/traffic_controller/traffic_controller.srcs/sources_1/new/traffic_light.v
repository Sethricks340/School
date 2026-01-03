`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 10:02:02 AM
// Design Name: 
// Module Name: traffic_light
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


module traffic_light(
input clk,
input btnC,
output [5:0] led 
);

parameter MainG_CenterR = 2'b00;
parameter MainY_CenterR = 2'b01;
parameter MainR_CenterG = 2'b10;
parameter MainR_CenterY = 2'b11;

reg [1:0] current_state;
reg [1:0] next_state = MainG_CenterR;

reg tm3_done = 0;
reg tm10_done = 0;
reg tm15_done = 0;

reg MG, MR, MY, CG, CR, CY;
reg start_tm3, start_tm15, start_tm10;

reg start_tm3_dly = 0;
reg start_tm10_dly = 0;
reg start_tm15_dly = 0;

reg clk_1Hz;

assign led[0] = (MG) ? 1 : 0;
assign led[1] = (MY) ? 1 : 0;
assign led[2] = (MR) ? 1 : 0;
assign led[3] = (CG) ? 1 : 0;
assign led[4] = (CY) ? 1 : 0;
assign led[5] = (CR) ? 1 : 0;

always@(*)begin
    case(current_state)
        MainG_CenterR: next_state = (tm15_done) ? MainY_CenterR : MainG_CenterR;
        MainY_CenterR: next_state = (tm3_done)  ? MainR_CenterG : MainY_CenterR;
        MainR_CenterG: next_state = (tm10_done) ? MainR_CenterY : MainR_CenterG;
        MainR_CenterY: next_state = (tm3_done)  ? MainG_CenterR : MainR_CenterY;
        default: next_state <= MainG_CenterR;
    endcase
 end
 
always@(posedge clk, posedge btnC)begin 
    if (btnC) current_state <= MainG_CenterR;
    else current_state <= next_state;
end

always@(*)begin
    case(current_state)
        MainG_CenterR: begin 
            start_tm3 = 0; start_tm15 = 1; start_tm10 = 0; 
            MG = 1; MR = 0; MY= 0;
            CG = 0; CR = 1; CY = 0; end
        MainY_CenterR: begin
            start_tm3 = 1; start_tm15 = 0; start_tm10 = 0; 
            MG = 0 ; MR = 0; MY= 1;
            CG = 0; CR = 1; CY = 0; end
        MainR_CenterG: begin
            start_tm3 = 0; start_tm15 = 0; start_tm10 = 1; 
            MG = 0; MR = 1; MY= 0;
            CG =1; CR = 0; CY = 0; end
        MainR_CenterY: begin
            start_tm3 = 1; start_tm15 = 0; start_tm10 = 0; 
            MG = 0; MR = 1; MY= 0;
            CG = 0; CR = 0; CY = 1; end
    endcase
end

always@(posedge clk)begin 
    start_tm3_dly <= start_tm3; 
end
    
assign start_tm3_pulse = start_tm3 && !start_tm3_dly;

reg [1:0] cnt_3sec;     // 3-second timer
always @ (posedge clk_1Hz, posedge start_tm3_pulse, posedge btnC)
    if (start_tm3_pulse || btnC)   // synchronous btnC
        begin
            cnt_3sec <= 0;        // initialize second counter to zero
            tm3_done <= 0;
        end
    else if (cnt_3sec < 2)
        cnt_3sec <= cnt_3sec + 1;
    else
        tm3_done <= 1;

always@(posedge clk)begin 
    start_tm10_dly <= start_tm10; 
end
    
assign start_tm10_pulse = start_tm10 && !start_tm10_dly;

reg [3:0] cnt_10sec;     // 10-second timer
always @ (posedge clk_1Hz, posedge start_tm10_pulse, posedge btnC)
    if (start_tm10_pulse || btnC)   // synchronous btnC
        begin
            cnt_10sec <= 0;        // initialize second counter to zero
            tm10_done <= 0;
        end
    else if (cnt_10sec < 9)
        cnt_10sec <= cnt_10sec + 1;
    else
        tm10_done <= 1;

always@(posedge clk)begin 
    start_tm15_dly <= start_tm15; 
end
    
assign start_tm15_pulse = start_tm15 && !start_tm15_dly;

reg [3:0] cnt_15sec;     // 15-second timer
always @ (posedge clk_1Hz, posedge start_tm15_pulse, posedge btnC)
    if (start_tm15_pulse || btnC)   // synchronous btnC
        begin
            cnt_15sec <= 0;        // initialize second counter to zero
            tm15_done <= 0;
        end
    else if (cnt_15sec < 14)
        cnt_15sec <= cnt_15sec + 1;
    else
        tm15_done <= 1;

reg [25:0] count; // make sure the count has enough bits to count to 50,000,000
always @ (posedge clk, posedge btnC)    // fclk is 100MHz
if (btnC)
    begin
        count <= 0;
        clk_1Hz <= 0;
    end
else if (count < 50000000) // Real time 
//else if (count < 5)      // Simulation time
    count <= count +1; // keep incrementing until you hit 50,000,000
else
    begin
        count <= 0;
        clk_1Hz <= !clk_1Hz; // invert the clock every second
    end

endmodule
