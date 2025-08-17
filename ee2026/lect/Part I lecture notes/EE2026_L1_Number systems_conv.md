# PDF Content

## Page 1

### Images and Figures

**Figure 1**: PNG image (Position: 94, 469, Size: 68×67)

*Image appears to be graphical/diagram without readable text*

**Figure 2**: PNG image (Position: 160, 469, Size: 68×68)

*Image content (OCR):*
```
ok Cacho ee ```

**Figure 3**: JPEG image (Position: 226, 469, Size: 68×68)

*Image content (OCR):* ```
OFAC weary ```

**Figure 4**: PNG image (Position: 293, 469, Size: 68×68)

*Image content (OCR):* ```
roe Death hy oy it" ```

**Figure 5**: PNG image (Position: 359, 469, Size: 68×68)

*Image content (OCR):* ```
HRS Cre aeeeane ```

**Figure 6**: PNG image (Position: 426, 468, Size: 68×68)

*Image content (OCR):* ```
r =i nd ES Bey ina a Ae ```

**Figure 7**: PNG image (Position: 495, 468, Size: 68×68)

*Image content (OCR):* ```
ERE a big OF Tara ```

EE2026 Digital Design

NUMBER SYSTEMS Massimo ALIOTO Dept of Electrical and Computer Engineering Email: massimo.alioto@nus.edu.sg

### Explore

### Follow

### Discover

more

What’s happening

Stay tuned

Be connected

### Communicate

Get to know the latest silicon system breakthroughs from our labs in 1-minute video demos

## Page 2

EE2026 Digital Design Prof. Massimo Alioto

### Outline

• Positional number systems • Radix conversion • Binary arithmetic • Binary signed representation • Binary-coded decimal (BCD)

### Page 2

## Page 3

EE2026 Digital Design Prof. Massimo Alioto
 `Positional Number Systems • Decimal number system: radix r = 10`

### Page 3

radix point
 `radix r = 10 → digits 0 to 9`

### 10 3

### 10 2

### 10 -1

### Terminology
 `◦ Radix(or base) ◦ Radix point ◦ Numerals made of digits (0  r-1) ◦ Place value (or weight) is in the power of the base (positive on the left and negative on the right side of the radix point)`

### 1 2 6 0 . 2 5 number
 `𝑁𝑁 = 1 × 10 3 + 2 × 10 2 + 6 × 10 1 + 0 × 10 0 + 2 × 10 −1 + 5 × 10 −2 = 1260.25`

weighted sum of each digit (each digit is weighted by its place value)

### 10 0 weight depends only on digit position

### 10 -2

integer part fractional part

### 10 1

## Page 4

EE2026 Digital Design Prof. Massimo Alioto
 `Binary Number System • Binary number system: radix r = 2`

### Page 4

radix point
 `radix r = 2 → digits 0 to 1 (binary digit, or “bit” )`

### 2 3

### 2 2

### 2 -1

### 10110 . 01 number

### 2 0 weight depends only on digit position

### 2 -2

integer part fractional part

### 2 1 2 4

• Decimal equivalent
 `𝑁𝑁 2 = 1 × 2 4 + 0 × 2 3 + 1 × 2 2 + 1 × 2 1 + 0 × 2 0 + 0 × 2 −1 + 1 × 2 −2`
 `= 16 + 0 + 4 + 2 + 0 + 0 + 1 4 𝑁𝑁 10 = 22.25`

## Page 5

EE2026 Digital Design Prof. Massimo Alioto
 `Hexadecimal Number System • Hexadecimal number system: radix r = 16`

### Page 5

radix point
 `radix r = 16 → digits 0 to 9, and then A to F`

### 16 3

### 16 2

### 16 -1

### 1 8 F 4 . 2 A number

### 16 0 weight depends only on digit position

### 16 -2

integer part fractional part

### 16 1

hex dec

### 0 0

### 1 1

### 2 2

### 3 3

### 4 4

### 5 5

### 6 6

### 7 7

### 8 8

### 9 9

## A 10

## B 11

## C 12

## D 13

## E 14

