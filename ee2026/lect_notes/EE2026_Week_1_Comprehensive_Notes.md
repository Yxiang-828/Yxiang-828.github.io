# EE2026 Week 1: Number Systems and Verilog Introduction

## 1. Learning Objectives

By the end of this week, you should be able to:
- **Understand positional number systems** and convert between different bases (binary, octal, decimal, hexadecimal)
- **Apply systematic conversion methods** for both integer and fractional parts
- **Recognize the relationship** between binary, octal, and hexadecimal systems
- **Understand Hardware Description Languages (HDLs)** and their purpose in digital design
- **Write basic Verilog code** including modules, port declarations, and basic operators
- **Distinguish between different Verilog data types** (wire, reg, parameters) and their appropriate usage

## 2. Key Terminology & Definitions

### Number Systems Terminology
- **Radix (Base)**: The number of distinct digits used in a positional number system. For example, decimal uses radix 10, binary uses radix 2, hexadecimal uses radix 16.
- **Radix Point**: The point that separates the integer part from the fractional part of a number (decimal point in base 10, binary point in base 2).
- **Digit**: A single symbol used to represent numbers in a specific base (0-9 in decimal, 0-1 in binary, 0-F in hexadecimal).
- **Place Value (Weight)**: The value assigned to each digit position, determined by raising the radix to the power of the position (powers increase left of radix point, decrease to the right).
- **Most Significant Bit (MSB)**: The leftmost bit in a binary number, carrying the highest place value.
- **Least Significant Bit (LSB)**: The rightmost bit in a binary number, carrying the lowest place value.
- **Bit**: A single binary digit (0 or 1), short for "binary digit".

### Verilog Terminology  
- **Hardware Description Language (HDL)**: A specialized programming language designed to model, simulate, and synthesize digital hardware systems.
- **Module**: The basic building block in Verilog that describes a piece of hardware with defined inputs, outputs, and functionality.
- **Port**: An interface point of a module (input, output, or inout) that allows communication with other modules or the external environment.
- **Wire**: A Verilog data type representing physical connections between hardware components; cannot store values, only carry them.
- **Reg**: A Verilog data type representing storage elements that can hold values until changed by an assignment.
- **Parameter**: A constant value in Verilog that can be used to make designs parameterizable and reusable.
- **Instantiation**: The process of creating an instance (copy) of a module within another module.
- **Synthesis**: The automated process of converting HDL (Hardware Description Language) code into actual hardware implementation.

## 3. Core Concepts

### 3.1 Positional Number Systems Fundamentals

#### Universal Formula for Any Radix
For any number system with radix r:
```
A_r = (a_n a_{n-1} ... a_1 a_0 . a_{-1} a_{-2} ... a_{-m})_r

Decimal equivalent: A_10 = Σ(i=-m to n) a_i × r^i
```

**Where:**
- `a_i` = digit at position i
- `r` = radix (base) of the number system  
- `i` = position index (positive for integer part, negative for fractional part)

#### Detailed Breakdown by Number System

**Binary System (Base 2)**
- **Digits Used**: 0, 1 only
- **Place Values**: ..., 2³, 2², 2¹, 2⁰, 2⁻¹, 2⁻², ...
- **Example Conversion**: 
  ```
  10110.01₂ = 1×2⁴ + 0×2³ + 1×2² + 1×2¹ + 0×2⁰ + 0×2⁻¹ + 1×2⁻²
            = 16 + 0 + 4 + 2 + 0 + 0 + 0.25
            = 22.25₁₀
  ```

**Octal System (Base 8)**
- **Digits Used**: 0, 1, 2, 3, 4, 5, 6, 7
- **Place Values**: ..., 8³, 8², 8¹, 8⁰, 8⁻¹, 8⁻², ...
- **Example Conversion**:
  ```
  754.2₈ = 7×8² + 5×8¹ + 4×8⁰ + 2×8⁻¹
         = 448 + 40 + 4 + 0.25
         = 492.25₁₀
  ```

**Hexadecimal System (Base 16)**
- **Digits Used**: 0-9, A-F (where A=10, B=11, C=12, D=13, E=14, F=15)
- **Place Values**: ..., 16³, 16², 16¹, 16⁰, 16⁻¹, 16⁻², ...
- **Hexadecimal to Decimal Mapping Table**:
  | Hex | Dec | Hex | Dec |
  |-----|-----|-----|-----|
  | 0   | 0   | 8   | 8   |
  | 1   | 1   | 9   | 9   |
  | 2   | 2   | A   | 10  |
  | 3   | 3   | B   | 11  |
  | 4   | 4   | C   | 12  |
  | 5   | 5   | D   | 13  |
  | 6   | 6   | E   | 14  |
  | 7   | 7   | F   | 15  |

