`timescale 1ns / 1ps

module display_handler(
    input clk,
    input [15:0] oled_data_b,
    input [15:0] oled_data_c,
    output [12:0] pixel_index_b,
    output [12:0] pixel_index_c,
    output [7:0] JB,
    output [7:0] JC
);
    
    wire clk6p25m;
    flexible_timer clk_6p25m(
        .CLOCK(clk),
        .frequency(32'd6250000), 
        .SLOW_CLOCK(clk6p25m)
    );
    
    Oled_Display oled_b(
        .clk(clk6p25m), 
        .pixel_index(pixel_index_b),
        .pixel_data(oled_data_b),
        .cs(JB[0]), 
        .sdin(JB[1]), 
        .sclk(JB[3]), 
        .d_cn(JB[4]), 
        .resn(JB[5]), 
        .vccen(JB[6]),
        .pmoden(JB[7])
    );
    
    Oled_Display oled_c(
        .clk(clk6p25m), 
        .pixel_index(pixel_index_c),
        .pixel_data(oled_data_c),
        .cs(JC[0]), 
        .sdin(JC[1]), 
        .sclk(JC[3]), 
        .d_cn(JC[4]), 
        .resn(JC[5]), 
        .vccen(JC[6]),
        .pmoden(JC[7])
    );
    
endmodule
