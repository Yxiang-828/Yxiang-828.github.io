# EE2026 Tutorial 2 - Questions

## Page 1

EE2026
Digital Design
LOGIC GATES
Massimo ALIOTO
Dept of Electrical and Computer Engineering
Email: massimo.alioto@nus.edu.sg
Explore
Follow
Discover
more
What’s
happening
Stay tuned
Be
connected
Communicate
Get to know the latest silicon system breakthroughs from our labs in 1-minute video demos

## Page 2

EE2026 Digital Design
Prof. Massimo Alioto
Outline
•
Logic gate introduction
◦
AND/NAND, OR/NOR, NOT/buffer, XOR/XNOR
•
Levels of abstraction: Boolean function, truth table, graphical, Verilog
•
Implementation of Boolean function using gates
•
Design simplification via algebraic manipulations
•
Positive and negative logic
•
Implementation of Boolean function with gate-level netlist
Page 2

## Page 3

EE2026 Digital Design

Prof. Massimo Alioto
Introduction to Logic Gates
•
Logic gates are digital circuits implementing fundamental Boolean
operators or some simple combination of them
◦
Abstraction: actually made up of transistors (not shown here), closer to physical
implementation of digital systems
Page 3
logic
gate
symbol
function (F)
logic
gate
symbol
function (F)
AND
𝐴𝐴ȉ 𝐵𝐵
NAND
𝐴𝐴ȉ 𝐵𝐵
OR
𝐴𝐴+ 𝐵𝐵
NOR
𝐴𝐴+ 𝐵𝐵
NOT
̅𝐴𝐴
Buffer
𝐴𝐴
A
B
F
A
B
F
A
B
F
A
B
F

## Page 4

EE2026 Digital Design

Prof. Massimo Alioto
AND and NAND Gates
Page 4
AND
•
F is 1 only when both A and B are 1
A
B
𝑨𝑨ȉ 𝑩𝑩
𝑨𝑨ȉ 𝑩𝑩
0
0
0
1
1
0
0
1
0
1
0
1
1
1
1
0
𝑭𝑭= 𝑨𝑨ȉ 𝑩𝑩
A
B
F
𝑭𝑭= 𝑨𝑨ȉ 𝑩𝑩
A
B
F
F
A
B
bubble = complement
module andgate(A, B, F);
input A, B;
output F;
assign F = A & B;
endmodule
NAND
•
F is 0 only if both A and B are 1
module nandgate(A, B, F);
input A, B;
output F;
assign F = ~(A & B);
endmodule
Truth table (AND, NAND)

## Page 5

EE2026 Digital Design

Prof. Massimo Alioto
A
B
F
module norgate(A, B, F);
input A, B;
output F;
assign F = ~(A | B);
endmodule
module orgate(A, B, F);
input A, B;
output F;
assign F = A | B;
endmodule
A
B
𝑨𝑨+ 𝑩𝑩
𝑨𝑨+ 𝑩𝑩
0
0
0
1
1
0
1
0
0
1
1
0
1
1
1
0
𝑭𝑭= 𝑨𝑨+ 𝑩𝑩
A
B
F
𝑭𝑭= 𝑨𝑨+ 𝑩𝑩
A
B
F
OR and NOR Gates
Page 5
OR
•
F is 1 when either A or B are 1
bubble = complement
NOR
•
F is 1 only if both A and B are 0
Truth table (OR, NOR)

## Page 6

EE2026 Digital Design

