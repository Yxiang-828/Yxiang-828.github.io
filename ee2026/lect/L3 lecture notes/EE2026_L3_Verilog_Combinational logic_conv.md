# EE2026

## Page 1

EE2026
Digital Design
COMBINATIONAL LOGIC IN Verilog
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
Combinational vs. sequential logic circuits
•
Review of code snippets and common errors
•
Continuous assignment
•
Procedural assignment
•
Equivalence of continuous and procedural assignment
•
Structural design
•
Testbenches
Page 2

## Page 3

EE2026 Digital Design

Prof. Massimo Alioto
Combinational vs. Sequential Logic
•
Any digital system partitioned into combinational and sequential logic
Page 3
𝑂𝑂𝑂𝑂𝑂𝑂𝑡𝑡𝑖𝑖= 𝐹𝐹𝐼𝐼𝐼𝐼𝑡𝑡𝑖𝑖
OUT
(with delay)
combinational
block
OUT
IN m
n
multi-bit (vector, bus)
•
Combinational logic
◦
Output at given time depends only on inputs at same time (apart from gate delays)
◦
No memory
A
B
OUT
A
B
OUT
(zero delay)
t
timing diagram
•
Sequential logic
◦
Output at given time depends on inputs at same time and past inputs
◦
Includes some form of memory elements (e.g., flip-flops, registers, memory)
sequential
block
OUT
IN m
n
𝑂𝑂𝑂𝑂𝑂𝑂𝑡𝑡𝑖𝑖= 𝐹𝐹𝐼𝐼𝐼𝐼𝑡𝑡𝑖𝑖, 𝐼𝐼𝐼𝐼𝑡𝑡𝑖𝑖−1 …

## Page 4

EE2026 Digital Design

Prof. Massimo Alioto
Review of Code Snippets and Common Errors
Page 4
module box( input  a, b,

input  [1:0] c,

output [3:0] y );
wire tmp;
reg [1:0] one = 3;
reg two;
integer three = 1;
assign y[3] = one[0];
assign y[2:1] = a + c;
assign y[0] = ( a > b );
endmodule
Net / Variable
Name
Number
of bits?
Value in
dec / bin
a
1
1  / 1’b1
b
1
0 / 1’b0
c
2
2 / 2’b10
tmp
1
Z / 1’bZ
one
2
3 / 2’b11
two
1
X / 1’bX
three
32
1 / 32’h00000001
y
4
15 / 4’b1111
Gate
Symbol
Function
(F)
Verilog
Operator
Gate
Symbol
Function
(F)
Verilog
Operator
AND
𝐴𝐴• 𝐵𝐵
F = A & B
NOT
'𝐴𝐴
F = ~A
OR
𝐴𝐴+ 𝐵𝐵
F = A | B
XOR
𝐴𝐴⊕𝐵𝐵
F = A ^ B
A
B
F
A
B
F
Verilog level of
abstraction
gate level of
abstraction
assign F =  ~w & ~x & z | ~w & x & z | w & y & z | x & y & z;
Boolean level of
abstraction

## Page 5

EE2026 Digital Design

Prof. Massimo Alioto
Review of Code Snippets and Common Errors
Page 5
module notgood
(…)

  reg z;
  assign z = a | b;
endmodule
Assign statements are used only for wire or net types
→ error states that <z> signal should be a net type

## Page 6

EE2026 Digital Design

Prof. Massimo Alioto
Review of Code Snippets and Common Errors
Page 6
module notgood(….);
(…)
   assign x = a | b;
   assign x = a + b;
endmodule
There are two conflicting instructions (multi-driven net)
Signal x is connected to TWO “drivers”
→  Multiple Driver Nets error will occur

## Page 7

EE2026 Digital Design

Prof. Massimo Alioto
Continuous Assignment
Page 7
A
B
D
Z
C
P
Q
R
order?
module bigbox (input a, b, c, d,

     output z);
