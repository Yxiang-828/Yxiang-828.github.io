## Page 1

### Visual Elements on Page 1

- **Image 1**: Position (93.6, 3.8), Size: 67.6 x 67.5
- **Image 2**: Position (159.8, 3.7), Size: 67.8 x 67.8
- **Image 3**: Position (226.3, 3.7), Size: 67.8 x 67.8
- **Image 4**: Position (292.7, 3.6), Size: 67.8 x 67.8
- **Image 5**: Position (359.2, 3.7), Size: 67.8 x 67.8
- **Image 6**: Position (425.7, 3.9), Size: 67.8 x 67.8
- **Image 7**: Position (495.4, 3.9), Size: 67.8 x 67.8

### EE2026

### Digital Design

### NUMBER SYSTEMS

### Massimo ALIOTO

Dept of Electrical and Computer Engineering

### Email: massimo.alioto@nus.edu.sg

Get to know the latest silicon system breakthroughs from our labs in 1-minute video demos

### Discover What’s Be

Explore Follow more happening Stay tuned connected Communicate

## Page 2

### Table 1

| Outline
• Positional number systems
• Radix conversion
• Binary arithmetic
• Binary signed representation
• Binary-coded decimal (BCD) |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 2 |

### Outline

• Positional number systems

### • Radix conversion

### • Binary arithmetic

• Binary signed representation

• Binary-coded decimal (BCD)

EE2026 Digital Design Prof. Massimo Alioto Page 2

## Page 3

### Table 1

| Positional Number Systems
• Decimal number system: radix r=10
radix r=10 → digits 0 to 9
Terminology
◦ Radix (or base)
1 2 6 0 . 2 5
◦ Radix point number
◦ Numerals made of digits (0  r-1)
◦ Place value (or weight) is in the
101100 10-1 10-2
weight depends 103
power of the base (positive on the radix point
102
only on digit position
left and negative on the right side of
the radix point) integer part fractional part
3 2 1 0 −1 −2
𝑁𝑁 = 1 ×w1e0igh+te2d× su1m0 o+f e6ac×h 1d0igit+ (e0ac×h1 d0igit+ is2 w×ei1g0hted+ b5y i×ts 1p0lace= va1lu2e6)0.25 |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 3 |

### Positional Number Systems

• Decimal number system: radix r=10

radix r=10 → digits 0 to 9

### Terminology

◦ Radix (or base)

1 2 6 0 . 2 5

◦ Radix point number

◦ Numerals made of digits (0  r-1)

◦ Place value (or weight) is in the

### 101100 10-1 10-2

### weight depends 103

power of the base (positive on the radix point

### 102

only on digit position

left and negative on the right side of

the radix point) integer part fractional part

3 2 1 0 −1 −2

𝑁𝑁 = 1 ×w1e0igh+te2d× su1m0 o+f e6ac×h 1d0igit+ (e0ac×h1 d0igit+ is2 w×ei1g0hted+ b5y i×ts 1p0lace= va1lu2e6)0.25

EE2026 Digital Design Prof. Massimo Alioto Page 3

## Page 4

### Table 1

| Binary Number System
• Binary number system: radix r=2
radix r=2 → digits 0 to 1 (binary digit, or “bit”)
10110 . 01
number
21 20 2-12-2
weight depends 24 23
radix point
22
only on digit position
integer part fractional part
• Decimal equivalent
4 3 2 1 0 −1 −2
2
𝑁𝑁 = 1 × 2 + 0 × 2 + 1 × 2 + 1 × 2 + 0 × 2 + 0 × 2 + 1 × 2
1
= 16 + 0 + 4 + 2 + 0 + 0 +
4 |
| --- |
| 10 |
| 𝑁𝑁 = 22.25
EE2026 Digital Design Prof. Massimo Alioto Page 4 |

### Binary Number System

• Binary number system: radix r=2

radix r=2 → digits 0 to 1 (binary digit, or “bit”)

