# EE2026 (Part 1)

## Page 1

EE2026 (Part 1)
Tutorial 4 - Questions
Boolean Algebra and Minimization
1.
A switching circuit has four inputs as shown. A and B represent the MSB
and LSB bits of a binary number N1. C and D represent the MSB and LSB bits of
a binary number N2. The output is to be 1 only if the product N1 x N2 is less than
or equal to 2.
(a) Write the truth table for the system.
(b) Write the canonical SOP and POS expressions for F.
(c) Draw a Karnaugh-map (K-map) for the function F.
(d) From the K-map, derive the MSOP expression for F.
A
B
C
D
F
{
{
N2
N1
2.
A bank vault has three locks with a different key for each lock. Each key is owned
by a different person. To open the door, at least two people must insert their keys
into the assigned locks. The signal lines A, B and C are 1 if there is a key inserted
into lock 1, 2 or 3, respectively. Write an equation for the variable Z which is 1 if
and only if the door should open.
(a) Write the truth table for the system.
(b) Write the canonical SOP and POS expressions for Z.
(c) Draw a Karnaugh-map (K-map) for the function Z.
(d) From the K-map, derive the MSOP expression for Z.
3.
Use K-maps to obtain an MSOP and an MPOS for each of the following
functions:
(a) Z = ABCD + ABCD + ABCD + ABCD + ABCD with don’t care for ABCD
= 1010
(b) Z = (A + B + C )(A + B + C ) with don’t cares for ABC = 111 and 110
(c) f (x1,... , x4 ) = ∑m(0, 4, 5, 6, 7) + D(1, 12, 13, 14, 15) , where m( ) is the set
of minterms for which f = 1 and D( ) is the set of don’t cares. For example,
m(2) is the minterm corresponding to     x1 x2 x3 x4 = 0010 (this alternate shorthand

notation is often used to express SOPs).
4.
A combinational circuit has four inputs A, B, C and D and one output Z. The
output is asserted whenever three or more of the inputs are asserted, otherwise the
output is de-asserted. Find an MSOP expression for Z. Design the
combinational circuit using only inverters, 2-input NAND gates and 3-input
NAND gates. Assume that A, B and Z are active high signals, while C and D are
active low signals. Use alternate gate representations for clarity of circuit
diagrams. Calculate the critical path delay.