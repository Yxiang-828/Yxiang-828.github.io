`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT_S NAME: Yao Xiang
//
//////////////////////////////////////////////////////////////////////////////////


module Student_S (
    input clk,           // 100MHz clock
    input [12:0] pixel_index,  // Pixel index from OLED
    input btnC,          // Center button for reset (optional)
    input btnL,          // Left button for moving circle left
    input btnR,          // Right button for moving circle right
    input btnU,          // Up button for moving circle up
    input btnD,          // Down button for moving circle down
    output [15:0] oled_data  // OLED data output
);

// 3.A2: Create 6.25 MHz clock signal
reg [3:0] clk_count = 0;  // Counter for clock division
wire clk6p25m;
always @(posedge clk) begin
    clk_count <= clk_count + 1;
end
assign clk6p25m = clk_count[3];  // Divide by 16: 100MHz / 16 = 6.25MHz

// Circle position registers
reg [6:0] circle_x = 48;  // Initial x center (0-95)
reg [5:0] circle_y = 32;  // Initial y center (0-63)

// Movement direction: 0=none, 1=left, 2=right, 3=up, 4=down
reg [2:0] direction = 0;

// Debounce counters for buttons (1000 cycles ~10us at 100MHz)
reg [15:0] debounce_L = 0;
reg [15:0] debounce_R = 0;
reg [15:0] debounce_U = 0;
reg [15:0] debounce_D = 0;

// Movement counter for speed control (2500000 cycles ~25ms for ~40 pixels/sec)
reg [21:0] move_counter = 0;

// Movement logic with simple collision check
always @(posedge clk) begin
    // Debounce counters
    if (btnL) debounce_L <= debounce_L + 1; else debounce_L <= 0;
    if (btnR) debounce_R <= debounce_R + 1; else debounce_R <= 0;
    if (btnU) debounce_U <= debounce_U + 1; else debounce_U <= 0;
    if (btnD) debounce_D <= debounce_D + 1; else debounce_D <= 0;

    // Set direction on debounced press
    if (debounce_L == 1000) direction <= 1; // Left
    if (debounce_R == 1000) direction <= 2; // Right
    if (debounce_U == 1000) direction <= 3; // Up
    if (debounce_D == 1000) direction <= 4; // Down

    // Movement counter
    move_counter <= move_counter + 1;
    if (move_counter >= 2500000) begin
        move_counter <= 0;

        // Move based on direction with collision checks
        case (direction)
            1: begin // Left movement
                // Check: won't go off screen AND won't hit square from the right
                if (circle_x > 12) begin
                    // If moving left would put circle's right edge inside square area
                    if (!((circle_x - 1 + 12 > 4) && (circle_x - 1 - 12 < 27) &&
                          (circle_y + 12 > 38) && (circle_y - 12 < 61))) begin
                        circle_x <= circle_x - 1;
                    end else begin
                        direction <= 0; // Stop if would hit
                    end
                end else begin
                    direction <= 0; // Stop at edge
                end
            end

            2: begin // Right movement
                // Check: won't go off screen AND won't hit square from the left
                if (circle_x < 83) begin
                    // If moving right would put circle's left edge inside square area
                    if (!((circle_x + 1 + 12 > 4) && (circle_x + 1 - 12 < 27) &&
                          (circle_y + 12 > 38) && (circle_y - 12 < 61))) begin
                        circle_x <= circle_x + 1;
                    end else begin
                        direction <= 0; // Stop if would hit
                    end
                end else begin
                    direction <= 0; // Stop at edge
                end
            end

            3: begin // Up movement
                // Check: won't go off screen AND won't hit square from below
                if (circle_y > 12) begin
                    // If moving up would put circle's bottom edge inside square area
                    if (!((circle_x + 12 > 4) && (circle_x - 12 < 27) &&
                          (circle_y - 1 + 12 > 38) && (circle_y - 1 - 12 < 61))) begin
                        circle_y <= circle_y - 1;
                    end else begin
                        direction <= 0; // Stop if would hit
                    end
                end else begin
                    direction <= 0; // Stop at edge
                end
            end

            4: begin // Down movement
                // Check: won't go off screen AND won't hit square from above
                if (circle_y < 51) begin
                    // If moving down would put circle's top edge inside square area
                    if (!((circle_x + 12 > 4) && (circle_x - 12 < 27) &&
                          (circle_y + 1 + 12 > 38) && (circle_y + 1 - 12 < 61))) begin
                        circle_y <= circle_y + 1;
                    end else begin
                        direction <= 0; // Stop if would hit
                    end
                end else begin
                    direction <= 0; // Stop at edge
                end
            end
        endcase
    end
end

// 3.A3: Create 16-bit oled_data signal
reg [15:0] oled_data;

// Calculate x,y coordinates from pixel_index
wire [6:0] x = pixel_index % 96;  // Column 0-95
wire [5:0] y = pixel_index / 96;  // Row 0-63

// Pixel color logic for Task S: 4.S1 Initial state
always @(pixel_index) begin
    // Default black background
    oled_data <= 16'h0000;

    // Solid red circle (movable, radius=12)
    if ((x - circle_x)*(x - circle_x) + (y - circle_y)*(y - circle_y) <= 144) begin
        oled_data <= 16'hF800; // Red
    end

    // Hollow white square at bottom-left (x=4-27, y=38-61, 24px side, 3px thick) - larger square wrapping the green digit in center
    // Left border
    if (x >= 4 && x <= 6 && y >= 38 && y <= 61) begin
        oled_data <= 16'hFFFF; // White
    end
    // Right border
    if (x >= 25 && x <= 27 && y >= 38 && y <= 61) begin
        oled_data <= 16'hFFFF;
    end
    // Top border
    if (y >= 38 && y <= 40 && x >= 4 && x <= 27) begin
        oled_data <= 16'hFFFF;
    end
    // Bottom border
    if (y >= 59 && y <= 61 && x >= 4 && x <= 27) begin
        oled_data <= 16'hFFFF;
    end

    // Green digit '2' inside square (x=11-19, y=42-56, 9x15) - 3px thick lines, verticals same height (3px)
    // Top horizontal (9 px wide, 3px high)
    if (x >= 11 && x <= 19 && y >= 42 && y <= 44) begin
        oled_data <= 16'h07E0; // Bright green
    end
    // Right vertical from top to middle (3px wide, 3px high)
    if (x >= 17 && x <= 19 && y >= 45 && y <= 47) begin
        oled_data <= 16'h07E0; // Bright green
    end
    // Middle horizontal (9 px wide, 3px high)
    if (x >= 11 && x <= 19 && y >= 48 && y <= 50) begin
        oled_data <= 16'h07E0; // Bright green
    end
    // Left vertical from middle to bottom (3px wide, 3px high)
    if (x >= 11 && x <= 13 && y >= 51 && y <= 53) begin
        oled_data <= 16'h07E0; // Bright green
    end
    // Bottom horizontal (9 px wide, 3px high)
    if (x >= 11 && x <= 19 && y >= 54 && y <= 56) begin
        oled_data <= 16'h07E0; // Bright green
    end
end

endmodule