wire p, q, r;
assign z = p ^ q ^ r;
assign q = ~c;
assign p = a & b;
assign r = ~(c | d);
endmodule
internal connections
1
2
3
4
0
∆
0
1
B
P
Z
1
∆
0
1
•
assign statements are used to model combinational logic
◦
Whenever there is an event on the RHS signal, expression is evaluated and assigned
(after ∆ delay) → continuously updated (assigned)
◦
Multiple statements executed concurrently (in parallel)
◦
wire used to represent an internal (physical) connection
irrelevant

## Page 8

EE2026 Digital Design

Prof. Massimo Alioto
Continuous Assignment
Page 8
A
B
D
Z
C
P
Q
R
•
assign statements can also be merged arbitrarily
◦
Concurrently anyway, no sequence whatsoever
module bigbox (input a, b, c, d,

     output z);
assign Z = (a & b) ^ ~c ^ ~(c | d);
endmodule

## Page 9

EE2026 Digital Design

Prof. Massimo Alioto
Useful Operators
Page 9
•
Boolean (bit-wise), logical, arithmetic, concatenation
◦
Use brackets for readability, use only synthesizable statements (apart from
testbenches)
Operator
Description
Examples: a = 4’b1010, b=4’b0000
!, ~
Logical negation, Bit-wise NOT
!a =   ,    !b =     , ~a=4’b          , ~b=4’b
&, |, ^
Reduction (merges all bits)
&a =  ,   |a=  ,   ^a =
{__,__}
Concatenation
{b, a} = 8’b
{n{___}}
Replication
{2 {a} } = 8’b
*, /, %,
Multiply, *Divide, *Modulus
3 % 2 = 1,    16 % 4 = 0
+, -
Binary addition, subtraction
a + b = 4’b1010
<< , >>
Shift Zeros in Left / Right
a << 1 =  4b’         ,   a >> 2 = 4’b
<, <=, >, >=
Logical Relative (1-bit output)
(a > b) =
==, !=
Logical Equality (1-bit output)
(a == b)=                   (a != b)=
&, ^, |
Bit-wise AND, XOR, OR
a&b =                         a|b =
&&, ||
Logical AND, OR (1-bit output)
a&&b =                      a||b =
?:
Conditional Operator
<out> = <condition> ? If_ONE : if_ZERO
high
low
precedence
<< towards MSB (0s inserted)
>> towards LSB (0s inserted)
(independent of index order)
if all bits=0 (“false
vector”) → 1
0 otherwise
vector 00…0
equivalent to 0
(1 otherwise)

## Page 10

EE2026 Digital Design

Prof. Massimo Alioto
Useful Operators
Page 10
•
Boolean (bit-wise), logical, arithmetic, concatenation
◦
Use brackets for readability, use only synthesizable statements (apart from
testbenches)
Operator
Description
Examples: a = 4’b1010, b=4’b0000
!, ~
Logical negation, Bit-wise NOT
!a = 0,    !b = 1, ~a = 4’b0101, ~b = 4’b1111
&, |, ^
Reduction (merges all bits)
&a = 0,  |a=1,  ^a = 0
{__,__}
Concatenation
{b, a} = 8’b00001010
{n{___}}
Replication
{2 {a} } = 8’b10101010
*, /, %,
Multiply, *Divide, *Modulus
3 % 2 = 1,    16 % 4 = 0
+, -
Binary addition, subtraction
a + b = 4’b1010
<< , >>
Shift Zeros in Left / Right
a << 1 = 4’b0100,   a >> 2 = 4’b0010
<, <=, >, >=
Logical Relative (1-bit output)
(a > b) = 1
==, !=
Logical Equality (1-bit output)
(a == b)=  0               (a != b)= 1
&, ^, |
Bit-wise AND, XOR, OR
a&b = 4’b0000         a|b = 4’b1010
&&, ||
Logical AND, OR (1-bit output)
a&&b = 0                   a||b = 1
?:
Conditional Operator
<out> = <condition> ? If_ONE : if_ZERO
high
low
precedence

## Page 11

