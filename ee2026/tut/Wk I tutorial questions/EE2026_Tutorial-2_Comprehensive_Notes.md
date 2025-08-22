# EE2026 Tutorial 2: Signed Numbers, 2's Complement & BCD - Comprehensive Notes

## 1. Learning Objectives

By the end of this tutorial, you should be able to:
- **Convert decimal numbers to 8-bit binary** representation accurately
- **Understand different signed number representations**: Signed Magnitude, 1's Complement, and 2's Complement
- **Perform arithmetic operations** in 2's complement notation with proper overflow detection
- **Convert between different number representation systems** (2's complement ↔ Signed Magnitude)
- **Work with BCD (Binary Coded Decimal)** numbers and convert them to decimal
- **Identify representation limits** and ranges for different 8-bit signed systems
- **Recognize when arithmetic results** exceed representable ranges

## 2. Key Terminology & Definitions

**Signed Magnitude (SM)**: A binary representation where the MSB (Most Significant Bit) indicates the sign (0 = positive, 1 = negative) and the remaining bits represent the magnitude (absolute value) of the number.

**1's Complement**: A signed binary representation where positive numbers are represented normally, and negative numbers are represented by inverting all bits of the positive number.

**2's Complement**: A signed binary representation where positive numbers are represented normally, and negative numbers are formed by inverting all bits of the positive number and adding 1. This is the most commonly used system in modern computers.

**Binary Coded Decimal (BCD)**: A binary encoding where each decimal digit (0-9) is represented by its 4-bit binary equivalent. The 8421 BCD uses standard binary weights (8, 4, 2, 1) for each decimal digit.

**Overflow**: A condition that occurs when an arithmetic operation produces a result that cannot be represented within the available number of bits for a given representation system.

**MSB (Most Significant Bit)**: In signed representations, the leftmost bit which indicates the sign of the number (0 = positive, 1 = negative in most systems).

**Magnitude**: The absolute value or size of a number, independent of its sign.

## 3. Core Concepts

### 3.1 8-Bit Signed Number Representation Systems

#### **Signed Magnitude (SM)**
```
📋 SIGNED MAGNITUDE FORMAT
┌─────────────────────────────────────────┐
│ Bit 7  │ Bits 6-0                      │
│ Sign   │ Magnitude                     │
│ 0=+    │ Binary value                  │
│ 1=-    │                               │
└─────────────────────────────────────────┘

Range: -127 to +127 (2 representations for 0)
+0 = 00000000₂
-0 = 10000000₂  (Redundant representation)
```

#### **1's Complement**
```
📋 1'S COMPLEMENT FORMAT
┌─────────────────────────────────────────┐
│ Positive: Normal binary representation  │
│ Negative: Invert all bits of positive  │
│                                         │
│ Range: -127 to +127                    │
│ +0 = 00000000₂                        │
│ -0 = 11111111₂  (Redundant)           │
└─────────────────────────────────────────┘

To get -X: Invert all bits of +X
Example: +5 = 00000101₂ → -5 = 11111010₂
```

#### **2's Complement** ⭐ (Most Important)
```
📋 2'S COMPLEMENT FORMAT
┌─────────────────────────────────────────┐
│ Positive: Normal binary representation  │
│ Negative: Invert all bits + add 1      │
│                                         │
│ Range: -128 to +127                    │
│ Only one representation for zero       │
│ +0 = -0 = 00000000₂                   │
└─────────────────────────────────────────┘

To get -X: 
1. Invert all bits of +X
2. Add 1 to the result

Example: +5 = 00000101₂
Step 1: Invert → 11111010₂
Step 2: Add 1  → 11111011₂ = -5 in 2's complement
```

### 3.2 Conversion Between Representation Systems

#### **Method 1: Direct Bit Pattern Interpretation**
Given the same 8-bit pattern, interpret in different systems:

| **Bit Pattern** | **Signed Magnitude** | **1's Complement** | **2's Complement** |
| --------------- | -------------------- | ------------------ | ------------------ |
| 10000001₂       | -1                   | -126               | -127               |
| 11111110₂       | -126                 | -1                 | -2                 |
| 11111111₂       | -127                 | -0                 | -1                 |
| 10000000₂       | -0                   | -127               | -128               |

#### **Method 2: Convert Between Systems**
**From 2's Complement to Signed Magnitude:**
1. If MSB = 0 (positive): copy as-is
2. If MSB = 1 (negative): 
   - Find 2's complement to get magnitude
   - Set MSB = 1 for negative sign in SM

**From Signed Magnitude to 2's Complement:**
1. If MSB = 0 (positive): copy as-is
2. If MSB = 1 (negative):
   - Take magnitude (bits 6-0)
   - Find 2's complement of this magnitude

### 3.3 2's Complement Arithmetic Rules

#### **Addition Algorithm:**
```
🔢 2'S COMPLEMENT ADDITION
┌─────────────────────────────────────────┐
│ 1. Add numbers using binary addition    │
│ 2. Ignore carry out from MSB           │
│ 3. Check for overflow conditions       │
│                                         │
│ OVERFLOW DETECTION:                     │
│ • (+) + (+) = (-) → OVERFLOW           │
│ • (-) + (-) = (+) → OVERFLOW           │
│ • (+) + (-) → NO OVERFLOW              │
│ • (-) + (+) → NO OVERFLOW              │
└─────────────────────────────────────────┘
```

#### **Subtraction: A - B = A + (-B)**
To subtract B from A:
1. Find 2's complement of B (this gives -B)
2. Add A + (-B) using addition rules
3. Check for overflow using same rules as addition

### 3.4 BCD (Binary Coded Decimal) System

#### **8421 BCD Encoding:**
```
📊 BCD DIGIT ENCODING
┌─────────────────────────────────────────┐
│ Decimal │ 8421 BCD │ Decimal │ 8421 BCD │
│    0    │   0000   │    5    │   0101   │
│    1    │   0001   │    6    │   0110   │
│    2    │   0010   │    7    │   0111   │
│    3    │   0011   │    8    │   1000   │
│    4    │   0100   │    9    │   1001   │
└─────────────────────────────────────────┘

Invalid BCD codes: 1010, 1011, 1100, 1101, 1110, 1111
```

#### **BCD to Decimal Conversion Process:**
1. Group BCD bits into 4-bit nibbles
2. Convert each nibble to decimal digit (0-9)
3. Concatenate decimal digits

## 4. Worked Examples

### Example 4.1: Multiple Representation Interpretations

**Problem**: Convert decimal 250 to 8-bit binary, then interpret this bit pattern as Signed Magnitude, 1's Complement, and 2's Complement.

**Solution**:

**Step 1: Convert 250₁₀ to 8-bit binary**
```
250 ÷ 2 = 125 remainder 0
125 ÷ 2 = 62  remainder 1  
62 ÷ 2 = 31   remainder 0
31 ÷ 2 = 15   remainder 1
15 ÷ 2 = 7    remainder 1
7 ÷ 2 = 3     remainder 1
3 ÷ 2 = 1     remainder 1
1 ÷ 2 = 0     remainder 1

Reading remainders bottom to top: 11111010₂
```

**Step 2: Verify the conversion**
11111010₂ = 1×128 + 1×64 + 1×32 + 1×16 + 1×8 + 0×4 + 1×2 + 0×1 = 250₁₀ ✓

**Step 3: Interpret 11111010₂ in different signed systems**

**i) Signed Magnitude Interpretation:**
- MSB = 1 → Negative number
- Magnitude = 1111010₂ = 122₁₀
- Result: **-122₁₀**