### 10110 . 01

### number

### 21 20 2-12-2

weight depends 24 23

### radix point

### 22

only on digit position

integer part fractional part

### • Decimal equivalent

4 3 2 1 0 −1 −2

### 2

### 𝑁𝑁 = 1 × 2 + 0 × 2 + 1 × 2 + 1 × 2 + 0 × 2 + 0 × 2 + 1 × 2

### 1

= 16 + 0 + 4 + 2 + 0 + 0 +

### 4

### 10

### 𝑁𝑁 = 22.25

EE2026 Digital Design Prof. Massimo Alioto Page 4

## Page 5

### Table 1

| Hexadecimal Number System
• Hexadecimal number system: radix r=16
hex dec
0 0
radix r=16 → digits 0 to 9, and then A to F
1 1
2 2
3 3
1 8 F 4 . 2 A
number
4 4
5 5
161160 16-1 16-2 6 6
weight depends 163
radix point
7 7
162
only on digit position
8 8
integer part fractional part
9 9
• Decimal equivalent
A 10
B 11
C 12
3 2 1 0 −1 −2
𝑁𝑁 16 = 1 × 16 + 8 × 16 + 𝐹𝐹 × 16 + 4 × 16 + 2 × 16 + 10 × 16 D 13
2 10
E 14
= 4096 + 2048 + 240 + 4 + +
16 256 F 15 |
| --- |
| 21 |
| 10
𝑁𝑁 = 6388 + ≈ 6388.16
EE2026 Digital Design Prof. Massimo Alioto Page 5
128 |

### Table 2

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

### Hexadecimal Number System

• Hexadecimal number system: radix r=16

### hex dec

### 0 0

radix r=16 → digits 0 to 9, and then A to F

### 1 1

### 2 2

### 3 3

### 1 8 F 4 . 2 A

### number

### 4 4

### 5 5

161160 16-1 16-2 6 6

### weight depends 163

### radix point

### 7 7

### 162

only on digit position

### 8 8

integer part fractional part

### 9 9

### • Decimal equivalent

### A 10

### B 11

### C 12

3 2 1 0 −1 −2

𝑁𝑁 16 = 1 × 16 + 8 × 16 + 𝐹𝐹 × 16 + 4 × 16 + 2 × 16 + 10 × 16 D 13

### 2 10

### E 14

= 4096 + 2048 + 240 + 4 + +

### 16 256 F 15

### 21

### 10

### 𝑁𝑁 = 6388 + ≈ 6388.16

EE2026 Digital Design Prof. Massimo Alioto Page 5

### 128

## Page 6

### Table 1

| Octal Number System
• Octal number system: radix r=8
Oct Dec
0 0
radix r=8 → digits 0 to 7
1 1
2 2
3 3
7 5 4 . 2
number
4 4
5 5
81 80 8-1 6 6
weight depends
radix point
7 7
82
only on digit position
? 8
integer part fractional part
? 9
? 10
• Decimal equivalent
2 1 0 −1
8
𝑁𝑁 = 7 × 8 + 5 × 8 + 4 × 8 + 2 × 8 |
| --- |
| 2 |
| 10
𝑁𝑁 = 448 + 40 + 4 + ≈ 492.25
EE2026 Digital Design Prof. Massimo Alioto Page 6
8 |

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

### Octal Number System

• Octal number system: radix r=8

### Oct Dec

### 0 0

radix r=8 → digits 0 to 7

### 1 1

### 2 2

### 3 3

7 5 4 . 2

### number

### 4 4

### 5 5

81 80 8-1 6 6

### weight depends

### radix point

### 7 7

### 82

only on digit position

### ? 8

integer part fractional part

### ? 9

### ? 10

### • Decimal equivalent

2 1 0 −1

### 8

### 𝑁𝑁 = 7 × 8 + 5 × 8 + 4 × 8 + 2 × 8

### 2

### 10

