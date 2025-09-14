# EE2026

## Page 1

EE2026
Digital Design
SEQUENTIAL LOGIC : FLIP-FLOPS
Chua Dingjuan elechuad@nus.edu.sg

## Page 2

Ask Week 5 Questions here…
You can ask questions during the week using
slido here : (Slido remains open for the week)
https://app.sli.do/event/97WjnSxqUbJmcXLZ
JZkBgJ
Or at slido.com + #2026 001
Or the tiny little QR :
Digital Design
Page 2

## Page 3

4
Course Organization (Refer Canvas)
Week
Lab
(E4-03-06 Digital
Electronics Lab)
Lecture
(LT7A / LT6)
Tutorial
WK 1
✓
WK 2
(B01 Friday Session one
week ahead)
✓
Tutorial – 1
WK 3
Lab 1
✓
Tutorial – 2
WK 4
Lab 2
✓
Tutorial – 3
WK 5
✓
Tutorial – 4
WK 6
Lab 3
✓
Tutorial – 5
Mid-Semester Quiz
20 Sept Sat 3pm –
430pm, EA/LT7A
Recess Week
Digital Design

## Page 4

5
Course Organization (Refer Canvas)
Week
Lab
Lecture
Tutorial
WK 7
Project 1
✓
Tutorial – 6
WK 8
Project 2
✓
Tutorial – 7
WK 9
Project 3
✓
Tutorial – 8
WK 10
WK 11
Verilog Evaluation
WK 12
Final Quiz
WK 13
Project Assessment and Demo
No final exam 
Guest Lecture

## Page 5

Contents
Part 1 (Combinational Logic)
◦Number systems + Verilog
◦Boolean Algebra and logic gates + Verilog
◦Gate-level design and minimization + Verilog
◦Combinational logic blocks and design + Verilog
Part 2 (Sequential Logic)
◦Introduction to Sequential Logic - Flip-flops + Verilog
◦Counters + Verilog
◦Combining combinational/sequential building blocks + Verilog
◦Finite State Machine Design + Modeling of FSMs in Verilog
6
Module Lecture Structure
Digital Design

## Page 6

Component
Assessment Weight
Quizzes
Total 40%
o
Mid-Term Quiz
20%
o
Weekly Canvas Quizzes
To id misconceptions / reinforce concepts
MCQ, MRQ, FIB, etc
3 Attempts, Best Score Taken
5%
o
Final Quiz
15%
Labs
Total 30%
o
Lab Assignment 1
3%
o
Lab Assignment 2
5%
o
Lab Assignment 3
10%
o
Verilog Evaluation
12%
Design Project – Team Work
Total 30%
o
Project basic features (specified)
o
Enhanced features (open-ended)
30%
7
Course Assessment
No final exam 
Digital Design

## Page 7

SEQUENTIAL
CIRCUITS - I
©COPYRIGHT CHUA DINGJUAN. ALL RIGHTS RESERVED.

## Page 8

Design a circuit to do this >>
Digital Design
Page 12
When the button is pushed :
1) Turn On the light if it is Off
2) Turn Off the light if it is On
What is missing?
1)
Remembering the previous
state of the bulb MEMORY
2)
Responding to an input EVENT (cf. input value)


## Page 9

Combinational Logic Circuits:
o Outputs depend on current inputs
Sequential Logic Circuits:
o Outputs depend on current and previous inputs Memory!
o Requires separation of previous, current, future : states
o 2 Types of sequential circuits:
Sequential Logic Circuits?
B
C
D
Z
A
Synchronous
Asynchronous
Clocked: need a clock input
Unclocked
Responds to inputs at discrete time
instants governed by a clock input
Responds whenever input
signals change
‘0’
Digital Design
Page 13

## Page 10

SR Flip-flop (FF)
The simplest memory element has two stable states :
Flip-Flop (FF) it can store 1 bit of information
Most basic FF : Set-Reset (SR) Flip-flop / Latch
Digital Design
Page 14
S
R
Q
__
Q
Implemented with NOR / NAND gates
S
R
Output
Q+
0
0
0
1
1
0
1
1
0 0 is the rest state

## Page 11

SR Flip-flop (FF)
Digital Design
Page 15
S
R
Output Q
0
0
0
1
1
0
1
1
S
R
Q
__
Q
A
B
NOR