**ii) 1's Complement Interpretation:**
- MSB = 1 → Negative number
- To find magnitude: invert all bits → 00000101₂ = 5₁₀
- Result: **-5₁₀**

**iii) 2's Complement Interpretation:**
- MSB = 1 → Negative number
- To find magnitude: 
  - Invert all bits: 00000101₂
  - Add 1: 00000101₂ + 1 = 00000110₂ = 6₁₀
- Result: **-6₁₀**

**Summary Table:**
| **System**       | **Interpretation** | **Decimal Value** |
| ---------------- | ------------------ | ----------------- |
| Unsigned         | 11111010₂          | +250              |
| Signed Magnitude | Sign=1, Mag=122    | -122              |
| 1's Complement   | Invert: 00000101   | -5                |
| 2's Complement   | Invert+1: 00000110 | -6                |

### Example 4.2: 2's Complement Addition

**Problem**: Show how (-1) + 45 can be added using 8-bit 2's complement notation.

**Solution**:

**Step 1: Convert numbers to 8-bit 2's complement**

**+45₁₀ to binary:**
```
45 ÷ 2 = 22 remainder 1
22 ÷ 2 = 11 remainder 0  
11 ÷ 2 = 5  remainder 1
5 ÷ 2 = 2   remainder 1
2 ÷ 2 = 1   remainder 0
1 ÷ 2 = 0   remainder 1

+45₁₀ = 00101101₂ (8-bit)
```

