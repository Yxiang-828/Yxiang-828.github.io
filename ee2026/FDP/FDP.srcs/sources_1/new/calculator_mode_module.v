// CONVERT 4-DIGIT BCD TO BINARY NUMBER
module bcd_to_bin_converter(
    input  [15:0] bcd_in,
    output [13:0] bin_out
);
    assign bin_out = bcd_in[15:12] * 14'd1000 + bcd_in[11:8] * 14'd100 + bcd_in[7:4] * 14'd10 + bcd_in[3:0];
endmodule


// CONVERT BINARY NUMBER TO 8-DIGIT BCD SIGNED NUMBER
module bin_to_bcd_converter(
    input         enable,
    input  [27:0] bin_in,   // 28-bit Binary Input
    output reg [32:0] bcd_out   // 33-bit BCD Output (8 digits + sign)
);
    reg [35:0] bcd_temp;
    reg [27:0] bin_temp;
    integer i;

    always @(*) begin
        if (enable) begin
            bcd_temp = 36'd0;
            bin_temp = bin_in[26:0];
            for (i = 26; i >= 0; i = i - 1) begin
                // Adjust digits >=5
                if (bcd_temp[3:0] >= 5) bcd_temp[3:0] = bcd_temp[3:0] + 3;
                if (bcd_temp[7:4] >= 5) bcd_temp[7:4] = bcd_temp[7:4] + 3;
                if (bcd_temp[11:8] >= 5) bcd_temp[11:8] = bcd_temp[11:8] + 3;
                if (bcd_temp[15:12] >= 5) bcd_temp[15:12] = bcd_temp[15:12] + 3;
                if (bcd_temp[19:16] >= 5) bcd_temp[19:16] = bcd_temp[19:16] + 3;
                if (bcd_temp[23:20] >= 5) bcd_temp[23:20] = bcd_temp[23:20] + 3;
                if (bcd_temp[27:24] >= 5) bcd_temp[27:24] = bcd_temp[27:24] + 3;
                if (bcd_temp[31:28] >= 5) bcd_temp[31:28] = bcd_temp[31:28] + 3;
                // Shift left
                bcd_temp = bcd_temp << 1;
                // Set LSB
                bcd_temp[0] = bin_temp[i];
            end
            bcd_out = {bin_in[27], bcd_temp[31:0]};
        end else begin
            bcd_out = 33'h0;
        end
    end
endmodule