Prof. Massimo Alioto
module xnorgate(A, B, F);
input A, B;
output F;
assign F = ~(A ^ B);
endmodule
module xorgate(A, B, F);
input A, B;
output F;
assign F = A ^ B;
endmodule
A
B
𝑨𝑨⊕𝑩𝑩
𝑨𝑨⊕𝑩𝑩
0
0
0
1
1
0
1
0
0
1
1
0
1
1
0
1
𝑭𝑭= 𝑨𝑨𝑩𝑩+ 𝑨𝑨𝑩𝑩= 𝑨𝑨⊕𝑩𝑩
XOR and XNOR Gates
Page 6
•
Logic gate that is not fundamental in Boolean algebra
◦
But very useful (e.g., arithmetic circuits – see week 4)
XOR
•
F is 1 when either A or B (exclusively) are 1,
or equivalently different from each other
A
B
F
bubble = complement
Truth Table (XOR, XNOR)
A
B
F
𝑭𝑭= 𝑨𝑨+ 𝑩𝑩
A
B
F
F
A
B
XNOR
•
F is 1 when either A or B (exclusively) are 0,
or equivalently equal

## Page 7

EE2026 Digital Design

Prof. Massimo Alioto
Implementation of Boolean Functions with Logic Gates
Page 7
•
Translate Boolean function into gate-level implementation
◦
Logic gates as building blocks of any digital system
•
Start simple: SOP form → gate-level design
◦
Example of SOP with constraint: max number of logic gate inputs is 4 (fan-in)
𝐹𝐹𝑤𝑤, 𝑥𝑥, 𝑦𝑦, 𝑧𝑧= ഥ𝑤𝑤̅𝑥𝑥𝑧𝑧+ ഥ𝑤𝑤𝑥𝑥𝑥𝑥+ 𝑤𝑤𝑤𝑤𝑤𝑤+ 𝑥𝑥𝑥𝑥𝑥𝑥
ഥ𝑤𝑤̅𝑥𝑥𝑧𝑧
ഥ𝑤𝑤𝑥𝑥𝑥𝑥
𝑤𝑤𝑤𝑤𝑤𝑤
𝑥𝑥𝑦𝑦𝑧𝑧
gate count = 7
if AND5 or more is needed: two-level ANDing (same for OR):
x1⋅x2⋅x3⋅x4⋅x5⋅x6 = (x1⋅x2⋅x3⋅x4)⋅(x5⋅x6)
x1
x2
x3
x4
x5
x6
module func(w,x,y,z,F);
input w, x, y, z;
output F;
assign F = ~w & ~x & z | ~w & x & z | w & y & z | x & y & z;
endmodule
parentheses (~w & x & z) not needed in
SOP, as precedence order is ~, &, ^, |

## Page 8

EE2026 Digital Design

Prof. Massimo Alioto
module func(a,b,c,d,F);
input a, b, c, d;
output F;
assign F = a & b & ~c | a & b & c | b & c & d | ~a & c & d | a & ~b & ~c & d;
endmodule
Implementation of Boolean Functions with Logic Gates
Page 8
◦
Another example of SOP with constraint: max number of logic gate inputs is 4
𝐹𝐹𝑎𝑎, 𝑏𝑏, 𝑐𝑐, 𝑑𝑑= 𝑎𝑎𝑎𝑎̅𝑐𝑐+ 𝑎𝑎𝑎𝑎𝑎𝑎+ 𝑏𝑏𝑏𝑏𝑏𝑏+ ത𝑎𝑎𝑐𝑐𝑐𝑐+ 𝑎𝑎ത𝑏𝑏𝑐𝑐𝑑𝑑
gate count = 11

## Page 9

EE2026 Digital Design

Prof. Massimo Alioto
module func(a,b,c,F);
input a, b, c;
output F;
assign F = (a | b | ~c) & (a | c) & (~a | ~b | c) & (a | ~b | ~c);
endmodule
gate count = 8
a
b
c
F
Implementation of Boolean Functions with Logic Gates
Page 9
◦
Example of POS with constraint: max number of logic gate inputs is 4
𝐹𝐹𝑎𝑎, 𝑏𝑏, 𝑐𝑐= (𝑎𝑎+ 𝑏𝑏+ ̅𝑐𝑐)(𝑎𝑎+ 𝑐𝑐)(ത𝑎𝑎+ ത𝑏𝑏+ 𝑐𝑐)(𝑎𝑎+ ത𝑏𝑏+ 𝑐𝑐)
parentheses needed in POS,
as precedence order is ~, &, ^, |

