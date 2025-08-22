# EE2026 Tutorial 2: Signed Binary Numbers - Complete Solutions & Study Guide

## 🎯 **Learning Focus Areas**
This tutorial covers the **three major signed binary representation systems** and their conversions. Master these concepts as they form the foundation of computer arithmetic:

1. **Signed Magnitude (SM)**: Sign bit + magnitude bits
2. **1's Complement**: Invert bits for negative numbers  
3. **2's Complement**: Most important - used in all modern computers
4. **Inter-system conversions** and arithmetic operations

---

## 📚 **Essential Theory Recap**

### **Signed Magnitude (SM)**
- **Format**: MSB = sign bit (0=+, 1=-), remaining bits = magnitude
- **Range (8-bit)**: -127 to +127 (has both +0 and -0)
- **Key Issue**: Two representations for zero, complicates arithmetic

### **1's Complement** 
- **Format**: Positive = normal, Negative = invert all bits
- **Range (8-bit)**: -127 to +127 (has +0 = 00000000, -0 = 11111111)
- **Key Issue**: Also has dual zero representation

### **2's Complement** ⭐ **MOST IMPORTANT**
- **Format**: Positive = normal, Negative = invert bits + add 1
- **Range (8-bit)**: -128 to +127 (single zero representation)
- **Advantages**: Single zero, simple arithmetic, hardware efficient

---

## 🔢 **Complete Solutions**

### **Question 1: Signed Magnitude Conversions**

**Convert to 8-bit signed magnitude representations:**

#### **(a) +127₁₀**

**Solution:**
```
Step 1: Convert 127 to binary
127 ÷ 2 = 63 remainder 1
63 ÷ 2 = 31 remainder 1  
31 ÷ 2 = 15 remainder 1
15 ÷ 2 = 7 remainder 1
7 ÷ 2 = 3 remainder 1
3 ÷ 2 = 1 remainder 1
1 ÷ 2 = 0 remainder 1

Binary: 1111111₂ (7 bits)

Step 2: Apply signed magnitude format
Sign bit = 0 (positive)
Magnitude = 1111111₂

Final Answer: 01111111₂
```

**Verification**: 0×128 + 1×64 + 1×32 + 1×16 + 1×8 + 1×4 + 1×2 + 1×1 = 127 ✓

#### **(b) -0₁₀**

**Solution:**
```
For -0 in signed magnitude:
Sign bit = 1 (negative)  
Magnitude = 0000000₂ (zero)

Final Answer: 10000000₂
```

**Key Point**: This demonstrates the dual zero problem in signed magnitude!

#### **(c) -55₁₀**

**Solution:**
```
Step 1: Convert 55 to binary
55 ÷ 2 = 27 remainder 1
27 ÷ 2 = 13 remainder 1
13 ÷ 2 = 6 remainder 1
6 ÷ 2 = 3 remainder 0
3 ÷ 2 = 1 remainder 1
1 ÷ 2 = 0 remainder 1

Binary: 110111₂ (6 bits)

Step 2: Pad to 7 bits for magnitude: 0110111₂
Step 3: Apply signed magnitude
Sign bit = 1 (negative)
Magnitude = 0110111₂

Final Answer: 10110111₂
```

### **Question 2: 1's Complement Conversions**

**Convert to 10-bit 1's complement representations:**

#### **(a) +43₁₀**

**Solution:**
```
Step 1: Convert 43 to binary
43 = 32 + 8 + 2 + 1 = 101011₂

Step 2: Pad to 10 bits
43₁₀ = 0000101011₂ (10-bit)

Step 3: Since positive, no inversion needed
Final Answer: 0000101011₂
```

#### **(b) -1₁₀**

**Solution:**
```
Step 1: Get +1 in 10-bit binary
+1₁₀ = 0000000001₂

Step 2: Apply 1's complement (invert all bits)
Invert: 1111111110₂

Final Answer: 1111111110₂
```

**Verification**: This should give -1. In 1's complement, to find value of negative number, invert: 0000000001₂ = +1, so original = -1 ✓

#### **(c) -128₁₀**

**Solution:**
```
Step 1: Get +128 in 10-bit binary
128 = 10000000₂ (8 bits)
Padded: 0010000000₂ (10 bits)

Step 2: Apply 1's complement (invert all bits)
Invert: 1101111111₂

Final Answer: 1101111111₂
```

### **Question 3: 2's Complement to Decimal**

**Convert 2's complement to signed decimal:**

#### **(a) 10000₂** (5-bit 2's complement)