NOR Implementation

## Page 12

SR Flip-flop (FF)
Digital Design
Page 16
S
R
Output Q
0
0
0
1
1
0
1
1
S
R
Q
__
Q
A
B
NOR

NOR Implementation

## Page 13

SR Flip-flop (FF)
The simplest memory element has two stable states :
Flip-Flop (FF) it can store 1 bit of information
Most basic FF : Set-Reset (SR) Flip-flop / Latch
Digital Design
Page 22
S
R
Output
Q+
0
0
Hold
Q
0
1
Clear
0
1
0
Set
1
1
1
Invalid
Invalid
0 0 is the rest state
S
R
Q
__
Q

Implemented with NOR / NAND gates

## Page 14

S = 0
SR Flip-flop (FF)
o FF can record and store transient events.
o Switching is not instantaneous propagation delays
Digital Design
Page 24
1) Assume that the rest state is:
S = R = 0; let Q = 0, Q = 1
S
R
Output
0
0
Hold
0
1
Clear
1
0
Set
1
1
Invalid
0 0 is the rest state
2) If S→
while R = 0 ⇒Q = 1, Q = 0,
i.e., the event (S going high) is recorded
and stored as Q = 1.
R = 0
Q = 0
S
Q
_
Q
0
1
0
_
Q = 1
1
0
Assume R=0 :

## Page 15

A Simple Application…
Digital Design
o Mechanical switches bounce before settling down
which may cause problems as inputs.
o Switch debouncing is a common use of S-R FFs.
close
(bounce)
open
(bounce)
Vcc
on
S    Q        Debounced
_         Signal
off
R    Q
VCC
(a) Output of typical mechanical switch
(b) Debounced switch output signal
S
R
Output
0
0
Hold
0
1
Clear
1
0
Set
1
1
Invalid
0 0 is the rest state
Page 28

## Page 16

A Simple Application…
Digital Design
VCC

close
(bounce)
Vcc
on
S    Q        Debounced
_         Signal
off
R    Q
S
R
Output
0
0
Hold
0
1
Clear
1
0
Set
1
1
Invalid
0 0 is the rest state
S
R=0
Q
Page 30

## Page 17

The JK FF is a synchronous circuit:
JK Flip Flop
The JK FF is based on SR with 2 improvements : _____ & ______
Digital Design
Page 32
J
K
Q
_
Q
CLK
J
K
Q+
↑
0
0
Q
↑
0
1
0
↑
1
0
1
↑
1
1
ഥ𝐐𝐐
o Clock input is a controlling input.
It specifies when circuit read inputs / change outputs.
o Synchronous circuits respond only at the ______ clock edges
i.e., LOW →HIGH, HIGH →LOW transitions
o At any other time, changing inputs have no effect on the output.
rising
falling
edge
edge
CLK
J
K
Q
Q+
↑
0
0
0
0
↑
0
0
1
1
↑
0
1
0
0
↑
0
1
1
0
↑
1
0
0
1
↑
1
0
1
1
↑
1
1
0
1
↑
1
1
1
0
Hold
Clear
Set
Toggle
characteristic table
condensed characteristic table


## Page 18

1
J
0
1
K
0
1
hold                  clear                  hold                  set                     toggle
Q/Q+
0
tpHL
tpLH
Respond @ Active Clock Edges
Digital Design
Page 33
o When inputs don’t change FF outputs don’t change.
o If inputs change FF output changes state only at active clock edge.
Ti
Ti+1
Ti+2
Ti+3
Ti+4
Ti+5
CLK
tsetup
?

## Page 19

tsetup :
minimum time before the active clock
edge by which FF inputs must be stable.
thold:
minimum time inputs must be stable after
active clock edge
tpHL :
time taken for FF output to change state
from High to Low.
tpLH :
time taken for FF output to change state
from Low to High.
FF Timing Parameters
Digital Design
Page 34
clock
tsetup
thold
What happens if inputs change state right at the active clock transition?
Answer: output is _________________
Thus, input changes must meet required setup & hold times of device
== Operating Speed of device
http://www.ti.com/product/SN74LS107A

## Page 20