## Page 10

EE2026 Digital Design

Prof. Massimo Alioto
•
To reduce the hardware cost, the Boolean function must be simplified
before gate-level implementation
◦
Eliminate redundancies, minimize gate count
Page 10
•
Simplification can be carried out via
◦
Algebraic manipulations using postulates and theorems
◦
Karnaugh maps
𝐹𝐹2 𝐴𝐴, 𝐵𝐵, 𝐶𝐶=
̅𝐴𝐴𝐵𝐵̅𝐶𝐶+ A ത𝐵𝐵+ ത𝐵𝐵𝐶𝐶+ 𝐴𝐴𝐴𝐴̅𝐶𝐶
terms
literals (variables, complemented or not)
•
Definition of simplified Boolean Function
◦
It contains a minimal number of terms and literals in each term, such that no other
expression with fewer literals and terms will represent the original function
𝐹𝐹2 𝐴𝐴, 𝐵𝐵, 𝐶𝐶= 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶⋅𝐴𝐴+ ത𝐵𝐵+
̅𝐶𝐶
terms
literals
Boolean Function Simplification

## Page 11

EE2026 Digital Design

Prof. Massimo Alioto
Boolean Function Simplification using Algebraic Manipulations
◦
Example: SOP
Page 11
(𝐴𝐴+
̅𝐴𝐴= 1)
(𝐴𝐴+
̅𝐴𝐴= 1)
Before simplification
gate count = 8
After simplification
gate count = 3
(62.5% reduction!)
= ത𝑎𝑎̅𝑐𝑐
= ത𝑎𝑎̅𝑐𝑐ത𝑏𝑏+ 𝑏𝑏
= ത𝑎𝑎ത𝑏𝑏̅𝑐𝑐+ ത𝑎𝑎𝑏𝑏̅𝑐𝑐
̅𝑑𝑑+ 𝑑𝑑
𝐹𝐹𝑎𝑎, 𝑏𝑏, 𝑐𝑐, 𝑑𝑑= ത𝑎𝑎ത𝑏𝑏̅𝑐𝑐+ ത𝑎𝑎𝑏𝑏̅𝑐𝑐̅𝑑𝑑+ ത𝑎𝑎𝑏𝑏̅𝑐𝑐𝑑𝑑
(𝐴𝐴+
̅𝐴𝐴= 1)

## Page 12

EE2026 Digital Design

Prof. Massimo Alioto
After simplification
gate count = 4
(43% reduction!)
gate count = 7
Before simplification
Boolean Function Simplification using Algebraic Manipulations
◦
Another example: SOP
Page 12
𝐹𝐹𝑥𝑥, 𝑦𝑦, 𝑧𝑧= ഥ𝑤𝑤̅𝑥𝑥𝑧𝑧+ ഥ𝑤𝑤𝑥𝑥𝑥𝑥+ 𝑥𝑥𝑥𝑥𝑥𝑥+ 𝑤𝑤𝑤𝑤𝑤𝑤
(𝐴𝐴+
̅𝐴𝐴= 1)
(𝐴𝐴𝐵𝐵+
̅𝐴𝐴𝐶𝐶+ 𝐵𝐵𝐶𝐶= 𝐴𝐴𝐴𝐴+
̅𝐴𝐴𝐶𝐶) - consensus
= ഥ𝑤𝑤𝑧𝑧
̅𝑥𝑥+ 𝑥𝑥+ 𝑤𝑤𝑥𝑥𝑥𝑥+ 𝑧𝑧𝑥𝑥𝑥𝑥
= ഥ𝑤𝑤𝑧𝑧+ 𝑤𝑤𝑥𝑥𝑥𝑥+ 𝑧𝑧𝑥𝑥𝑥𝑥
= ഥ𝑤𝑤𝑧𝑧+ 𝑤𝑤𝑥𝑥𝑥𝑥
(𝐴𝐴+
̅𝐴𝐴= 1)