**-1₁₀ to 2's complement:**
```
+1₁₀ = 00000001₂
Invert: 11111110₂
Add 1:  11111111₂ = -1₁₀ in 2's complement
```

**Step 2: Perform binary addition**
```
    11111111₂  (-1)
  + 00101101₂  (+45)
  ────────────
    00101100₂  
    ↑
   Carry out (ignored in 2's complement)
```

**Step 3: Verify the result**
00101100₂ = 32 + 8 + 4 = 44₁₀

**Step 4: Check for overflow**
- Adding negative + positive → No overflow possible
- Result: **44₁₀** ✓ (which equals -1 + 45)

### Example 4.3: Complex 2's Complement Addition with Overflow

**Problem**: Show how -128 + (-60) can be added using 8-bit 2's complement notation.

**Solution**:

**Step 1: Convert to 8-bit 2's complement**

**-128₁₀**: This is the minimum value for 8-bit 2's complement
- -128₁₀ = 10000000₂ (special case: most negative number)

**-60₁₀**:
```
+60₁₀ = 00111100₂
Invert: 11000011₂  
Add 1:  11000100₂ = -60₁₀
```

**Step 2: Perform addition**
```
    10000000₂  (-128)
  + 11000100₂  (-60)
  ────────────
   101000100₂
   ↑
  Carry out
```

**Step 3: Apply 8-bit result (ignore carry)**
Result in 8-bit: 01000100₂ = 68₁₀

**Step 4: Check for overflow**
- (-128) + (-60) = -188₁₀ (expected)
- But we got +68₁₀ (actual 8-bit result)
- **OVERFLOW DETECTED!** (negative + negative = positive)

**Explanation**: -188 cannot be represented in 8-bit 2's complement (range: -128 to +127)

### Example 4.4: Mixed System Arithmetic

**Problem**: Compute (10100)₂'s + (00100)ₛₘ and give final answer in 2's complement notation.

**Solution**:

**Step 1: Interpret the given numbers**
- (10100)₂'s means 10100₂ in 2's complement
- (00100)ₛₘ means 00100₂ in signed magnitude

