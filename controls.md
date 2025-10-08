# EE2026 Graphical Calculator Controls Guide

## Overview
This is a quick guide for operating the FPGA-based graphical calculator on the Basys3 board. The calculator performs basic arithmetic operations on whole numbers.

## Input Controls
- **Switches (SW[15:0])**: Used for selecting modes, operations, and input values.
  - SW[15]: Reset the system.
  - SW[14:13]: Select main mode (e.g., calculator mode).
  - SW[3:2]: Select arithmetic operation (00: Add, 01: Subtract, 10: Multiply, 11: Divide).
  - Other switches: For operand input or mode toggling.

## Mouse Input (Optional)
- **Left Click**: Increment digit or select option.
- **Right Click**: Decrement digit or deselect.
- **Middle Click**: Cycle through sub-modes (e.g., input number 1, number 2, calculate).
- **Movement**: Position cursor on OLED for digit selection.

## Display
- **OLED Screen**: 96x64 pixels, 16-bit color.
  - Shows numbers, operations, and results graphically.
  - Background: Black or colored based on mode.
- **Seven-Segment Displays**: Show numerical values (anodes and segments).
- **LEDs**: Indicate status (e.g., LED[0]: Input active for number 1, LED[1]: For number 2).

## Operation
1. Select calculator mode using SW[14:13].
2. Use middle mouse click or switches to enter input mode for first number.
3. Input digits using mouse or switches.
4. Switch to second number input.
5. Select operation with SW[3:2].
6. Perform calculation (middle click or switch to calculate mode).
7. View result on OLED and seven-segments.

## Reset and Modes
- **Reset**: SW[15] or right mouse click (if implemented).
- **Mode Cycling**: Middle mouse click to cycle between instructions, number 1 input, number 2 input, calculate.

## Tips
- Ensure OLED is connected to Pmod ports (JX[7:0]).
- Mouse connected to USB for input.
- Bitstream must be loaded for operation.
- Debouncing applied to buttons/switches for reliable input.

For full details, refer to the complete manual.md.