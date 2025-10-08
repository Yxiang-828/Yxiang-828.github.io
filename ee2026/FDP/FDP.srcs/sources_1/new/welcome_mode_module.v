module welcome_drawer_b(
    input [12:0] pixel_index,
    output draw_pixel
);
    // --- Screen/Drawing Parameters ---
    localparam SCREEN_WIDTH = 7'd96;
    localparam SCREEN_HEIGHT = 7'd64;

    // Character Dimensions
    localparam CHAR_W = 7'd7;
    localparam CHAR_H = 7'd14;

    // Y Start
    localparam ROW_1_Y = 7'd12;
    localparam ROW_2_Y = 7'd37;

    // Coordinate Calculation
    reg [6:0] x_coord, y_coord;

    always @ (*) begin
        x_coord = pixel_index % SCREEN_WIDTH;
        y_coord = pixel_index / SCREEN_WIDTH;
    end


    // Drawing Wires (Output of each character instance)
    wire [15:0] draw_pixels;

    // E
    fourteen_segment_drawer char_inst_0 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd14),
        .x_start(7'd22),
        .y_start(ROW_1_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[0])
    );

    // E
    fourteen_segment_drawer char_inst_1 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd14),
        .x_start(7'd31),
        .y_start(ROW_1_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[1])
    );

    // 2
    fourteen_segment_drawer char_inst_2 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd2),
        .x_start(7'd40),
        .y_start(ROW_1_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[2])
    );

    // 0
    fourteen_segment_drawer char_inst_3 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd0),
        .x_start(7'd49),
        .y_start(ROW_1_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[3])
    );

    // 2
    fourteen_segment_drawer char_inst_4 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd2),
        .x_start(7'd58),
        .y_start(ROW_1_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[4])
    );

    // 6
    fourteen_segment_drawer char_inst_5 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd6),
        .x_start(7'd67),
        .y_start(ROW_1_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[5])
    );

    // C
    fourteen_segment_drawer char_inst_6 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd12),
        .x_start(7'd4),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[6])
    );

    // A
    fourteen_segment_drawer char_inst_7 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd10),
        .x_start(7'd13),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[7])
    );

    // L
    fourteen_segment_drawer char_inst_8 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd21),
        .x_start(7'd22),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[8])
    );

    // C
    fourteen_segment_drawer char_inst_9 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd12),
        .x_start(7'd31),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[9])
    );

    // U
    fourteen_segment_drawer char_inst_10 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd30),
        .x_start(7'd40),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[10])
    );

    // L
    fourteen_segment_drawer char_inst_11 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd21),
        .x_start(7'd49),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[11])
    );

    // A
    fourteen_segment_drawer char_inst_12 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd10),
        .x_start(7'd58),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[12])
    );

    // T
    fourteen_segment_drawer char_inst_13 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd29),
        .x_start(7'd67),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[13])
    );

    // O
    fourteen_segment_drawer char_inst_14 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd24),
        .x_start(7'd76),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[14])
    );

    // R
    fourteen_segment_drawer char_inst_15 (
        .x(x_coord),
        .y(y_coord),
        .character(6'd27),
        .x_start(7'd85),
        .y_start(ROW_2_Y),
        .height(CHAR_H),
        .width(CHAR_W),
        .draw_pixel(draw_pixels[15])
    );

    // Final Output
    assign draw_pixel = draw_pixels[0] | draw_pixels[1] | draw_pixels[2] |
                        draw_pixels[3] | draw_pixels[4] | draw_pixels[5] |
                        draw_pixels[6] | draw_pixels[7] | draw_pixels[8] |
                        draw_pixels[9] | draw_pixels[10] | draw_pixels[11] |
                        draw_pixels[12] | draw_pixels[13] | draw_pixels[14] |
                        draw_pixels[15];

endmodule

module welcome_drawer_c(
    input [12:0] pixel_index,
    output reg draw_pixel = 0
);

endmodule

module welcome_mode_module (
    input reset,
    input  [1:0]  current_main_mode,    // Control signal to select the display content
    input  [12:0] pixel_index_b,        // Pixel index for screen B
    input  [12:0] pixel_index_c,        // Pixel index for screen C
    output reg [15:0] oled_data_b,      // Output pixel data for screen B
    output reg [15:0] oled_data_c       // Output pixel data for screen C
);

    localparam MODE_WELCOME = 2'b00;

    wire draw_pixel_b, draw_pixel_c;

    welcome_drawer_b welcome_drawer_b_inst (
        .pixel_index(pixel_index_b),
        .draw_pixel(draw_pixel_b)
    );

    welcome_drawer_c welcome_drawer_c_inst (
            .pixel_index(pixel_index_c),
            .draw_pixel(draw_pixel_c)
        );

    localparam TEXT_COLOR = 16'hFFFF;
    localparam BG_COLOR = 16'h0000;

    always @ (*) begin
        if (~reset & current_main_mode == MODE_WELCOME) begin
            if (draw_pixel_b) begin
                oled_data_b = TEXT_COLOR;
            end else begin
                oled_data_b = BG_COLOR;
            end
            if (draw_pixel_c) begin
                oled_data_c = TEXT_COLOR;
            end else begin
                oled_data_c = BG_COLOR;
            end
        end else begin
            oled_data_b = BG_COLOR;
            oled_data_c = BG_COLOR;
        end
    end

endmodule