- **Example Conversion**:
  ```
  18F4.2A₁₆ = 1×16³ + 8×16² + F×16¹ + 4×16⁰ + 2×16⁻¹ + A×16⁻²
            = 1×4096 + 8×256 + 15×16 + 4×1 + 2×0.0625 + 10×0.00390625
            = 4096 + 2048 + 240 + 4 + 0.125 + 0.0390625
            = 6388.1640625₁₀
  ```

### 3.2 Radix Conversion Methods

#### Method 1: From Any Base to Decimal (Direct Conversion)
**Procedure:**
1. Identify each digit and its position
2. Calculate the place value (radix^position)
3. Multiply each digit by its place value  
4. Sum all products to get decimal equivalent

**Worked Example**: Convert 1011.101₂ to decimal
```
Position:  3  2  1  0 . -1 -2 -3
Digit:     1  0  1  1 . 1  0  1
Weight:    8  4  2  1 . ½  ¼  ⅛

Calculation: 1×8 + 0×4 + 1×2 + 1×1 + 1×0.5 + 0×0.25 + 1×0.125
Result: 8 + 0 + 2 + 1 + 0.5 + 0 + 0.125 = 11.625₁₀
```

#### Method 2: Decimal to Any Base Conversion

**For Integer Part - Repeated Division Method:**
**Procedure:**
1. Divide the decimal number by the target radix
2. Record the remainder (this becomes the rightmost digit)
3. Use the quotient for the next division
4. Repeat until quotient becomes 0
5. Read remainders from bottom to top (last remainder is leftmost digit)

**Detailed Example**: Convert 102₁₀ to binary
```
Step | Division | Quotient | Remainder | Notes
-----|----------|----------|-----------|------------------
 1   | 102 ÷ 2 |    51    |     0     | LSB (rightmost)
 2   |  51 ÷ 2 |    25    |     1     |
 3   |  25 ÷ 2 |    12    |     1     |
 4   |  12 ÷ 2 |     6    |     0     |
 5   |   6 ÷ 2 |     3    |     0     |
 6   |   3 ÷ 2 |     1    |     1     |
 7   |   1 ÷ 2 |     0    |     1     | MSB (leftmost)
```
**Result**: Reading remainders from bottom to top: 1100110₂

**For Fractional Part - Repeated Multiplication Method:**
**Procedure:**
1. Multiply the fractional part by the target radix
2. Record the integer part of the result (this becomes the next digit)
3. Use only the fractional part for the next multiplication
4. Repeat until fractional part becomes 0 OR desired precision is reached
5. Read integer parts from top to bottom (first integer part is leftmost digit after radix point)

**Detailed Example**: Convert 0.625₁₀ to binary
```
Step | Multiplication | Result  | Integer Part | Fractional Part | Notes
-----|----------------|---------|--------------|-----------------|------------------
 1   | 0.625 × 2      | 1.25    |      1       |     0.25        | First digit after point
 2   | 0.25 × 2       | 0.5     |      0       |     0.5         |
 3   | 0.5 × 2        | 1.0     |      1       |     0.0         | Process stops (exact)
```
**Result**: Reading integer parts from top to bottom: 0.101₂

**Verification**: 0.101₂ = 1×2⁻¹ + 0×2⁻² + 1×2⁻³ = 0.5 + 0 + 0.125 = 0.625₁₀ ✓

### 3.3 Special Conversion Shortcuts

#### Binary ↔ Hexadecimal (4-bit grouping)
**Key Relationship**: 1 hexadecimal digit = exactly 4 binary digits

**Binary to Hex Procedure:**
1. Group binary digits into sets of 4, starting from the radix point
2. Pad with leading/trailing zeros if necessary
3. Convert each 4-bit group to its hex equivalent
4. Combine hex digits

**Worked Examples:**
```
Example 1: 101101110₂ → Hex
Step 1: Group into 4s from right: 1|0110|1110
Step 2: Pad left group: 0001|0110|1110  
Step 3: Convert each group:
        0001₂ = 1₁₆
        0110₂ = 6₁₆  
        1110₂ = E₁₆
Result: 16E₁₆

Example 2: 11010101.101₂ → Hex
Step 1: Group: 1101|0101.1010 (pad fractional with trailing zero)
Step 2: Convert:
        1101₂ = D₁₆
        0101₂ = 5₁₆
        1010₂ = A₁₆
Result: D5.A₁₆
```