// ARITHMETIC LOGIC UNIT
module calculator_module(
    input enable,
    input clk,                   // System Clock (Needed for sequential operations like DIV/MUL)
    input [3:0] sw,              // Operation Select Switches (e.g., sw[0]=+, sw[1]=-, sw[2]=*, sw[3]=/)
    input [13:0] number1,        // 14-bit Binary Operand A (Max 9999)
    input [13:0] number2,        // 14-bit Binary Operand B (Max 9999)
    output reg [27:0] calculated_number, // 28-bit Signed Result ([27]=Sign, [26:0]=Magnitude)
    output reg error_flag        // Error Flag (Div by Zero, etc.)
);

    always @(posedge clk) begin
        if (enable) begin
            error_flag <= 1'b0;
            case (sw)
                2'b00: begin // Addition
                    calculated_number <= {1'b0, number1 + number2};
                end
                2'b01: begin // Subtraction
                    if (number1 >= number2) begin
                        calculated_number <= {1'b0, number1 - number2};
                    end else begin
                        calculated_number <= {1'b1, number2 - number1};
                    end
                end
                2'b10: begin // Multiplication
                    calculated_number <= {1'b0, number1 * number2};
                end
                2'b11: begin // Division
                    if (number2 == 0) begin
                        error_flag <= 1'b1;
                        calculated_number <= 28'd0;
                    end else begin
                        calculated_number <= {1'b0, number1 / number2};
                    end
                end
                default: begin
                    calculated_number <= 28'd0;
                end
            endcase
        end else begin
            calculated_number <= 28'd0;
            error_flag <= 1'b0;
        end
    end

endmodule


// DRAW LOGIC
module calculator_drawer_b(
    input [12:0] pixel_index,
    input [1:0] sub_mode,
    input [3:0] sw,
    input [15:0] number1_bcd,
    input [15:0] number2_bcd,
    input [32:0] calculated_number_bcd,
    input error_flag,
    output draw_pixel
);

    wire [6:0] x = pixel_index % 96;
    wire [6:0] y = pixel_index / 96;

    // Character dimensions (matching welcome_mode_module)
    localparam CHAR_W = 7'd7;
    localparam CHAR_H = 7'd14;
    localparam DIGIT_Y = 7'd10; // Y position for digits
    localparam TEXT_Y = 7'd25;  // Y position for text

    // Mode definitions
    localparam MODE_INSTRUCTIONS = 2'b00;
    localparam MODE_NUMBER1 = 2'b01;
    localparam MODE_NUMBER2 = 2'b10;
    localparam MODE_CALCULATE = 2'b11;

    // Drawing wires
    wire draw_instructions, draw_number1, draw_number2, draw_result;

    // INSTRUCTIONS MODE: Draw "CALC" text
    wire draw_c, draw_a, draw_l, draw_c2;
    fourteen_segment_drawer c_drawer (
        .x(x), .y(y), .character(6'd12), // 'C'
        .x_start(7'd10), .y_start(TEXT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_c)
    );
    fourteen_segment_drawer a_drawer (
        .x(x), .y(y), .character(6'd10), // 'A'
        .x_start(7'd18), .y_start(TEXT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_a)
    );
    fourteen_segment_drawer l_drawer (
        .x(x), .y(y), .character(6'd21), // 'L'
        .x_start(7'd26), .y_start(TEXT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_l)
    );
    fourteen_segment_drawer c2_drawer (
        .x(x), .y(y), .character(6'd12), // 'C'
        .x_start(7'd34), .y_start(TEXT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_c2)
    );
    assign draw_instructions = draw_c | draw_a | draw_l | draw_c2;

    // NUMBER1 MODE: Draw number1_bcd as 4 digits
    wire [3:0] digit0 = number1_bcd[3:0];
    wire [3:0] digit1 = number1_bcd[7:4];
    wire [3:0] digit2 = number1_bcd[11:8];
    wire [3:0] digit3 = number1_bcd[15:12];

    wire draw_digit0, draw_digit1, draw_digit2, draw_digit3;
    fourteen_segment_drawer digit0_drawer (
        .x(x), .y(y), .character({2'b0, digit0}),
        .x_start(7'd10), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit0)
    );
    fourteen_segment_drawer digit1_drawer (
        .x(x), .y(y), .character({2'b0, digit1}),
        .x_start(7'd18), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit1)
    );
    fourteen_segment_drawer digit2_drawer (
        .x(x), .y(y), .character({2'b0, digit2}),
        .x_start(7'd26), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit2)
    );
    fourteen_segment_drawer digit3_drawer (
        .x(x), .y(y), .character({2'b0, digit3}),
        .x_start(7'd34), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit3)
    );
    assign draw_number1 = draw_digit0 | draw_digit1 | draw_digit2 | draw_digit3;

    // NUMBER2 MODE: Draw number2_bcd as 4 digits
    wire [3:0] digit0_2 = number2_bcd[3:0];
    wire [3:0] digit1_2 = number2_bcd[7:4];
    wire [3:0] digit2_2 = number2_bcd[11:8];
    wire [3:0] digit3_2 = number2_bcd[15:12];

    wire draw_digit0_2, draw_digit1_2, draw_digit2_2, draw_digit3_2;
    fourteen_segment_drawer digit0_2_drawer (
        .x(x), .y(y), .character({2'b0, digit0_2}),
        .x_start(7'd10), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit0_2)
    );
    fourteen_segment_drawer digit1_2_drawer (
        .x(x), .y(y), .character({2'b0, digit1_2}),
        .x_start(7'd18), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit1_2)
    );
    fourteen_segment_drawer digit2_2_drawer (
        .x(x), .y(y), .character({2'b0, digit2_2}),
        .x_start(7'd26), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit2_2)
    );
    fourteen_segment_drawer digit3_2_drawer (
        .x(x), .y(y), .character({2'b0, digit3_2}),
        .x_start(7'd34), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_digit3_2)
    );
    assign draw_number2 = draw_digit0_2 | draw_digit1_2 | draw_digit2_2 | draw_digit3_2;

    // CALCULATE MODE: Draw result (first 4 digits of calculated_number_bcd)
    wire [3:0] result_digit0 = calculated_number_bcd[3:0];
    wire [3:0] result_digit1 = calculated_number_bcd[7:4];
    wire [3:0] result_digit2 = calculated_number_bcd[11:8];
    wire [3:0] result_digit3 = calculated_number_bcd[15:12];

    wire draw_result_digit0, draw_result_digit1, draw_result_digit2, draw_result_digit3;
    fourteen_segment_drawer result_digit0_drawer (
        .x(x), .y(y), .character({2'b0, result_digit0}),
        .x_start(7'd10), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_result_digit0)
    );
    fourteen_segment_drawer result_digit1_drawer (
        .x(x), .y(y), .character({2'b0, result_digit1}),
        .x_start(7'd18), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_result_digit1)
    );
    fourteen_segment_drawer result_digit2_drawer (
        .x(x), .y(y), .character({2'b0, result_digit2}),
        .x_start(7'd26), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_result_digit2)
    );
    fourteen_segment_drawer result_digit3_drawer (
        .x(x), .y(y), .character({2'b0, result_digit3}),
        .x_start(7'd34), .y_start(DIGIT_Y), .height(CHAR_H), .width(CHAR_W), .draw_pixel(draw_result_digit3)
    );
    assign draw_result = draw_result_digit0 | draw_result_digit1 | draw_result_digit2 | draw_result_digit3;

    // Select drawing based on sub_mode
    assign draw_pixel = (sub_mode == MODE_INSTRUCTIONS) ? draw_instructions :
                       (sub_mode == MODE_NUMBER1) ? draw_number1 :
                       (sub_mode == MODE_NUMBER2) ? draw_number2 :
                       (sub_mode == MODE_CALCULATE) ? draw_result : 1'b0;

endmodule


// MAIN CALCULATOR MODULE
module calculator_mode_module(
    input reset,                        // Reset Signal
    input  [1:0]  current_main_mode,    // Control signal to select the display content
    input clk,                          // Clock Signal
    input  [12:0] pixel_index_b,        // Pixel index for screen B
    input  [12:0] pixel_index_c,        // Pixel index for screen C
    input  [11:0] mouse_x,              // Mouse X position
    input  [11:0] mouse_y,              // Mouse Y position
    input  mouse_l,                     // Mouse left button
    input  mouse_r,                     // Mouse right button
    input  mouse_m,                     // Mouse middle button
    input  [15:0] sw,                   // Switches Input
    output [3:0]  an,                   // Common anode to 7-segment display
    output [7:0]  seg,                  // Output 7-segment Display and decimal point
    output reg [15:0] oled_data_b,      // Output pixel data for screen B
    output reg [15:0] oled_data_c,      // Output pixel data for screen C
    output [2:0] led
);

    // INSTANTIATE LOCAL PARAMETERS
    localparam MODE_CALCULATOR  = 2'b01;

    localparam MODE_CALCULATOR_INSTRUCTIONS = 2'b00;
    localparam MODE_CALCULATOR_NUMBER1 = 2'b01;
    localparam MODE_CALCULATOR_NUMBER2 = 2'b10;
    localparam MODE_CALCULATOR_CALCULATE = 2'b11;

    // Mouse-controlled sub-mode
    reg [1:0] sub_mode = 2'b00;
    reg mouse_m_prev = 1'b0;
    wire mouse_m_edge;

    always @(posedge clk) begin
        mouse_m_prev <= mouse_m;
    end

    assign mouse_m_edge = mouse_m && !mouse_m_prev;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sub_mode <= 2'b00;
        end else if (mouse_m_edge) begin
            sub_mode <= sub_mode + 1; // Cycle through modes
        end
    end

    // Wires to capture the BCD output *during* active input mode
    wire [15:0] number1_bcd_wire;
    wire [15:0] number2_bcd_wire;

    // Registers to *hold* the BCD values across different modes
    reg [15:0] number1_bcd_reg = 16'd0;
    reg [15:0] number2_bcd_reg = 16'd0;

    // The BCD values visible to the rest of the module (e.g., bcd_to_bin_converter)
    wire [15:0] number1_bcd;
    wire [15:0] number2_bcd;

    assign number1_bcd = number1_bcd_reg;
    assign number2_bcd = number2_bcd_reg;

    // INSTANTIATE INPUT MODULE
    // Wiring for Enabling Input Numbers
    wire input_number1_flag, input_number2_flag;
    assign input_number1_flag = ~reset & (current_main_mode == MODE_CALCULATOR) & (sub_mode == MODE_CALCULATOR_NUMBER1);
    assign input_number2_flag = ~reset & (current_main_mode == MODE_CALCULATOR) & (sub_mode == MODE_CALCULATOR_NUMBER2);
    wire [3:0] an1_out;
    wire [7:0] seg1_out;
    wire [3:0] an2_out;
    wire [7:0] seg2_out;

    // Instantiate Input Number Module for Number 1
    input_number input_calculator_number1(
        .reset(reset),
        .enable(input_number1_flag),
        .clk(clk),
        .mouse_x(mouse_x),
        .mouse_y(mouse_y),
        .mouse_l(mouse_l),
        .mouse_r(mouse_r),
        .manual(~sw[8]),
        .an(an1_out),
        .seg(seg1_out),
        .number_bcd(number1_bcd_wire),
        .led(led[0])
    );

    // Instantiate Input Number Module for Number 2
    input_number input_calculator_number2(
        .reset(reset),
        .enable(input_number2_flag),
        .clk(clk),
        .mouse_x(mouse_x),
        .mouse_y(mouse_y),
        .mouse_l(mouse_l),
        .mouse_r(mouse_r),
        .manual(~sw[8]),
        .an(an2_out),
        .seg(seg2_out),
        .number_bcd(number2_bcd_wire),
        .led(led[1])
    );

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            number1_bcd_reg <= 16'd0;
            number2_bcd_reg <= 16'd0;
        end else begin
            // Latch number 1 when its input flag is active
            if (input_number1_flag) begin
                number1_bcd_reg <= number1_bcd_wire;
            end

            // Latch number 2 when its input flag is active
            if (input_number2_flag) begin
                number2_bcd_reg <= number2_bcd_wire;
            end
        end
    end

    // 7-SEGMENT DISPLAY MUX LOGIC
    assign an = input_number1_flag ? an1_out :
                input_number2_flag ? an2_out :
                4'b1111; // Default: All off

    assign seg = input_number1_flag ? seg1_out :
                 input_number2_flag ? seg2_out :
                 8'b11111111; // Default: All off

    // CONVERT INPUT BCD NUMBERS TO BINARY NUMBER
    // Wiring for Input Numbers
    wire [13:0] number1, number2;

    // Convert Input Number 1 to Binary Number
    bcd_to_bin_converter bcd_to_bin_converter_number1(
        .bcd_in(number1_bcd),
        .bin_out(number1)
    );

    // Convert Input Number 2 to Binary Number
    bcd_to_bin_converter bcd_to_bin_converter_number2(
        .bcd_in(number2_bcd),
        .bin_out(number2)
    );

    // INSTANTIATE OUTPUT NUMBERS AND PERFORM CALCULATION
    // Wiring for Output Numbers
    wire calculate_operation_flag;
    assign calculate_operation_flag = ~reset & (current_main_mode == MODE_CALCULATOR) & (sub_mode == MODE_CALCULATOR_CALCULATE);
    wire [27:0] calculated_number;
    wire [32:0] calculated_number_bcd;
    wire error_flag;
    wire convert_bin_to_bcd_flag;
    assign convert_bin_to_bcd_flag = calculate_operation_flag & ~error_flag;

    // Convert Calculated Number to BCD
    bin_to_bcd_converter bin_to_bcd_converter_inst(
        .enable(convert_bin_to_bcd_flag),
        .bin_in(calculated_number),
        .bcd_out(calculated_number_bcd)
    );

    // Perform Calculation
    calculator_module calculator_module_inst(
        .enable(calculate_operation_flag),
        .clk(clk),
        .sw(sw[3:2]),
        .number1(number1),
        .number2(number2),
        .calculated_number(calculated_number),
        .error_flag(error_flag)
    );

    // INSTANTIATE MAIN SCREEN DRAWER
    wire draw_pixel_b;
    calculator_drawer_b calculator_drawer_b_inst(
        .pixel_index(pixel_index_b),
        .sub_mode(sub_mode),
        .sw(sw[3:0]),
        .number1_bcd(number1_bcd),
        .number2_bcd(number2_bcd),
        .calculated_number_bcd(calculated_number_bcd),
        .error_flag(error_flag),
        .draw_pixel(draw_pixel_b)
    );

    // Colors
    localparam TEXT_COLOR = 16'hFFFF;
    localparam BG_COLOR = 16'h0000;

    // Draw Logic
    always @ (*) begin
        if (~reset & current_main_mode == MODE_CALCULATOR) begin
            if (draw_pixel_b) begin
                oled_data_b = TEXT_COLOR;
            end else begin
                oled_data_b = BG_COLOR;
            end
            /*
            if (draw_pixel_c) begin
                oled_data_c = TEXT_COLOR;
            end else begin
                oled_data_c = BG_COLOR;
            end
            */
        end else begin
            oled_data_b = BG_COLOR;
            oled_data_c = BG_COLOR;
        end
    end

endmodule