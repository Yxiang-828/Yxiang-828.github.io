`timescale 1ns / 1ps
module led_lighting(
    input CLK,
    input pulse_1_11s,
    input [2:0] sw,
    input slow_1hz,
    input slow_10hz,
    input slow_100hz,
    output reg [14:0] LED_low,
    output max_led_on
);

reg [3:0] led_count = 0;

always @(posedge CLK) begin
    if (pulse_1_11s && led_count < 8) begin  // Stop at 8 to prevent overflow to 9
        led_count <= led_count + 1;
    end
end

assign max_led_on = (led_count >= 8);

always @(*) begin
    LED_low = 15'b0; // Default all LEDs off

    if (max_led_on) begin
        // Blinking phase: LD0-8 ON by default, override blinking LED based on priority
        LED_low[8:0] = 9'b111111111; // LD0-8 ON

        if (sw[2]) LED_low[2] = slow_100hz; // SW2 on: LD2 blinks (highest priority)
        if (sw[1] && !sw[2]) LED_low[1] = slow_10hz; // SW1 on, SW2 off: LD1 blinks
        if (sw[0] && !sw[1] && !sw[2]) LED_low[0] = slow_1hz; // SW0 on, SW1/SW2 off: LD0 blinks
        // If multiple on, higher priority wins; if none, all stay ON
        // LD9-14 stay off
    end else begin
        // Lighting phase: LD0 to led_count ON, others off
        case (led_count)
            0: LED_low[0] = 1;
            1: LED_low[1:0] = 2'b11;
            2: LED_low[2:0] = 3'b111;
            3: LED_low[3:0] = 4'b1111;
            4: LED_low[4:0] = 5'b11111;
            5: LED_low[5:0] = 6'b111111;
            6: LED_low[6:0] = 7'b1111111;
            7: LED_low[7:0] = 8'b11111111;
            8: LED_low[8:0] = 9'b111111111;
            default: LED_low = 15'b0;
        endcase
    end
end

endmodule