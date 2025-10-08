module manual_input_number(
    input reset,
    input enable,
    input clk,
    input [11:0] mouse_x,
    input [11:0] mouse_y,
    input mouse_l,
    input mouse_r,
    output reg [3:0] an,
    output [7:0] seg,
    output reg [15:0] number = 16'b0,
    output led
);

    assign led = enable;

    // --- Clock Generation ---
    wire clk_1k;
    flexible_timer clk1k(
        .CLOCK(clk),
        .frequency(32'd1000),
        .SLOW_CLOCK(clk_1k)
    );

    // --- BLINKING CLOCK ---
    reg [7:0] clk_blink_count = 8'd0;
    reg blink_en = 1'b0; // High to turn off segment, creating the blink effect
    localparam BLINK_LIMIT = 8'd249;
    always @(posedge clk_1k) begin
        // Only run the blink counter if the module is enabled
        if (enable) begin
            clk_blink_count <= clk_blink_count + 1;
            if (clk_blink_count == BLINK_LIMIT) begin
                blink_en <= ~blink_en;
                clk_blink_count <= 8'd0;
            end
        end else begin
            clk_blink_count <= 8'd0;
            blink_en <= 1'b0;
        end
    end

    // --- Mouse Button Edge Detection ---
    reg mouse_l_prev = 1'b0;
    reg mouse_r_prev = 1'b0;
    wire mouse_l_edge, mouse_r_edge;

    always @(posedge clk) begin
        mouse_l_prev <= mouse_l;
        mouse_r_prev <= mouse_r;
    end

    assign mouse_l_edge = mouse_l && !mouse_l_prev;
    assign mouse_r_edge = mouse_r && !mouse_r_prev;

    // Determine digit pointer based on mouse_y (divide screen height 64 into 4 parts)
    wire [1:0] mouse_digit_ptr = mouse_y[5:4]; // mouse_y / 16, since 64/4=16

    // --- BCD Input Logic and Digit Selection (using Edge Signals) ---
    // This block replaces the two original input blocks and uses the correct edge detection.
    reg [1:0] digit_ptr = 2'b00; // Points to the digit currently being modified (0=LSB to 3=MSB)

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            digit_ptr <= 2'b0;
            number <= 16'b0;
        end else if (~enable) begin
            digit_ptr <= 2'b00;
        end else begin
            digit_ptr <= mouse_digit_ptr; // Always follow mouse position

            // Increment/Decrement based on button clicks
            if (mouse_l_edge) begin
                case (digit_ptr)
                    2'b00: number[3:0]   <= (number[3:0]   == 4'd9) ? 4'd0 : number[3:0] + 4'd1;
                    2'b01: number[7:4]   <= (number[7:4]   == 4'd9) ? 4'd0 : number[7:4] + 4'd1;
                    2'b10: number[11:8]  <= (number[11:8]  == 4'd9) ? 4'd0 : number[11:8] + 4'd1;
                    2'b11: number[15:12] <= (number[15:12] == 4'd9) ? 4'd0 : number[15:12] + 4'd1;
                endcase
            end else if (mouse_r_edge) begin
                case (digit_ptr)
                    2'b00: number[3:0]   <= (number[3:0]   == 4'd0) ? 4'd9 : number[3:0] - 4'd1;
                    2'b01: number[7:4]   <= (number[7:4]   == 4'd0) ? 4'd9 : number[7:4] - 4'd1;
                    2'b10: number[11:8]  <= (number[11:8]  == 4'd0) ? 4'd9 : number[11:8] - 4'd1;
                    2'b11: number[15:12] <= (number[15:12] == 4'd0) ? 4'd9 : number[15:12] - 4'd1;
                endcase
            end
        end
    end

    // --- MUX Pointer Sequential Logic ---
    reg [1:0] display_mux_ptr = 2'b00;
    always @(posedge clk_1k) begin
        if (enable) begin
            display_mux_ptr <= display_mux_ptr + 1;
        end else begin
            display_mux_ptr <= 2'b00;
        end
    end

    // --- 7-Segment Combinational Driver Logic (Always @*) ---
    // This block calculates all outputs based on the current MUX pointer instantly
    reg [3:0] current_digit_bcd;
    reg [7:0] seg_output;

    always @(*) begin
        // Default assignments (display off)
        an = 4'b1111; // All anodes off (Active LOW)
        current_digit_bcd = 4'hF; // Default value for blanking

        if (enable) begin
            // 1. BCD Value Selection (Combinational based on current MUX pointer)
            case (display_mux_ptr)
                2'b00: current_digit_bcd = number[3:0]; // Digit 1 (LSB)
                2'b01: current_digit_bcd = number[7:4]; // Digit 2
                2'b10: current_digit_bcd = number[11:8]; // Digit 3
                2'b11: current_digit_bcd = number[15:12]; // Digit 4 (MSB)
                default: current_digit_bcd = 4'hF;
            endcase

            // 2. Anode Selection (Active LOW)
            case (display_mux_ptr)
                2'b00: an = 4'b1110;
                2'b01: an = 4'b1101;
                2'b10: an = 4'b1011;
                2'b11: an = 4'b0111;
                default: an = 4'b1111;
            endcase

            // 3. Apply Blinking Logic: If blink_en is high, force the selected anode HIGH (OFF)
            if (display_mux_ptr == digit_ptr && blink_en) begin
                an[display_mux_ptr] = 1'b1;  // Force the currently MUXed digit off
            end
        end

        // 4. Segment Decoder (Must be below BCD selection to use the correct value)
        // Assuming Common Anode (Active LOW segments: '0' lit, '1' unlit)
        case (current_digit_bcd)
            4'd0: seg_output = 8'b11000000;
            4'd1: seg_output = 8'b11111001;
            4'd2: seg_output = 8'b10100100;
            4'd3: seg_output = 8'b10110000;
            4'd4: seg_output = 8'b10011001;
            4'd5: seg_output = 8'b10010010;
            4'd6: seg_output = 8'b10000010;
            4'd7: seg_output = 8'b11111000;
            4'd8: seg_output = 8'b10000000;
            4'd9: seg_output = 8'b10010000;
            default: seg_output = 8'b11111111; // Off/Blank
        endcase
    end

    // Assign final segment output
    assign seg = enable ? seg_output : 8'b11111111; // Blank display when disabled