### 𝑁𝑁 = 448 + 40 + 4 + ≈ 492.25

EE2026 Digital Design Prof. Massimo Alioto Page 6

### 8

## Page 7

### Table 1

| Generalization to Any Positional Number System
• Generic number system with radix r
radix r → digits 0 to r-1
𝒓𝒓 𝒏𝒏 𝒏𝒏−𝟏𝟏 𝒐𝒐 −𝟏𝟏 −𝒎𝒎 𝒓𝒓
𝑨𝑨 = (𝒂𝒂 𝒂𝒂 . … . . 𝒂𝒂r0 . 𝒂𝒂r-1 . … . . 𝒂𝒂 r-m )
radix point
rn rn-1
• Decimal equivalent is weighted sum of all digits
𝑟𝑟 𝑛𝑛 𝑛𝑛−1 𝑜𝑜 −1 −𝑚𝑚 𝑟𝑟
𝐴𝐴 = (𝑎𝑎 𝑎𝑎 . . . 𝑎𝑎 . 𝑎𝑎 . . . 𝑎𝑎 )
𝑛𝑛 𝑛𝑛−1 0 −1 −𝑚𝑚
10 𝑛𝑛 𝑛𝑛−1 𝑜𝑜 −1 −𝑚𝑚
𝐴𝐴 = 𝑎𝑎 × 𝑟𝑟 + 𝑎𝑎 × 𝑟𝑟 +. . . 𝑎𝑎 × 𝑟𝑟 + 𝑎𝑎 × 𝑟𝑟 +. . . 𝑎𝑎 × 𝑟𝑟
𝑛𝑛
𝑖𝑖 |
| --- |
| 𝑖𝑖 |
| = � 𝑎𝑎 𝑟𝑟
EE2026 Digital Design Prof. Massimo Alioto Page 7
𝑖𝑖=−𝑚𝑚 |

Generalization to Any Positional Number System

• Generic number system with radix r

radix r → digits 0 to r-1

𝒓𝒓 𝒏𝒏 𝒏𝒏−𝟏𝟏 𝒐𝒐 −𝟏𝟏 −𝒎𝒎 𝒓𝒓

𝑨𝑨 = (𝒂𝒂 𝒂𝒂 . … . . 𝒂𝒂r0 . 𝒂𝒂r-1 . … . . 𝒂𝒂 r-m )

### radix point

### rn rn-1

• Decimal equivalent is weighted sum of all digits

𝑟𝑟 𝑛𝑛 𝑛𝑛−1 𝑜𝑜 −1 −𝑚𝑚 𝑟𝑟

𝐴𝐴 = (𝑎𝑎 𝑎𝑎 . . . 𝑎𝑎 . 𝑎𝑎 . . . 𝑎𝑎 )

𝑛𝑛 𝑛𝑛−1 0 −1 −𝑚𝑚

10 𝑛𝑛 𝑛𝑛−1 𝑜𝑜 −1 −𝑚𝑚

𝐴𝐴 = 𝑎𝑎 × 𝑟𝑟 + 𝑎𝑎 × 𝑟𝑟 +. . . 𝑎𝑎 × 𝑟𝑟 + 𝑎𝑎 × 𝑟𝑟 +. . . 𝑎𝑎 × 𝑟𝑟

### 𝑛𝑛

### 𝑖𝑖

### 𝑖𝑖

= � 𝑎𝑎 𝑟𝑟

EE2026 Digital Design Prof. Massimo Alioto Page 7

### 𝑖𝑖=−𝑚𝑚

## Page 8

### Table 1

