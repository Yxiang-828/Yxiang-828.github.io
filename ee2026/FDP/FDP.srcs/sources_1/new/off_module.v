`timescale 1ns / 1ps

module off_module(
    output [15:0] off_screen_b,
    output [15:0] off_screen_c,
    output [3:0] an,
    output [7:0] seg
);

    assign off_screen_b = 16'b0;
    assign off_screen_c = 16'b0;
    
    assign an = 4'b1111;
    assign seg = 8'b11111111;

endmodule