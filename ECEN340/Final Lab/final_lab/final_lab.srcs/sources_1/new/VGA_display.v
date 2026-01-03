module VGA_CONTROLLER (
    input wire clk,      // 100 MHz clock input (W5)
    input wire btnC,     // Reset button input (U18)
    
    // Outputs matching the XDC File
    output wire Hsync,   // P19
    output wire Vsync,   // R19
    output wire [3:0] vgaRed,
    output wire [3:0] vgaGreen,
    output wire [3:0] vgaBlue
);
    
    // --- Internal Signals ---
    wire pix_strobe; // The 25 MHz pixel clock signal
    wire h_sync_int, v_sync_int; // Internal sync signals from VGA_DRIVER
    wire [9:0] x_pos, x_draw;    // Coordinates from VGA_DRIVER
    wire [8:0] y_pos, y_draw;
    
    // The internal VGA_DRIVER is designed for a simple 1/4 clock division (100MHz -> 25MHz) 
    // using the accumulator 'cnt' and 'pix_strobe'. This is kept here for simplicity 
    // since you preferred the original structure, but remember the Clocking Wizard 
    // is the ideal way to generate pix_strobe.

    // 1. Clock Divider and Timing Core (VGA_DISPLAY)
    VGA_DISPLAY #(.CLK_FREQ_IN(100_000_000)) 
    VGA_TIMING_CORE (
        .clk(clk),
        .reset(btnC),           // Use btnC as the reset
        .v_sync(v_sync_int),    // Internal v_sync
        .h_sync(h_sync_int),    // Internal h_sync
        .x(x_pos),              // Current absolute X coordinate
        .y(y_pos),              // Current absolute Y coordinate
        .pix_strobe(pix_strobe) // Internal 25 MHz pixel strobe
    );
    
    // 2. Color Generator
    COLOR_GENERATOR V_COLOR (
        .clk(clk),              // Clock runs continuously
        .pix_strobe(pix_strobe),// Use the 25 MHz strobe
        .x_pos(x_pos),
        .y_pos(y_pos),
        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue)
    );
    
    // 3. Connect Internal Sync Signals to Pin Outputs
    // The pin names (Hsync, Vsync) must match the XDC file.
    assign Hsync = h_sync_int;
    assign Vsync = v_sync_int;
    
endmodule