J                Q
K                _
Q
CLR
PR
J              Q
K              _
Q
CLR
Commercially Available JK FFs
Digital Design
Page 38
74’107 with asynchronous clear
CLK
PR
CLR
J
K
Q+
X
L
H
X
X
H
X
H
L
X
X
L
X
L
L
X
X
not allowed
↓
H
H
L
L
Q
↓
H
H
L
H
L
↓
H
H
H
L
H
↓
H
H
H
H
ഥQ
74’109 with direct set & direct clear
CLK CLR
J
K
Q+
X
L
X
X
L
↓
H
L
L
Q
↓
H
L
H
L
↓
H
H
L
H
↓
H
H
H
74’107
74’109

## Page 21

D         Q
_
EN       Q
Other Flip-Flops…
Digital Design
Page 39
D         Q
_
Q
D Flip-Flop
CLK
D
Q+
↑
0
0
↑
1
1
T          Q
_
Q
T Flip-Flop
CLK
T
Q+
↑
0
Q
↑
1
ഥ𝐐𝐐
J           Q
K
_
Q
T
CLK
A T Flip-flop made
from a J-K Flip-flop
CLK
J
K
Q+
↑
0
0
Q
↑
0
1
0
↑
1
0
1
↑
1
1
ഥ𝐐𝐐
Since T Flip-flops are easy to construct from other FFs, they are not often
used commercially.
D Latch
EN
D
Q+
0
X
No change
1
0
0
1
1
1

## Page 22

Verilog for
Sequential Logic
Page 40

## Page 23

In previous labs and lectures…
o module
o wire (net) , reg
o Logic gates (~, &, |, ^ )
o Operators : +, -, ? :, { }
o Dataflow
o Continuous Assignments : assign
o Behavioural
o Procedural Assignments : always @ (*)
o
o Structural modeling
Blocking (=) and Non-Blocking (<=)
Digital Design
Page 41

## Page 24

CLK
D
Q+
↑
0
0
↑
1
1
Verilog Time! – D-FF
Digital Design
Page 42
D
Q
CLK
D
Q

## Page 25

CLK
D
Q+
↑
0
0
↑
1
1
Verilog Time! – D-FF
Digital Design
Page 44
D
Q
module dff (
input d, clk,
output reg q);
endmodule
always @ (posedge __)
always @ (negedge __)
always @ (posedge clk)
begin
q = d;
end
↑
↑
Conceptually, the always block runs
once when sensitivity list changes value.
posedge captures the 0 1 change in clk.
Anything assigned in an always block
must be declared as type reg
If posedge / negedge is used in the
sensitivity list, ALL signals must be used
with posedge / negedge.

## Page 26

Blocking & Non-blocking
Digital Design
Verilog supports two types of assignments within
= blocking assignment
o Sequential evaluation
o Immediate assignment
<= non-blocking asignment
o Sequential evaluation
o Deferred assignment
always
always @ (*)
begin
x = y;
z = ~x;
end
always @ (*)
begin
x <= y;
z <= ~x;
end
1) Evaluate y, assign result to x
2) Evaluate ~x, assign result to z
1) Evaluate y, defer assignment
2) Evaluate ~x, defer assignment
3) Assign x and z with new values
Page 45
Behaviour
x
y
z
Initial Condition
0
0
1
y changes
x = y
z = ~x
Behaviour
x
y
z
Deferred
Initial Condition
0
0
1
y changes
x <= y
z <= ~x
Assignment

## Page 27

Example
Digital Design
module example(input [2:0] A,
output reg [2:0] V, Z, W);
always @ (A)
begin
V = A | 3’b001;
Z <= V | 3’b100;
W = Z;
end
endmodule
Behaviour
A
V
Z
W
Deferred
Initial Condition
000
001
101
000
A changes
010
001
101
000
Stmt 1
010
101
000
Stmt 2
010
011
000
Stmt 3
010
011
101
Assignment
An event occurs on A at simulation time :
o Stmt 1 is executed and V is assigned immediately
o Stmt 2 is executed and defer assignment to Z
o Stmt 3 is executed using old value of Z.
o Z is assigned.
Page 47

## Page 28

CLK
D
Q+
↑
0
0
↑
1
1
Verilog Time! – D-FF
Page 49
D
Q
module dff (
input d, clk,
output reg q);
endmodule
always @ (posedge __)
always @ (negedge __)
always @ (posedge clk)
begin
end
↑
↑
q <= d;       or       q = d;
Digital Design

