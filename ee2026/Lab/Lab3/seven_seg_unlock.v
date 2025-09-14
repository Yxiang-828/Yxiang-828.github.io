module seven_seg_unlock(
    input CLK,
    input [3:0] BTN,
    input max_led_on,
    output reg [3:0] an,
    output reg [6:0] seg,
    output reg LED15
);

reg [2:0] step = 0;
reg [3:0] prev_btn = 4'b1111;
wire [3:0] press = BTN & ~prev_btn;
wire [2:0] press_btn = BTN[0] ? 0 : BTN[1] ? 1 : BTN[2] ? 2 : BTN[3] ? 3 : 4;

always @(posedge CLK) begin
    prev_btn <= BTN;
end

always @(posedge CLK) begin
    if (!max_led_on) begin
        step <= 0;
        LED15 <= 0;
    end else begin
        if (step == 0) step <= 1;  // Set to step 1 when max_led_on
        else if (press && press_btn != 4) begin  // BTN[3]=btnL, BTN[2]=btnR, BTN[1]=btnD, BTN[0]=btnC
            if (step == 1 && press_btn == 0) step <= 2;      // BTNC
            else if (step == 2 && press_btn == 2) step <= 3; // BTNR
            else if (step == 3 && press_btn == 1) step <= 4; // BTND
            else if (step == 4 && press_btn == 3) step <= 5; // BTNL
            else if (step == 5 && press_btn == 2) step <= 6; // BTNR
            // Wrong presses do nothing
        end
    end
    LED15 <= (step == 6);
end

// Seven-segment display
always @(*) begin
    case (step)
        0: begin an = 4'b1111; seg = 7'b1111111; end // off
        1: begin an = 4'b1110; seg = 7'b0100111; end // g,e,d on 4th (AN3)
        2: begin an = 4'b1101; seg = 7'b0101111; end // g,e on 3rd (AN2)
        3: begin an = 4'b1011; seg = 7'b0100001; end // g,e,d,c,b on 2nd (AN1)
        4: begin an = 4'b0111; seg = 7'b1001111; end // e,f on 1st (AN0)
        5: begin an = 4'b1101; seg = 7'b0101111; end // e,g on 3rd (AN2)
        6: begin an = 4'b1101; seg = 7'b0101111; end // e,g on 3rd (AN2, unlocked)
        default: begin an = 4'b1111; seg = 7'b1111111; end
    endcase
end

endmodule