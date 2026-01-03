module sseg(
    input [3:0] switches,
    output reg [6:0] led_layout
);

    always @(*) begin
        // 7-segment pattern lookup
        case (switches)
            4'd0:  led_layout = 7'b1000000;
            4'd1:  led_layout = 7'b1111001;
            4'd2:  led_layout = 7'b0100100;
            4'd3:  led_layout = 7'b0110000;
            4'd4:  led_layout = 7'b0011001;
            4'd5:  led_layout = 7'b0010010;
            4'd6:  led_layout = 7'b0000010;
            4'd7:  led_layout = 7'b1111000;
            4'd8:  led_layout = 7'b0000000;
            4'd9:  led_layout = 7'b0011000;
            4'd10: led_layout = 7'b0001000;
            4'd11: led_layout = 7'b0000011;
            4'd12: led_layout = 7'b1000110;
            4'd13: led_layout = 7'b0100001;
            4'd14: led_layout = 7'b0000110;
            4'd15: led_layout = 7'b0001110;
            default: led_layout = 7'b1111111;
        endcase
    end

endmodule