**Solution:**
```
MSB = 1, so this is negative

Method: Find 2's complement to get magnitude
Step 1: Invert bits: 01111₂
Step 2: Add 1: 01111₂ + 1 = 10000₂

Wait - this gives the same number! This is the special case.

For n-bit 2's complement, 10000...0 = -2^(n-1)
For 5-bit: 10000₂ = -2⁴ = -16₁₀

Final Answer: -16₁₀
```

#### **(b) 10000001₂** (8-bit 2's complement)

**Solution:**
```
MSB = 1, so this is negative

Step 1: Invert all bits: 01111110₂
Step 2: Add 1: 01111110₂ + 1 = 01111111₂
Step 3: Convert to decimal: 01111111₂ = 127₁₀

Since original was negative: Final Answer = -127₁₀
```

### **Question 4: Multiple Interpretation Problem**

**This is the CLASSIC multiple representation question!**

#### **(a) Convert 250₁₀ to 8-bit binary**

**Solution:**
```
250 ÷ 2 = 125 remainder 0
125 ÷ 2 = 62 remainder 1
62 ÷ 2 = 31 remainder 0  
31 ÷ 2 = 15 remainder 1
15 ÷ 2 = 7 remainder 1
7 ÷ 2 = 3 remainder 1
3 ÷ 2 = 1 remainder 1
1 ÷ 2 = 0 remainder 1

Reading bottom to top: 11111010₂

Verification: 128+64+32+16+8+2 = 250 ✓
```

#### **(b) Interpret 11111010₂ in different systems**

**i) Signed Magnitude:**
```
MSB = 1 → negative number
Magnitude bits = 1111010₂ = 64+32+16+8+2 = 122₁₀
Final Answer: -122₁₀
```

**ii) 1's Complement:**
```
MSB = 1 → negative number
To find value, invert all bits: 00000101₂ = 5₁₀
Final Answer: -5₁₀
```

**iii) 2's Complement:**
```
MSB = 1 → negative number
Step 1: Invert bits: 00000101₂  
Step 2: Add 1: 00000101₂ + 1 = 00000110₂ = 6₁₀
Final Answer: -6₁₀
```

**🎯 Key Learning**: Same bit pattern = different values in different systems!

### **Question 5: Sign Extension in 2's Complement** ⭐ **CRITICAL CONCEPT**

**🔑 KEY RULE: Sign Extension in 2's Complement**
- **Positive numbers (MSB = 0)**: Pad with 0s  
- **Negative numbers (MSB = 1)**: Pad with 1s
- **Why**: Must preserve the sign and value when extending bit width

**Convert 4-bit to 8-bit 2's complement:**

#### **(a) (0101)₂'s** 

**Solution:**
```
Original: 0101₂ (4-bit)
MSB = 0 → POSITIVE number

🔑 SIGN EXTENSION RULE: Positive → Pad with 0s
0101₂ → 00000101₂

Final Answer: 00000101₂ (8-bit)

Verification: 
4-bit: 0101₂ = 4+1 = 5₁₀
8-bit: 00000101₂ = 4+1 = 5₁₀ ✓ Same value preserved!
```

#### **(b) (1010)₂'s**

**Solution:**
```
Original: 1010₂ (4-bit)  
MSB = 1 → NEGATIVE number

🔑 SIGN EXTENSION RULE: Negative → Pad with 1s
1010₂ → 11111010₂

Final Answer: 11111010₂ (8-bit)

Verification: 
4-bit: 1010₂ → invert: 0101₂ → add 1: 0110₂ = 6₁₀ → so -6₁₀
8-bit: 11111010₂ → invert: 00000101₂ → add 1: 00000110₂ = 6₁₀ → so -6₁₀ ✓
Same value preserved!
```

**🎯 WHY This Rule Works:**
```
In 2's complement, the MSB has weight -2^(n-1)
4-bit: 1010₂ = -8 + 2 = -6
8-bit: 11111010₂ = -128 + 64+32+16+8+2 = -128 + 122 = -6

The extra 1s don't change the value because:
-128 + 64 + 32 + 16 + 8 = -128 + 120 = -8 (compensates for the larger negative weight)
```

### **Question 6: 2's Complement Addition**

#### **(a) (-1) + 45**

**Solution:**
```
Step 1: Convert to 8-bit 2's complement
+45₁₀ = 00101101₂
-1₁₀: +1 = 00000001₂ → invert: 11111110₂ → add 1: 11111111₂

Step 2: Add
  11111111₂  (-1)
+ 00101101₂  (+45)  
─────────────
 100101100₂  
 ↑
Carry out (ignore)

Step 3: Result in 8-bit: 00101100₂ = 44₁₀

Final Answer: 44₁₀ ✓ (which equals -1 + 45)
```

#### **(b) -128 + (-60)**

