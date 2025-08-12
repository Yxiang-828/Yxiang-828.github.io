# EE2026 Lecture 1: Number Systems

## 1. Positional Number Systems

### Basic Terminology
- **Radix (Base)**: The number of distinct digits used in the system
- **Radix Point**: Separates integer and fractional parts
- **Place Value**: Weight determined by position (powers of radix)

### General Formula
For any radix r number system:
```
A_r = (a_n a_{n-1} ... a_1 a_0 . a_{-1} a_{-2} ... a_{-m})_r
A_10 = Σ(i=-m to n) a_i × r^i
```

## 2. Common Number Systems

### Binary (Base 2)
- **Digits**: 0, 1
- **Example**: 10110.01₂ = 1×2⁴ + 0×2³ + 1×2² + 1×2¹ + 0×2⁰ + 0×2⁻¹ + 1×2⁻²
- **Result**: 16 + 0 + 4 + 2 + 0 + 0 + 0.25 = 22.25₁₀

### Octal (Base 8)  
- **Digits**: 0-7
- **Example**: 754.2₈ = 7×8² + 5×8¹ + 4×8⁰ + 2×8⁻¹ = 448 + 40 + 4 + 0.25 = 492.25₁₀

### Hexadecimal (Base 16)
- **Digits**: 0-9, A-F (A=10, B=11, C=12, D=13, E=14, F=15)
- **Example**: 18F4.2A₁₆ = 1×16³ + 8×16² + 15×16¹ + 4×16⁰ + 2×16⁻¹ + 10×16⁻²
- **Result**: 4096 + 2048 + 240 + 4 + 0.125 + 0.039 ≈ 6388.16₁₀

## 3. Radix Conversion Methods

### From Any Base to Decimal
Use the weighted sum formula directly.

### Decimal to Any Base

#### Integer Part - Repeated Division
1. Divide by target radix
2. Record remainder (rightmost digit)
3. Continue with quotient until quotient = 0
4. Read remainders from bottom to top

**Example**: 102₁₀ to Binary
```
102 ÷ 2 = 51 remainder 0
51 ÷ 2 = 25 remainder 1  
25 ÷ 2 = 12 remainder 1
12 ÷ 2 = 6 remainder 0
6 ÷ 2 = 3 remainder 0
3 ÷ 2 = 1 remainder 1
1 ÷ 2 = 0 remainder 1
```
**Result**: 1100110₂

#### Fractional Part - Repeated Multiplication
1. Multiply by target radix
2. Record integer part (leftmost digit)
3. Continue with fractional part
4. Stop when fractional part = 0 or desired precision reached

**Example**: 0.58₁₀ to Binary
```
0.58 × 2 = 1.16 → 1
0.16 × 2 = 0.32 → 0
0.32 × 2 = 0.64 → 0
0.64 × 2 = 1.28 → 1
0.28 × 2 = 0.56 → 0
0.56 × 2 = 1.12 → 1
```
**Result**: 0.100101...₂

## 4. Binary ↔ Octal ↔ Hex Conversions

### Binary ↔ Hex (4-bit grouping)
- **1 Hex digit = 4 binary bits**
- Group from radix point outward
- Pad with zeros if needed

#### Examples:
**Binary → Hex:**
```
101101110₂ → 0001 0110 1110₂ → 16E₁₆
11010101.101₂ → 1101 0101.1010₂ → D5.A₁₆
1111000110₂ → 0011 1100 0110₂ → 3C6₁₆
```

**Hex → Binary:**
```
2AF₁₆ → 0010 1010 1111₂ → 1010101111₂
C3.8₁₆ → 1100 0011.1000₂ → 11000011.1₂
5BE₁₆ → 0101 1011 1110₂ → 10110111110₂
```

### Binary ↔ Octal (3-bit grouping)
- **1 Octal digit = 3 binary bits**
- Group from radix point outward

#### Examples:
**Binary → Octal:**
```
101110₂ → 101 110₂ → 56₈
1100101₂ → 001 100 101₂ → 145₈
110.011₂ → 110.011₂ → 6.3₈
10111.101₂ → 010 111.101₂ → 27.5₈
```

**Octal → Binary:**
```
347₈ → 011 100 111₂ → 11100111₂
62.4₈ → 110 010.100₂ → 110010.1₂
150₈ → 001 101 000₂ → 1101000₂
```

### Hex ↔ Octal (via Binary)
Use binary as intermediate step: Hex → Binary → Octal

#### Examples:
**Hex → Octal:**
```
1. 2A₁₆ → 0010 1010₂ → 52₈
   2A₁₆ → 00101010₂ → 052₈

2. F3₁₆ → 1111 0011₂ → 363₈
   F3₁₆ → 11110011₂ → 011 110 011₂ → 363₈

3. 1C.8₁₆ → 0001 1100.1000₂ → 34.4₈
   1C.8₁₆ → 00011100.1000₂ → 000 111 00.100₂ → 34.4₈
```

