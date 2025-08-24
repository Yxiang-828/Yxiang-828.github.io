# EE2026 Tutorial 1: Number Systems & Verilog Fundamentals

## 1. Learning Objectives
- Master conversion between decimal, binary, hexadecimal, and octal number systems
- Understand fractional number conversions with precision limitations
- Solve radix identification problems using algebraic methods
- Implement Verilog modules with bit indexing and concatenation operators
- Understand big-endian vs little-endian data representation in computer systems
- Apply bit manipulation techniques for endianness conversion

## 2. Key Terminology & Definitions

**Radix (Base)**: The number of unique digits used in a positional number system. Binary uses radix 2, decimal uses radix 10, hexadecimal uses radix 16.

**Most Significant Bit (MSB)**: The leftmost bit in a binary number that carries the highest positional weight (2^n where n is the highest position).

**Least Significant Bit (LSB)**: The rightmost bit in a binary number that carries the lowest positional weight (2^0 = 1).

**Big Endian**: Data storage format where the Most Significant Byte (MSB) is stored at the lowest memory address. The "big end" comes first.

**Little Endian**: Data storage format where the Least Significant Byte (LSB) is stored at the lowest memory address. The "little end" comes first.

**Byte**: A group of 8 bits, the basic addressable unit in most computer architectures.

**Bit Indexing**: The method of accessing individual bits or ranges of bits within a multi-bit signal using square bracket notation in Verilog.

**Concatenation Operator**: The Verilog operator `{}` used to join multiple signals or bit ranges into a single wider signal.

## 3. Core Concepts

### Number System Conversion Procedures

#### **Decimal to Binary Conversion**
**Method**: Successive division by 2, collecting remainders from bottom to top

**Procedure**:
1. Divide the decimal number by 2
2. Record the remainder (0 or 1)
3. Use the quotient for the next division
4. Continue until quotient becomes 0
5. Read remainders from bottom to top

**For Fractional Parts**:
1. Multiply fractional part by 2
2. Record the integer part (0 or 1)
3. Use the new fractional part for next multiplication
4. Continue until fractional part becomes 0 or desired precision reached

#### **Decimal to Hexadecimal Conversion**
**Method**: Successive division by 16, using digits 0-9 and A-F

**Hexadecimal Digits**: 0,1,2,3,4,5,6,7,8,9,A(10),B(11),C(12),D(13),E(14),F(15)

**Procedure**:
1. Divide decimal number by 16
2. Convert remainder to hex digit (0-9, A-F)
3. Use quotient for next division
4. Continue until quotient becomes 0
5. Read hex digits from bottom to top

#### **Binary to Octal Conversion**
**Method**: Group binary digits in sets of 3 (since 2³ = 8)

**Procedure**:
1. Group binary digits from right to left in sets of 3
2. Add leading zeros if necessary to complete leftmost group
3. Convert each 3-bit group to its octal equivalent (0-7)
4. Concatenate octal digits

**Binary-Octal Mapping**:
- 000₂ = 0₈
- 001₂ = 1₈
- 010₂ = 2₈
- 011₂ = 3₈
- 100₂ = 4₈
- 101₂ = 5₈
- 110₂ = 6₈
- 111₂ = 7₈

#### **Hexadecimal to Binary Conversion**
**Method**: Each hex digit converts to exactly 4 binary digits

**Procedure**:
1. Convert each hexadecimal digit to its 4-bit binary equivalent
2. Concatenate all 4-bit groups
3. Remove leading zeros if desired

**Hex-Binary Mapping**:
- 0₁₆ = 0000₂, 1₁₆ = 0001₂, 2₁₆ = 0010₂, 3₁₆ = 0011₂
- 4₁₆ = 0100₂, 5₁₆ = 0101₂, 6₁₆ = 0110₂, 7₁₆ = 0111₂
- 8₁₆ = 1000₂, 9₁₆ = 1001₂, A₁₆ = 1010₂, B₁₆ = 1011₂
- C₁₆ = 1100₂, D₁₆ = 1101₂, E₁₆ = 1110₂, F₁₆ = 1111₂

#### **Hexadecimal to Decimal Conversion**
**Method**: Direct positional notation using powers of 16

**Concept**: Each position in a hexadecimal number represents a power of 16, starting from 16⁰ on the right.

**Procedure**:
1. Identify each hex digit's position (rightmost is position 0)
2. Convert hex digits A-F to decimal values: A=10, B=11, C=12, D=13, E=14, F=15
3. Multiply each digit by 16 raised to its position power
4. Sum all results to get the decimal equivalent

