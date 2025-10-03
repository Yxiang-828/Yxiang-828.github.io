`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT_P NAME: Ryan Koh Jun Hao
//  STUDENT_Q NAME: Sean
//  STUDENT_R NAME: Yi Yang
//  STUDENT_S NAME: Yao Xiang
//
//////////////////////////////////////////////////////////////////////////////////

module flexible_timer(
    input CLOCK, 
    input [31:0] frequency, 
    output reg SLOW_CLOCK = 0
);
    
    localparam BASYS_CLOCK = 100_000_000;
    reg [31:0] MAX_COUNT;
    reg [31:0] COUNT = 0;

    always @(*) begin
        if (frequency > 0)
            MAX_COUNT = (BASYS_CLOCK / (2 * frequency)) - 1;
        else
            MAX_COUNT = 32'hFFFFFFFF; // avoid div by 0
    end

    always @(posedge CLOCK) begin
        if (COUNT == MAX_COUNT) begin
            COUNT <= 0;
            SLOW_CLOCK <= ~SLOW_CLOCK;
        end else begin
            COUNT <= COUNT + 1;
        end
    end
endmodule

module selector_module(
    input SLOW_CLOCK,
    output reg [1:0] SELECTOR = 0
);

    always @ (posedge SLOW_CLOCK) begin
        SELECTOR = SELECTOR + 1;
    end
endmodule

module character_display(
    input [1:0] SELECTOR,
    output reg [3:0] an,
    output reg [7:0] seg
);

    always @ (SELECTOR) begin
        if (SELECTOR == 2'b00) begin
            an = 4'b0111;
            seg = 8'b10010010;
        end else if (SELECTOR == 2'b01) begin
            an = 4'b1011;
            seg = 8'b00110000;
        end else if (SELECTOR == 2'b10) begin
            an = 4'b1101;
            seg = 8'b11000000;
        end else if (SELECTOR == 2'b11) begin
            an = 4'b1110;
            seg = 8'b10010000;
        end
    end
endmodule

module Main(
    input CLOCK,
    input [4:0] btn,
    input [5:0] sw,
    output [7:0] JC,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire SLOW_CLOCK, clk6p25m;
    flexible_timer(
        .CLOCK(CLOCK), 
        .frequency(32'd1000), 
        .SLOW_CLOCK(SLOW_CLOCK)
    );
    
    flexible_timer(
        .CLOCK(CLOCK), 
        .frequency(32'd6250000), 
        .SLOW_CLOCK(clk6p25m)
    );
    
    wire [1:0] SELECTOR;
    selector_module selector(
        .SLOW_CLOCK(SLOW_CLOCK),
        .SELECTOR(SELECTOR)
    );
    
    character_display character(
        .SELECTOR(SELECTOR),
        .an(an),
        .seg(seg)
    );
    
    wire [12:0] pixel_index;
    wire [15:0] oled_data, oled_data_p, oled_data_q, oled_data_r, oled_data_s;
    reg task_p_flag = 0;
    reg task_q_flag = 0;
    reg task_r_flag = 0;
    reg task_s_flag = 0;
    
    wire sending_pixel, sample_pixel;
    Oled_Display oled(
        .clk(clk6p25m), 
        .pixel_index(pixel_index),
        .pixel_data(oled_data),
        .cs(JC[0]), 
        .sdin(JC[1]), 
        .sclk(JC[3]), 
        .d_cn(JC[4]), 
        .resn(JC[5]), 
        .vccen(JC[6]),
        .pmoden(JC[7])
     );
    
    Task_P task_p(
        .CLOCK(CLOCK),
        .clk6p25m(clk6p25m),
        .pixel_index(pixel_index),
        .flag(task_p_flag),
        .btn(btn),
        .oled_data(oled_data_p)
    );
    
    Task_Q task_q(
        .clkhundred(CLOCK),
        .clk(clk6p25m),
        .flag(task_q_flag),
        .btnC(btn[0]),
        .btnL(btn[2]),
        .btnR(btn[3]),
        .pixel_index(pixel_index),
        .oled_data(oled_data_q)
    );
    
    
    Task_R task_r(
        .basys_clock(CLOCK),
        .sw(sw[5:4]),
        .flag(task_r_flag),
        .pixel_index(pixel_index),
        .digit_pix(oled_data_r)
    );
    
    Task_S task_s(
        .clk(CLOCK),
        .flag(task_s_flag),
        .pixel_index(pixel_index),
        .btnC(btn[0]),
        .btnU(btn[1]),
        .btnL(btn[2]),
        .btnR(btn[3]),
        .btnD(btn[4]),
        .oled_data(oled_data_s)
    );
    
    always @(posedge CLOCK) begin
        task_p_flag <= sw[0] & ~sw[1] & ~sw[2] & ~sw[3];
        task_q_flag <= sw[1] & ~sw[2] & ~sw[3];
        task_r_flag <= sw[2] & ~sw[3];
        task_s_flag <= sw[3];
    end

    
    assign oled_data = (pixel_index == 13'd6143) ? 16'h0000 :
                       sw[3] ? oled_data_s :
                       sw[2] ? oled_data_r :
                       sw[1] ? oled_data_q :
                       sw[0] ? oled_data_p :
                       16'b0;
            
endmodule