## Page 13

EE2026 Digital Design

Prof. Massimo Alioto
gate count = 11
Before simplification
Boolean Function Simplification using Algebraic Manipulations
◦
Another example: SOP
Page 13
(𝐴𝐴+
̅𝐴𝐴= 1)
(𝐴𝐴𝐵𝐵+
̅𝐴𝐴𝐶𝐶+ 𝐵𝐵𝐶𝐶= 𝐴𝐴𝐴𝐴+
̅𝐴𝐴𝐶𝐶) - consensus
𝐹𝐹𝑎𝑎, 𝑏𝑏, 𝑐𝑐, 𝑑𝑑= 𝑎𝑎𝑎𝑎̅𝑐𝑐+ 𝑎𝑎𝑎𝑎𝑎𝑎+ 𝑏𝑏𝑏𝑏𝑏𝑏+ ത𝑎𝑎𝑐𝑐𝑐𝑐+ 𝑎𝑎ത𝑏𝑏𝑐𝑐𝑑𝑑
(𝐴𝐴+
̅𝐴𝐴ȉ 𝐵𝐵= 𝐴𝐴+ 𝐵𝐵)
= 𝑎𝑎𝑎𝑎
̅𝑐𝑐+ 𝑐𝑐+ 𝑏𝑏𝑏𝑏𝑏𝑏+ ത𝑎𝑎𝑐𝑐𝑐𝑐+ 𝑎𝑎ത𝑏𝑏𝑐𝑐𝑑𝑑
= 𝑎𝑎𝑏𝑏+ ത𝑏𝑏
̅𝑐𝑐𝑑𝑑
+ 𝑏𝑏𝑏𝑏𝑏𝑏+ ത𝑎𝑎𝑐𝑐𝑐𝑐
= 𝑎𝑎𝑏𝑏+ ̅𝑐𝑐𝑑𝑑+ 𝑏𝑏𝑏𝑏𝑏𝑏+ ത𝑎𝑎𝑐𝑐𝑐𝑐
= 𝑎𝑎𝑏𝑏+ ത𝑎𝑎𝑐𝑐𝑐𝑐+ 𝑏𝑏𝑐𝑐𝑐𝑐
+ 𝑎𝑎̅𝑐𝑐𝑑𝑑
= 𝑎𝑎𝑎𝑎+ ത𝑎𝑎𝑐𝑐𝑐𝑐+ 𝑎𝑎̅𝑐𝑐𝑑𝑑
gate count = 6
After simplification
(45.5% reduction!)

## Page 14

EE2026 Digital Design

Prof. Massimo Alioto
•
Proposed procedure to somewhat minimize Boolean functions using
algebraic manipulations
1) 𝐴𝐴𝐴𝐴+ 𝐴𝐴ത𝐵𝐵= 𝐴𝐴           (Logical adjacency)
2) 𝐴𝐴+
̅𝐴𝐴ȉ 𝐵𝐵= 𝐴𝐴+ 𝐵𝐵
3) 𝐴𝐴𝐴𝐴+
̅𝐴𝐴𝐶𝐶+ 𝐵𝐵𝐵𝐵= 𝐴𝐴𝐴𝐴+
̅𝐴𝐴𝐶𝐶    (Consensus)
Boolean Function Simplification using Algebraic Manipulations
•
Disadvantage of algebraic manipulations: not systematic, tedious, no
guarantee of minimal function
Page 14
◦
Apply (1) until it cannot be applied further
◦
Apply (2) until it cannot be applied further
◦
Go back to (1) and then (2) until they can no longer be applied
◦
Apply (3) until it cannot be applied further
◦
Go back to (1), (2) and then (3) until none of them can be applied

## Page 15

EE2026 Digital Design

