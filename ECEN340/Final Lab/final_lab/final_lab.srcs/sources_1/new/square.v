module square(
    input  wire clk, 
    input  wire btnC,
    input wire btnD,
    input wire btnU,
    input wire btnR,
    input wire btnL,
    
    // joystick inputs
    input wire LEFT,
    input wire RIGHT,
    input wire UP,
    input wire DOWN,

    output reg Hsync,
    output reg Vsync,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue
);

    // 1080p Timing
    localparam H_TOTAL      = 2200;
    localparam H_SYNC_START = 2008;
    localparam H_SYNC_END   = 2052;

    localparam V_TOTAL      = 1125;
    localparam V_SYNC_START = 1084;
    localparam V_SYNC_END   = 1089;
    
    localparam SQUARE_WIDTH = 200;
    localparam MAX_X = 1920 - SQUARE_WIDTH;
    localparam MAX_Y = 1080 - SQUARE_WIDTH;

    // Counters
    reg [11:0] x = 0;
    reg [11:0] y = 0;

    // Square position
    reg [11:0] sq_x = 0;
    reg [11:0] sq_y = 0;

    reg [11:0] next_sq_x;
    reg [11:0] next_sq_y;

    // Pixel counters
    always @(posedge clk) begin
        if (btnC) begin
            x <= 0;
            y <= 0;
        end else begin
            if (x == H_TOTAL - 1) begin
                x <= 0;
                y <= (y == V_TOTAL - 1) ? 0 : y + 1;
            end else begin
                x <= x + 1;
            end
        end
    end

    // Square movement - updates once per full frame
    always @(posedge clk) begin
        if (btnC) begin
            sq_x <= 0;
            sq_y <= 0;

        end else if (x == H_TOTAL-1 && y == V_TOTAL-1) begin

            // Move left
            if (LEFT && !RIGHT)
                next_sq_x = (sq_x > 0) ? sq_x - 1 : 0;

            // Move right
            else if (RIGHT && !LEFT)
                next_sq_x = (sq_x < MAX_X) ? sq_x + 1 : MAX_X;

            // Move up
            if (UP && !DOWN)
                next_sq_y = (sq_y > 0) ? sq_y - 1 : 0;

            // Move down
            else if (DOWN && !UP)
                next_sq_y = (sq_y < MAX_Y) ? sq_y + 1 : MAX_Y;

            sq_x <= next_sq_x;
            sq_y <= next_sq_y;
        end
    end

    // Sync outputs
    always @(posedge clk) begin
        Hsync <= ~((x >= H_SYNC_START) && (x < H_SYNC_END));
        Vsync <= ~((y >= V_SYNC_START) && (y < V_SYNC_END));
    end

    // Draw square
always @(posedge clk) begin
    if (x < 1920 && y < 1080 &&
        x >= sq_x && x < sq_x + SQUARE_WIDTH &&
        y >= sq_y && y < sq_y + SQUARE_WIDTH) begin

        // if down button is pushed turn square blue
        if (btnD) begin
            vgaRed   <= 4'h0;
            vgaGreen <= 4'h0;
            vgaBlue  <= 4'hF;
        end
        
         else if (btnU) begin
            vgaRed   <= 4'hF;
            vgaGreen <= 4'h0;
            vgaBlue  <= 4'hF;
        end
        
         else if (btnL) begin
            vgaRed   <= 4'h0;
            vgaGreen <= 4'hF;
            vgaBlue  <= 4'h0;
        end
        
         else if (btnR) begin
            vgaRed   <= 4'h0;
            vgaGreen <= 4'hF;
            vgaBlue  <= 4'hF;
        end
        
        
        // otherwise, square is white
        else begin
            vgaRed   <= 4'hF;
            vgaGreen <= 4'hF;
            vgaBlue  <= 4'hF;
        end

    end else begin
        // Background = black
        vgaRed   <= 4'h0;
        vgaGreen <= 4'h0;
        vgaBlue  <= 4'h0;
    end
end


endmodule