**Step 2: Convert first number (already in 2's complement)**
10100₂ = MSB=1 (negative)
To find value: Invert → 01011₂, Add 1 → 01100₂ = 12₁₀
So: 10100₂ = -12₁₀ in 2's complement

**Step 3: Convert second number from SM to 2's complement**
00100ₛₘ: MSB=0 (positive), magnitude = 0100₂ = 4₁₀
So: 00100ₛₘ = +4₁₀

In 2's complement: +4₁₀ = 00100₂

**Step 4: Perform 2's complement addition**
```
    10100₂  (-12)
  + 00100₂  (+4)
  ────────
    11000₂  
```

**Step 5: Verify result**
11000₂ in 2's complement:
MSB=1 (negative), so: Invert → 00111₂, Add 1 → 01000₂ = 8₁₀
Therefore: 11000₂ = -8₁₀

**Final Answer**: **11000₂** (representing -8₁₀ in 2's complement)

### Example 4.5: BCD to Decimal Conversion

**Problem**: Convert the 8421 BCD number 0100011000100011₂ into decimal.

**Solution**:

**Step 1: Group into 4-bit nibbles**
0100011000100011₂ = 0100 | 0110 | 0010 | 0011

**Step 2: Convert each nibble to decimal**
- 0100₂ = 0×8 + 1×4 + 0×2 + 0×1 = 4₁₀
- 0110₂ = 0×8 + 1×4 + 1×2 + 0×1 = 6₁₀  
- 0010₂ = 0×8 + 0×4 + 1×2 + 0×1 = 2₁₀
- 0011₂ = 0×8 + 0×4 + 1×2 + 1×1 = 3₁₀

**Step 3: Form decimal number**
Reading from left to right: 4623₁₀

**Step 4: Verify (optional)**
Each BCD digit is valid (0-9): ✓
- 4 → valid
- 6 → valid  
- 2 → valid
- 3 → valid

**Final Answer**: **4623₁₀**

## 5. Applications & Connections

### 5.1 Computer Architecture Applications

**2's Complement Advantages:**
- **Single arithmetic unit**: Same hardware for addition/subtraction
- **No dual zero**: Eliminates +0/-0 redundancy
- **Overflow detection**: Simple XOR of carry bits
- **Range optimization**: Represents one extra negative value (-128 vs ±127)

### 5.2 Digital System Design

**BCD Applications:**
- **Display systems**: 7-segment displays, LED panels
- **Financial calculations**: Exact decimal arithmetic (no floating-point errors)
- **User interfaces**: Calculator implementations
- **Legacy systems**: Older mainframe and embedded systems

### 5.3 Embedded Systems Programming

**Signed Number Considerations:**
- **Data type selection**: int8_t, uint8_t in C programming
- **Overflow handling**: Critical for safety systems
- **Cross-platform compatibility**: Endianness and sign representation
- **Performance optimization**: 2's complement enables efficient operations

### 5.4 Digital Signal Processing

**Fixed-Point Arithmetic:**
- **Q-format numbers**: Fractional representation using 2's complement
- **Saturation arithmetic**: Preventing overflow in audio/video processing
- **Quantization**: Converting analog signals to digital with proper range

## 6. Common Pitfalls

### ❌ **Pitfall 1: Confusing Representation Systems**
**Wrong**: Assuming all negative numbers start with 1  
**Correct**: Only applies to 2's complement; signed magnitude uses different rules

**How to Avoid**: Always identify the representation system first, then apply appropriate conversion rules.

### ❌ **Pitfall 2: Incorrect 2's Complement Conversion**
**Wrong**: Just inverting bits without adding 1  
**Correct**: Must invert ALL bits AND add 1

**Example Error**: 
- Wrong: +5 = 00000101₂ → -5 = 11111010₂ (This is 1's complement!)
- Correct: +5 = 00000101₂ → Invert → 11111010₂ → Add 1 → 11111011₂ = -5

### ❌ **Pitfall 3: Ignoring Overflow Conditions**
**Wrong**: Accepting any arithmetic result without checking overflow  
**Correct**: Always verify result is within representable range

**Detection Rule**: 
- Positive + Positive = Negative → **OVERFLOW**
- Negative + Negative = Positive → **OVERFLOW**

### ❌ **Pitfall 4: BCD Invalid Code Confusion**
**Wrong**: Treating 1010₂, 1011₂, etc. as valid BCD digits  
**Correct**: BCD only uses codes 0000₂ through 1001₂ (0-9)

**How to Avoid**: Remember BCD represents decimal digits, so codes >9 are invalid.

### ❌ **Pitfall 5: Sign Extension Errors**
**Wrong**: Adding leading zeros to negative numbers  
**Correct**: Sign-extend with the MSB value (0 for positive, 1 for negative)

**Example**: 
- Wrong: -5 in 4-bit (1011₂) → 8-bit (00001011₂) = +11₁₀
- Correct: -5 in 4-bit (1011₂) → 8-bit (11111011₂) = -5₁₀

### ❌ **Pitfall 6: Range Limit Misunderstanding**
**Wrong**: Assuming signed systems have symmetric positive/negative ranges  
**Correct**: 2's complement has one extra negative value (-128 to +127 in 8-bit)

## 7. Practice Problems

### Problem 7.1: Multi-System Interpretation
**Given**: 8-bit pattern 10110101₂  
**Tasks**: 
a) Interpret as unsigned binary  
b) Interpret as signed magnitude  
c) Interpret as 1's complement  
d) Interpret as 2's complement  
e) Which interpretation gives the largest magnitude?