Prof. Massimo Alioto
Interfaces and Legacy Systems: Negative Logic
Page 15
•
Physical logic gates: voltage input and output levels low (L) and high (H)
◦
Binary values 0 and 1 can be mapped in two ways
◦
positive logic (“active high”): ex. X.H
◦
negative logic (“active low”): ex. X.L
◦
convert one to another via simple inverter
voltage level
positive logic
value (X.H)
negative logic
value (X.L)
H
1
0
L
0
1
◦
Today (including FPGAs), no preference
◦
think in terms of positive logic, negate any active-low input/output signal if necessary
𝑋𝑋. 𝐿𝐿
𝑋𝑋. 𝐻𝐻
existing
system
system
under
design
𝑋𝑋. 𝐻𝐻
𝑋𝑋. 𝐿𝐿
existing
system
system
under
design
A.L
B.L
F.L
A.L
B.L
F.L
◦
graphically add “bubble” to signals to remind about the complement
◦
In the (distant) past, active-low preferred because of lower power in H level
◦
normally-off signals (e.g., reset) were set to H (e.g., TTL logic, open-collector)
◦
it was easier to merge normally-off signals into one occasionally-on signal
◦
today used only in system resets, interrupts and I2C busses
I1
Rpull-up
I2
In
...
VDD

## Page 16

EE2026 Digital Design

Prof. Massimo Alioto
Bubble Pushing Rule
Page 16
•
Graphical interpretation of De Morgan’s law(s), useful to
◦
Manipulate gate-level netlists directly without Boolean expressions (tedious)
◦
Transform logic gates from one type (e.g., NAND) into another one (NOR)
•
Graphically, bubble = complement
◦
If a bubble is needed, it can always be created anywhere (but in pairs)
𝐴𝐴= 𝐴𝐴
𝐴𝐴= 𝐴𝐴
◦
Vice versa, two adjacent bubbles can always be dissolved
◦
Bubbles at input of AND gate can be “pushed” at its output, and the
gate is transformed into a NOR gate (similarly, NAND becomes OR)
𝐴𝐴⋅𝐵𝐵= 𝐴𝐴+ 𝐵𝐵
𝐴𝐴+ 𝐵𝐵= 𝐴𝐴⋅𝐵𝐵
A.L
B.L
F.L
A.L
B.L
F.L
and vice versa
(push from
output to input)

## Page 17

EE2026 Digital Design

Prof. Massimo Alioto
Bubble Pushing Rule
Page 17
◦
Example: implement Boolean function using only NOR gates and inverter gates
𝐹𝐹= 𝐴𝐴ȉ 𝐵𝐵+ 𝐴𝐴ȉ 𝐶𝐶
Step 1: place logic gates
A
B
A
C
Step 2: add bubbles
and connect
(add the complement
where needed for
the correct function)
A
B
A
C
Step 3: bubble pushing
(i) Replace gates with targeted ones
(ii) balance the bubbles using inverters
to maintain the correct functionality
already NOR, no
change needed
need to change
to NOR
A
B
A
C
F
F
F
Step 4: simplify
(eliminate redundant pairs of bubbles)
A
B
A
C
F
A
B 𝑨𝑨+ 𝑩𝑩
0
0
1
1
1
0
A
B
𝑨𝑨⋅𝑩𝑩
0
0
1
1
1
0

## Page 18

EE2026 Digital Design

Prof. Massimo Alioto
Bubble Pushing Rule
Page 18
◦
Another example: implement Boolean function with logic gates with active-low
output, using only NAND gates (no inverter gates)

## Page 19

EE2026 Digital Design

Prof. Massimo Alioto
In Summary
Page 19
•
Logic gates
◦
Building blocks of any digital system
◦
Different levels of abstraction (Boolean, truth table, graphical, Verilog)
•
Implementation of Boolean function using gates
•
Design simplification via algebraic manipulations (limitations motivate
introduction of K-maps)
•
Positive → negative logic conversion for legacy systems
•
Bubble pushing for direct manipulation of gate-level netlists (with no
intermediate Boolean manipulations)