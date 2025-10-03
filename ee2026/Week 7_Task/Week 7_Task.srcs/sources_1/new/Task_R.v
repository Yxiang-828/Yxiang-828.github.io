`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT_R NAME: Yi Yang
//
//////////////////////////////////////////////////////////////////////////////////

module draw_rectangle(
    input [6:0] x, 
    input [5:0] y,
    input [6:0] x_start,
    input [6:0] x_end ,
    input [5:0] y_start, 
    input [5:0] y_end, 
    input [15:0] colour,
    output reg [15:0] pixel_data
);
    always @(*) begin 
        if (x < x_end && x > x_start && y > y_start && y < y_end) pixel_data = colour;
        else pixel_data = 16'h0000;
    end
endmodule

module draw_5(
    input [5:0] y,
    input [6:0] x,
    input [15:0] colour,
    input signed [6:0] var_y,
    output reg [15:0] pixel_data
);
    //A
    wire [6:0] x_start1 = 36; 
    wire [6:0] x_end1 = 57;
    wire [5:0] y_start1 = var_y; 
    wire [5:0] y_end1 = 5 + var_y;
    //F
    wire [6:0] x_start5 = 36; 
    wire [6:0] x_end5 = 41;
    wire [5:0] y_start5 = 4 + var_y; 
    wire [5:0] y_end5 = 14 + var_y;
    //G
    wire [6:0] x_start2 = 36; 
    wire [6:0] x_end2 = 57;
    wire [5:0] y_start2 = 13 + var_y; 
    wire [5:0] y_end2 = 18 + var_y;
    //C
    wire [6:0] x_start3 = 52; 
    wire [6:0] x_end3 = 57;
    wire [5:0] y_start3 = 17 + var_y; 
    wire [5:0] y_end3 =27 + var_y;
    //G
    wire [6:0] x_start4 = 36; 
    wire [6:0] x_end4 = 57;
    wire [5:0] y_start4 = 26 + var_y; 
    wire [5:0] y_end4 = 31 + var_y;
    
    wire [15:0] pix1, pix2, pix3, pix4, pix5;
    
    draw_rectangle five1 (.x(x), .y(y), .x_start(x_start1),.x_end(x_end1) ,.y_start(y_start1), .y_end(y_end1),.colour(colour), .pixel_data(pix1));
    draw_rectangle five2 (.x(x), .y(y), .x_start(x_start2),.x_end(x_end2) ,.y_start(y_start2), .y_end(y_end2), .colour(colour),.pixel_data(pix2));
    draw_rectangle five3 (.x(x), .y(y), .x_start(x_start3),.x_end(x_end3) ,.y_start(y_start3), .y_end(y_end3),.colour(colour), .pixel_data(pix3));
    draw_rectangle five4 (.x(x), .y(y), .x_start(x_start4),.x_end(x_end4) ,.y_start(y_start4), .y_end(y_end4),.colour(colour), .pixel_data(pix4));
    draw_rectangle five5 (.x(x), .y(y), .x_start(x_start5),.x_end(x_end5) ,.y_start(y_start5), .y_end(y_end5),.colour(colour), .pixel_data(pix5));
    
    always @* begin
        if (pix1 != 16'h0000) pixel_data = pix1;
        else if (pix2 != 16'h0000) pixel_data = pix2;
        else if (pix3 != 16'h0000) pixel_data = pix3;
        else if (pix4 != 16'h0000) pixel_data = pix4;
        else if (pix5 != 16'h0000) pixel_data = pix5;
        else pixel_data = 16'h0000; 
    end
endmodule

module draw_8(input [5:0]y,
    input [15:0] colour,
    input [6:0] x,
    input signed [7:0] var_x,
    output reg [15:0] pixel_data
);
    //A
    wire [6:0] x_start6 = 0 + var_x; 
    wire [6:0] x_end6 = 21 + var_x;
    wire [5:0] y_start6 = 15; 
    wire [5:0] y_end6 = 20;
    //LEFY
    wire [6:0] x_start7 = 0 + var_x; 
    wire [6:0] x_end7 = 5 + var_x;
    wire [5:0] y_start7 = 15; 
    wire [5:0] y_end7 = 47;
    //G
    wire [6:0] x_start8 = var_x; 
    wire [6:0] x_end8 = 21 + var_x;
    wire [5:0] y_start8 = 28; 
    wire [5:0] y_end8 = 33;
    //LEFT
    wire [6:0] x_start9 = 16 + var_x; 
    wire [6:0] x_end9 = 21 + var_x;
    wire [5:0] y_start9 = 15; 
    wire [5:0] y_end9 = 47;
    //D
    wire [6:0] x_start10 = var_x; 
    wire [6:0] x_end10 = 21 + var_x;
    wire [5:0] y_start10 = 42; 
    wire [5:0] y_end10 = 47;
    
    wire [15:0] pix6, pix7, pix8, pix9, pix10;
    
    draw_rectangle eight1 (.x(x), .y(y), .x_start(x_start10),.x_end(x_end10) ,.y_start(y_start10), .y_end(y_end10),.colour(colour), .pixel_data(pix10));
    draw_rectangle eight2 (.x(x), .y(y), .x_start(x_start9),.x_end(x_end9) ,.y_start(y_start9), .y_end(y_end9), .colour(colour),.pixel_data(pix9));
    draw_rectangle eight3 (.x(x), .y(y), .x_start(x_start8),.x_end(x_end8) ,.y_start(y_start8), .y_end(y_end8), .colour(colour),.pixel_data(pix8));
    draw_rectangle eight4 (.x(x), .y(y), .x_start(x_start7),.x_end(x_end7) ,.y_start(y_start7), .y_end(y_end7), .colour(colour),.pixel_data(pix7));
    draw_rectangle eight5 (.x(x), .y(y), .x_start(x_start6),.x_end(x_end6) ,.y_start(y_start6), .y_end(y_end6),.colour(colour), .pixel_data(pix6));
    
    always @* begin
        if (pix10 != 16'h0000) pixel_data = pix10;
        else if (pix9 != 16'h0000) pixel_data = pix9;
        else if (pix8 != 16'h0000) pixel_data = pix8;
        else if (pix7 != 16'h0000) pixel_data = pix7;
        else if (pix6 != 16'h0000) pixel_data = pix6;
        else pixel_data = 16'h0000; 
    end
    
endmodule

module Task_R (
    input basys_clock, 
    input [12:0] pixel_index,
    input [1:0] sw,
    input flag,
    output reg [15:0] digit_pix
);

    wire clk_10Hz;
    wire clk_23Hz; wire clk_6Hz;
    flexible_timer Hz23(basys_clock, 23, clk_23Hz);
    flexible_timer Hz6(basys_clock, 6, clk_6Hz);
    
    flexible_timer Hz10(basys_clock, 10, clk_10Hz);
    
    wire [6:0] x;
    wire [5:0] y;
    
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;
    
    wire [15:0] pix5, pix8;
    reg signed [7:0] var_x, var_y;
    reg direc5 = 1; 
    reg direc8 = 1;
    draw_5 d5(.x(x), .y(y),.var_y(var_y),.colour(16'hFD20), .pixel_data(pix5));
    draw_8 d8(.x(x), .y(y),.var_x(var_x),.colour(16'h07FF), .pixel_data(pix8));
    
    always @(*) begin
        if (pix5 != 16'h0000) digit_pix = pix5;
        else if (pix8 != 16'h0000) digit_pix = pix8;
        else digit_pix = 16'h0000;
    end
    
    always @ (posedge clk_6Hz) begin 
        if (~flag) begin
            var_y <= 0;
            direc5<= 1;
        end else begin
            if (sw[0]) begin 
                if (direc5) var_y <= var_y + 1;
                else var_y <= var_y - 1;
                if (var_y > 30) direc5 <= 0;
                if (var_y < 2) direc5 <= 1;
            end 
        end
    end
    
    always @ (posedge clk_23Hz) begin 
        if (~flag) begin
            var_x <= 0;
            direc8 <= 1;
        end else begin
            if (sw[1]) begin 
                if (direc8) var_x <= var_x + 1;
                else var_x <= var_x - 1;
                if (var_x > 72) direc8 <= 0;
                if (var_x < 2) direc8 <= 1;
            end 
        end
    end 

endmodule