**Octal → Hex:**
```
1. 65₈ → 110 101₂ → 0011 0101₂ → 35₁₆
   65₈ → 110101₂ → 35₁₆

2. 127₈ → 001 010 111₂ → 0101 0111₂ → 57₁₆
   127₈ → 1010111₂ → 57₁₆

3. 70.6₈ → 111 000.110₂ → 0011 1000.1100₂ → 38.C₁₆
   70.6₈ → 111000.110₂ → 38.C₁₆
```

### Advanced Conversion Examples

#### Multi-step Conversions:
```
1. 1010111₂ → ? (all bases)
   Binary: 1010111₂
   Decimal: 64+16+4+2+1 = 87₁₀
   Octal: 001 010 111₂ → 127₈
   Hex: 0101 0111₂ → 57₁₆

2. ABC₁₆ → ? (all bases)
   Hex: ABC₁₆
   Binary: 1010 1011 1100₂ → 101010111100₂
   Decimal: 2560+160+12 = 2732₁₀
   Octal: 101 010 111 100₂ → 5274₈

3. 456₈ → ? (all bases)
   Octal: 456₈
   Binary: 100 101 110₂ → 100101110₂
   Decimal: 256+32+8+4+2 = 302₁₀
   Hex: 0001 0010 1110₂ → 12E₁₆
```

## 5. Conversion Summary Table

| Decimal | Binary | Octal | Hex |
|---------|--------|-------|-----|
| 0       | 0000   | 0     | 0   |
| 1       | 0001   | 1     | 1   |
| 2       | 0010   | 2     | 2   |
| 3       | 0011   | 3     | 3   |
| 4       | 0100   | 4     | 4   |
| 5       | 0101   | 5     | 5   |
| 6       | 0110   | 6     | 6   |
| 7       | 0111   | 7     | 7   |
| 8       | 1000   | 10    | 8   |
| 9       | 1001   | 11    | 9   |
| 10      | 1010   | 12    | A   |
| 11      | 1011   | 13    | B   |
| 12      | 1100   | 14    | C   |
| 13      | 1101   | 15    | D   |
| 14      | 1110   | 16    | E   |
| 15      | 1111   | 17    | F   |

## 6. Practice Problems & Solutions

### Problem Set 1: Basic Conversions
1. **Convert 1101011₂ to decimal, octal, and hex**
   - Decimal: 1×64 + 1×32 + 0×16 + 1×8 + 0×4 + 1×2 + 1×1 = 107₁₀
   - Octal: 001 101 011₂ → 153₈
   - Hex: 0110 1011₂ → 6B₁₆

2. **Convert 89₁₀ to binary, octal, and hex**
   - Binary: 89÷2=44 r1, 44÷2=22 r0, 22÷2=11 r0, 11÷2=5 r1, 5÷2=2 r1, 2÷2=1 r0, 1÷2=0 r1 → 1011001₂
   - Octal: 89÷8=11 r1, 11÷8=1 r3, 1÷8=0 r1 → 131₈
   - Hex: 89÷16=5 r9, 5÷16=0 r5 → 59₁₆

3. **Convert F2A₁₆ to binary and octal**
   - Binary: 1111 0010 1010₂ → 111100101010₂
   - Octal: 111 100 101 010₂ → 7452₈

### Problem Set 2: Fractional Conversions
1. **Convert 0.375₁₀ to binary**
   - 0.375×2=0.75 → 0, 0.75×2=1.5 → 1, 0.5×2=1.0 → 1 → 0.011₂

2. **Convert 101.11₂ to decimal and hex**
   - Decimal: 4+0+1+0.5+0.25 = 5.75₁₀
   - Hex: 0101.1100₂ → 5.C₁₆

3. **Convert 3.2₈ to binary and hex**
   - Binary: 011.010₂ → 11.01₂
   - Hex: 0011.0100₂ → 3.4₁₆

### Quick Reference Patterns
- **Powers of 2**: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024...
- **Common fractions**: 0.5=1/2, 0.25=1/4, 0.125=1/8, 0.0625=1/16
- **Hex shortcuts**: A=10, B=11, C=12, D=13, E=14, F=15
- **Memory trick**: Each hex digit = 4 bits, each octal digit = 3 bits

## 7. Key Points for Practice
- **Always check conversions** by converting back to verify
- **Fractional conversions** may not terminate (use required precision)
- **Grouping method** is fastest for binary ↔ hex/octal conversions
- **Remember hex digits A-F** represent 10-15 in decimal
