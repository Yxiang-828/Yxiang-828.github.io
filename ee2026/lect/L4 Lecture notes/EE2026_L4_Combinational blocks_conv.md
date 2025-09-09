# EE2020 Digital Fundamentals – Prof. Massimo Alioto

## Page 1

EE2020 Digital Fundamentals – Prof. Massimo Alioto
1
Prof. Massimo Alioto
Dept of Electrical and Computer Engineering
Email: massimo.alioto@nus.edu.sg
EE2026
Digital Fundamentals
Combinational Building Blocks and
Structural/Dataflow Verilog Description

## Page 2

2
Outline
• Introduction
• Binary adders
– Half adders, full adders, ripple adders.
• Magnitude comparators
• Decoders, BCD to 7-segment decoders
• Encoders, Multiplexers
• Demultiplexers
• Tri-state logic elements
EE2020 Digital Fundamentals – Prof. Massimo Alioto

## Page 3

3
EE2020 Digital Fundamentals – Prof. Massimo Alioto
Introduction
• There are two types of logic circuits
– Combinational and sequential logic circuits
• Combinational logic
– The output depends only on the current inputs
• Sequential logic
– The output depends on both past and present inputs, which implies
that there is a memory element in the sequential circuit
• Combinational building blocks that are commonly used in
digital systems

## Page 4

Half Adders
• It is a one bit binary adder with two inputs of Ai and Bi
Ai
Bi
Sumi
Carryi+1
0
0
0
0
0
1
1
0
1
0
1
0
1
1
0
1
EE2020 Digital Fundamentals – Prof. Massimo Alioto
4
0 + 0 = 0
0 + 1 = 1
1 + 0 = 1
1 + 1 = 10
1
0
1
0
:
:
n
i
i
n
i
i
A A
A A
A
B B
B B
B
+
+




𝐶𝐶𝑖𝑖+1 = 𝐴𝐴𝑖𝑖⋅𝐵𝐵𝑖𝑖
SUMi
CARRYi+1
Ai
Bi
𝑆𝑆𝑖𝑖=
'𝐴𝐴𝑖𝑖⋅𝐵𝐵𝑖𝑖+ 𝐴𝐴𝑖𝑖⋅'𝐵𝐵𝑖𝑖⋅
𝑆𝑆𝑖𝑖
𝐶𝐶𝑖𝑖+1
Sum 
Carry 
Carry in from i-1 bit cannot be added

## Page 5

Half Adders (cont.)
• Dataflow Verilog description
Ai
Bi
Sumi
Carryi+1
0
0
0
0
0
1
1
0
1
0
1
0
1
1
0
1
EE2020 Digital Fundamentals – Prof. Massimo Alioto
5
𝐶𝐶𝑖𝑖+1 = 𝐴𝐴𝑖𝑖⋅𝐵𝐵𝑖𝑖
𝑆𝑆𝑖𝑖= 𝐴𝐴𝑖𝑖⨁𝐵𝐵𝑖𝑖
module ha(S,Cout,A,B);
input A, B;
output S, Cout; // Cout is the carry output
assign S = A ^ B;
assign Cout = A & B;
endmodule

## Page 6

Full Adders
• Full adders can use the carry bit from the previous stage
of addition
Full adder
Ai
Bi
Ci
Si
Ci+1

Current
bits
carry-in from
previous stg
carry-out to
next stg
Current
sum
Ai
Bi
Ci
Si
Ci+1
0
0
0
0
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
0
1
1
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
0
1
1
1
0
0
1
1
1
1
1
1
EE2020 Digital Fundamentals – Prof. Massimo Alioto
6

## Page 7