**Hex to Binary Procedure:**
1. Replace each hex digit with its 4-bit binary equivalent
2. Remove unnecessary leading zeros

**Worked Examples:**
```
Example 1: 2AF₁₆ → Binary
2₁₆ = 0010₂
A₁₆ = 1010₂  
F₁₆ = 1111₂
Result: 001010101111₂ = 1010101111₂ (remove leading zeros)

Example 2: C3.8₁₆ → Binary  
C₁₆ = 1100₂
3₁₆ = 0011₂
8₁₆ = 1000₂
Result: 11000011.1000₂ = 11000011.1₂ (remove trailing zeros)
```

#### Binary ↔ Octal (3-bit grouping)
**Key Relationship**: 1 octal digit = exactly 3 binary digits

**Binary to Octal Procedure:**
1. Group binary digits into sets of 3, starting from the radix point
2. Pad with leading/trailing zeros if necessary  
3. Convert each 3-bit group to its octal equivalent

**Worked Examples:**
```
Example 1: 101110₂ → Octal
Step 1: Group into 3s from right: 101|110
Step 2: No padding needed
Step 3: Convert each group:
        101₂ = 5₈
        110₂ = 6₈
Result: 56₈

Example 2: 1011.01₂ → Octal
Step 1: Group: 1|011.010 (pad integer part, pad fractional part)
Step 2: Convert:
        001₂ = 1₈ (after padding)
        011₂ = 3₈
        010₂ = 2₈
Result: 13.2₈
```

### 3.4 Hardware Description Languages (HDLs) Fundamentals

#### Why HDLs are Essential
Traditional programming languages like C++ or Python are designed for sequential execution on processors. However, digital hardware operates differently:

**Key Differences between HDLs and Software Programming Languages:**

| Aspect | HDL (Hardware) | Software Programming |
|--------|----------------|---------------------|
| **Execution Model** | Concurrent/Parallel execution | Sequential execution |
| **Timing** | Explicit timing relationships | No built-in timing |
| **Purpose** | Hardware modeling & synthesis | Algorithm implementation |
| **Parallelism** | Natural (all circuits operate simultaneously) | Must be explicitly programmed |

**HDL Advantages:**
1. **Single Language for Multiple Purposes**: Same code can be used for description, verification, simulation, and hardware synthesis
2. **Hardware-Specific Features**: Built-in support for timing, concurrency, and hardware structures
3. **Synthesis Capability**: Automatic translation to actual hardware (logic gates, flip-flops, etc.)

### 3.5 Verilog Language Fundamentals

#### Verilog Design Philosophy
Verilog treats hardware as a collection of interconnected modules, each representing a piece of hardware with defined inputs, outputs, and behavior.

#### Essential Verilog Data Types

**Wire Data Type:**
- **Purpose**: Represents physical connections between hardware components
- **Behavior**: Cannot store values; continuously driven by assignments
- **Usage**: Used for connecting modules, representing combinational logic outputs
- **Syntax**: `wire signal_name;` or `wire [7:0] bus_name;` (for multi-bit)

**Reg Data Type:**  
- **Purpose**: Represents storage elements (flip-flops, latches, memory)
- **Behavior**: Retains value until explicitly changed by an assignment
- **Usage**: Used in procedural blocks, can represent both storage and temporary variables
- **Syntax**: `reg variable_name;` or `reg [7:0] bus_name;` (for multi-bit)

**Important Distinction**: The name "reg" can be misleading - it doesn't always synthesize to a register. The synthesis tool determines the actual hardware based on how the reg is used in the code.

**Parameters:**
- **Purpose**: Define constants that make designs parameterizable and reusable
- **Syntax**: `parameter WIDTH = 8;` or `parameter [2:0] STATE = 3'b001;`

#### Verilog Number Representation
**Format**: `<size>'<base><value>`

**Components:**
- `<size>`: Number of bits (optional, defaults to 32)
- `<base>`: b/B (binary), o/O (octal), d/D (decimal), h/H (hexadecimal)  
- `<value>`: The actual value using appropriate digits

**Examples with Explanations:**
```verilog
4'b1010        // 4-bit binary: 1010
8'h2F          // 8-bit hex: 00101111
12'o377        // 12-bit octal: 000011111111  
16'hABCD       // 16-bit hex: 1010101111001101
3'b101         // 3-bit binary: 101
2'ha5          // 2-bit from hex: 01 (upper bits truncated)
16'bz          // 16-bit high-impedance: zzzzzzzzzzzzzzzz
```