## F 15
 `𝑁𝑁 16 = 1 × 16 3 + 8 × 16 2 + 𝐹𝐹× 16 1 + 4 × 16 0 + 2 × 16 −1 + 10 × 16 −2 • Decimal equivalent`
 `= 4096 + 2048 + 240 + 4 + 2 16 + 10 256 𝑁𝑁 10 = 6388 + 21 128 ≈6388.16`

### Table 1

| hex | dec |
| --- | --- |
| 0 | 0 |
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |
| 4 | 4 |
| 5 | 5 |
| 6 | 6 |
| 7 | 7 |
| 8 | 8 |
| 9 | 9 |
| A | 10 |
| B | 11 |
| C | 12 |
| D | 13 |
| E | 14 |
| F | 15 |

## Page 6

EE2026 Digital Design Prof. Massimo Alioto
 `Octal Number System • Octal number system: radix r = 8`

### Page 6

radix point
 `radix r = 8 → digits 0 to 7`

### 8 2

### 8 -1

### 7 5 4 . 2 number

### 8 0 weight depends only on digit position

integer part fractional part

### 8 1
 `𝑁𝑁 8 = 7 × 8 2 + 5 × 8 1 + 4 × 8 0 + 2 × 8 −1 • Decimal equivalent`
 `𝑁𝑁 10 = 448 + 40 + 4 + 2 8 ≈492.25`

### Oct Dec

### 0 0

### 1 1

### 2 2

### 3 3

### 4 4

### 5 5

### 6 6

### 7 7

? 8

? 9

? 10

### Table 2

| Oct | Dec |
| --- | --- |
| 0 | 0 |
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |
| 4 | 4 |
| 5 | 5 |
| 6 | 6 |
| 7 | 7 |
| ? | 8 |
| ? | 9 |
| ? | 10 |

## Page 7

EE2026 Digital Design Prof. Massimo Alioto

Generalization to Any Positional Number System • Generic number system with radix r

### Page 7

radix point
 `radix r → digits 0 to r-1`

r n-1

r -1 r 0
 `𝐴𝐴 𝑟𝑟 = (𝑎𝑎 𝑛𝑛 𝑎𝑎 𝑛𝑛−1 . . . 𝑎𝑎 𝑜𝑜 . 𝑎𝑎 −1 . . . 𝑎𝑎 −𝑚𝑚 ) 𝑟𝑟 𝐴𝐴 10 = 𝑎𝑎 𝑛𝑛 × 𝑟𝑟 𝑛𝑛 + 𝑎𝑎 𝑛𝑛−1 × 𝑟𝑟 𝑛𝑛−1 +. . . 𝑎𝑎 𝑜𝑜 × 𝑟𝑟 0 + 𝑎𝑎 −1 × 𝑟𝑟 −1 +. . . 𝑎𝑎 −𝑚𝑚 × 𝑟𝑟 −𝑚𝑚`
 `= ෍`
 `𝑖𝑖 = −𝑚𝑚`

𝑛𝑛 𝑎𝑎 𝑖𝑖 𝑟𝑟 𝑖𝑖

• Decimal equivalent is weighted sum of all digits
 `𝑨𝑨 𝒓𝒓 = (𝒂𝒂 𝒏𝒏 𝒂𝒂 𝒏𝒏−𝟏𝟏 . . . 𝒂𝒂 𝒐𝒐 . 𝒂𝒂 −𝟏𝟏 . . . 𝒂𝒂 −𝒎𝒎 ) 𝒓𝒓`

r n

… r -m …

## Page 8

EE2026 Digital Design Prof. Massimo Alioto

### Radix Conversion
 `• Three types of conversions ◦ Radix r (r ≠ 10) → decimal ◦ Decimal → radix r (r ≠ 10) ◦ Conversion among binary, octal and hex numbers`

### Page 8
 `• Radix r (r ≠ 10) → decimal is trivial (decimal equivalent) 𝐴𝐴 10 = ෍`
 `𝑖𝑖 = −𝑚𝑚`

𝑛𝑛

𝑎𝑎 𝑖𝑖 𝑟𝑟 𝑖𝑖
 `◦ Binary → decimal`