**Solution:**
```
Step 1: Convert to 8-bit 2's complement
-128₁₀ = 10000000₂ (special case: most negative)
-60₁₀: +60 = 00111100₂ → invert: 11000011₂ → add 1: 11000100₂

Step 2: Add  
  10000000₂  (-128)
+ 11000100₂  (-60)
─────────────
 101000100₂
 ↑
Carry out

Step 3: Result in 8-bit: 01000100₂ = 68₁₀

Final Answer: 68₁₀

⚠️ OVERFLOW DETECTED! 
Expected: -128 + (-60) = -188₁₀
Got: +68₁₀
This is overflow because -188 cannot be represented in 8-bit 2's complement!
```

### **Question 7: Mixed System Arithmetic**

**(10100)₂'s + (00100)ₛₘ**

**Solution:**
```
Step 1: Interpret both numbers
(10100)₂'s in 2's complement:
MSB = 1 → negative
Invert: 01011₂ → Add 1: 01100₂ = 12₁₀
So (10100)₂'s = -12₁₀

(00100)ₛₘ in signed magnitude:
MSB = 0 → positive  
Magnitude = 0100₂ = 4₁₀
So (00100)ₛₘ = +4₁₀

Step 2: Convert +4 to 2's complement for addition
+4₁₀ = 00100₂ (already in 2's complement form)

Step 3: Perform 2's complement addition
  10100₂  (-12)
+ 00100₂  (+4)
─────────
  11000₂

Step 4: Verify result  
11000₂ in 2's complement:
MSB = 1 → negative
Invert: 00111₂ → Add 1: 01000₂ = 8₁₀
So result = -8₁₀

Final Answer: 11000₂ (representing -8₁₀ in 2's complement)

Check: -12 + 4 = -8 ✓
```

---

## 🔑 **Key Concepts Mastered**

### **1. Representation Ranges (8-bit)**
```
System              Range           Special Notes
─────────────────────────────────────────────────
Unsigned            0 to 255        
Signed Magnitude   -127 to +127     Dual zero
1's Complement     -127 to +127     Dual zero  
2's Complement     -128 to +127     Single zero ⭐
```

### **2. Conversion Quick Reference**
```
TO 2'S COMPLEMENT (negative numbers):
1. Get positive binary
2. Invert all bits  
3. Add 1

FROM 2'S COMPLEMENT (MSB = 1) - Multiple Methods:

🚀 METHOD 1: Direct Weight Calculation (FASTEST!)
For negative number: Value = -(MSB weight) + (other bits)
Example: 11111010₂ = -128 + 64+32+16+8+2 = -6

⚡ METHOD 2: Scan from Right (FAST for hand calculation)
Find rightmost 1, keep it and everything to the right
Invert everything to the left
Example: 11111010₂ → rightmost 1 at position 1
Keep: 10, Invert left part: 00000010₂ = 2, so original = -6

🔄 METHOD 3: Traditional (Invert + Add 1)
1. Invert all bits
2. Add 1  
3. Result is magnitude of negative number
```

### **3. Sign Extension Rule**
```
Extending bit width in 2's complement:
- Positive (MSB = 0): Pad with 0s
- Negative (MSB = 1): Pad with 1s
```

### **4. Overflow Detection**
```
In 2's complement addition:
- Pos + Pos = Neg → OVERFLOW
- Neg + Neg = Pos → OVERFLOW  
- Pos + Neg → No overflow possible
```

---

## 🎯 **Common Mistakes to Avoid**

### ❌ **Mistake 1**: Confusing 1's and 2's complement
- **1's complement**: Just invert bits
- **2's complement**: Invert bits THEN add 1

### ❌ **Mistake 2**: Wrong sign extension  
- **Wrong**: Always pad with zeros
- **Right**: Pad with MSB value (0 for +, 1 for -)

### ❌ **Mistake 3**: Ignoring overflow
- Always check if result is within representable range
- Especially important for negative + negative

### ❌ **Mistake 4**: Multiple representation confusion
- Same bit pattern = different values in different systems
- Always identify the system first!

---

## 📝 **Practice Strategy**

1. **Master 2's complement first** - it's used everywhere
2. **Practice sign extension** - crucial for computer arithmetic  
3. **Always verify conversions** by working backwards
4. **Check overflow conditions** in arithmetic operations
5. **Understand why 2's complement dominates** modern computing

---

## 🏆 **Tutorial Mastery Checklist**

- [ ] Can convert between all three signed systems
- [ ] Understand why 2's complement has asymmetric range
- [ ] Can perform sign extension correctly  
- [ ] Can detect overflow in 2's complement arithmetic
- [ ] Understand the "special case" of most negative number
- [ ] Can interpret same bit pattern in different systems

**Master these concepts and you'll be ready for computer architecture, digital design, and embedded programming!** 🚀
