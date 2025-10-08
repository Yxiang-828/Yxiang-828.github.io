//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME:
//  STUDENT B NAME:
//  STUDENT C NAME:
//  STUDENT D NAME:
//
//////////////////////////////////////////////////////////////////////////////////

module Top_Student (
    input clk,
    input [4:0] btn,
    input [15:0] sw,
    inout PS2Clk,
    inout PS2Data,
    output [7:0] JB,
    output [7:0] JC,
    output [7:0] seg,
    output [3:0] an,
    output [2:0] led
);




    // ON/OFF CALCULATOR (driven by sw[15])
    reg reset = 1'b1;
    always @ (posedge clk) begin
        reset <= ~sw[15];
    end




    // MAIN OPERATION MODES (driven by sw[14:13])
    localparam MODE_WELCOME       = 2'b00; // 'Welcome to GC'
    localparam MODE_CALCULATOR    = 2'b01; // Calculator Mode
    localparam MODE_FUNC_INPUT    = 2'b10; // Function Input Mode
    localparam MODE_FUNC_READ     = 2'b11; // Function Read Mode
    reg [1:0] current_main_mode;

    // Main Mode Logic
    always @ (posedge clk) begin
        current_main_mode <= sw[14:13];
    end




    // OUTPUT DATA MULTIPLEXING
    // OLED Data Wires
    wire [15:0] oled_data_b, oled_data_c;
    wire [12:0] pixel_index_b, pixel_index_c;

    // OLED Data from Sub-Modules
    wire [15:0] off_screen_b, off_screen_c;
    wire [15:0] welcome_screen_b, welcome_screen_c;
    wire [15:0] calculator_screen_b, calculator_screen_c;
    wire [15:0] func_input_screen_b, func_input_screen_c;
    wire [15:0] func_read_screen_b, func_read_screen_c;

    // Anode Multiplexing
    wire [3:0] an_off;
    wire [3:0] an_calculator;

    // Segment Multiplexing
    wire [7:0] seg_off;
    wire [7:0] seg_calculator;

    // OLED Screen B Data
    assign oled_data_b =
        (reset == 1)                           ? off_screen_b :
        (current_main_mode == MODE_WELCOME)    ? welcome_screen_b :
        (current_main_mode == MODE_CALCULATOR) ? calculator_screen_b :
        (current_main_mode == MODE_FUNC_INPUT) ? func_input_screen_b :
        (current_main_mode == MODE_FUNC_READ)  ? func_read_screen_b :
        16'h0000;

    // OLED Screen C Data
    assign oled_data_c =
        (reset == 1)                           ? off_screen_c :
        (current_main_mode == MODE_WELCOME)    ? welcome_screen_c :
        (current_main_mode == MODE_CALCULATOR) ? calculator_screen_c :
        (current_main_mode == MODE_FUNC_INPUT) ? func_input_screen_c :
        (current_main_mode == MODE_FUNC_READ)  ? func_read_screen_c :
        16'h0000;

    // Anode Data
    assign an =
        (reset == 1)                           ? an_off :
        (current_main_mode == MODE_CALCULATOR) ? an_calculator :
        4'b1111;

    // Segment Data
    assign seg =
        (reset == 1)                           ? seg_off :
        (current_main_mode == MODE_CALCULATOR) ? seg_calculator :
        8'b11111111;




    // PS/2 MOUSE MODULE
    wire [11:0] mouse_x, mouse_y;
    wire mouse_l, mouse_r, mouse_m;
    ps2_mouse ps2_mouse_inst(
        .clk(clk),
        .reset(reset),
        .PS2Clk(PS2Clk),
        .PS2Data(PS2Data),
        .mouse_x(mouse_x),
        .mouse_y(mouse_y),
        .mouse_l(mouse_l),
        .mouse_r(mouse_r),
        .mouse_m(mouse_m)
    );








    // OFF MODULE
    off_module off_module_inst(
        .off_screen_b(off_screen_b),
        .off_screen_c(off_screen_c),
        .an(an_off),
        .seg(seg_off)
    );




    // WELCOME MODULE
    welcome_mode_module welcome_mode_module_inst(
        .reset(reset),
        .current_main_mode(current_main_mode),
        .pixel_index_b(pixel_index_b),
        .pixel_index_c(pixel_index_c),
        .oled_data_b(welcome_screen_b),
        .oled_data_c(welcome_screen_c)
    );




    // CALCULATOR MODULE
    calculator_mode_module calculator_mode_module_inst(
        .reset(reset),
        .current_main_mode(current_main_mode),
        .clk(clk),
        .pixel_index_b(pixel_index_b),
        .pixel_index_c(pixel_index_c),
        .mouse_x(mouse_x),
        .mouse_y(mouse_y),
        .mouse_l(mouse_l),
        .mouse_r(mouse_r),
        .mouse_m(mouse_m),
        .sw(sw),
        .an(an_calculator),
        .seg(seg_calculator),
        .oled_data_b(calculator_screen_b),
        .oled_data_c(calculator_screen_c),
        .led(led[2:0])
    );



endmodule