### 10110.01 2 = 1 × 2 4 + 0 × 2 3 + 1 × 2 2 + 1 × 2 1 + 0 × 2 0 + 0 × 2 −1 + 1 × 2 −2
 `= 16 + 0 + 4 + 2 + 0 + 0 + 1 4 = 22.25 10`
 `◦ Hex → decimal`
 `18𝐹𝐹𝐹.2𝐴𝐴 16 = 1 × 16 3 + 8 × 16 2 + 𝐹𝐹× 16 1 + 4 × 16 0 + 2 × 16 −1 + 10 × 16 −2`
 `= 6388 + 21 128 ≈6388.16 10`

## Page 9

EE2026 Digital Design Prof. Massimo Alioto
 `Decimal → Radix r (r ≠ 10): Integer Part`
 `• Must find a systematic way ◦ Decimal → binary`

### Page 9
 `(102) 10 = (𝐴𝐴) 2 = (𝑎𝑎 𝑛𝑛 𝑎𝑎 𝑛𝑛−1 . . . 𝑎𝑎 𝑜𝑜 . 𝑎𝑎 −1 . . . 𝑎𝑎 −𝑚𝑚 ) 𝑟𝑟 = ?`
 `(102) 10 = (𝐴𝐴) 2 = 𝑎𝑎 𝑛𝑛 × 2 𝑛𝑛 + 𝑎𝑎 𝑛𝑛−1 × 2 𝑛𝑛−1 +. . . +𝑎𝑎 1 × 2 1 + 𝑎𝑎 𝑜𝑜 ◦ Start simple: integer number`
 `integer multiple of 2 if 𝑎𝑎 𝑜𝑜 = 0, (integer multiple of 2)+1 if 𝑎𝑎 𝑜𝑜 = 1`
 `= (𝑎𝑎 𝑛𝑛 × 2 𝑛𝑛 + 𝑎𝑎 𝑛𝑛−1 × 2 𝑛𝑛−1 +. . . +𝑎𝑎 1 × 2 1 ) + 𝑎𝑎 𝑜𝑜`

𝑎𝑎 𝑜𝑜 is remainder of division by 2

### 1 3 1 2

1

### 2 1 1

### 1 2 1 1 2 2

### 2 2

### 2 2 2

a a a

a

a a

a a a

n n n n

n n n n

n n n n

+ + × + ×

+ × + ×

+ + × + ×

− − −

− − −

− − − ...

...

...

remainder is a 1

continue dividing quotient by 2

### 1 2 1 1

### 1 1 1

### 1 1 1

10

### 2 2

### 2 2 2

### 2 2 2 2

### 2 102

a a a

a

a a a

a a a a

n n n n

o

n n n n

o n n n n

+ + × + ×

× + + × + ×

+ × + + × + ×
 `→`

− − −

− −

− −

...

...