| Radix Conversion
• Three types of conversions
◦ Radix r (r≠10) → decimal
◦ Decimal → radix r (r≠10)
◦ Conversion among binary, octal and hex numbers
• Radix r (r≠10) → decimal is trivial (decimal equivalent)
𝑛𝑛
◦ Binary → decimal 𝑖𝑖
10 � 𝑎𝑎 𝑖𝑖 𝑟𝑟
𝐴𝐴 =
𝑖𝑖=−𝑚𝑚
4 3 2 1 0 −1 −2
2
10110.01 = 1 × 2 + 0 × 2 + 1 × 2 + 1 × 2 + 0 × 2 + 0 × 2 + 1 × 2
1
◦ He x → decima=l 16 + 0 + 4 + 2 + 0 + 0 + = 22.25 10
4
3 2 1 0 −1 −2
16
18𝐹𝐹𝐹.2𝐴𝐴 = 1 × 16 + 8 × 16 + 𝐹𝐹 × 16 + 4 × 16 + 2 × 16 + 10 × 16
21 |
| --- |
| 10 |
| = 6388 + ≈ 6388.16
128
EE2026 Digital Design Prof. Massimo Alioto Page 8 |

### Radix Conversion

• Three types of conversions

◦ Radix r (r≠10) → decimal

◦ Decimal → radix r (r≠10)

◦ Conversion among binary, octal and hex numbers

• Radix r (r≠10) → decimal is trivial (decimal equivalent)

### 𝑛𝑛

◦ Binary → decimal 𝑖𝑖

10 � 𝑎𝑎 𝑖𝑖 𝑟𝑟

### 𝐴𝐴 =

### 𝑖𝑖=−𝑚𝑚

4 3 2 1 0 −1 −2

### 2

10110.01 = 1 × 2 + 0 × 2 + 1 × 2 + 1 × 2 + 0 × 2 + 0 × 2 + 1 × 2

### 1

◦ He x → decima=l 16 + 0 + 4 + 2 + 0 + 0 + = 22.25 10

### 4

3 2 1 0 −1 −2

### 16

18𝐹𝐹𝐹.2𝐴𝐴 = 1 × 16 + 8 × 16 + 𝐹𝐹 × 16 + 4 × 16 + 2 × 16 + 10 × 16

### 21

### 10

= 6388 + ≈ 6388.16

### 128

EE2026 Digital Design Prof. Massimo Alioto Page 8

## Page 9

### Table 1

| → ≠
Decimal Radix r (r 10): Integer Part
• Must find a systematic way
◦ Decimal → binary
10 2 𝑛𝑛 𝑛𝑛−1 𝑜𝑜 −1 −𝑚𝑚 𝑟𝑟
◦ Start simple: integer num(1b0e2r) = (𝐴𝐴) = (𝑎𝑎 𝑎𝑎 . . . 𝑎𝑎 . 𝑎𝑎 . . . 𝑎𝑎 ) =?
𝑛𝑛 𝑛𝑛−1 1
10 2 𝑛𝑛 𝑛𝑛−1 1 𝑜𝑜
(102) = (𝐴𝐴) = 𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎
𝑛𝑛 integer mu𝑛𝑛lt−ip1le of 2 1
𝑛𝑛 𝑛𝑛−1 1 𝑜𝑜
= (𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 ) + 𝑎𝑎
integer multiple of 2 if =0,
is remainder of division by 2
(integer multiple of 2)+1 if =1
(102)
𝑜𝑜
10 → 𝑎𝑎
𝑜𝑜
𝑎𝑎
2 𝑜𝑜
𝑎𝑎
continue dividing quotient by 2
quotient a × 2n−1 + a × 2n−2 +... + a a × 2n−2 + a × 2n−3 +... + a
n n−1 1 n n−1 1
a × 2n + a × 2n−1 +... + a × 2 + a a × 2n−1 + a × 2n−2 +... + a
2 n n−1 1 o 2 n n−1 1
a × 2n + a × 2n−1 +... + a × 2 a × 2n−1 + a × 2n−2 +...
n n−1 1 n n−1
a a
o 1
remainder is a remainder is a
0 1 |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 9 |

### → ≠

Decimal Radix r (r 10): Integer Part

• Must find a systematic way

