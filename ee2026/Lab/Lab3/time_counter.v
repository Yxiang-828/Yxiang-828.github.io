`timescale 1ns / 1ps

module time_counter(
    input CLK,
    output reg pulse_1_11s
);

parameter COUNT_1_11S = 111000000; // 100MHz * 1.11s ? 111M cycles

reg [26:0] counter = 0; // 27 bits for up to 134M

always @(posedge CLK) begin
    if (counter == COUNT_1_11S - 1) begin
        counter <= 0;
        pulse_1_11s <= 1;
    end else begin
        counter <= counter + 1;
        pulse_1_11s <= 0;
    end
end

endmodule