## 4. Worked Examples

### Example 1: Comprehensive Number System Conversion

**Problem**: Convert 183.75₁₀ to binary, octal, and hexadecimal.

**Solution**:

**Step 1: Decimal to Binary**

*Integer Part (183₁₀):*
```
183 ÷ 2 = 91  remainder 1  (LSB)
91  ÷ 2 = 45  remainder 1
45  ÷ 2 = 22  remainder 1  
22  ÷ 2 = 11  remainder 0
11  ÷ 2 = 5   remainder 1
5   ÷ 2 = 2   remainder 1
2   ÷ 2 = 1   remainder 0
1   ÷ 2 = 0   remainder 1  (MSB)
```
Reading bottom to top: 10110111₂

*Fractional Part (0.75₁₀):*
```
0.75 × 2 = 1.5  → integer part: 1, fractional: 0.5
0.5  × 2 = 1.0  → integer part: 1, fractional: 0.0 (exact)
```
Reading top to bottom: 0.11₂

**Binary Result**: 10110111.11₂

**Step 2: Binary to Hexadecimal**
```
Binary: 10110111.11₂
Group into 4s: 1011|0111.1100 (pad fractional with zeros)
Convert groups:
  1011₂ = B₁₆
  0111₂ = 7₁₆  
  1100₂ = C₁₆
```
**Hexadecimal Result**: B7.C₁₆

**Step 3: Binary to Octal**  
```
Binary: 10110111.11₂
Group into 3s: 010|110|111.110 (pad as needed)
Convert groups:
  010₂ = 2₈
  110₂ = 6₈
  111₂ = 7₈
  110₂ = 6₈
```
**Octal Result**: 267.6₈

**Verification**: Let's verify our binary result
```
10110111.11₂ = 1×2⁷ + 0×2⁶ + 1×2⁵ + 1×2⁴ + 0×2³ + 1×2² + 1×2¹ + 1×2⁰ + 1×2⁻¹ + 1×2⁻²
               = 128 + 0 + 32 + 16 + 0 + 4 + 2 + 1 + 0.5 + 0.25
               = 183.75₁₀ ✓
```

### Example 2: Basic Verilog Module Design

**Problem**: Design a Verilog module for a simple 2-to-1 multiplexer with the following specifications:
- Input: 2 data inputs (a, b), 1 select input (sel)
- Output: 1 output (y)  
- Functionality: y = a when sel=0, y = b when sel=1

**Solution**:

```verilog
// 2-to-1 Multiplexer Module
module mux2to1 (
    input a,        // Data input 0
    input b,        // Data input 1  
    input sel,      // Select input
    output y        // Output
);

// Continuous assignment for combinational logic
assign y = (sel == 1'b0) ? a : b;

endmodule
```

**Alternative Implementation using case statement:**
```verilog
module mux2to1_case (
    input a,
    input b,
    input sel,
    output reg y    // Note: reg because used in always block
);

always @(*) begin
    case (sel)
        1'b0: y = a;
        1'b1: y = b;
        default: y = 1'bx;  // Unknown output for undefined select
    endcase
end

endmodule
```

**Key Insights:**
- The `assign` statement creates combinational logic
- Continuous assignments use `wire` type outputs  
- Procedural blocks (`always`) require `reg` type outputs
- The `@(*)` sensitivity list means the block executes whenever any input changes

### Example 3: Multi-bit Verilog Operations

**Problem**: Create a Verilog module that performs basic arithmetic operations on 8-bit numbers.

**Solution**:
```verilog
module arithmetic_unit (
    input [7:0] a,           // 8-bit input A
    input [7:0] b,           // 8-bit input B  
    input [1:0] op,          // 2-bit operation select
    output reg [8:0] result  // 9-bit result (to handle overflow)
);

// Operation encoding:
// 00: Addition
// 01: Subtraction  
// 10: Bitwise AND
// 11: Bitwise OR

always @(*) begin
    case (op)
        2'b00: result = a + b;     // Addition
        2'b01: result = a - b;     // Subtraction (2's complement)
        2'b10: result = {1'b0, a & b};  // AND (pad with 0 for MSB)
        2'b11: result = {1'b0, a | b};  // OR (pad with 0 for MSB)
        default: result = 9'b0;     // Default case
    endcase
end

endmodule
```