◦ Decimal → binary

10 2 𝑛𝑛 𝑛𝑛−1 𝑜𝑜 −1 −𝑚𝑚 𝑟𝑟

◦ Start simple: integer num(1b0e2r) = (𝐴𝐴) = (𝑎𝑎 𝑎𝑎 . . . 𝑎𝑎 . 𝑎𝑎 . . . 𝑎𝑎 ) =?

### 𝑛𝑛 𝑛𝑛−1 1

10 2 𝑛𝑛 𝑛𝑛−1 1 𝑜𝑜

(102) = (𝐴𝐴) = 𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎

𝑛𝑛 integer mu𝑛𝑛lt−ip1le of 2 1

𝑛𝑛 𝑛𝑛−1 1 𝑜𝑜

= (𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 ) + 𝑎𝑎

integer multiple of 2 if =0,

is remainder of division by 2

(integer multiple of 2)+1 if =1

### (102)

### 𝑜𝑜

### 10 → 𝑎𝑎

### 𝑜𝑜

### 𝑎𝑎

### 2 𝑜𝑜

### 𝑎𝑎

continue dividing quotient by 2

quotient a × 2n−1 + a × 2n−2 +... + a a × 2n−2 + a × 2n−3 +... + a

n n−1 1 n n−1 1

a × 2n + a × 2n−1 +... + a × 2 + a a × 2n−1 + a × 2n−2 +... + a

2 n n−1 1 o 2 n n−1 1

a × 2n + a × 2n−1 +... + a × 2 a × 2n−1 + a × 2n−2 +...

n n−1 1 n n−1

### a a

### o 1

remainder is a remainder is a

### 0 1

EE2026 Digital Design Prof. Massimo Alioto Page 9

## Page 10

### Table 1

| • Numerical example of repeated division by 2: (102) =(A) =(?)
10 2 2
division by 2 quotient remainder
102/2 51 0 → a
0
Check (inverse calculation)
51/2 25 1 → a
1
25/2 12 1 → a
2
6 5 4 3
12/2 6 0 → a
3 10 6 5 4 3
𝐴𝐴 = 𝑎𝑎 × 2 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2
2 1 0
6/2 3 0 → a 2 1 0
4 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2
6 5 4 3
3/2 1 1 → a = 1 × 2 + 1 × 2 + 0 × 2 + 0 × 2
5 2 1 0
+ 1 × 2 + 1 × 2 + 0 × 2
1/2 0 1 → a
6 
= 64 + 32 + 0 + 0 + 4 + 2 + 0
= 102
stop divisions when quotient=0
(subsequent divisions are all zero)
(𝐴𝐴) 2 = … 00001100110 |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 10 |

### Table 2

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

• Numerical example of repeated division by 2: (102) =(A) =(?)

### 10 2 2

division by 2 quotient remainder

102/2 51 0 → a

### 0

### Check (inverse calculation)

51/2 25 1 → a

### 1

25/2 12 1 → a

### 2

6 5 4 3

12/2 6 0 → a

3 10 6 5 4 3

𝐴𝐴 = 𝑎𝑎 × 2 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2

### 2 1 0

6/2 3 0 → a 2 1 0

4 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2 + 𝑎𝑎 × 2

6 5 4 3

3/2 1 1 → a = 1 × 2 + 1 × 2 + 0 × 2 + 0 × 2

5 2 1 0

+ 1 × 2 + 1 × 2 + 0 × 2

1/2 0 1 → a

### 6 

= 64 + 32 + 0 + 0 + 4 + 2 + 0

### = 102

stop divisions when quotient=0

(subsequent divisions are all zero)

### (𝐴𝐴) 2 = … 00001100110

EE2026 Digital Design Prof. Massimo Alioto Page 10

## Page 11

### Table 1

