`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT_Q NAME: Sean
//
//////////////////////////////////////////////////////////////////////////////////


module Task_Q(
    input clk,          // 6.25Mhz clk
    input clkhundred,       // 100 Mhz clk for debouncer
    input flag,         // flag to run program
    input btnL,         // left button
    input btnC,         // center button
    input btnR,         // right button
    input [12:0] pixel_index,  // pixel index from Oled_Display
    output [15:0] oled_data     // OLED signals
);
    
    // 200ms debouncer
    wire btnL_db, btnC_db, btnR_db;
    debounce_btn_q dbL (.clk(clkhundred), .btn_in(btnL), .btn_out(btnL_db));
    debounce_btn_q dbC (.clk(clkhundred), .btn_in(btnC), .btn_out(btnC_db));
    debounce_btn_q dbR (.clk(clkhundred), .btn_in(btnR), .btn_out(btnR_db));

    // initialise start colours
    reg [2:0] color_idx_left  = 0; // start red
    reg [2:0] color_idx_mid   = 3; // start green
    reg [2:0] color_idx_right = 1; // start blue

    // hardcode start sequence
    localparam [2:0] target_left  = 3;  // Green
    localparam [2:0] target_mid   = 1;  // Blue
    localparam [2:0] target_right = 2;  // Yellow
    
    // each button press cycles the sequenc;
    always @(posedge clkhundred) begin
        if (~flag) begin
            color_idx_left  <= 0;
            color_idx_mid   <= 3;
            color_idx_right <= 1;
        end else begin
            if (btnL_db)  color_idx_left  <= (color_idx_left  == 4) ? 0 : color_idx_left + 1;
            if (btnC_db)  color_idx_mid   <= (color_idx_mid   == 4) ? 0 : color_idx_mid + 1;
            if (btnR_db)  color_idx_right <= (color_idx_right == 4) ? 0 : color_idx_right + 1;
        end
    end
      

    wire match; // if sequence of colours match, display 4th Rmost student number
    assign match = (color_idx_left  == target_left) && (color_idx_mid   == target_mid) && (color_idx_right == target_right);

    drawer_q drawer_inst (
        .pixel_index(pixel_index),
        .color_idx_left(color_idx_left),
        .color_idx_mid(color_idx_mid),
        .color_idx_right(color_idx_right),
        .match(match),
        .oled_data(oled_data)
    );

endmodule


module debounce_btn_q (
    input  wire clk,      // 100 MHz clock
    input  wire btn_in,   // raw button input
    output reg  btn_out
);

    localparam integer DEBOUNCE_COUNT = 20_000_000 - 1; // 200 ms at 100 MHz

    reg btn_ff = 0;             // flip-flop to store button press state
    reg [24:0] count = 0;       // debounce counter
    reg btn_sync = 0;

    // synchronize raw button input
    always @(posedge clk) begin
        btn_sync <= btn_in;
    end

    always @(posedge clk) begin
        btn_out <= 0;  // default to low
        
        // once btn_ff set to high for first button press, sets btn signal to 1,and 0 in next clk cycle
        // btn_out stays at 0 untill user releases button, once the release is stable for 200ms,
        // we clear btn_ff to get ready for next button press.
        if (!btn_ff && btn_sync) begin
            // rising edge detected, initial press
            btn_out <= 1;    // register inital press
            btn_ff <= 1;     // set flip-flop to block further pulses, untill released & stable for >200ms
            count <= 0;      // start counting debounce period
        end
        // flip flop is now high at 1, it will hold the output to 0 now
        else if (btn_ff) begin
            if (btn_sync) begin
                // button being held down, hold infinitely untill button released for >200ms
                count <= count;
            end 
            
            else begin
                // button released, count 200 ms before resetting flip-flop
                if (count < DEBOUNCE_COUNT)
                    count <= count + 1;
                else
                    btn_ff <= 0; // ready for next press
            end
        end
    end
endmodule

module drawer_q (
    input  wire [12:0] pixel_index,     // pixel index from OLED driver
    input  wire [2:0]  color_idx_left,  // left square color index
    input  wire [2:0]  color_idx_mid,   // middle square color index
    input  wire [2:0]  color_idx_right, // right square color index
    input  wire match,                  // condition for top-right "7"
    output reg  [15:0] oled_data        // pixel color output
);
    parameter WIDTH  = 96;
    parameter HEIGHT = 64;
    
    // Colours
    localparam [15:0] RED     = 16'hF800;
    localparam [15:0] BLUE    = 16'h001F;
    localparam [15:0] GREEN   = 16'h07E0;
    localparam [15:0] YELLOW  = 16'hFFE0;
    localparam [15:0] WHITE   = 16'hFFFF;
    localparam [15:0] MAGENTA = 16'hF81F;
    localparam [15:0] BLACK   = 16'h0000;

    // Map color index ? color
    function [15:0] color_seq;
        input [2:0] idx;
        begin
            case(idx)
                0: color_seq = RED;
                1: color_seq = BLUE;
                2: color_seq = YELLOW;
                3: color_seq = GREEN;
                4: color_seq = WHITE;
                default: color_seq = BLACK;
            endcase
        end
    endfunction

    // Pixel coordinates
    wire [6:0] x = pixel_index % WIDTH;
    wire [6:0] y = pixel_index / WIDTH;

    // Top-right "7" logic
    wire draw7;
    assign draw7 = match && (
        // Top horizontal line of "7"
        (y < 2 && x >= 85 && x < 90) ||
        // Diagonal / right vertical of "7"
        (x >= 88 && x < 90 && y >= 2 && y < 10)
    );

    always @(*) begin
        oled_data = BLACK;  // default background

        // Bottom-left 20x20 square
        if(x >= 0 && x < 20 && y >= 44 && y < 64)
            oled_data = color_seq(color_idx_left);

        // Bottom-middle 20x20 square
        if(x >= 38 && x < 58 && y >= 44 && y < 64)
            oled_data = color_seq(color_idx_mid);

        // Bottom-right 20x20 square
        if(x >= 76 && x < 96 && y >= 44 && y < 64)
            oled_data = color_seq(color_idx_right);

        // Top-right "7"
        if(draw7)
            oled_data = MAGENTA;
    end
endmodule