EE2026 Digital Design

Prof. Massimo Alioto
Conditional Operator
Page 11
•
The ?: conditional operator allows to select the output from a set of
inputs based on a condition
module mystery ( input s, input [1:0] d,

      output y);
assign y = s ? d[1] : d[0];
endmodule
d[1]
d[0]
s
y
•
This expression is evaluated whenever there is an event on any input
◦
Continuous assignment
<output> = <condition> ? If_ONE : If_ZERO
s= 1  y = d[1],
s= 0  y= d[0]
•
What is this block?
2:1 multiplexer (MUX, see next week)
MUX
d[0]
d[1]
s
y

## Page 12

EE2026 Digital Design

Prof. Massimo Alioto
Procedural Assignment: always @
Page 12
•
Behavioral (higher-level description of logic)
◦
Two assignment types: blocking vs. non-blocking
MUX
d[0]
d[1]
s
y
module mux21( input s, input [1:0] d,

   output reg y);
endmodule
always @ (s, d)
begin

if (s == 1’b0)

y = d[0];

else

y = d[1];
end
conceptually, the always block runs once when
any signal in sensitivity list (s,d) changes value
statements executed sequentially & evaluated
instantaneously → order matters!
begin and end behave like
parentheses/brackets for conditional statements.
anything assigned in an always block must be declared as type reg
y = d;
expresses combinational logic
y <= d;
expresses sequential logic (see later)

## Page 13

EE2026 Digital Design

Prof. Massimo Alioto
Procedural Assignment: always @
Page 13
•
 always@(*) for combinational logic
◦
Sensitivity list must include all input signals that are read in current block
◦
otherwise, no longer combinational: memory is inferred (see part II)
◦
All outputs always explicitly assigned for any input value (including z, x…)
◦
otherwise, no longer combinational: latch is inferred (see part II)
•
Statements within always block are executed sequentially
◦
But irrelevant with blocking assignments/combinational logic (see later for non-blocking)
always @ (…)
begin
…
end
always @ (…)
begin
…
end
(…)
•
Multiple always blocks run concurrently (like continuous assignment)
•
No assign in always blocks

## Page 14

EE2026 Digital Design

Prof. Massimo Alioto
Review of Code Snippets and Common Errors
Page 14
module notgood(….);
   always @ (*)
     y = y + 1;
  always @ (*)
     y = y + 3;
endmodule
There are two conflicting instructions:
•
first instruction would be to
increment y by 1
•
second would be to increment y by 3
Another case of multi-driven net (here
with multiple procedural blocks)

## Page 15

EE2026 Digital Design

Prof. Massimo Alioto
Control-Flow Statements: Conditional
Page 15
•
Conditional statements: computations executed depending on
conditions/value of variables
◦
Always within procedural block (always @)
if ( expr )
   statement;
if ( expr )
   statement;
else
   statement;
if ( expr )
   statement;
else if ( expr )
   statement;
else if ( expr )
   statement;
else
   statement;
If - else if - else
•
 if, if-else and else-if
◦
If expression evaluates to true → execute statement(s)
◦
Otherwise, do not (or else…)
•
Nested if-else
◦
Entails sense of priority
◦
Use it if intended
if (cond1)

signal_name<=value1;

else if (cond2)
signal_name<=value2;

else if (cond3)
signal_name<=value3;

…

else

signal_name<=defaultvalue;
Nested if-else
signal_name <= cond1*value1+not(cond1)*cond2*value2+...
not(cond1)*not(cond2)*...*defaultvalue
synthesis
◦
If not, redundant logic is generated
◦
unless conditions are mathematically

guaranteed to be mutually exclusive

## Page 16

EE2026 Digital Design

Prof. Massimo Alioto
Control-Flow Statements: Conditional
Page 16
•
Conditional statements: computations executed depending on
conditions/value of variables
◦
Always within procedural block (always @)
•
 case compares expression with each case item
