`timescale 1ns / 1ps

module lab3_top(
    input CLK,          // 100 MHz clock
    input [2:0] sw,     // Switches SW0, SW1, SW2
    input btnC, btnD, btnL, btnR,  // Buttons
    output [15:0] led,  // LEDs LD0-LD15
    output [3:0] an,    // Seven-segment anodes (4)
    output [6:0] seg    // Seven-segment segments
);

// Internal signals
wire pulse_1_11s;
wire slow_1hz, slow_10hz, slow_100hz;
wire max_led_on;
wire [14:0] LED_low;
wire [3:0] BTN = {btnL, btnR, btnD, btnC};  // BTN[3]=btnL, BTN[2]=btnR, BTN[1]=btnD, BTN[0]=btnC

// Instantiate time_counter for 1.11s pulse
time_counter tc(
    .CLK(CLK),
    .pulse_1_11s(pulse_1_11s)
);

// Instantiate slow_clocks for blinking
slow_clocks sc(
    .CLK(CLK),
    .slow_1hz(slow_1hz),
    .slow_10hz(slow_10hz),
    .slow_100hz(slow_100hz)
);

// Instantiate led_lighting for Subtask A
led_lighting ll(
    .CLK(CLK),
    .pulse_1_11s(pulse_1_11s),
    .sw(sw),
    .slow_1hz(slow_1hz),
    .slow_10hz(slow_10hz),
    .slow_100hz(slow_100hz),
    .LED_low(LED_low),
    .max_led_on(max_led_on)
);

// Instantiate seven_seg_unlock for Subtask B
seven_seg_unlock ssu(
    .CLK(CLK),
    .BTN(BTN),
    .max_led_on(max_led_on),
    .an(an),
    .seg(seg),
    .LED15(led[15])
);

// Combine LED_low and LED15
assign led[14:0] = LED_low;

endmodule