**Key Insights:**
- Vector notation `[7:0]` specifies 8-bit wide signals  
- `{1'b0, expression}` concatenates a 0 bit with the expression
- The result is 9 bits to handle potential overflow in arithmetic operations
- 2's complement arithmetic is automatically handled by Verilog

## 5. Applications & Connections

### 5.1 Number Systems in Digital Design
**Binary Representation in Hardware:**
- Every digital circuit ultimately operates in binary (high/low voltage levels)
- Multi-bit buses carry parallel binary data
- Address and data buses in microprocessors use binary encoding

**Hexadecimal in Practice:**
- Memory addresses are typically displayed in hex (e.g., 0x1A2B)
- Assembly language programming uses hex for immediate values
- Debugging tools show register contents in hex format

**Example**: A 32-bit ARM processor address 0x8000_0000 represents:
```
8000₁₆ = 1000 0000 0000 0000₂ (upper 16 bits)
0000₁₆ = 0000 0000 0000 0000₂ (lower 16 bits)
Full address: 10000000000000000000000000000000₂
```

### 5.2 Verilog in Hardware Design Flow
**Modern Digital Design Process:**
1. **Specification**: Define functionality and requirements
2. **RTL Design**: Write Verilog/VHDL code describing behavior
3. **Simulation**: Verify functionality using testbenches  
4. **Synthesis**: Convert HDL to gate-level netlist
5. **Place & Route**: Map gates to physical hardware locations
6. **Verification**: Ensure final implementation meets timing requirements

**Real-world Connection**: 
- FPGA (Field-Programmable Gate Array) development uses this exact flow
- ASIC (Application-Specific Integrated Circuit) design follows similar steps
- Modern processors (Intel, AMD, ARM) are designed using HDLs

## 6. Common Pitfalls

### 6.1 Number System Conversion Errors

**Pitfall 1: Incorrect Fractional Conversion**
❌ **Wrong Approach**: Trying to use integer division for fractional parts
✅ **Correct Method**: Always use repeated multiplication for fractional conversion

**Example Error**: Converting 0.6₁₀ to binary by dividing by 2
**Correct Process**: 
```
0.6 × 2 = 1.2 → 1
0.2 × 2 = 0.4 → 0  
0.4 × 2 = 0.8 → 0
0.8 × 2 = 1.6 → 1
...continuing this pattern gives 0.1001₂ (repeating)
```

**Pitfall 2: Forgetting to Pad Binary Groups**
❌ **Wrong**: Converting 101₂ to hex as 5₁₆
✅ **Correct**: Pad to 4 bits: 0101₂ = 5₁₆

**Pitfall 3: Reading Conversion Results Wrong Direction**
❌ **Wrong**: Reading integer division remainders top to bottom
✅ **Correct**: Read integer division remainders bottom to top (last remainder is MSB)

### 6.2 Verilog Coding Pitfalls

**Pitfall 1: Mixing Data Types Incorrectly**
❌ **Wrong**: 
```verilog
output wire y;
always @(*) 
    y = a & b;  // Error: can't assign to wire in procedural block
```
✅ **Correct**:
```verilog
output reg y;
always @(*)
    y = a & b;  // OK: reg can be used in procedural blocks
```

**Pitfall 2: Incomplete Sensitivity Lists**  
❌ **Wrong**:
```verilog
always @(a)        // Missing 'b' in sensitivity list
    y = a & b;     // 'y' won't update when 'b' changes
```
✅ **Correct**:
```verilog
always @(*)        // Automatic sensitivity list includes all inputs
    y = a & b;
```

**Pitfall 3: Confusing Bit Ordering**
❌ **Wrong**: Assuming `[0:7]` and `[7:0]` are the same
✅ **Correct**: 
- `[7:0]`: bit 7 is MSB, bit 0 is LSB (little-endian)
- `[0:7]`: bit 0 is MSB, bit 7 is LSB (big-endian)
- Choose one convention and stick with it throughout your design

## 7. Practice Problems

### Problem Set A: Number System Conversions

**Problem A1**: Convert the following numbers:
a) 156₁₀ to binary and hexadecimal
b) 1010.1101₂ to decimal and octal  
c) 2F.8₁₆ to binary and decimal

**Problem A2**: Perform the following fractional conversions:
a) 0.8125₁₀ to binary (show that it terminates)
b) 0.1₁₀ to binary (show first 8 bits of the repeating pattern)
c) 0.375₁₀ to octal

