// This module MUST be set as the Top-Level Entity in Vivado.
module TOP_1080P_VGA (
    // Clock Input from Basys 3 Pin W5
    input wire clk, 
    
    // Reset Input from Basys 3 Pin U18 (btnC)
    input wire btnC,     
    
    // VGA Outputs (Matching XDC and Pinout)
    output wire Hsync,
    output wire Vsync,
    output wire [3:0] vgaRed,
    output wire [3:0] vgaGreen,
    output wire [3:0] vgaBlue
);

    // Wire to receive the clean 148.5 MHz clock from the Clocking Wizard
    wire clk_148_5mhz_stable;
    
    // --- 1. Clock Management Instance ---
    // You MUST generate a Clocking Wizard IP in Vivado (MMCM/PLL) 
    // configured for 100MHz Input -> 148.5MHz Output.
    // Replace 'clk_wiz_148_5mhz' with the actual name Vivado generates!
    clk_wiz_0 CLOCK_GEN (
        // Clock Outputs
        .clk_out1(clk_148_5mhz_stable), 
        // Control Signals
        .reset(btnC),                  // Reset the clocking structure with btnC
        // Clock Input
        .clk_in1(clk)        // 100 MHz input from Basys 3
    );

    // --- 2. VGA Controller Instance ---
    // The 'square' module performs the 1080p counter and drawing logic.
    square VGA_CONTROLLER (
        .clk(clk_148_5mhz_stable), // Use the stable, high-speed clock
        .btnC(btnC),               // Use btnC as the reset for the VGA logic
        
        // Output Connections
        .Hsync(Hsync),
        .Vsync(Vsync),
        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue)
    );

endmodule