**Powers of 16 Reference**:
| Position | Power | Decimal Value |
| -------- | ----- | ------------- |
| 0        | 16⁰   | 1             |
| 1        | 16¹   | 16            |
| 2        | 16²   | 256           |
| 3        | 16³   | 4,096         |
| 4        | 16⁴   | 65,536        |

**Example 1**: Convert 2A3₁₆ to decimal
```
Position:  2   1   0
Hex:      2   A   3
Powers:   16² 16¹ 16⁰
Values:   256  16   1

Calculation:
2 × 256 = 512
A(10) × 16 = 160
3 × 1 = 3
Total: 512 + 160 + 3 = 675₁₀
```

**Example 2**: Convert 1F4B₁₆ to decimal
```
Position:  3    2   1   0
Hex:      1    F   4   B
Powers:   16³  16² 16¹ 16⁰
Values:   4096 256  16   1

Calculation:
1 × 4096 = 4096
F(15) × 256 = 3840
4 × 16 = 64
B(11) × 1 = 11
Total: 4096 + 3840 + 64 + 11 = 8011₁₀
```

**Key Advantage**: This direct method is more efficient than converting hex→binary→decimal, as it eliminates the intermediate binary step and directly applies the positional value concept.

### Verilog Bit Manipulation Fundamentals

#### **Bit Indexing Syntax**
```verilog
wire [31:0] data;  // 32-bit signal, MSB at position 31
data[31]    // Single bit access (MSB)
data[7:0]   // Byte access (LSB byte)
data[31:24] // MSB byte access
```

#### **Concatenation Operator**
```verilog
{data[7:0], data[15:8], data[23:16], data[31:24]}  // Reverse byte order
```

### Endianness in Computer Systems

#### **Big Endian Architecture**
- **Memory Layout**: MSB stored at lowest address
- **Example**: 0x12345678 stored as [12][34][56][78] in consecutive bytes
- **Used by**: PowerPC, SPARC, some ARM configurations
- **Advantage**: Natural for humans reading hex dumps

#### **Little Endian Architecture**
- **Memory Layout**: LSB stored at lowest address
- **Example**: 0x12345678 stored as [78][56][34][12] in consecutive bytes
- **Used by**: x86, x86-64, most ARM configurations
- **Advantage**: Simplifies arithmetic operations in hardware

## 4. Worked Examples

### **Example 1: Decimal to Binary (166.34₁₀)**

**Integer Part (166₁₀)**:
```
166 ÷ 2 = 83 remainder 0
83  ÷ 2 = 41 remainder 1
41  ÷ 2 = 20 remainder 1
20  ÷ 2 = 10 remainder 0
10  ÷ 2 = 5  remainder 0
5   ÷ 2 = 2  remainder 1
2   ÷ 2 = 1  remainder 0
1   ÷ 2 = 0  remainder 1
```
**Reading from bottom to top**: 166₁₀ = 10100110₂

**Fractional Part (0.34₁₀)**:
```
0.34 × 2 = 0.68 → 0
0.68 × 2 = 1.36 → 1
0.36 × 2 = 0.72 → 0
0.72 × 2 = 1.44 → 1
0.44 × 2 = 0.88 → 0
0.88 × 2 = 1.76 → 1
... (continues, never terminates exactly)
```
**Result**: 0.34₁₀ ≈ 0.010101₂ (to 6 decimal places)

**Complete Answer**: 166.34₁₀ = 10100110.010101₂

**Key Insight**: Most decimal fractions cannot be represented exactly in binary due to different base relationships.

### **Example 2: Decimal to Hexadecimal (1400.16₁₀)**

**Integer Part (1400₁₀)**:
```
1400 ÷ 16 = 87 remainder 8
87   ÷ 16 = 5  remainder 7
5    ÷ 16 = 0  remainder 5
```
**Reading from bottom to top**: 1400₁₀ = 578₁₆

**Fractional Part (0.16₁₀)**:
```
0.16 × 16 = 2.56 → 2
0.56 × 16 = 8.96 → 8
0.96 × 16 = 15.36 → F (15 in hex)
0.36 × 16 = 5.76 → 5
... (continues)
```
**Result**: 0.16₁₀ ≈ 0.28F5₁₆

**Complete Answer**: 1400.16₁₀ = 578.28F5₁₆

### **Example 3: Binary to Octal (101011100.000111₂)**

**Integer Part**: 101011100₂
**Grouping in 3s from right**: 101|011|100₂
- 100₂ = 4₈
- 011₂ = 3₈
- 101₂ = 5₈

**Result**: 534₈

**Fractional Part**: .000111₂
**Grouping in 3s from left**: .000|111₂
- 000₂ = 0₈
- 111₂ = 7₈

