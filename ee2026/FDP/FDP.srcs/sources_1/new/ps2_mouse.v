//////////////////////////////////////////////////////////////////////////////////
// PS/2 Mouse Decoder Module
// Decodes PS/2 mouse signals into position and button data
//////////////////////////////////////////////////////////////////////////////////

module ps2_mouse(
    input clk,           // 100MHz clock
    input reset,
    inout PS2Clk,
    inout PS2Data,
    output reg [11:0] mouse_x,  // Mouse X position
    output reg [11:0] mouse_y,  // Mouse Y position
    output reg mouse_l,         // Left button
    output reg mouse_r,         // Right button
    output reg mouse_m          // Middle button
);

// PS/2 clock and data lines
reg PS2Clk_sync, PS2Data_sync;
reg PS2Clk_prev;
reg [3:0] bit_count;
reg [32:0] shift_reg;
reg parity;
reg [7:0] byte1, byte2, byte3;

// Synchronize PS/2 signals
always @(posedge clk) begin
    PS2Clk_sync <= PS2Clk;
    PS2Data_sync <= PS2Data;
    PS2Clk_prev <= PS2Clk_sync;
end

wire PS2Clk_falling = PS2Clk_prev && !PS2Clk_sync;

// PS/2 state machine for mouse
reg [1:0] state;
localparam IDLE = 2'b00;
localparam RECEIVE = 2'b01;
localparam PROCESS = 2'b10;

reg [1:0] byte_count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        bit_count <= 0;
        shift_reg <= 0;
        byte_count <= 0;
        mouse_x <= 12'd480;  // Center X (96*5)
        mouse_y <= 12'd320;  // Center Y (64*5)
        mouse_l <= 0;
        mouse_r <= 0;
        mouse_m <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (PS2Clk_falling && PS2Data_sync == 0) begin
                    state <= RECEIVE;
                    bit_count <= 0;
                    byte_count <= 0;
                end
            end
            RECEIVE: begin
                if (bit_count < 11) begin
                    shift_reg[bit_count] <= PS2Data_sync;
                    bit_count <= bit_count + 1;
                end else begin
                    // Check start bit and parity
                    if (shift_reg[0] == 0 && ^shift_reg[8:1] == shift_reg[9]) begin
                        case (byte_count)
                            0: byte1 <= shift_reg[8:1];
                            1: byte2 <= shift_reg[8:1];
                            2: byte3 <= shift_reg[8:1];
                        endcase
                        byte_count <= byte_count + 1;
                        if (byte_count == 3) begin
                            state <= PROCESS;
                        end else begin
                            bit_count <= 0;
                        end
                    end else begin
                        state <= IDLE; // Error
                    end
                end
            end
            PROCESS: begin
                // Process the 3 bytes
                mouse_l <= byte1[0];
                mouse_r <= byte1[1];
                mouse_m <= byte1[2];
                // X movement (signed 9-bit)
                if (byte1[4]) begin
                    mouse_x <= mouse_x - (9'h100 - {byte1[4], byte2});
                end else begin
                    mouse_x <= mouse_x + {byte1[4], byte2};
                end
                // Y movement (signed 9-bit)
                if (byte1[5]) begin
                    mouse_y <= mouse_y - (9'h100 - {byte1[5], byte3});
                end else begin
                    mouse_y <= mouse_y + {byte1[5], byte3};
                end
                // Clamp to screen bounds (assuming 96x64 scaled)
                if (mouse_x > 12'd960) mouse_x <= 12'd960;
                if (mouse_x < 12'd0) mouse_x <= 12'd0;
                if (mouse_y > 12'd640) mouse_y <= 12'd640;
                if (mouse_y < 12'd0) mouse_y <= 12'd0;
                state <= IDLE;
            end
        endcase
    end
end

endmodule