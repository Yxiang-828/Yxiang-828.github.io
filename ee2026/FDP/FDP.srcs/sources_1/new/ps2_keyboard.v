//////////////////////////////////////////////////////////////////////////////////
// PS/2 Keyboard Decoder Module
// Decodes PS/2 keyboard signals into key codes and events
//////////////////////////////////////////////////////////////////////////////////

module ps2_keyboard(
    input clk,           // 100MHz clock
    input reset,
    inout PS2Clk,
    inout PS2Data,
    output reg [7:0] key_code,  // Last key code received
    output reg key_pressed,     // High when a key is pressed
    output reg key_released     // High when a key is released
);

// PS/2 clock and data lines
reg PS2Clk_sync, PS2Data_sync;
reg [3:0] bit_count;
reg [10:0] shift_reg;
reg parity;
reg [7:0] key_code_reg;
reg key_pressed_reg, key_released_reg;

// Synchronize PS/2 signals
always @(posedge clk) begin
    PS2Clk_sync <= PS2Clk;
    PS2Data_sync <= PS2Data;
end

// PS/2 state machine
reg [1:0] state;
localparam IDLE = 2'b00;
localparam RECEIVE = 2'b01;
localparam PARITY_CHECK = 2'b10;
localparam STOP = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        bit_count <= 0;
        shift_reg <= 0;
        key_code <= 8'h00;
        key_pressed <= 0;
        key_released <= 0;
        key_code_reg <= 8'h00;
        key_pressed_reg <= 0;
        key_released_reg <= 0;
    end else begin
        case (state)
            IDLE: begin
                key_pressed <= 0;
                key_released <= 0;
                if (PS2Clk_sync == 0 && PS2Data_sync == 0) begin
                    state <= RECEIVE;
                    bit_count <= 0;
                end
            end
            RECEIVE: begin
                if (bit_count < 11) begin
                    shift_reg[bit_count] <= PS2Data_sync;
                    bit_count <= bit_count + 1;
                end else begin
                    // Check parity
                    parity = ^shift_reg[8:1]; // XOR of data bits
                    if (parity == shift_reg[9]) begin
                        state <= STOP;
                        key_code_reg <= shift_reg[8:1];
                        if (shift_reg[8:1] == 8'hF0) begin
                            key_released_reg <= 1;
                        end else begin
                            key_pressed_reg <= 1;
                        end
                    end else begin
                        state <= IDLE; // Parity error, discard
                    end
                end
            end
            STOP: begin
                if (PS2Clk_sync == 1) begin
                    state <= IDLE;
                    key_code <= key_code_reg;
                    key_pressed <= key_pressed_reg;
                    key_released <= key_released_reg;
                    key_pressed_reg <= 0;
                    key_released_reg <= 0;
                end
            end
        endcase
    end
end

endmodule