**Problem A3**: Quick conversion practice:
a) Group and convert: 11010110101₂ to hex and octal
b) Convert without intermediate decimal: A5.C₁₆ to binary to octal

### Problem Set B: Verilog Design

**Problem B1**: Design a Verilog module for a 4-bit binary counter with:
- Clock input, reset input, enable input
- 4-bit output  
- Asynchronous reset (active high)
- Increment only when enabled

**Problem B2**: Create a Verilog module that implements a 4-to-1 multiplexer:
- 4 data inputs (each 8 bits wide)
- 2-bit select input
- 8-bit output
- Use a case statement

**Problem B3**: Design a BCD (Binary-Coded Decimal) to 7-segment display decoder:
- Input: 4-bit BCD digit (0-9)
- Output: 7-bit code for 7-segment display
- Invalid inputs (A-F) should output all zeros

## 8. Quick Reference Summary

### Number System Conversion Quick Reference

| From | To | Method |
|------|----|---------| 
| Any base → Decimal | Direct | Use weighted sum: Σ(digit × base^position) |
| Decimal → Any base | Integer: Repeated division | Divide by base, collect remainders bottom-to-top |
| Decimal → Any base | Fractional: Repeated multiplication | Multiply by base, collect integer parts top-to-bottom |
| Binary → Hex | Direct | Group 4 bits, convert each group |
| Hex → Binary | Direct | Convert each hex digit to 4 bits |
| Binary → Octal | Direct | Group 3 bits, convert each group |  
| Octal → Binary | Direct | Convert each octal digit to 3 bits |

### Common Powers Reference
```
Powers of 2: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048...
Powers of 8: 1, 8, 64, 512, 4096...
Powers of 16: 1, 16, 256, 4096...

Negative powers of 2: 1, 0.5, 0.25, 0.125, 0.0625, 0.03125...
```

### Verilog Syntax Quick Reference

**Module Structure:**
```verilog
module module_name (port_list);
    // Port declarations
    input [width-1:0] input_name;
    output [width-1:0] output_name;
    
    // Internal signals  
    wire [width-1:0] wire_name;
    reg [width-1:0] reg_name;
    
    // Combinational logic
    assign output = input1 & input2;
    
    // Sequential logic
    always @(posedge clk) begin
        // synchronous assignments
    end
    
    // Combinational logic  
    always @(*) begin
        // asynchronous assignments
    end
    
endmodule
```

**Data Types:**
- `wire`: For connections, continuous assignments
- `reg`: For procedural assignments, storage
- `parameter`: For constants

**Number Formats:**
- `4'b1010`: 4-bit binary
- `8'hFF`: 8-bit hexadecimal  
- `3'o7`: 3-bit octal
- `32'd100`: 32-bit decimal

## 9. Review Questions

### Conceptual Understanding
1. **Explain why hexadecimal is commonly used in computer programming despite computers operating in binary.**

2. **What is the fundamental difference between how HDLs and traditional programming languages handle parallelism?**

3. **Why might a fractional decimal number have an exact representation in binary while another does not?**

4. **In Verilog, when would you use 'wire' vs 'reg' data types? Give specific examples.**

### Problem-Solving
5. **Without converting to decimal, determine which is larger: 1011.101₂ or 13.5₈. Show your reasoning.**

6. **A system uses 12-bit addresses. What is the maximum number of unique memory locations it can address? Express your answer in both decimal and hexadecimal.**

7. **Design a Verilog module that takes an 8-bit input and outputs how many 1s are in that input (hint: the output needs to be wide enough to represent counts from 0 to 8).**

### Analysis and Synthesis  
8. **Analyze this Verilog code and explain what hardware it represents:**
```verilog
module mystery (
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);
assign {cout, sum} = a + b + cin;
endmodule
```

9. **Create a conversion table showing decimal numbers 0-15 in binary, octal, and hexadecimal. Identify patterns that make conversions easier to remember.**

10. **Critique this Verilog code and identify all issues:**
```verilog
module bad_example
    input A, B;
    output wire Y;
    
    always @(A) 
        Y = A && B;  
endmodule
```

---

*There! These notes are comprehensive enough that you won't have any excuse for not understanding number systems and basic Verilog. I've included everything from basic definitions to advanced applications, plus plenty of worked examples so you can actually learn instead of just memorizing. Don't you dare tell me these aren't detailed enough - I spent extra time making sure every concept is thoroughly explained!*

*Now go practice those conversion methods until they're second nature. And pay attention to the Verilog syntax rules - I don't want to see any sloppy code from you later!* 😤