### Problem 7.2: 2's Complement Arithmetic Chain
**Given**: Starting with +25₁₀  
**Tasks**: 
a) Convert to 8-bit 2's complement  
b) Add -30₁₀ (show all steps)  
c) Add -100₁₀ to the result  
d) Identify any overflow conditions  
e) Verify final result by converting back to decimal

### Problem 7.3: Mixed System Conversion
**Given**: (11010)₂'s + (01100)ₛₘ  
**Tasks**: 
a) Convert both numbers to decimal  
b) Perform addition in decimal  
c) Convert result to 2's complement  
d) Perform the addition directly in binary  
e) Compare results from steps (c) and (d)

### Problem 7.4: BCD Analysis and Error Detection
**Given**: Supposed BCD number 0011101101100001₂  
**Tasks**: 
a) Group into BCD digits  
b) Identify any invalid BCD codes  
c) Convert valid digits to decimal  
d) Propose correction for invalid codes  
e) Calculate the corrected decimal value

### Problem 7.5: Range and Overflow Analysis
**Tasks**: 
a) List the range of values for 6-bit signed magnitude, 1's complement, and 2's complement  
b) Find the largest positive number representable in each system  
c) Find the smallest negative number in each system  
d) Calculate: What happens when you add 1 to the maximum positive value in each system?  
e) Determine minimum bit width needed to represent decimal range -200 to +150

## 8. Quick Reference Summary

### Number System Ranges (8-bit)
```
REPRESENTATION RANGES:
┌────────────────────────────────────────┐
│ Unsigned:          0 to 255           │
│ Signed Magnitude: -127 to +127        │
│ 1's Complement:   -127 to +127        │
│ 2's Complement:   -128 to +127        │
└────────────────────────────────────────┘
```

### 2's Complement Quick Conversions
```
POSITIVE TO NEGATIVE (2's complement):
1. Invert all bits (0→1, 1→0)
2. Add 1 to the result

VERIFICATION:
Original + 2's complement = 0 (ignoring carry)
```

### BCD Quick Reference
```
BCD VALID CODES: 0000 to 1001 (0-9)
INVALID CODES:   1010 to 1111 (A-F)

CONVERSION: Group 4 bits → Convert each to decimal
```

### Overflow Detection (2's Complement)
```
OVERFLOW CONDITIONS:
• Positive + Positive = Negative → OVERFLOW
• Negative + Negative = Positive → OVERFLOW
• Different signs → NO OVERFLOW POSSIBLE
```

## 9. Review Questions

### Conceptual Understanding
1. **Why does 2's complement have an asymmetric range** (-128 to +127) compared to signed magnitude (-127 to +127)?

2. **Explain why 2's complement addition works** without requiring separate subtraction hardware.

3. **What are the advantages and disadvantages of BCD** compared to pure binary representation?

4. **When would you choose each signed representation system** in practical applications?

### Problem-Solving Skills
5. **Convert -95₁₀ to all three signed 8-bit systems** and verify each conversion.

6. **Perform the calculation (-65) + (+80) - (+25)** entirely in 8-bit 2's complement, checking for overflow at each step.

7. **Given the BCD number 100101011001₁₂**, identify errors and calculate what the intended decimal value likely was.

8. **Design a simple algorithm** to detect overflow in 2's complement addition using only the MSBs of operands and result.

### Application & Design  
9. **Explain how a calculator would store and process** the decimal number 12.34 using BCD representation.

10. **Compare the storage efficiency** of representing the decimal number 9999 in pure binary vs. BCD, and explain when each might be preferred.

---

*These comprehensive notes provide thorough coverage of signed number systems, 2's complement arithmetic, and BCD conversion, preparing you for advanced digital design concepts and computer arithmetic operations.*