| → ≠
Decimal Radix r (r 10): Fractional Part
• Must find a systematic way for the fractional part too
◦ Then, sum up with integer part for arbitrary numbers with integer and fractional part
◦ Fractional number
10 2 −1 −2 −𝑚𝑚+1 −𝑚𝑚 2
(0.58) = (𝐴𝐴) = 0. 𝑎𝑎 𝑎𝑎 … 𝑎𝑎 𝑎𝑎 =
−1 −2 −𝑚𝑚+1 −𝑚𝑚
−1 −2 −𝑚𝑚+1 −𝑚𝑚
= 𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎 × 2
◦ Interesting interpretation of after multiplying the number by 2
−1
𝑎𝑎
−1 −2 −𝑚𝑚+1 −𝑚𝑚
=
−1 −2 −𝑚𝑚+1 −𝑚𝑚
2 × 𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎 × 2 =
−1 −𝑚𝑚+2 −𝑚𝑚+1
integer part of
−1 −2 −𝑚𝑚+1 −𝑚𝑚
𝑎𝑎 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎 × 2
10
2 × (𝐴𝐴) fractional part of
10
can be simply found as th2e× in(te𝐴𝐴g)er part of ,
then repeat for , … |
| --- |
| −1 10 |
| 𝑎𝑎 2 × (𝐴𝐴)
EE2026 Digital Design −2 −3 Prof. Massimo Alioto Page 11
𝑎𝑎 𝑎𝑎 |

### → ≠

Decimal Radix r (r 10): Fractional Part

• Must find a systematic way for the fractional part too

◦ Then, sum up with integer part for arbitrary numbers with integer and fractional part

### ◦ Fractional number

10 2 −1 −2 −𝑚𝑚+1 −𝑚𝑚 2

(0.58) = (𝐴𝐴) = 0. 𝑎𝑎 𝑎𝑎 … 𝑎𝑎 𝑎𝑎 =

−1 −2 −𝑚𝑚+1 −𝑚𝑚

−1 −2 −𝑚𝑚+1 −𝑚𝑚

= 𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎 × 2

◦ Interesting interpretation of after multiplying the number by 2

### −1

### 𝑎𝑎

−1 −2 −𝑚𝑚+1 −𝑚𝑚

### =

−1 −2 −𝑚𝑚+1 −𝑚𝑚

2 × 𝑎𝑎 × 2 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎 × 2 =

### −1 −𝑚𝑚+2 −𝑚𝑚+1

### integer part of

−1 −2 −𝑚𝑚+1 −𝑚𝑚

𝑎𝑎 + 𝑎𝑎 × 2 +. . . +𝑎𝑎 × 2 + 𝑎𝑎 × 2

### 10

2 × (𝐴𝐴) fractional part of

### 10

can be simply found as th2e× in(te𝐴𝐴g)er part of ,

then repeat for , …

### −1 10

𝑎𝑎 2 × (𝐴𝐴)

EE2026 Digital Design −2 −3 Prof. Massimo Alioto Page 11

### 𝑎𝑎 𝑎𝑎

## Page 12

### Table 1

| • Numerical example of repeated multiplications by 2: (0.58) =(A) =(?)
10 2 2
multiply product integer
by 2 part
0.58x2 1.16 1 → a
-1 Check (inverse calculation)
0.16x2 0.32 0 → a
-2
0.32x2 0.64 0 → a
-3 −1 −4 −6
10
𝐴𝐴 = 1 × 2 + 1 × 2 + 1 × 2
0.64x2 1.28 1 → a
-4
1 1 1
0.28x2 0.56 0 → a = + +
-5
2 16 64
0.56x2 1.12 1 → a = 0.578125
-6
0.12x2 0.24 0 → a ≈ 0.58
-7
0.24x2 0.48 0 → a
-8
• conversion certainly stops when product=0
• may never end (non-terminating representation, even if (A) may terminate)
10
(𝐴𝐴) 2 = 10010100… • in this case, stop at the required precision (system specification, no. of bits) |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 12 |

### Table 2

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