◦
If none match,  the default statement is executed
◦
Default clause: unknown/unspecified values, shortens notation
signal_name <= cond1*value1+cond2*value2+ ... condn*valuen
synthesis
◦
No redundant logic is generated
case ( expr )

   value1 : statement;
   value2 : statement;
   value3 : statement;
   ...
   default : statement;
endcase
case
•
No priority implied (mutually exclusive values)
◦
logic checks only if expression

matches one case item
case (an-1...a0)
item1: value1;
item2: value2;
...
itemn: valuen;
endcase

## Page 17

EE2026 Digital Design

Prof. Massimo Alioto
Equivalence of Procedural and Continuous Assign.
Page 17
module mux ( input s, input [1:0] d, output y);
assign y = s ? d[1] : d[0];
endmodule
MUX
d[0]
d[1]
s
y
module mux21( input s, input [1:0] d, output reg y);
always @ (s, d)
begin

if (s == 1’b0)

y = d[0];

else

y = d[1];
end
endmodule

## Page 18

EE2026 Digital Design

Prof. Massimo Alioto
Equivalence of Procedural and Continuous Assign.
Page 18
module bigbox
(input a,b,c,d, output z);
wire p, q, r;
assign q = ~c;
assign z = p ^ q ^ r;
assign p = a & b;
assign r = ~(c | d);
endmodule
module bigbox
(input a,b,c,d, output ___ z);
always @ (
)

begin

end
endmodule
a, b, c, d
reg
reg p,q,r;
A
B
D
Z
C

q = ~c;

p = a & b;

r = ~(c | d);

z = p ^ q ^ r;
P
Q
R

## Page 19

EE2026 Digital Design

Prof. Massimo Alioto
Structural Modeling
Page 19
•
Structural modeling connects modules and gates
◦
Practice with equivalent dataflow and structural description styles
A
B
D
Z
C
module bigbox (input a,b,c,d, output z);
   assign z = (a & b) ^ ~c ^ ~(c | d) ;
endmodule
Dataflow
module bigbox (input a,b,c,d, output z);
wire p, q, r;
endmodule
Structural (using primitives)
P
Q
R
and u1 (p, a, b); //output, then inputs
not u2 (q, c);
NOR u3 (r, c, d);
XOR u4 (z, p, q, r);

## Page 20

EE2026 Digital Design

Prof. Massimo Alioto
Structural Modeling
Page 20
◦
Examples: 2:1 MUX and 4:1 MUX
module mux41( input [1:0] s,
              input [3:0] d,
              output y);
… … … ?
endmodule
module mux21( input s,

   input [1:0] d,
              output y);
  assign y = s ? d[1] : d[0];

endmodule
mux21
d[1]
d[0]
s
y
mux41
d[1]
d[0]
s[1]
y
d[3]
d[2]
s[0]

## Page 21

EE2026 Digital Design

Prof. Massimo Alioto
Structural Modeling
Page 21
◦
4:1 multiplexer can also be implemented by combining several 2-to-1 multiplexers
mux21
d[1]
d[0]
s
y
d[3]
d[2]
d[1]
d[0]
mux21
d[1]
d[0]
s
y
s[0]
s[0]
mux21
d[1]
d[0]
s
y
y
s[1]
mux41
d[1]
d[0]
s[1]
y
d[3]
d[2]
s[0]

## Page 22

EE2026 Digital Design

Prof. Massimo Alioto
Structural Modeling
Page 22
◦
4:1 multiplexer can also be implemented by combining several 2-to-1 multiplexers
module mux41( input [1:0] s,
              input [3:0] d,
              output y);
endmodule
module mux21( input s, input [1:0] d,
              output y);
   assign y = s ? d[1] : d[0];
endmodule
wire out1, out2;
//check for port order!
mux21 u1 (s[0], d[3:2], out1);
mux21 u2 (                    );
mux21 u3 (
);
Port Connection by Position
mux21
d[1]
d[0]
s
y
mux21
d[1]
d[0]
s
y
d[3]
d[2]
d[1]
d[0]
s[0]
y
s[1]
mux21
out1
out2
mux21
d[1]
d[0]
s
y

