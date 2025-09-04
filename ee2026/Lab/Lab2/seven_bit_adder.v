`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 31.08.2025 00:42:20
// Design Name:
// Module Name: seven_bit_adder
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module seven_bit_adder (
    input [6:0] A,      // 7-bit input A (from switches)
    input [6:0] B,      // 7-bit input B (from switches)
    output [8:0] led,   // 9 LEDs for display
    output [6:0] seg,   // 7-segment display segments
    output [3:0] an     // 7-segment display anodes
);
    wire carry_2to5;    // Carry from 2-bit adder to 5-bit adder
    wire unused_carry;  // Final carry that gets discarded
    wire [6:0] result;  // Complete 7-bit addition result

    // Lower 2 bits: Use 2-bit parallel adder
    // LSB module: No carry in, but has carry out
    two_bit_adder ADDER_2BIT (
        .A(A[1:0]),           // Bits [1:0] of input A
        .B(B[1:0]),           // Bits [1:0] of input B
        .Cin(1'b0),           // No carry input for LSB section
        .Sum(result[1:0]),    // Store lower 2 bits of result
        .Cout(carry_2to5)     // Carry to upper section
    );

    // Upper 5 bits: Use 5-bit parallel adder
    // MSB module: Has carry in, but no carry out (discarded)
    five_bit_adder ADDER_5BIT (
        .A(A[6:2]),           // Bits [6:2] of input A
        .B(B[6:2]),           // Bits [6:2] of input B
        .Cin(carry_2to5),     // Carry input from 2-bit section
        .Sum(result[6:2]),    // Store upper 5 bits of result
        .Cout(unused_carry)   // Final carry is discarded
    );

    // Enable only the rightmost display (anode 0)
    // Active low anodes - only rightmost digit enabled
    assign an = 4'b1000;  // Only an[0] is active high

endmodule