• Numerical example of repeated multiplications by 2: (0.58) =(A) =(?)

### 10 2 2

### multiply product integer

### by 2 part

0.58x2 1.16 1 → a

-1 Check (inverse calculation)

0.16x2 0.32 0 → a

### -2

0.32x2 0.64 0 → a

-3 −1 −4 −6

### 10

### 𝐴𝐴 = 1 × 2 + 1 × 2 + 1 × 2

0.64x2 1.28 1 → a

### -4

### 1 1 1

0.28x2 0.56 0 → a = + +

### -5

### 2 16 64

0.56x2 1.12 1 → a = 0.578125

### -6

0.12x2 0.24 0 → a ≈ 0.58

### -7

0.24x2 0.48 0 → a

### -8

• conversion certainly stops when product=0

• may never end (non-terminating representation, even if (A) may terminate)

### 10

(𝐴𝐴) 2 = 10010100… • in this case, stop at the required precision (system specification, no. of bits)

EE2026 Digital Design Prof. Massimo Alioto Page 12

## Page 13

### Table 1

| Summary Table for Conversion of 4-bit Integers
Numbers with Different Radixes
Decimal Binary Octal Hexadecimal
(radix 10) (radix 2) (radix 8) (radix 16) |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 13 |

### Table 2

|  |
| --- |
|  |

### Visual Elements on Page 13

- **Image 1**: Position (251.2, 54.7), Size: 460.0 x 396.0

Summary Table for Conversion of 4-bit Integers

Numbers with Different Radixes

Decimal Binary Octal Hexadecimal

(radix 10) (radix 2) (radix 8) (radix 16)

EE2026 Digital Design Prof. Massimo Alioto Page 13

## Page 14

### Table 1

| Conversion among Hex, Octal and Binary
• Hex ↔ binary Numbers with Different Radixes
Decimal Binary Octal Hexadecimal
(radix 10) (radix 2) (radix 8) (radix 16)
◦ Each Hex digit → 4 bits
◦ Or each group of 4 bits → 1 Hex digit (starting from radix
point and add zeroes if necessary to have all groups of 4 bits)
• Octal ↔ binary
◦ Each octal digit (0…7) → 3 bits (indeed 0…7)
◦ Or each group of 3 bits → 1 octal digit (starting from radix point)
• Hex ↔ Octal
◦ Use binary as an intermediate step
◦ Hex → binary → octal
◦ Octal → binary → Hex |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 14 |

### Table 2

|  |
| --- |
|  |

### Visual Elements on Page 14

- **Image 1**: Position (696.9, 257.9), Size: 248.6 x 214.0

Conversion among Hex, Octal and Binary

• Hex ↔ binary Numbers with Different Radixes

Decimal Binary Octal Hexadecimal

(radix 10) (radix 2) (radix 8) (radix 16)

◦ Each Hex digit → 4 bits

◦ Or each group of 4 bits → 1 Hex digit (starting from radix

point and add zeroes if necessary to have all groups of 4 bits)

• Octal ↔ binary

◦ Each octal digit (0…7) → 3 bits (indeed 0…7)

◦ Or each group of 3 bits → 1 octal digit (starting from radix point)

• Hex ↔ Octal

◦ Use binary as an intermediate step

◦ Hex → binary → octal

◦ Octal → binary → Hex

EE2026 Digital Design Prof. Massimo Alioto Page 14

## Page 15

### Table 1

| Examples (Hex, Octal, Binary Conversion)
Hex → bin: Bin → Hex:
(A45F) 00(11 1010 1101 0111)
16 2
( 1 0 1 0 0 1 0 0 0 1 0 1 1 1 1 1 )
complete with zeroes on ( 3 A D 7 )
2
16
the left in integer numbers
(same number), on the
right in fractional numbers
Oct → bin: Bin → oct:
(475)
0 (10 111 101 110)
8
2
( 1 0 0 1 1 1 1 0 1 )
(2 7 5 6)
2
8 |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 15 |

