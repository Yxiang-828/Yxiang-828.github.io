`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT_P NAME: Ryan Koh Jun Hao
//
//////////////////////////////////////////////////////////////////////////////////

module debouncer (
    input  wire clk,
    input  wire btn_in,
    output reg  btn_out
);

    localparam integer DEBOUNCE_COUNT = 20_000_000 - 1;

    reg btn_ff = 0;
    reg [24:0] count = 0;
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

module single_pulse_detector (
    input CLOCK,
    input [4:0] btn_debounced_held,
    output reg [4:0] btn_pulse = 0
);
    reg [4:0] btn_prev = 5'b0; 

    always @ (posedge CLOCK) begin
        btn_prev <= btn_debounced_held;
        btn_pulse <= btn_debounced_held & (~btn_prev);
    end
endmodule

module toggle_switch (
    input CLOCK,
    input pulse,
    input run_en,
    output reg state = 0
);
    always @ (posedge CLOCK) begin
        if (~run_en) begin
            state <= 1'b0; 
        end else if (pulse) begin
            state <= ~state;
        end
    end
endmodule


module ram (
    input clk6p25m,
    input [12:0] pixel_index,
    input [15:0] draw_color,
    input draw_en,
    output reg [15:0] pixel_data_out = 0
);

    reg [15:0] memory [0:6143];
    
    always @ (posedge clk6p25m) begin
        pixel_data_out <= memory[pixel_index];
        
        if (draw_en) begin
            memory[pixel_index] <= draw_color;
        end
    end
endmodule



module seven_segment_generator (
    input [6:0] x,
    input [6:0] y,
    input [3:0] number_char,
    input [6:0] x_start,
    input [6:0] y_start,
    input [6:0] height,
    input [6:0] width,
    input [6:0] segment_width,
    output reg draw_pixel
);

    // Define the segment thickness based on the explicit input
    wire [6:0] SEG_W = segment_width;

    // --- X/Y Boundary Coordinates ---
    
    // Y-Coordinates for horizontal segment boundaries (Top, Middle, Bottom)
    wire [6:0] Y_TOP_SEG = y_start;
    wire [6:0] Y_MID_SEG = y_start + (height / 2) - (SEG_W / 2);
    wire [6:0] Y_BOT_SEG = y_start + height - SEG_W;

    // X-Coordinates for vertical segment boundaries (Left, Right)
    wire [6:0] X_LEFT_SEG  = x_start;
    wire [6:0] X_RIGHT_SEG = x_start + width - SEG_W;
    
    // --- Segment Checks (a through g) ---

    // Segment A (Top Horizontal)
    wire in_seg_A = (x >= X_LEFT_SEG) && (x <= X_RIGHT_SEG) && (y >= Y_TOP_SEG) && (y <= Y_TOP_SEG + SEG_W);

    // Segment B (Top Right Vertical)
    wire in_seg_B = (x >= X_RIGHT_SEG) && (x <= X_RIGHT_SEG + SEG_W) && (y >= Y_TOP_SEG) && (y <= Y_MID_SEG + SEG_W);

    // Segment C (Bottom Right Vertical)
    wire in_seg_C = (x >= X_RIGHT_SEG) && (x <= X_RIGHT_SEG + SEG_W) && (y >= Y_MID_SEG) && (y <= Y_BOT_SEG + SEG_W);

    // Segment D (Bottom Horizontal)
    wire in_seg_D = (x >= X_LEFT_SEG) && (x <= X_RIGHT_SEG + SEG_W) && (y >= Y_BOT_SEG) && (y <= Y_BOT_SEG + SEG_W);

    // Segment E (Bottom Left Vertical)
    wire in_seg_E = (x >= X_LEFT_SEG) && (x <= X_LEFT_SEG + SEG_W) && (y >= Y_MID_SEG) && (y <= Y_BOT_SEG + SEG_W);

    // Segment F (Top Left Vertical)
    wire in_seg_F = (x >= X_LEFT_SEG) && (x <= X_LEFT_SEG + SEG_W) && (y >= Y_TOP_SEG) && (y <= Y_MID_SEG + SEG_W);

    // Segment G (Middle Horizontal)
    wire in_seg_G = (x >= X_LEFT_SEG) && (x <= X_RIGHT_SEG + SEG_W) && (y >= Y_MID_SEG) && (y <= Y_MID_SEG + SEG_W);


    // --- Character Logic (Seven Segment Decoder) ---
    always @ (*) begin
        draw_pixel = 1'b0; // Default: Don't draw

        case (number_char)
            // 0: A, B, C, D, E, F
            4'd0: draw_pixel = in_seg_A | in_seg_B | in_seg_C | in_seg_D | in_seg_E | in_seg_F;
            
            // 1: B, C
            4'd1: draw_pixel = in_seg_B | in_seg_C;

            // 2: A, B, G, E, D
            4'd2: draw_pixel = in_seg_A | in_seg_B | in_seg_G | in_seg_E | in_seg_D;

            // 3: A, B, G, C, D
            4'd3: draw_pixel = in_seg_A | in_seg_B | in_seg_G | in_seg_C | in_seg_D;

            // 4: F, G, B, C
            4'd4: draw_pixel = in_seg_F | in_seg_G | in_seg_B | in_seg_C;

            // 5: A, F, G, C, D
            4'd5: draw_pixel = in_seg_A | in_seg_F | in_seg_G | in_seg_C | in_seg_D;

            // 6: A, F, G, E, C, D
            4'd6: draw_pixel = in_seg_A | in_seg_F | in_seg_G | in_seg_E | in_seg_C | in_seg_D;
            
            // 7: A, B, C
            4'd7: draw_pixel = in_seg_A | in_seg_B | in_seg_C;

            // 8: A, B, C, D, E, F, G
            4'd8: draw_pixel = in_seg_A | in_seg_B | in_seg_C | in_seg_D | in_seg_E | in_seg_F | in_seg_G;

            // 9: A, B, C, D, F, G
            4'd9: draw_pixel = in_seg_A | in_seg_B | in_seg_C | in_seg_D | in_seg_F | in_seg_G;
            
            default: draw_pixel = 1'b0; 
        endcase
    end
endmodule

module circle (
    input [6:0] x,
    input [6:0] y,
    input [6:0] x_centre,
    input [6:0] y_centre,
    input [6:0] radius,
    output reg draw_pixel
);
    
    wire signed [7:0] dx = x - x_centre;
    wire signed [7:0] dy = y - y_centre;
    
    wire [15:0] dx_sq = dx * dx;
    wire [15:0] dy_sq = dy * dy;
    
    wire [15:0] radius_sq = radius * radius;
    
    always @ (*) begin
        if (dx_sq + dy_sq < radius_sq) begin
            draw_pixel = 1'b1;
        end else begin
            draw_pixel = 1'b0;
        end
    end

endmodule

module drawer_logic (
    input [6:0] x,
    input [6:0] y,
    input [4:0] btn,
    input [4:0] state,
    output reg [15:0] draw_color
);

    localparam [15:0] COLOR_RED      = 16'hF800;
    localparam [15:0] COLOR_GREEN    = 16'h07E0;
    localparam [15:0] COLOR_MAGENTA  = 16'hF81F;
    localparam [15:0] COLOR_BLACK    = 16'h0000;
    localparam [15:0] COLOR_WHITE    = 16'hFFFF;
    
    wire is_in_2, is_in_9, is_in_circle;
    
    // 2 starts at (20, 8) has (height, width) of (45, 25) with segment width 6
    seven_segment_generator in_2(
        .x(x),
        .y(y),
        .number_char(4'd2),
        .x_start(7'd20),
        .y_start(7'd8),
        .height(7'd45),
        .width(7'd25),
        .segment_width(7'd6),
        .draw_pixel(is_in_2)
    );
    
    // 9 starts at (51, 8) has (height, width) of (45, 25) with segment width 6
    seven_segment_generator in_9(
        .x(x),
        .y(y),
        .number_char(4'd9),
        .x_start(7'd51),
        .y_start(7'd8),
        .height(7'd45),
        .width(7'd25),
        .segment_width(7'd6),
        .draw_pixel(is_in_9)
    );
    
    circle in_circle(
        .x(x),
        .y(y),
        .x_centre(7'd9),
        .y_centre(7'd9),
        .radius(7'd6),
        .draw_pixel(is_in_circle)
    );

    
    always @ (*) begin
        if (is_in_2 && ~state[2]) begin
            draw_color = COLOR_RED;
        end else if (is_in_9 && ~state[3]) begin
            draw_color = COLOR_GREEN;
        end else if (is_in_circle && (btn[2] | btn[3])) begin
            draw_color = COLOR_MAGENTA;
        end else if (is_in_circle && (~btn[2] && ~btn[3])) begin
            draw_color = COLOR_WHITE; 
        end else begin
            draw_color = COLOR_BLACK;
        end
    end


endmodule

module drawer_control (
    input clk6p25m,
    input [12:0] pixel_index,
    input [15:0] current_color,
    input [4:0] btn,
    input [4:0] state,
    
    output reg draw_en,
    output reg [15:0] draw_color_out
);
    
    localparam WIDTH = 96;
    localparam HEIGHT = 64;
    
    localparam BLACK_COLOR = 16'h0000;
    
    wire [6:0] pixel_X = pixel_index % WIDTH;
    wire [6:0] pixel_Y = pixel_index / WIDTH;
    wire [15:0] draw_color;
    
    drawer_logic to_draw(
        .x(pixel_X),
        .y(pixel_Y),
        .btn(btn),
        .state(state),
        .draw_color(draw_color)
    );
    
    always @ (posedge clk6p25m) begin
        begin 
            if (current_color != draw_color) begin
                draw_en <= 1'b1;
                draw_color_out <= draw_color;
            end else begin
                draw_en <= 1'b0;
                draw_color_out <= BLACK_COLOR;
            end
        end
    end
endmodule

module Task_P (
    input CLOCK,
    input clk6p25m,
    input flag,
    input [12:0] pixel_index,
    input [4:0] btn,
    output [15:0] oled_data
);

    // Button debouncer to reset screen
    
    wire btn_debounced_L, btn_debounced_R;
    wire [4:0] btn_debounced;
    debouncer debouncerL (.clk(CLOCK), .btn_in(btn[2]), .btn_out(btn_debounced_L));
    debouncer debouncerR (.clk(CLOCK), .btn_in(btn[3]), .btn_out(btn_debounced_R));
    
    assign btn_debounced = {btn[4], btn_debounced_R, btn_debounced_L, btn[1:0]};
    
    wire [4:0] btn_pulse;
    single_pulse_detector pulse_gen (
        .CLOCK(CLOCK),
        .btn_debounced_held(btn_debounced),
        .btn_pulse(btn_pulse)
    );

    wire toggle_2, toggle_9;

    toggle_switch toggle_2_inst (
        .CLOCK(CLOCK),
        .pulse(btn_pulse[2]),
        .run_en(flag),
        .state(toggle_2)
    );
    
    toggle_switch toggle_9_inst (
        .CLOCK(CLOCK),
        .pulse(btn_pulse[3]),
        .run_en(flag),
        .state(toggle_9)
    );
    
    wire [15:0] current_color;
    
    wire draw_en;
    wire [15:0] ram_draw_color;
    
    ram memory (
        .clk6p25m(clk6p25m),
        .pixel_index(pixel_index),
        .draw_color(ram_draw_color),
        .draw_en(draw_en & flag),
        .pixel_data_out(oled_data)
    );
    
    assign current_color = oled_data;

    drawer_control drawer(
        .clk6p25m(clk6p25m),
        .pixel_index(pixel_index),
        .current_color(current_color),
        .btn(btn),
        .state({btn_debounced[4], toggle_9, toggle_2, btn_debounced[1:0]}),
        
        .draw_en(draw_en),
        .draw_color_out(ram_draw_color)
    );
    
endmodule