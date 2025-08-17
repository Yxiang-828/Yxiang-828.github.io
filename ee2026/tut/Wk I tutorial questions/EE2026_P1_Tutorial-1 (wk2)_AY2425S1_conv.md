# PDF Content

## Page 1

### Images and Figures

**Figure 1**: PNG image (Position: 108, 462, Size: 345×108)

*Image content (OCR):*
```
0111 1000 0101 0110 0011 0100 0001 0010 Loftmost 8 bits (78) Loft middle 8 bits (56) right middle 8 bits (34) rightmost 8 bits (12) ```

**Figure 2**: PNG image (Position: 108, 584, Size: 342×108)

*Image content (OCR):* ```
0001 0010 0011 0100 01010110 0111 1000 Loftmost 8 bits (12) Loft middle 8 bits (24) right middle 8 bits (56) rightmost 8 bits (73) ```

1

EE2026 (Part 1) Tutorial 1 - Questions

### Number Systems
 `1. (a) Convert the decimal number 166.34 into binary. (b) Convert the decimal number 1400.16 to hexadecimal. (c) Convert the binary number 101011100.000111 into octal. (d) Convert the hexadecimal number A59.FCE to binary. (e) (62) x - (26) x = (34) x . Identify the radix as represented by x . Verilog : Creating Module, Bit Indexing and Operators`

• In digital systems, binary numbers are often represented in little endian (MSB on left) or big endian (MSB on right). For 32-bit operating systems, information is further encoded in groups of 8-bits (bytes). Write a Verilog module using bit indexing and concatenation operators to convert from big endian to little endian for a 32-bit operating system as shown below. Note that the endianness per byte (within 8 bits) is preserved. Example : Input Signal X in Big Endian : 32’h78563412

**Output Signal Y in Little Endian : 32’h12345678**

**You can try verifying the function of your code here : LINK . (link updated 20 Aug 8pm)**