**Result**: .07₈

**Complete Answer**: 101011100.000111₂ = 534.07₈

### **Example 4: Hexadecimal to Binary (A59.FCE₁₆)**

**Converting each hex digit**:
- A₁₆ = 1010₂
- 5₁₆ = 0101₂
- 9₁₆ = 1001₂
- F₁₆ = 1111₂
- C₁₆ = 1100₂
- E₁₆ = 1110₂

**Complete Answer**: A59.FCE₁₆ = 101001011001.111111001110₂

### **Example 5: Hexadecimal to Decimal (B3A.C8₁₆)**

**Integer Part (B3A₁₆)**:
```
Position:  2   1   0
Hex:      B   3   A
Powers:   16² 16¹ 16⁰
Values:   256  16   1

Calculation:
B(11) × 256 = 2816
3 × 16 = 48
A(10) × 1 = 10
Total: 2816 + 48 + 10 = 2874₁₀
```

**Fractional Part (.C8₁₆)**:
```
Position:  -1   -2
Hex:      C    8
Powers:   16⁻¹ 16⁻²
Values:   1/16 1/256

Calculation:
C(12) × (1/16) = 12/16 = 0.75
8 × (1/256) = 8/256 = 0.03125
Total: 0.75 + 0.03125 = 0.78125₁₀
```

**Complete Answer**: B3A.C8₁₆ = 2874.78125₁₀

**Verification using alternative method**:
- Convert to binary first: B3A.C8₁₆ = 101100111010.11001₂
- Then binary to decimal: 2048+1024+256+64+8+2 + 0.75+0.03125 = 2874.78125₁₀ ✓

**Key Insight**: The direct positional method is more efficient and less error-prone than the two-step hex→binary→decimal conversion process.

### **Example 6: Radix Identification Problem**

**Given**: (62)ₓ - (26)ₓ = (34)ₓ

**Setting up the equation in decimal**:
- (62)ₓ = 6x¹ + 2x⁰ = 6x + 2
- (26)ₓ = 2x¹ + 6x⁰ = 2x + 6
- (34)ₓ = 3x¹ + 4x⁰ = 3x + 4

**Equation**: (6x + 2) - (2x + 6) = 3x + 4
**Simplifying**: 6x + 2 - 2x - 6 = 3x + 4
**Further**: 4x - 4 = 3x + 4
**Solving**: 4x - 3x = 4 + 4
**Result**: x = 8

**Answer**: The radix is 8 (octal)

**Verification**: (62)₈ - (26)₈ = 50₁₀ - 22₁₀ = 28₁₀ = (34)₈ ✓

### **Example 7: Verilog Endianness Conversion**

**Problem**: Convert 32-bit big-endian to little-endian
**Input**: 32'h78563412 (big-endian)
**Output**: 32'h12345678 (little-endian)

**Verilog Implementation**:
```verilog
module endian_converter (
    input  [31:0] X,    // Big-endian input
    output [31:0] Y     // Little-endian output
);

// Method 1: Using bit indexing and concatenation
assign Y = {X[7:0], X[15:8], X[23:16], X[31:24]};

// Method 2: More explicit byte swapping
assign Y[31:24] = X[7:0];   // Move LSB to MSB position
assign Y[23:16] = X[15:8];  // Move byte 1 to byte 2 position
assign Y[15:8]  = X[23:16]; // Move byte 2 to byte 1 position
assign Y[7:0]   = X[31:24]; // Move MSB to LSB position

endmodule
```

**Step-by-step Analysis**:
1. **Input X = 32'h78563412**
   - X[31:24] = 8'h78 (MSB)
   - X[23:16] = 8'h56
   - X[15:8]  = 8'h34
   - X[7:0]   = 8'h12 (LSB)

2. **Output Y Construction**:
   - Y[31:24] = X[7:0]  = 8'h12
   - Y[23:16] = X[15:8] = 8'h34
   - Y[15:8]  = X[23:16]= 8'h56
   - Y[7:0]   = X[31:24]= 8'h78

3. **Result**: Y = 32'h12345678

## 5. Applications & Connections

### **Network Protocols**
- **TCP/IP Headers**: Use big-endian format for multi-byte fields
- **Network Byte Order**: Standard big-endian format for data transmission
- **Protocol Conversion**: Requires endianness conversion between host and network byte order

### **Computer Architecture**
- **x86 Processors**: Use little-endian format for memory storage
- **Memory Debugging**: Understanding endianness crucial for analyzing memory dumps
- **Cross-Platform Development**: Must handle endianness differences between architectures