endmodule


module input_number(
    input reset,
    input enable,
    input clk,
    input [11:0] mouse_x,
    input [11:0] mouse_y,
    input mouse_l,
    input mouse_r,
    input manual,
    output [3:0] an,
    output [7:0] seg,
    output [15:0] number_bcd,
    output led
);

    wire manual_en;
    assign manual_en = enable & manual;
    wire [15:0] number_bcd_manual;
    manual_input_number manual_input_number_inst(
        .reset(reset),
        .enable(manual_en),
        .clk(clk),
        .mouse_x(mouse_x),
        .mouse_y(mouse_y),
        .mouse_l(mouse_l),
        .mouse_r(mouse_r),
        .an(an),
        .seg(seg),
        .number(number_bcd_manual),
        .led(led)
    );

    // Multiplex for Paint Module later
    assign number_bcd = number_bcd_manual;

endmodule



/*
module seven_seg_decoder(
    input [3:0] bcd_in,
    output [6:0] seg_out
);

    reg [6:0] seg_code;

    always @(*) begin
        case (bcd_in)
            // BCD (Hex) : Display : g f e d c b a
            4'h0: seg_code = 7'b000_0001; // 0
            4'h1: seg_code = 7'b100_1111; // 1
            4'h2: seg_code = 7'b001_0010; // 2
            4'h3: seg_code = 7'b000_0110; // 3
            4'h4: seg_code = 7'b100_1100; // 4
            4'h5: seg_code = 7'b010_0100; // 5
            4'h6: seg_code = 7'b010_0000; // 6
            4'h7: seg_code = 7'b000_1111; // 7
            4'h8: seg_code = 7'b000_0000; // 8
            4'h9: seg_code = 7'b000_0100; // 9
            default: seg_code = 7'b111_1111; // Default to Blank
        endcase
    end

    assign seg_out = seg_code;

endmodule


module input_number(
    // Input Clocks
    input clk100m,
    input clk25m,
    input clk12p5m,
    input clk6p25m,
    input clk1k,

    // Mouse Data
    inout PS2Clk,
    inout PS2Data,

    // Input Data
    input [4:0] btn,

    // Functional Output
    output [13:0] number,

    // Display Outputs
    output [2:0] led, // DEBUGGING
    output [7:0] JC, // Output to OLED Mouse Screen
    output [7:0] seg, // Output to Segment Display
    output [3:0] an // Output to Segment Display
);

    // --- System Reset Signal ---
    // A simple power-on reset (active high) that pulses high for the first clock cycle.
    reg rst = 1'b1;
    always @(posedge clk100m) begin
        rst <= 1'b0;
    end

    // Outputs from MouseCtl
    wire [11:0] mouse_xpos, mouse_ypos;
    wire mouse_left;
    wire mouse_middle;
    wire mouse_right;

    // Wires for OLED data and Paint LED
    wire [12:0] pixel_index;
    wire [15:0] oled_data; // This wire is connected to Oled_Display.pixel_data
    wire led_paint;        // Paint module's single LED output
    wire [6:0] paint_seg_out;

    // --- Button Rising-Edge Detection ---
    reg [4:0] btn_prev = 5'h0;
    wire [4:0] btn_rise; // Single-cycle pulse on rising edge

    // Register the previous state of the input button (runs on fast clock clk100m)
    always @(posedge clk100m) begin
        btn_prev <= btn;
    end

    // Rising edge detection: (NOT previous state) AND (current state)
    assign btn_rise = (~btn_prev) & btn;

    // Instantiate the MouseCtl module
    // NOTE: 'rst' signal added here for proper initialization.
    MouseCtl mouse_controller_inst (
        // Input Ports
        .clk           (clk100m),
        .rst           (rst), // **CORRECTION: Added Power-On Reset**

        // Control Ports (3.84)
        .value         (12'd0),
        .setx          (1'b0),
        .sety          (1'b0),
        .setmax_x      (1'b0),
        .setmax_y      (1'b0),

        // Output Ports
        .xpos          (mouse_xpos),
        .ypos          (mouse_ypos),
        .left          (mouse_left),
        .middle        (mouse_middle),
        .right         (mouse_right),

        // Inout Ports
        .ps2_clk       (PS2Clk),
        .ps2_data      (PS2Data)
    );

    // Instantiate the Paint module
    paint paint_inst (
        // Clock Inputs
        .clk_100M      (clk100m),
        .clk_25M       (clk25m),
        .clk_12p5M     (clk12p5m),
        .clk_6p25M     (clk6p25m),
        .slow_clk      (clk1k),

        // Mouse Inputs
        .mouse_x       (mouse_xpos),
        .mouse_y       (mouse_ypos),
        .mouse_l       (mouse_left),
        .reset         (mouse_right), // mouse_right to paint_reset

        // OLED I/O
        .pixel_index   (pixel_index),
        .colour_chooser(oled_data), // colour_chooser to Oled_Display's pixel_data

        // Control
        .enable        (1'b1),    // Enable the Paint module

        // Outputs
        .seg           (paint_seg_out),         // Connect to the 7-segment display logic
        .led           (led_paint)     // Use a separate wire for the Paint LED output
    );

    localparam [6:0] S_0 = 7'b100_0000;
    localparam [6:0] S_1 = 7'b111_1001;
    localparam [6:0] S_2 = 7'b010_0100;
    localparam [6:0] S_3 = 7'b011_0000;
    localparam [6:0] S_4 = 7'b001_1001;
    localparam [6:0] S_5 = 7'b001_0010;
    localparam [6:0] S_6 = 7'b000_0010;
    localparam [6:0] S_7 = 7'b111_1000;
    localparam [6:0] S_8 = 7'b000_0000;
    localparam [6:0] S_9 = 7'b001_0000;

    // Wire to signal if the Paint module's seg output is a recognized digit 0-9.
    wire ml_is_valid_digit;

    assign ml_is_valid_digit =
        (paint_seg_out[6:0] == S_0) || (paint_seg_out[6:0] == S_1) ||
        (paint_seg_out[6:0] == S_2) || (paint_seg_out[6:0] == S_3) ||
        (paint_seg_out[6:0] == S_4) || (paint_seg_out[6:0] == S_5) ||
        (paint_seg_out[6:0] == S_6) || (paint_seg_out[6:0] == S_7) ||
        (paint_seg_out[6:0] == S_8) || (paint_seg_out[6:0] == S_9);


    // --- Oled_Display instantiation ---
    Oled_Display oled(
        .clk(clk6p25m),
        .pixel_index(pixel_index), // Input from Paint.v
        .pixel_data(oled_data),    // Input from Paint.v (colour_chooser)
        .cs(JC[0]),
        .sdin(JC[1]),
        .sclk(JC[3]),
        .d_cn(JC[4]),
        .resn(JC[5]),
        .vccen(JC[6]),
        .pmoden(JC[7])
    );

    // DEBUGGING PURPOSES: Map the mouse button signals and paint LED to the board LEDs
    assign led[0] = mouse_left;    // Left button
    assign led[1] = mouse_middle; // Middle button
    assign led[2] = led_paint;    // Paint LED output

    // --- Blink Signals ---
    reg slow_blink_en = 1'b0; // ~4 Hz blink
    reg fast_blink_en = 1'b0; // ~8 Hz blink
    reg [2:0] blink_counter = 3'b000;

    always @(posedge clk1k) begin
        blink_counter <= blink_counter + 1;

        // Slow Blink (~4 Hz)
        if (blink_counter == 3'd3) slow_blink_en <= ~slow_blink_en;

        // Fast Blink (~8 Hz)
        if (blink_counter == 3'd1) fast_blink_en <= ~fast_blink_en;
    end

    // Number Editor FSM
    reg [1:0] state_number_input = 2'b00;
    reg [3:0] state_digit_confirmed = 4'b0000;
    reg [1:0] hover_digit = 2'b00;
    reg [15:0] bcd_number = 16'h0000;
    reg [3:0] current_digit_value = 4'h0;

    always @ (posedge clk100m) begin
        // Removed the redundant/confusing current_digit_value <= current_digit_value;

        case (state_number_input)

            // State 1: Initialisation (Reset state)
            2'b00: begin
                bcd_number <= 16'h0000; // Set default to 0000
                current_digit_value <= 4'h0;
                state_digit_confirmed <= 4'b0000; // Set all digits to unconfirmed
                hover_digit <= 2'b00; // Set the digit to hover as the ones place
                state_number_input <= 2'b01;
            end

            // State 2: Editing state
            2'b01: begin
                // Left button, Shift left
                if (btn_rise[2] && hover_digit < 2'b11) begin
                    bcd_number[hover_digit*4 +: 4] <= current_digit_value;
                    hover_digit <= hover_digit + 1;
                    current_digit_value <= bcd_number[(hover_digit + 1)*4 +: 4];
                end

                // Right button, Shift right
                if (btn_rise[3] && hover_digit > 2'b00) begin
                    bcd_number[hover_digit*4 +: 4] <= current_digit_value;
                    hover_digit <= hover_digit - 1;
                    current_digit_value <= bcd_number[(hover_digit - 1)*4 +: 4];
                end

                // Up button, Increment digit
                if (btn_rise[1] && ~state_digit_confirmed[hover_digit]) begin
                    if (current_digit_value == 4'd9) begin
                        current_digit_value <= 4'd0;
                    end else begin
                        current_digit_value <= current_digit_value + 1;
                    end
                end

                // Down button, Decrease digit
                if (btn_rise[4] && ~state_digit_confirmed[hover_digit]) begin
                    if (current_digit_value == 4'd0) begin
                        current_digit_value <= 4'd9;
                    end else begin
                        current_digit_value <= current_digit_value - 1;
                    end
                end

                // Centre button, Confirm Digit
                if (btn_rise[0]) begin
                    bcd_number[hover_digit*4 +: 4] <= current_digit_value;

                    // **CORRECTION: FSM Transition Fix**
                    // We check if the current digit is UNCONFIRMED (0)
                    // AND if confirming it would result in 4'b1111 (i.e., all other 3 bits are already 1).
                    // This predicts the result of the non-blocking assignment below.
                    if (!state_digit_confirmed[hover_digit] && ((state_digit_confirmed | (4'b0001 << hover_digit)) == 4'b1111)) begin
                        state_number_input <= 2'b10;
                    end

                    state_digit_confirmed[hover_digit] <= ~state_digit_confirmed[hover_digit];
                end
            end

            // State 3: Confirmation of Number
            2'b10: begin
                if (btn_rise[1] | btn_rise[2] | btn_rise[3] | btn_rise[4]) begin
                    state_digit_confirmed <= 4'b0000;
                    state_number_input <= 2'b01;
                end
                if (btn_rise[0]) begin
                    // Placeholder for final confirmation action
                end

            end

            default: state_number_input <= 2'b00;
        endcase
    end

    assign number = (bcd_number[15:12] * 1000) +
                        (bcd_number[11:8] * 100) +
                        (bcd_number[7:4] * 10) +
                        bcd_number[3:0];

    // --- 7-Segment Display Control Wires/Registers ---
    wire [6:0] bcd_to_seg; // Segment code for the currently selected digit value
    reg [3:0] digit_to_display; // The BCD value of the digit currently being multiplexed
    reg [1:0] an_select_counter = 2'b00; // Counter for 7-seg multiplexing
    reg [3:0] an_control = 4'b1111; // Anode control output (Common Anode: 0 is ON)

    always @(posedge clk1k) begin
        an_select_counter <= an_select_counter + 1;
    end

    always @(*) begin
        // By default, turn all anodes OFF (Logic '1')
        an_control = 4'b1111;

        // 1. Set the BCD value to display for the current anode
        if (state_number_input == 2'b01 && an_select_counter == hover_digit) begin
            digit_to_display = current_digit_value;
        end else begin
            case (an_select_counter)
                2'b00: digit_to_display = bcd_number[3:0];
                2'b01: digit_to_display = bcd_number[7:4];
                2'b10: digit_to_display = bcd_number[11:8];
                2'b11: digit_to_display = bcd_number[15:12];
                default: digit_to_display = 4'b1111; // Blank
            endcase
        end

        // 2. Turn on the current anode for multiplexing
        an_control[an_select_counter] = 1'b0;

        // --- BLINK LOGIC --- (Applied by turning the anode OFF)

        // 1. Blinking Unconfirmed Digits (Slow Blink)
        if (state_number_input == 2'b01 && !state_digit_confirmed[an_select_counter] && !slow_blink_en) begin
            // Turn anode OFF if unconfirmed and slow blink is OFF
            an_control[an_select_counter] = 1'b1;
        end

        // 2. Blinking Hover Digit (Fast Blink - Priority)
        if (state_number_input == 2'b01 && an_select_counter == hover_digit && !fast_blink_en) begin
            // Turn anode OFF if hovered and fast blink is OFF
            an_control[an_select_counter] = 1'b1;
        end

        // 3. Final Number Confirmation Blink (State 2)
        if (state_number_input == 2'b10 && !slow_blink_en) begin
            an_control[an_select_counter] = 1'b1; // Blink all digits when complete
        end
    end

    assign an = an_control;

    seven_seg_decoder u_decoder (
        .bcd_in (digit_to_display),
        .seg_out(bcd_to_seg)
    );

    // Determine if the number editor is active (based on FSM state 01 or 10)
    wire editor_active = (state_number_input != 2'b00);

    // FINAL SEGMENT OUTPUT ASSIGNMENT (Priority Logic)

    assign seg[6:0] =
        // RULE 1: If the editor is active, always use the editor's multiplexed output (bcd_to_seg)
        (editor_active) ? bcd_to_seg :

        // RULE 2: If the editor is NOT active, but the ML output is a valid digit, use the ML output
        (ml_is_valid_digit) ? paint_seg_out[6:0] :

        // RULE 3: Otherwise (Editor inactive AND ML output is invalid), fall back to the Paint module's output
        paint_seg_out[6:0];

    // Decimal Point (seg[7]) - Turn it off
    assign seg[7] = 1'b1;

endmodule

*/
