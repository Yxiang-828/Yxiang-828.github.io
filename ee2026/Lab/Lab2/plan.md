Matric number: A0299826E

start, so initialisation, show this:

------------------

Starts > 7-seg show based on 2nd rightmost numerical value of matric number (2)

4 anodes, 7 segment, leds



^ from 2nd to 4th entries, all (top horizontal dash, bottom left and right vertical dash of the 7-seg representation of the number 8)

compulsory to use multi bit representation, no more single bit controller

------------

for subtask A (structural modelling), show this:

-------------

use 3rd rightmost numerical value of matric number (8)

== 2-bit parallel adder & 5-bit parallel adder

each of these parallel adders must be made up of multiple 1-bit adders

make use of both parallel adders to create a "single complete n-bit parallel adder" with inputs A and B and output DR

n-bit input A or B, of the complete adder : 7bits

n-bit output DR of the complete adder: 7 bits

module dealing with lsb: no carry in, but theres carry out
module dealing with msb: There's carry in, but no carry out

explain the whole concept first of the things involved in this entire concept, then let me understand the question, then elaborate the question, then explain the concept of the elaborated question again, then do the question in verilog