...

) (

remainder is a 0

quotient

integer multiple of 2

## Page 10

EE2026 Digital Design Prof. Massimo Alioto

0
 `• Numerical example of repeated division by 2: (102) 10 = (A) 2 = (?) 2`

### Page 10

division by 2 quotient remainder
 `102/2 51 0 → a 0`
 `51/2 25 1 → a 1`
 `25/2 12 1 → a 2`
 `12/2 6 0 → a 3`
 `6/2 3 0 → a 4`
 `3/2 1 1 → a 5`
 `1/2 0 1 → a 6`
 `(𝐴𝐴) 2 = 0 0 1 1 1 1 … 0000`
 `𝐴𝐴 10 = 𝑎𝑎 6 × 2 6 + 𝑎𝑎 5 × 2 5 + 𝑎𝑎 4 × 2 4 + 𝑎𝑎 3 × 2 3`

+ 𝑎𝑎 2 × 2 2 + 𝑎𝑎 1 × 2 1 + 𝑎𝑎 0 × 2 0
 `= 1 × 2 6 + 1 × 2 5 + 0 × 2 4 + 0 × 2 3`

+ 1 × 2 2 + 1 × 2 1 + 0 × 2 0
 `= 64 + 32 + 0 + 0 + 4 + 2 + 0`
 `Check(inverse calculation)`
 ` = 102`
 `stop divisions when quotient = 0 (subsequent divisions are all zero)`

### Table 3

| division by 2 | quotient | remainder |
| --- | --- | --- |
| 102/2 | 51 | 0 → a
0 |
| 51/2 | 25 | 1 → a
1 |
| 25/2 | 12 | 1 → a
2 |
| 12/2 | 6 | 0 → a
3 |
| 6/2 | 3 | 0 → a
4 |
| 3/2 | 1 | 1 → a
5 |
| 1/2 | 0 | 1 → a
6 |

## Page 11

EE2026 Digital Design Prof. Massimo Alioto
 `Decimal → Radix r (r ≠ 10): Fractional Part`

• Must find a systematic way for the fractional part too ◦ Then, sum up with integer part for arbitrary numbers with integer and fractional part

### Page 11
 `(0.58) 10 = (𝐴𝐴) 2 = 0. 𝑎𝑎 −1 𝑎𝑎 −2 … 𝑎𝑎 −𝑚𝑚+1 𝑎𝑎 −𝑚𝑚2 = ◦ Fractional number`
 `= 𝑎𝑎 −1 × 2 −1 + 𝑎𝑎 −2 × 2 −2 +. . . +𝑎𝑎 −𝑚𝑚+1 × 2 −𝑚𝑚+1 + 𝑎𝑎 −𝑚𝑚 × 2 −𝑚𝑚`

◦ Interesting interpretation of 𝑎𝑎 −1 after multiplying the number by 2

### 2 × 𝑎𝑎 −1 × 2 −1 + 𝑎𝑎 −2 × 2 −2 +. . . +𝑎𝑎 −𝑚𝑚+1 × 2 −𝑚𝑚+1 + 𝑎𝑎 −𝑚𝑚 × 2 −𝑚𝑚 =

integer part of 2 × (𝐴𝐴) 10

fractional part of 2 × (𝐴𝐴) 10

𝑎𝑎 −1 can be simply found as the integer part of 2 × (𝐴𝐴) 10 , then repeat for 𝑎𝑎 −2 , 𝑎𝑎 −3 …
 `= 𝑎𝑎 −1 + 𝑎𝑎 −2 × 2 −1 +. . . +𝑎𝑎 −𝑚𝑚+1 × 2 −𝑚𝑚+2 + 𝑎𝑎 −𝑚𝑚 × 2 −𝑚𝑚+1`

## Page 12

EE2026 Digital Design Prof. Massimo Alioto

multiply

by 2

product integer

part
 `0.58x2 1.16 1 → a -1`
 `0.16x2 0.32 0 → a -2`
 `0.32x2 0.64 0 → a -3`
 `0.64x2 1.28 1 → a -4`
 `0.28x2 0.56 0 → a -5`
 `0.56x2 1.12 1 → a -6`
 `0.12x2 0.24 0 → a -7`
 `0.24x2 0.48 0 → a -8`

… 0 10
 `• Numerical example of repeated multiplications by 2: (0.58) 10 = (A) 2 = (?) 2`

### Page 12

## (𝐴𝐴) 2 = 0 0 1 0 1
 ` ≈0.58`
 `• conversion certainly stops when product = 0 • may never end (non-terminating representation, even if (A) 10 may terminate) • in this case, stop at the required precision (system specification, no. of bits)`
 `Check(inverse calculation)`
 `𝐴𝐴 10 = 1 × 2 −1 + 1 × 2 −4 + 1 × 2 −6`
 `= 1 2 + 1 16 + 1 64 = 0.578125`

### Table 4

| multiply
by 2 | product | integer
part |
| --- | --- | --- |
| 0.58x2 | 1.16 | 1 → a
-1 |
| 0.16x2 | 0.32 | 0 → a
-2 |
| 0.32x2 | 0.64 | 0 → a
-3 |
| 0.64x2 | 1.28 | 1 → a
-4 |
| 0.28x2 | 0.56 | 0 → a
-5 |
| 0.56x2 | 1.12 | 1 → a
-6 |
| 0.12x2 | 0.24 | 0 → a
-7 |
| 0.24x2 | 0.48 | 0 → a
-8 |

## Page 13

### Images and Figures

**Figure 8**: JPEG image (Position: 251, 89, Size: 460×396)

*Image content (OCR):* ```
Table 1.2 Numbers with Different Bases Decimal Binary Octal Hexadecimal (base 10) (base 2) (base 8) (base 16) 00 0000 00 0 01 0001 01 1 02 0010 02 2 03 0011 03 3 04 0100 04 4 05 0101 05 5 06 0110 06 6 07 0111 07 7 08 1000 10 8 09 1001 11 9 10 1010 12 A 11 1011 13 B 12 1100 14 Cc 13 1101 15 D 14 1110 16 E 15 1111 17 F ```

EE2026 Digital Design Prof. Massimo Alioto

Summary Table for Conversion of 4-bit Integers

### Page 13
 `Decimal(radix 10)`
 `Binary(radix 2)`
 `Octal(radix 8)`
 `Hexadecimal(radix 16)`

Numbers with Different Radixes

## Page 14

### Images and Figures

**Figure 9**: JPEG image (Position: 697, 68, Size: 249×214)

*Image content (OCR):* ```
Table 1.2 Numbers with Different Bases Decimal Binary Octal Hexadecimal (base 10) (base 2) (base 8) (base 16) 00 0000 00 0 01 0001 01 1 02 0010 02 2 03 0011 03 3 04 0100 04 4 05 0101 05 5 06 0110 06 6 07 0111 07 7 08 1000 10 8 09 1001 11 9 10 1010 12 A 11 1011 13 B 12 1100 14 Cc 13 1101 15 D 14 1110 16 E 15 1111 17 F ```

EE2026 Digital Design Prof. Massimo Alioto
 `Decimal(radix 10)`
 `Binary(radix 2)`
 `Octal(radix 8)`
 `Hexadecimal(radix 16)`

Numbers with Different Radixes Conversion among Hex, Octal and Binary
 `• Hex ↔ binary ◦ Each Hex digit → 4 bits ◦ Or each group of 4 bits → 1 Hex digit (starting from radix point and add zeroes if necessary to have all groups of 4 bits)`
 `• Octal ↔ binary ◦ Each octal digit (0…7) → 3 bits (indeed 0…7) ◦ Or each group of 3 bits → 1 octal digit (starting from radix point)`
 `• Hex ↔ Octal ◦ Use binary as an intermediate step ◦ Hex → binary → octal ◦ Octal → binary → Hex`

### Page 14

## Page 15

EE2026 Digital Design Prof. Massimo Alioto

( ) 16 ( ) 2

### Examples (Hex, Octal, Binary Conversion)

### Page 15

## (A45F) 16

3

### Hex → bin:

(11 1010 1101 0111) 2

### Bin → Hex:

( ) 2

### (475) 8 Oct → bin:

( ) 8

(10 111 101 110) 2

### Bin → oct:

### 1010 1111 0101 0100

6

## 7 D A

00

complete with zeroes on the left in integer numbers (same number), on the right in fractional numbers

### 100 101 111 5 7 2

0

## Page 16

EE2026 Digital Design Prof. Massimo Alioto

### (0 . A45F) 16 Hex → bin:

(0 . ) 2 1010 0100 0101 1111

## ( ) 16 B A 1

( ) 2

### (653) 8 Oct → Hex:

### 011 101 110

convert each 3-bit group

( ) 2 regroup in 3-bit groups, add zeroes

( ) 2

### Other Examples (Hex, Octal, Binary Conversion)

### Page 16

### (A45F) 16 Hex → oct:

### 1010 1111 0101 0100 010 111 011 001 010 1 00

( ) 8 7 3 1 2 2 1

(1 1010 1011) 2 000

• For the fractional part: same, just group digits by starting from the position after the radix point (same number when adding zeroes on the right

00…

add zeroes to the right (same number, not needed in this example)

## Page 17

EE2026 Digital Design Prof. Massimo Alioto

**Radix Conversion: Summary and Generalization**
 `• Radix r (r ≠ 10) → decimal ◦ Just use definition of positional number system (weighted sum of all digits)`
 `• Decimal → Radix r (r ≠ 10) ◦ Integer part → repeated division by r and take the remainder ◦ Fractional part → repeated multiplication by r and take the integer part ◦ Add integer and fractional part`
 `• Conversion among binary, octal and Hex numbers ◦ Grouping: 1 Hex digit = 4 bits, 1 octal digit = 3 bits ◦ Conversion with binary as intermediate step + regroup: Hex → oct carried out as Hex → Binary → Octal, and vice versa`

### Page 17