### **Digital Signal Processing**
- **Audio/Video Codecs**: Often specify byte order for multi-byte samples
- **Image Formats**: Header fields may use specific endianness conventions
- **Data Interchange**: File formats must specify endianness for portability

## 6. Common Pitfalls

### **Number System Conversions**
❌ **Error**: Reading remainders in wrong order during division method
✅ **Correct**: Always read remainders from bottom to top (last to first)

❌ **Error**: Grouping binary digits incorrectly for octal conversion
✅ **Correct**: Always group from right to left for integer part, left to right for fractional part

❌ **Error**: Assuming all decimal fractions have exact binary representations
✅ **Correct**: Most decimal fractions are approximated in binary (e.g., 0.1₁₀ is infinite in binary)

### **Verilog Bit Manipulation**
❌ **Error**: Confusing bit indexing order: `[7:0]` vs `[0:7]`
✅ **Correct**: `[MSB:LSB]` convention is standard: `[7:0]` means bits 7,6,5,4,3,2,1,0

❌ **Error**: Forgetting concatenation operator braces: `X[7:0], X[15:8]`
✅ **Correct**: Must use braces: `{X[7:0], X[15:8]}`

❌ **Error**: Misunderstanding endianness as bit reversal
✅ **Correct**: Endianness is byte-order reversal, not bit reversal within bytes

## 7. Practice Problems

### **Problem Set A: Number Conversions**
1. Convert 255.125₁₀ to binary
2. Convert 1024.5₁₀ to hexadecimal
3. Convert 11111111.1₂ to octal
4. Convert FF.8₁₆ to binary
5. Convert 2A5₁₆ to decimal using direct positional method
6. Convert 1FC.4₁₆ to decimal using direct positional method
7. Find the radix x in: (123)ₓ + (45)ₓ = (170)ₓ

### **Problem Set B: Verilog Implementation**
1. Write a module to swap the upper and lower 16 bits of a 32-bit signal
2. Implement a module that converts a 16-bit little-endian input to big-endian output
3. Create a module that extracts the middle byte from a 32-bit signal
4. Design a module that reverses the bit order within each byte of a 32-bit signal

### **Solutions to Practice Problems**

**Problem A1**: 255.125₁₀ = 11111111.001₂
**Problem A2**: 1024.5₁₀ = 400.8₁₆
**Problem A3**: 11111111.1₂ = 377.4₈
**Problem A4**: FF.8₁₆ = 11111111.1₂
**Problem A5**: 2A5₁₆ = 2×256 + 10×16 + 5×1 = 512 + 160 + 5 = 677₁₀
**Problem A6**: 1FC.4₁₆ = 1×256 + 15×16 + 12×1 + 4×(1/16) = 256 + 240 + 12 + 0.25 = 508.25₁₀
**Problem A7**: x = 6 (base 6)

**Problem B1**:
```verilog
assign out = {in[15:0], in[31:16]};
```

## 8. Quick Reference Summary

### **Conversion Quick Reference**
| From    | To      | Method                              |
| ------- | ------- | ----------------------------------- |
| Decimal | Binary  | Successive division by 2            |
| Decimal | Hex     | Successive division by 16           |
| Binary  | Octal   | Group by 3 bits                     |
| Hex     | Binary  | Each hex digit → 4 bits             |
| Hex     | Decimal | Positional notation (Σ digit × 16ⁱ) |
| Binary  | Decimal | Positional notation (Σ bit × 2ⁱ)    |

### **Verilog Syntax Reference**
```verilog
// Bit indexing
signal[MSB:LSB]     // Range selection
signal[bit_number]  // Single bit selection

// Concatenation
{sig1, sig2, sig3}  // Join signals

// Endian conversion (32-bit)
{data[7:0], data[15:8], data[23:16], data[31:24]}
```

### **Endianness Memory Layout**
```
32'h12345678:
Big Endian:    [12][34][56][78] → addresses increase →
Little Endian: [78][56][34][12] → addresses increase →
```

## 9. Review Questions

1. **Conceptual**: Why might decimal fractions not have exact binary representations?

2. **Application**: In what scenarios would you need to convert between endianness formats in embedded systems?

3. **Analysis**: Given a 64-bit processor, how would you modify the endian conversion module?

4. **Synthesis**: Design a Verilog module that can convert between any two endianness formats based on a control signal.

5. **Evaluation**: Compare the advantages and disadvantages of big-endian vs little-endian architectures for network communication.

---

**Key Takeaways**: Master the systematic procedures for number system conversions, understand that endianness affects byte ordering (not bit ordering), and practice Verilog bit manipulation through hands-on implementation of conversion modules.