## Page 23

EE2026 Digital Design

Prof. Massimo Alioto
module mux41( input [1:0] s,
              input [3:0] d,
              output y);
endmodule
module mux21( input s, input [1:0] d,
              output y);
   assign y = s ? d[1] : d[0];
endmodule
wire out1, out2;
//check for port order!
mux21 u1 (s[0], d[3:2], out1);
mux21 u2 (                    );
mux21 u3 (
);
Port Connection by Position
mux21
Structural Modeling
Page 23
◦
4:1 multiplexer can also be implemented by combining several 2-to-1 multiplexers
mux21
d[1]
d[0]
s
y
mux21
d[1]
d[0]
s
y
d[3]
d[2]
d[1]
d[0]
s[0]
y
s[1]
out1
out2
mux21
d[1]
d[0]
s
y
s[1], {out1, out2}, y
s[0], d[1:0], out2

## Page 24

EE2026 Digital Design

Prof. Massimo Alioto
Structural Modeling
Page 24
◦
4:1 multiplexer can also be implemented by combining several 2-to-1 multiplexers
module mux41( input [1:0] s,
              input [3:0] d,
              output y);
wire out1, out2;
mux21 u1 (.s ( s[0]),
          .d ( d[3:2] ),
          .y ( out1 ) );
mux21 u2 (.s ( s[0]),
          .d ( d[1:0] ),
          .y ( out2) );
mux21 u3 (.s ( s[1]),
          .d ( {out1, out2} ),
          .y ( y ) );
endmodule
Port Connection by Name

## Page 25

EE2026 Digital Design

Prof. Massimo Alioto
Structural Modeling
Page 25
◦
 For modular designs, the top view is specified as interconnected blocks
◦
these examples demonstrate port connection by position / name.
module mymodule (input a, b, output x);
...
endmodule
module yourmodule (input c, d, output z);
…
endmodule
module ourmodule (input sw1, sw2,

   output led1, led2);
mymodule M1 (sw1, sw2, led1);
yourmodule M2 (sw1, sw2, led2);
endmodule
module ourmodule (input sw1, sw2,

   output led1, led2);
mymodule M1 ( .a (sw1),

.b (sw2),

.x (led1) );
yourmodule M2( .z(led2),

.c (sw1),

.d(sw2) );
endmodule
mymodule
yourmodule
a
b
x
c
d
z
sw1
sw2
led1
led2
ourmodule
Port Connection by Position
Port Connection by Name

## Page 26

EE2026 Digital Design

Prof. Massimo Alioto
Logic Simulations
Page 26
How do we know our design actually works?
o Functional Simulation
(Verification)
Verilog Code
module
………. ……….
………. ……….
endmodule
Test Bench
call module
a1=9;
b1=1;
//wait for 10u
#10
b1=0;
a1
z1
save
the
world
.v
a2
z2
module savetheworld (input a1, … z1,

output a2, …,z2);

………. ………. ………. ………. ……….

………. ………. ………. ………. ……….

………. ………. ………. ………. ……….
endmodule
0
b1
b2
z2
10 20 30
t/µs
Method
o Designer applies input values to the code
o Simulator produces corresponding outputs in truth tables /
timing diagrams
o Simulators usually assume negligible propagation gate delays.

## Page 27

EE2026 Digital Design

Prof. Massimo Alioto
Testbench Example
Page 27
module mux21( input s,

   input [1:0] d,
              output y);
  assign y = s ? d[1] : d[0];
endmodule
module mux_test();
endmodule
s
mux21
d[1]
d[0]
y
mux21
d[1]
d[0]
s
y
mux_test
ip
sel
op
(sel, ip, op);
2’b10
1’b0
reg [1:0] ip = 0;
reg sel = 0;
wire op;
mux21 dut
initial begin
   ip = 2’b10;
   sel = 1’b0;
   #10; //wait 10 time units
end