Ai
BiCi
0
1
00
0
0
01
0
1
11
1
1
10
0
1
K-map for CARRY
Full Adders (cont.)
EE2020 Digital Fundamentals – Prof. Massimo Alioto
7
)
(
)
(
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
1
i
B
A
C
B
A
B
A
B
A
C
B
A
C
B
A
C
B
A
B
A
C
⊕
+
=
+
+
=
+
+
=
+
Note: Ci+1 is not a MSOP, but
less overall hardware is reqd. if
we use this expression. It
allows sharing of Ai XOR Bi
between SUMi and Ci+1.
Ai
BiCi
0
1
00
0
1
01
1
0
11
0
1
10
1
0
K-map for SUM
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
i
SUM
ABC
ABC
ABC
ABC
A (BC
BC )
A (BC
BC )
A (B
C )
A (B
C )
A
B
C
=
+
+
+
=
+
+
+
=
⊕
+
⊕
=
⊕
⊕

## Page 8

Full Adder Circuit
SUMi
Ci+1
Ai
Bi
Full adder
half adder
half adder
Ci
)
(
1
i
i
i
i
i
i
B
A
C
B
A
C
⊕
+
=
+
i
i
i
C
B
A
SUM
⊕
⊕
=
)
(
Note: A full adder adds 3 bits. Can also consider as first
adding first two and then the result with the carry
EE2020 Digital Fundamentals – Prof. Massimo Alioto
8

## Page 9

Full Adder Circuit
)
(
1
i
i
i
i
i
i
B
A
C
B
A
C
⊕
+
=
+
i
i
i
C
B
A
SUM
⊕
⊕
=
)
(
EE2020 Digital Fundamentals – Prof. Massimo Alioto
9
module fa(S,Cout,A,B,Cin);
input A, B, Cin; // Cin is the carry input
output S, Cout; // Cout is the carry output
assign S = A ^ B ^ Cin;
assign Cout = A & B | Cin & (A ^ B);
endmodule
•
Verilog dataflow description

## Page 10

Parallel Adders
Stage 3
FA
A3
B3
S3
Stage 0
FA
A0
B0
S0
Stage 2
FA
A2
B2
S2
Stage 1
FA
A1
B1
S1
C3
C2
C1
C0
0
C4
carry-out
Note: no carry-in
MSB
LSB
Full
Adder
Ai
Bi
Si
Ci+1
Ci
C4  C3  C2  C1
      A3  A2  A1  A0
      B3  B2  B1  B0
EE2020 Digital Fundamentals – Prof. Massimo Alioto
10
4 cascaded full adders

## Page 11

Parallel Adders (cont.)
EE2020 Digital Fundamentals – Prof. Massimo Alioto
11
•
In general, n full adders need to be used to form an n-bit adder
•
Carry ripple effect
– output of each full adder is not available until the carry-in from the
previous stage is delivered
– carry bits have to propagate from one stage to the next
– as the carries ripple through the carry chain  also known as ripple
carry adders
•
This slow rippling effect is substantially reduced by using carry look
ahead adders
FA0
A 0 B 0
C in0
C in1
S 0
FA1
A 1 B 1
C in2
S 1
FA(N-1)
A N-1 B N-1
C out
S N-1
C in(N-1)
critical path

## Page 12

Parallel Adders (cont.)
•
Structural Verilog description (parameterized, arbitrary bit width)
EE2020 Digital Fundamentals – Prof. Massimo Alioto
12
module rca(S,Cout,A,B,Cin); // 4-bit ripple carry adder
parameter N = 4; // parameterized bit width
input [N-1:0] A, B;
input Cin; // Cin is the adder carry input (at LSB)
output [N-1:0] S;
output Cout; // Cout is the adder carry output (at MSB)
wire [N:0] C; // carry inputs of all full adders + carry output of last one
assign C[0] = Cin;
assign Cout = C[N];
genvar i; // temp variable used only in generate loop

generate for(i=0;i<N;i=i+1) begin

fa FAinstance (.S(S[i]),.Cout(C[i+1]),.A(A[i]),.B(B[i]),.Cin(C[i]));

end
endgenerate
endmodule

## Page 13

Magnitude Comparator
• Outputs are functions of relative magnitudes of
input binary numbers A and B
Magnitude comparator
(A > B)
(A < B)
(A = B)
AN-1 ...A0
N
N
BN-1...B0
Functional block diagram
EE2020 Digital Fundamentals – Prof. Massimo Alioto
13

## Page 14

Magnitude Comparator: Truth Table
A1
A0
B1
B0
(A > B)
(A = B)
(A < B)
0
0
0
0
0
1
0
0
0
0
1
0
0
1
0
0
1
0
0
0
1
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
0
1
0
0
0
1
0
1
0
1
0
0
1
1
0
0
0
1
0
1
1
1
0
0
1
1
0
0
0
1
0
0
1
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
0
1
0
1
0
1
1
0
0
1
1
1
0
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
0
1
1
1
0
1
0
0
1
1
1
1
0
1
0
EE2020 Digital Fundamentals – Prof. Massimo Alioto
14
2-bit magnitude comparator

## Page 15

K-maps for A>B and A<B
A1A0
B1B0
00
01
1
1
10
00
0
1
1
1
01
0
0
1
1
11
0
0
0
0
10
0
0
1
0
0
0
1
0
1
0
1
1
B
A
A
B
B
A
B
A
B
A
+
+
=
>
)
(
A1A0
B1B0
00
01
11
10
00
0
0
0
0
01
1
0
0
0
11
1
1
0
1
10
1
1
0
0
A>B
A<B
0
1
0
0
0
1
1
1
B
B
A
B
A
A
B
A
B
A
+
+
=
<
)
(
EE2020 Digital Fundamentals – Prof. Massimo Alioto
15

## Page 16

K-map for A=B
A1A0
B1B0
00
01
11
10
00
1
0
0
0
01
0
1
0
0
11
0
0
1
0
10
0
0
0
1
A=B
0
1
0
1
0
1
0
1
0
1
0
1
0
1
0
1
)
(
B
B
A
A
B
B
A
A
B
B
A
A
B
B
A
A
B
A
+
+
+
=
=
)
(
)
(
)
(
B
A
B
A
B
A
>
⋅
<
=
=
This can be generated indirectly
using (A<B) and (A>B)
EE2020 Digital Fundamentals – Prof. Massimo Alioto
16

## Page 17

Magnitude Comparator: Verilog
EE2020 Digital Fundamentals – Prof. Massimo Alioto
17
•
Dataflow Verilog description (parameterized, arbitrary bit width)
module magcomp(AgreaterB,AequalB,AlowerB,A,B);
parameter N = 4;
input [N-1:0] A, B;
output AgreaterB, AequalB, AlowerB;
assign AgreaterB = (A > B);
assign AequalB = (A == B);
assign AlowerB = (A < B);
/*  to reduce complexity at the cost of slightly worse performance: assign
AlowerB = ~AgreaterB & ~AequalB */
endmodule

## Page 18

Decoder
•
Input: N-bit input code
•
A decoder activates a (single) appropriate output line among M
(more than N, usually 2N) as a function of the input
A2
A0
A1
Z2
Z6
Z5
Z4
Z3
Z1
Z0
Z7
3-to-8 decoder
A2
A1
A0
Z0
Z1
Z2
Z3
Z4
Z5
Z6
Z7
0
0
0
1
0
0
0
0
0
0
0
0
0
1
0
1
0
0
0
0
0
0
0
1
0
0
0
1
0
0
0
0
0
0
1
1
0
0
0
1
0
0
0
0
1
0
0
0
0
0
0
1
0
0
0
1
0
1
0
0
0
0
0
1
0
0
1
1
0
0
0
0
0
0
0
1
0
1
1
1
0
0
0
0
0
0
0
1
Functional block diagram
Truth Table
EE2020 Digital Fundamentals – Prof. Massimo Alioto
18
2N
N

## Page 19

Example: Decoder 3-8
• A decoder has 2N output
lines for N inputs
– named N-2N decoder
– output can be single- or
multi-bit
• Enable signal
– if E = 1, NORmal operation
– if E= 0, disable outputs (all
0’s)
– N enables permit to
combine multiple decoders
(see videolecture on MSIs)
A2
A0
A1
Z2
Z6
Z5
Z4
Z3
Z1
Z0
Z7
E
Functional block diagram
EE2020 Digital Fundamentals – Prof. Massimo Alioto
19

## Page 20

Decoder with Enable Signal
E
A2
A1
A0
Z0
Z1
Z2
Z3
Z4
Z5
Z6
Z7
0
X
X
X
0
0
0
0
0
0
0
0
1
0
0
0
1
0
0
0
0
0
0
0
1
0
0
1
0
1
0
0
0
0
0
0
1
0
1
0
0
0
1
0
0
0
0
0
1
0
1
1
0
0
0
1
0
0
0
0
1
1
0
0
0
0
0
0
1
0
0
0
1
1
0
1
0
0
0
0
0
1
0
0
1
1
1
0
0
0
0
0
0
0
1
0
1
1
1
1
0
0
0
0
0
0
0
1
Truth Table including Enable signal (single-bit output)
Inputs
Outputs
EE2020 Digital Fundamentals – Prof. Massimo Alioto
20

## Page 21

Example: Decoder 2-4
• A 2:4 decoder has 22
output lines for N inputs
– output can be single- or
multi-bit
• Enable signal
– if E = 1, NORmal operation
– if E= 0, disable outputs (all
0’s)
A0
A1
Z1
Z3
Z2
Z0
E
Functional block diagram
EE2020 Digital Fundamentals – Prof. Massimo Alioto
21

## Page 22

Decoder with Enable Signal
E
A1
A0
Z0
Z1
Z2
Z3
0
X
X
0
0
0
0
1
0
0
1
0
0
0
1
0
1
0
1
0
0
1
1
0
0
0
1
0
1
1
1
0
0
0
1
Truth Table including Enable signal (single-bit output)
Inputs
Outputs
EE2020 Digital Fundamentals – Prof. Massimo Alioto
22

## Page 23

Decoder: Verilog
EE2020 Digital Fundamentals – Prof. Massimo Alioto
23
•
Dataflow Verilog description of a 2:4 decoder
module decoder24(Z,A,E);
input [1:0] A;
input E;
output [0:3] Z;
assign Z = ((A == 2'b00) & E) ? 4'b1000 :

((A == 2'b01) & E) ? 4'b0100 :

((A == 2'b10) & E) ? 4'b0010 :

((A == 2'b11) & E) ? 4'b0001 :
4'b0000;

// 0000 is assigned if E=0
endmodule
E
A1
A0
Z0
Z1
Z2
Z3
0
X
X
0
0
0
0
1
0
0
1
0
0
0
1
0
1
0
1
0
0
1
1
0
0
0
1
0
1
1
1
0
0
0
1
Inputs
Outputs

## Page 24

((A == 2'b01) & E) ? 4'b0100 :
Decoder: Verilog
EE2020 Digital Fundamentals – Prof. Massimo Alioto
24
•
Dataflow Verilog description of a 2:4 decoder
module decoder24(Z,A,E);
input [1:0] A;
input E;
output [0:3] Z;
assign Z =

endmodule
E
A1
A0
Z0
Z1
Z2
Z3
0
X
X
0
0
0
0
1
0
0
1
0
0
0
1
0
1
0
1
0
0
1
1
0
0
0
1
0
1
1
1
0
0
0
1
Inputs
Outputs
4'b0000; // 0000 if E=0
…
((A == 2'b00) & E) ? 4'b1000 :
((A == 2'b01) & E) ? 4'b0100 :
…
((A == 2'b10) & E) ? 4'b0010 :
…
((A == 2'b11) & E) ? 4'b0001 :
…

## Page 25

Decoder: Verilog
EE2020 Digital Fundamentals – Prof. Massimo Alioto
25
•
Parameterized dataflow Verilog description (arbitrary bit width)
module decoder(Z,A,E);
parameter M = 4; // parameterized design (sets # inputs)
parameter N = 16; // parameterized design (sets # outputs=2^M)
input [M-1:0] A;
input E;
output [0:N-1] Z;
wire [N-1:0] zerovec = {N{1'b0}}; // replication operator N(.)
/* other option: define constant zerovec=1'b0, it will be extended to the left
with zeros to the correct bit width */
assign Z = (enable) ? (1 << A) : zerovec;
// if enable=0, output is set to to zerovec = 00...0
// if enable=1, shift “1” A times and fill all other positions with zeros
endmodule

## Page 26

Example: BCD-to-7 Segment Decoder
•
Converts a BCD number into signals required to display
that number on a 7-segment display
ANODE
CATHODE
LED
+
-
a
c
b
g
e
d
f
A 7-segment display. Each segment is an LED
which will light when a logic T signal is applied to it
•
7-segment displays are of 2 types: common anode and
common cathode
•
Common anode display has all LED anodes connected and is
active low, whereas the common cathode display is active
high
EE2020 Digital Fundamentals – Prof. Massimo Alioto
26

## Page 27

BCD-to-7 Segment Decoder – cont.
D
C
B
A
a
b
c
d
e
f
g
0
0
0
0
1
1
1
1
1
1
0
0
0
0
1
0
1
1
0
0
0
0
0
0
1
0
1
1
0
1
1
0
1
0
0
1
1
1
1
1
1
0
0
1
0
1
0
0
0
1
1
0
0
1
1
0
1
0
1
1
0
1
1
0
1
1
0
1
1
0
1
0
1
1
1
1
1
0
1
1
1
1
1
1
0
0
0
0
1
0
0
0
1
1
1
1
1
1
1
1
0
0
1
1
1
1
1
0
1
1
1
0
1
0
X
X
X
X
X
X
X
1
0
1
1
X
X
X
X
X
X
X
1
1
0
0
X
X
X
X
X
X
X
1
1
0
1
X
X
X
X
X
X
X
1
1
1
0
X
X
X
X
X
X
X
1
1
1
1
X
X
X
X
X
X
X
D
B
C
c
f
e
d
b
a
g
BCD-to-7-
segment decoder
A
Functional block diagram
Truth Table
a
b
c
d
e
f
g
27
• Verilog: essentially, description of a truth table
–
no clever dataflow Verilog description (behavioral, see later)

## Page 28

Encoder
•
No clever dataflow Verilog description (behavioral, see later)
C2
C0
C1
I2
I6
I5
I4
I3
I1
I0
I7
Functional block diagram
I0
I1
I2
I3
I4
I5
I6
I7
C2
C1
C0
1
0
0
0
0
0
0
0
0
0
0
0
1
0
0
0
0
0
0
0
0
1
0
0
1
0
0
0
0
0
0
1
0
0
0
0
1
0
0
0
0
0
1
1
0
0
0
0
1
0
0
0
1
0
0
0
0
0
0
0
1
0
0
1
0
1
0
0
0
0
0
0
1
0
1
1
0
0
0
0
0
0
0
0
1
1
1
1
Truth Table (an 8-3 encoder)
EE2020 Digital Fundamentals – Prof. Massimo Alioto
28
• For different input bits (usually 2N), encoder generates a
code with fewer bits (usually N bits) uniquely identifying
the input
– performs the inverse of the decoding function

## Page 29

Example: Priority Encoder
EE2020 Digital Fundamentals – Prof. Massimo Alioto
29
I0
I1
I2
I3
I4
I5
I6
I7
C2
C1
C0
1
0
0
0
0
0
0
0
0
0
0
X
1
0
0
0
0
0
0
0
0
1
X
X
1
0
0
0
0
0
0
1
0
X
X
X
1
0
0
0
0
0
1
1
X
X
X
X
1
0
0
0
1
0
0
X
X
X
X
X
1
0
0
1
0
1
X
X
X
X
X
X
1
0
1
1
0
X
X
X
X
X
X
X
1
1
1
1
• Generic encoders: error flagged if multiple input bits are 1
• Priority encoder allows multiple input bits to be 1
– output set by the input bit with highest priority (i.e., most
significant position), igNORing those with lower priority

## Page 30

Example: Priority Encoder
EE2020 Digital Fundamentals – Prof. Massimo Alioto
30
•
No clever parameterized dataflow Verilog description
•
Dataflow Verilog description of 4-2 priority encoder
•
Use nested conditional operators, starting from

MSB and progressively moving to the LSB
module priorityencoder(C,I);
input [3:0] I;
output [1:0] C;
assign C =
endmodule
I0
I1
I2
I3
C1
C0
1
0
0
0
0
0
X
1
0
0
0
1
X
X
1
0
1
0
X
X
X
1
1
1

    (I[2] ? (2'b10) :
// else, if I[2]=1, C=10, etc.
(I[3]) ? (2'b11) :
// if I[3]=1, C=11
…
…
(I[1] ? (2'b01) : …
(2'b00)) );

## Page 31

Multiplexer
• A multiplexer (MUX) is a combinational circuit element
that selects data from one of 2N inputs and directs it to a
single output, according to an N-bit selection signal
– inputs/outputs can be 1 or M>1 bit wide
– examples with 1-bit inputs/output
I0
I1
In-1
Selection
control
Z
S1
S0
Z
0
0
I0
0
1
I1
1
0
I2
1
1
I3
Condensed truth table
Actual truth table would
have 26 rows corresponding
to I0, I1, I2, I3, S0 and S1
4-input MUX
I0
I1
I3
I2
S1
S0
Z
Functional block diagram
Selection inputs allow one of the
inputs to pass through to the output
EE2020 Digital Fundamentals – Prof. Massimo Alioto
31

## Page 32

Example: 4:1 MUX
• Sometimes include enable

input signal
• M-bit inputs/output:

use M 1-bit MUXes
32
E
S1
S0
I0
I1
I2
I3
Z
0
X
X
X
X
X
X
0
1
0
0
0
X
X
X
0
1
0
0
1
X
X
X
1
1
0
1
X
0
X
X
0
1
0
1
X
1
X
X
1
1
1
0
X
X
0
X
0
1
1
0
X
X
1
X
1
1
1
1
X
X
X
0
0
1
1
1
X
X
X
1
1
𝑍𝑍= 𝐸𝐸⋅𝑆𝑆0 ഥ𝑆𝑆1𝐼𝐼0 + 𝑆𝑆0 ഥ𝑆𝑆1𝐼𝐼1 + 𝑆𝑆0𝑆𝑆1𝐼𝐼2 + 𝑆𝑆0𝑆𝑆1𝐼𝐼3
module mux41(Z,S,I0,I1,I2,I3,E);

parameter M = 16; // 16-bit inputs and outputs
input [M-1:0] I0, I1, I2, I3; // inputs
input [1:0] S; // 2-bit selection signal
input E; // enable
output [M-1:0] Z;
endmodule
EE2020 Digital Fundamentals – Prof. Massimo Alioto
assign Z = E ? (                                                         ) : 0;
S[1] ? (S[0] ? I3 : I2) : (S[0] ? I1 : I0)

## Page 33

Demultiplexer
• A Demultiplexer (DEMUX) connects an input signal to
any of 2N output lines, based on an N-bit selection control
– inputs/outputs can be 1 or M>1 bit wide
– examples with 1-bit inputs/output
Z0
Z1
ZN-1
Selection
control
N-output switch
N-output switch
Z0
Z1
Z3
Z2
S1
S0
D
4-output DEMUX
Functional block diagram
of 4-output demux
D
S1
S0
Z0
Z1
Z2
Z3
0
X
X
0
0
0
0
1
0
0
1
0
0
0
1
0
1
0
1
0
0
1
1
0
0
0
1
0
1
1
1
0
0
0
1
Truth table
Selection
control
EE2020 Digital Fundamentals – Prof. Massimo Alioto
33

## Page 34

Example: 1:4 DEMUX
• Boolean expression of output
34
𝑍𝑍0 = 𝐷𝐷⋅𝑆𝑆0 ⋅ഥ𝑆𝑆1
𝑍𝑍1 = 𝐷𝐷⋅𝑆𝑆0 ⋅ഥ𝑆𝑆1
𝑍𝑍2 = 𝐷𝐷⋅𝑆𝑆0 ⋅𝑆𝑆1
𝑍𝑍3 = 𝐷𝐷⋅𝑆𝑆0 ⋅𝑆𝑆1
module demux41(Z0,Z1,Z2,Z3,S,D);

parameter M = 16; // 16-bit inputs and outputs
input [M-1:0] D; // input
input [1:0] S; // 2-bit selection signal
output [M-1:0] Z0, Z1, Z2, Z3;
assign Z0 = (S == 2'b00) ? D : 1'b0; // zeros extended to other bits of Z0
assign Z1 = (S == 2'b01) ? D : 1'b0; // zeros extended to other bits of Z0
assign Z2 = (S == 2'b10) ? D : 1'b0; // zeros extended to other bits of Z0
assign Z3 = (S == 2'b11) ? D : 1'b0; // zeros extended to other bits of Z0
endmodule
D
S1
S0
Z0
Z1
Z2
Z3
0
X
X
0
0
0
0
1
0
0
1
0
0
0
1
0
1
0
1
0
0
1
1
0
0
0
1
0
1
1
1
0
0
0
1
EE2020 Digital Fundamentals – Prof. Massimo Alioto

## Page 35

Tri-State Logic Elements
• Ordinarily, a digital device has 2 states
– tri-state devices also have high impedance state (Z)
• floating output: the device does not force any voltage
• voltage set by the output of some other device
• if only one device is enabled at a time (all others in Z),
multiple devices can drive the same node without conflicting
• several tri-state logic gates
• example: tri-state buffer with active-high enable
35
D E Y
Functional block diagram
E
D
Y
1
0
0
1
1
1
0
X
Z
Voltage table
 Z = high impedance
EE2020 Digital Fundamentals – Prof. Massimo Alioto

## Page 36

Tri-State Logic Gates: Verilog
EE2020 Digital Fundamentals – Prof. Massimo Alioto
36
•
Dataflow Verilog description of various logic gates
module tristatebuffer(Y,D,E);
input D, E;
output Y;
assign Y = E ? D : 1’bz;
endmodule
tristate buffer with active-high enable
module tristatebuffer(Y,D,E);
input D, E;
output Y;
assign Y = E ? 1’bz : D;
endmodule
tristate buffer with active-low enable
module tristateinv(Y,D,E);
input D, E;
output Y;
assign Y = E ? ~D : 1’bz;
endmodule
tristate inverter with active-high enable
module tristateoinv(Y,D,E);
input D, E;
output Y;
assign Y = E ? 1’bz : ~D;
endmodule
tristate inverter with active-low enable
Can you write the dataflow Verilog description of tristate NAND2 and MUX4:1?

## Page 37

MUXes Based on Tri-State Elements
When Control = 00, tri-state device for A0 is
enabled, others are disabled. Hence A0 is
connected to X0, etc.
Control signals select which input goes to X
⇒ effectively it behaves like a MUX
EE2020 Digital Fundamentals – Prof. Massimo Alioto
37
2-to-4 decoder
A0.H
D0.H
C0.H
B0.H
Control
X0
X1
Device X
Physically
connected, but only
one is enabled
• Tri-state gates with common

output implement MUXes
• Useful to connect several resources to same bus
– avoids expensive point-to-point interconnection
– the enabled resource drives the bus (others in Z may receive)
1
2
3
N
...
BUS
n
n
n
n
n
n
n
n
n
n
1
2
...

## Page 38

38
EE2020 Digital Fundamentals – Prof. Massimo Alioto
Summary
• Introduction to combinational building blocks and their
structural/dataflow Verilog description
• Binary adders
– half adders, full adders, ripple carry adders
• Magnitude comparators
• Decoders, BCD-to-7-segment decoders
• Encoders, Priority encoders
• Multiplexers
• Demultiplexers
• Tri-state logic elements
• Behavioral Verilog description style is also possible: see
next lectures...

## Page 39

39
EE2020 Digital Fundamentals – Prof. Massimo Alioto
Suggestions for Self-Improvement
• In addition to the lecture/tutorials/lab sessions on
Verilog, you may want to read chapter 4 of the textbook

(see IVLE Workbin)
– description of logic functions