Examples (Hex, Octal, Binary Conversion)

Hex → bin: Bin → Hex:

### (A45F) 00(11 1010 1101 0111)

### 16 2

( 1 0 1 0 0 1 0 0 0 1 0 1 1 1 1 1 )

complete with zeroes on ( 3 A D 7 )

### 2

### 16

the left in integer numbers

(same number), on the

right in fractional numbers

Oct → bin: Bin → oct:

### (475)

0 (10 111 101 110)

### 8

### 2

( 1 0 0 1 1 1 1 0 1 )

(2 7 5 6)

### 2

### 8

EE2026 Digital Design Prof. Massimo Alioto Page 15

## Page 16

### Table 1

| Other Examples (Hex, Octal, Binary Conversion)
Hex → oct: Oct → Hex:
(A45F) (653)
16 8
( 1 0 1 0 0 1 0 0 0 1 0 1 1 1 1 1 ) (1 1 0 1 0 1 0 1 1 )
2 2
00(1 0 1 0 0 1 0 0 0 1 0 1 1 1 1 1 ) 000(1 1010 1011)
2 2
regroup in 3-bit groups, add zeroes
(1 A B )
convert each 3-bit group 16
(1 2 2 1 3 7 )
8
• For the fractional part: same, just group digits by starting from the position
after the radix point (same number when adding zeroes on the right
→
Hex bin:
add zeroes to the right
(0 . A45F) (same number, not
16
needed in this example)
(0 . 1010 0100 0101 1111) 00…
2 |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 16 |

Other Examples (Hex, Octal, Binary Conversion)

Hex → oct: Oct → Hex:

### (A45F) (653)

### 16 8

( 1 0 1 0 0 1 0 0 0 1 0 1 1 1 1 1 ) (1 1 0 1 0 1 0 1 1 )

### 2 2

00(1 0 1 0 0 1 0 0 0 1 0 1 1 1 1 1 ) 000(1 1010 1011)

### 2 2

regroup in 3-bit groups, add zeroes

### (1 A B )

convert each 3-bit group 16

(1 2 2 1 3 7 )

### 8

• For the fractional part: same, just group digits by starting from the position

after the radix point (same number when adding zeroes on the right

### →

### Hex bin:

add zeroes to the right

(0 . A45F) (same number, not

### 16

needed in this example)

(0 . 1010 0100 0101 1111) 00…

### 2

EE2026 Digital Design Prof. Massimo Alioto Page 16

## Page 17

### Table 1

| Radix Conversion: Summary and Generalization
• Radix r (r≠10) → decimal
◦ Just use definition of positional number system (weighted sum of all digits)
• Decimal → Radix r (r≠10)
◦ Integer part → repeated division by r and take the remainder
◦ Fractional part → repeated multiplication by r and take the integer part
◦ Add integer and fractional part
• Conversion among binary, octal and Hex numbers
◦ Grouping: 1 Hex digit = 4 bits, 1 octal digit = 3 bits
◦ Conversion with binary as intermediate step + regroup: Hex → oct carried out as
Hex → Binary → Octal, and vice versa |
| --- |
|  |
| EE2026 Digital Design Prof. Massimo Alioto Page 17 |

Radix Conversion: Summary and Generalization

• Radix r (r≠10) → decimal

◦ Just use definition of positional number system (weighted sum of all digits)

• Decimal → Radix r (r≠10)

◦ Integer part → repeated division by r and take the remainder

◦ Fractional part → repeated multiplication by r and take the integer part

◦ Add integer and fractional part

• Conversion among binary, octal and Hex numbers

◦ Grouping: 1 Hex digit = 4 bits, 1 octal digit = 3 bits

◦ Conversion with binary as intermediate step + regroup: Hex → oct carried out as

Hex → Binary → Octal, and vice versa

EE2026 Digital Design Prof. Massimo Alioto Page 17