## Page 29

Two D Flip-Flops…
Page 51
D         Q
_
Q
D         Q
_
Q
‘1’
Behaviour
q1
q2
Reset FFs
0
0
@ 1st rising edge
@ 2nd rising edge
Q1
Q2
D1
clk
1     0
1     1
CLK
D
Q+
↑
0
0
↑
1
1
CLK
Q1
Q2
Behaviour
Q1
Q2
0
0
After 1st rising edge
After 2nd rising edge
Assume initial outputs of FFs is ‘0’
and D1 is ‘1’.
Digital Design

## Page 30

Two D Flip-Flops… and Verilog!
Page 52
D         Q
_
Q
D         Q
_
Q
‘1’
Behaviour
Q1
Q2
0
0
After 1st rising edge
After 2nd rising edge
always @ (posedge clk)
begin
q1 = d1;
q2 = q1;
end
always @ (posedge clk)
begin
q1 <= d1;
q2 <= q1;
end
Q1
Q2
D1
Behaviour
Q1
Q2
0
0
After 1st rising edge
After 2nd rising edge
Behaviour
Q1
Q2
0
0
After 1st rising edge
After 2nd rising edge
clk
1     0
1     1
Digital Design

## Page 31

Discussion Example 1
Digital Design
Page 54
always @ (posedge clk)
begin
q1 = d1;
q2 = q1;
end
always @ (posedge clk)
begin
q1 <= d1;
q2 <= q1;
end

## Page 32

Discussion Example 1
Digital Design
Page 56
module ff(input clk,
d1,d2, output reg q1);
always @ (posedge clk)
begin
q1 <= d1;
end
always @ (posedge clk)
begin
q1 <= d2;
end
endmodule

## Page 33

Basic Guidelines…
#1: When modeling sequential logic, use nonblocking
assignments.
#2: When modeling simple combinational logic, use
continuous assignments (assign).
#3: When modeling complex combinational logic, use
blocking assignments in an always block.
#3: When modeling both sequential and combinational logic
within the same always block, use nonblocking assignments.
#4: Do not mix blocking and nonblocking assignments in the
same always block.
#5: Do not make assignments to the same variable from
more than one always block.
Digital Design
Page 60

## Page 34

Discussion Example
Digital Design
Page 61
CLK
Q
Q
Given the circuit diagram below, complete the timing diagram below by filling in Q
and Q. Assume that the initial value of Q is ‘0’ and include all propagation delays.
D
Q
Q
CLK

## Page 35

Summary
o SR Flip Flop & Applications
o JK Flip Flop
o FF Timing Parameters
o Commercial JK Flip Flops
o Verilog description of D Flip Flop
o Blocking and Non-blocking procedural
assignments
o Modeling of multiple D Flip-flops
Digital Design
Page 62

## Page 36

FFs on Artix-7
FPGA
Page 63

## Page 37

module dff1 (input d,clk,
output reg q);
always @ (posedge clk)
begin
q <= d;
end
endmodule
Page 64
D         Q
Q
D
clk
Vivado RTL Schematic
Verilog Code
D Flip-Flop with Clock Enable and Synchronous Reset
https://docs.xilinx.com/r/2021.2-English/ug953-vivado-7series-libraries/FDRE
D Flip-Flop… in Vivado?
Vivado Synthesized Schematic
Digital Design

## Page 38

FDXX Primitives in 7series FPGA
Page 65
D Flip-Flop with Clock Enable and
Asynchronous Clear
D Flip-Flop with Clock Enable and
Asynchronous Preset
D Flip-Flop with Clock Enable and
Synchronous Reset
D Flip-Flop with Clock Enable and
Synchronous Set
Digital Design

## Page 39

Try this!
assign is used for
ο
In continuous assignments,
the code is executed
ο
The code in the always
block is executed when
ο
always is used for
ο
<= is a
ο
endmodule Is always
paired with
ο
The sensitivity list follows
the
ο
Code in always block is
executed
ο
ο
always @.
ο
when any RHS signal
changes
ο
module
ο
sequentially.
ο
non-blocking procedural
assignment.
ο
continuous assignments.
ο
procedural assignments.
ο
a signal in the sensitivity
list changes.
Digital Design
Page 66