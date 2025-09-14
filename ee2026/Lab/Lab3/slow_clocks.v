`timescale 1ns / 1ps

module slow_clocks(
    input CLK,
    output slow_1hz,
    output slow_10hz,
    output slow_100hz
);

// 1 Hz: toggle every 50M cycles (100M / 2)
reg [25:0] cnt1 = 0;
reg slow_1hz_reg = 0;
always @(posedge CLK) begin
    if (cnt1 == 50000000 - 1) begin
        cnt1 <= 0;
        slow_1hz_reg <= ~slow_1hz_reg;
    end else begin
        cnt1 <= cnt1 + 1;
    end
end
assign slow_1hz = slow_1hz_reg;

// 10 Hz: toggle every 5M cycles (10M / 2)
reg [22:0] cnt10 = 0; // 23 bits for 8M
reg slow_10hz_reg = 0;
always @(posedge CLK) begin
    if (cnt10 == 5000000 - 1) begin
        cnt10 <= 0;
        slow_10hz_reg <= ~slow_10hz_reg;
    end else begin
        cnt10 <= cnt10 + 1;
    end
end
assign slow_10hz = slow_10hz_reg;

// 100 Hz: toggle every 500K cycles (1M / 2)
reg [18:0] cnt100 = 0; // 19 bits for 524K
reg slow_100hz_reg = 0;
always @(posedge CLK) begin
    if (cnt100 == 500000 - 1) begin
        cnt100 <= 0;
        slow_100hz_reg <= ~slow_100hz_reg;
    end else begin
        cnt100 <= cnt100 + 1;
    end
end
assign slow_100hz = slow_100hz_reg;

endmodule