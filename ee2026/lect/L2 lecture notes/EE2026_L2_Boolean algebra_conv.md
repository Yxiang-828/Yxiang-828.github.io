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

BOOLEAN ALGEBRA Massimo ALIOTO Dept of Electrical and Computer Engineering Email: massimo.alioto@nus.edu.sg

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

• Definitions and postulates • Theorems • Boolean functions and truth table • Boolean function simplification using algebra manipulation

### Page 2

## Page 3

EE2026 Digital Design Prof. Massimo Alioto

### Boolean Algebra
 `• Developed as formal algebraic system in 1854 by George Boole(English mathematician, philosopher, and logician) ◦ Huntington formulated the postulates in1904 as formal definition ◦ Boolean Algebra is the mathematical foundation for digital system design, including computers ◦ First applied by C.E Shannon(MIT) to the practical problem of analyzing networks of relays (switches) ◦ Useful for control and logic systems`

### Page 3
 `• Boolean algebra is ultimately described by ◦ a set of elements B = {0,1} (binary symbols) ◦ operator ഥ … (NOT) on single operand ◦ operators ∙ (AND), + (OR) on multiple operands`

binary constants or variables (as in common algebra)

⋅ has precedence over +

## Page 4

EE2026 Digital Design Prof. Massimo Alioto
 `2. Neutral elements of + and ⋅ ◦ There exists a 0 and 1 element in B, such that ◦ 𝑥𝑥+ 0 = 𝑥𝑥 ◦ 𝑥𝑥⋅1 = 𝑥𝑥`

### Boolean Algebra

• Huntington postulates as foundation of Boolean algebra ◦ General algebraic structure based on axioms (rules), leading to more practical set- theoretic definition (operations are a consequence of postulates)

### Page 4

### 0 is neutral elements for + 1 is neutral elements for ⋅
 `1. Closure ◦ ∀𝑥𝑥, 𝑦𝑦 ∈𝐵𝐵 , 𝑥𝑥+ 𝑦𝑦∈𝐵𝐵 (outcome of operation is still in B, obviously) ◦ ∀𝑥𝑥, 𝑦𝑦 ∈𝐵𝐵 , 𝑥𝑥⋅𝑦𝑦∈𝐵𝐵 (outcome of operation is still in B, obviously)`

### 3. Commutative Law
 `◦ 𝑥𝑥+ 𝑦𝑦 = 𝑦𝑦+ 𝑥𝑥 ◦ 𝑥𝑥⋅𝑦𝑦 = 𝑦𝑦⋅𝑥𝑥`

## Page 5

EE2026 Digital Design Prof. Massimo Alioto
 `5. Complement ◦ ∀𝑥𝑥∈𝐵𝐵 , there exists an element ̅𝑥𝑥∈𝐵𝐵 (complement of 𝑥𝑥 ) such that ◦ 𝑥𝑥+ ̅𝑥𝑥 = 1 ◦ 𝑥𝑥⋅̅𝑥𝑥 = 0`

### Boolean Algebra

### Page 5
 `4. Distributive Law ◦ 𝑥𝑥⋅𝑦𝑦+ 𝑧𝑧 = 𝑥𝑥⋅𝑦𝑦+ 𝑥𝑥⋅𝑧𝑧 ( ⋅ over + , easy to remember)`

• There exist at least two distinct elements in the set 𝐵𝐵 (obvious, it was introduced for more general algebras with more than two symbols)
 `◦ 𝑥𝑥+ 𝑦𝑦⋅𝑧𝑧 = (𝑥𝑥+ 𝑦𝑦) ⋅(𝑥𝑥+ 𝑧𝑧) ( + over ⋅ not intuitive, still true)`

## Page 6

EE2026 Digital Design Prof. Massimo Alioto

Operators in Boolean Algebra

### • Derived from axioms:

### Page 6

## OR: 𝑨𝑨+ 𝑩𝑩

## 𝑨𝑨 𝑩𝑩 𝑨𝑨+ 𝑩𝑩

### 0 0 0

### 0 1 1

### 1 0 1

### 1 1 1

**AND: 𝑨𝑨 ȉ 𝑩𝑩**

𝑨𝑨 𝑩𝑩 𝑨𝑨 ȉ 𝑩𝑩

### 0 0 0

### 0 1 0

### 1 0 0

### 1 1 1

## NOT: 𝑨𝑨

## 𝑨𝑨 𝑨𝑨

### 0 1

### 1 0

### 0 + 0 = 0 0 + 1 = 1 1 + 0 = 1 1 + 1 = 1

### 0 ȉ 0 = 0 0 ȉ 1 = 0 1 ȉ 0 = 0 1 ȉ 1 = 1
 `A = 0 → 𝐴𝐴 = 1 A = 1 → 𝐴𝐴 = 0`
 `priority: NOT has highest precedence, followed by AND and OR → NOT(A ⋅ B + C) = NOT((A ⋅ B) + C)`

truth table (simplest expression of a function)

### Table 1

| 𝑨𝑨 𝑩𝑩 | 𝑨𝑨+ 𝑩𝑩 |
| --- | --- |
| 0 0
0 1
1 0
1 1 | 0
1
1
1 |

### Table 2

| 𝑨𝑨 𝑩𝑩 | 𝑨𝑨ȉ 𝑩𝑩 |
| --- | --- |
| 0 0
0 1
1 0
1 1 | 0
0
0
1 |

### Table 3

| 𝑨𝑨 | 𝑨𝑨 |
| --- | --- |
| 0 | 1 |
| 1 | 0 |

## Page 7

EE2026 Digital Design Prof. Massimo Alioto

Boolean vs. Elementary Algebra

### Page 7

Boolean algebra Ordinary algebra

No associative law. But it can be derived from the other postulates

### Associative law is included:
 `𝑎𝑎+ 𝑏𝑏+ 𝑐𝑐 = 𝑎𝑎+ 𝑏𝑏+ 𝑐𝑐`
 `Distributive law: x + 𝑦𝑦 ȉ 𝑧𝑧 = (𝑥𝑥+ 𝑦𝑦) ȉ (𝑥𝑥+ 𝑧𝑧) valid`

Not valid

No additive or multiplicative inverses, therefore there are no subtraction and division operation

Subtraction and division operations exist

Complement operation available No complement operation

Boolean algebra: Undefined set of elements; Switching algebra: a two-valued Boolean algebra, whose element set only has two elements, 0 and 1

Dealing with real numbers and constituting an infinite set of elements

### Table 4

| Boolean algebra | Ordinary algebra |
| --- | --- |
| No associative law. But it can be derived from the
other postulates | Associative law is included:
𝑎𝑎 + 𝑏𝑏 + 𝑐𝑐 = 𝑎𝑎 + 𝑏𝑏 + 𝑐𝑐 |
| Distributive law:
x + 𝑦𝑦 ȉ 𝑧𝑧 = (𝑥𝑥 + 𝑦𝑦) ȉ (𝑥𝑥 + 𝑧𝑧) valid | Not valid |
| No additive or multiplicative inverses, therefore there
are no subtraction and division operation | Subtraction and division operations exist |
| Complement operation available | No complement operation |
| Boolean algebra: Undefined set of elements;
Switching algebra: a two-valued Boolean algebra,
whose element set only has two elements, 0 and 1 | Dealing with real numbers and constituting an infinite
set of elements |

## Page 8

EE2026 Digital Design Prof. Massimo Alioto

### Theorems of Boolean Algebra

### Page 8

### # Theorem

### 1 𝐴𝐴+ 𝐴𝐴= 𝐴𝐴 𝐴𝐴 ȉ 𝐴𝐴 = 𝐴𝐴 Tautology Law

### 2 𝐴𝐴+ 1 = 1 𝐴𝐴 ȉ 0 = 0 Union Law

### 3 ഥ𝐴𝐴 = 𝐴𝐴 Involution Law

### 4 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 = 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 = 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 Associative Law

### 5 𝐴𝐴+ 𝐵𝐵= ̅𝐴𝐴 ȉ ത𝐵𝐵 𝐴𝐴 ȉ 𝐵𝐵 = ̅𝐴𝐴+ ത𝐵𝐵 De Morgan’s Law

### 6 𝐴𝐴+ 𝐴𝐴 ȉ 𝐵𝐵 = 𝐴𝐴 𝐴𝐴 ȉ 𝐴𝐴+ 𝐵𝐵= 𝐴𝐴 Absorption Law

### 7 𝐴𝐴+ ̅𝐴𝐴 ȉ 𝐵𝐵 = 𝐴𝐴+ 𝐵𝐵 𝐴𝐴 ȉ ̅𝐴𝐴+ 𝐵𝐵= 𝐴𝐴 ȉ 𝐵𝐵

### 8 𝐴𝐴𝐴𝐴+ 𝐴𝐴 ത 𝐵𝐵 = 𝐴𝐴 (𝐴𝐴+ 𝐵𝐵)(𝐴𝐴+ ത 𝐵𝐵 ) = 𝐴𝐴 Logical adjacency

## 9 𝐴𝐴𝐴𝐴+ ̅𝐴𝐴𝐶𝐶+ 𝐵𝐵𝐵𝐵 = 𝐴𝐴𝐴𝐴+ ̅𝐴𝐴𝐶𝐶
 `𝐴𝐴+ 𝐵𝐵 ̅𝐴𝐴+ 𝐶𝐶 𝐵𝐵+ 𝐶𝐶 = (𝐴𝐴+ 𝐵𝐵)( ̅ 𝐴𝐴+ 𝐶𝐶) Consensus Law`

duality (swap OR and AND, swap 0 and 1)

### Table 5

| # | Theorem | None | None |
| --- | --- | --- | --- |
| 1 | 𝐴𝐴 + 𝐴𝐴 = 𝐴𝐴 | 𝐴𝐴 ȉ 𝐴𝐴 = 𝐴𝐴 | Tautology Law |
| 2 | 𝐴𝐴 + 1 = 1 | 𝐴𝐴 ȉ 0 = 0 | Union Law |
| 3 | 𝐴ഥ 𝐴 = 𝐴𝐴 |  | Involution Law |
| 4 | 𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶
= 𝐴𝐴+ 𝐵𝐵 + 𝐶𝐶 | 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 = 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | Associative Law |
| 5 | 𝐴𝐴 + 𝐵𝐵 = 𝐴̅𝐴 ȉ 𝐵ത𝐵 | 𝐴𝐴 ȉ 𝐵𝐵 = 𝐴̅𝐴 + 𝐵ത𝐵 | De Morgan’s Law |
| 6 | 𝐴𝐴 + 𝐴𝐴 ȉ 𝐵𝐵 = 𝐴𝐴 | 𝐴𝐴ȉ 𝐴𝐴+ 𝐵𝐵 = 𝐴𝐴 | Absorption Law |
| 7 | 𝐴𝐴 +𝐴̅𝐴 ȉ 𝐵𝐵 = 𝐴𝐴 + 𝐵𝐵 | 𝐴𝐴 ȉ 𝐴̅𝐴+ 𝐵𝐵 = 𝐴𝐴 ȉ 𝐵𝐵 |  |
| 8 | 𝐴 + 𝐴𝐴𝐵ത𝐵 = 𝐴𝐴 | (𝐴𝐴 + 𝐵𝐵)(𝐴𝐴 + 𝐵ത𝐵) = 𝐴𝐴 | Logical adjacency |
| 9 | 𝐴 + 𝐴̅𝐴𝐶𝐶 + 𝐵
= 𝐴 +𝐴̅𝐴𝐶𝐶 | 𝐴𝐴+ 𝐵𝐵 𝐴̅𝐴+ 𝐶𝐶 𝐵𝐵 + 𝐶𝐶
= (𝐴𝐴 + 𝐵𝐵)( 𝐴̅𝐴+ 𝐶𝐶) | Consensus Law |

## Page 9

EE2026 Digital Design Prof. Massimo Alioto

Analytical Expressions and Truth Tables

• Analytical expressions for Boolean functions use logical relationship between binary variables via operators ◦ Evaluated by determining the binary value of the expression for all possible values of the variables ◦ Examples:

### Page 9

## 𝐹𝐹 3 = 𝐴𝐴+ 𝐵𝐵𝐵𝐵

## 𝐹𝐹 4 = ̅𝐴𝐴 ത 𝐵𝐵𝐶𝐶+ 𝐴𝐴𝐴𝐴̅𝐶𝐶

## 𝐹𝐹 1 = 𝐴𝐴+ 𝐵𝐵
 `𝐹𝐹 2 = 𝐴𝐴 ȉ 𝐵𝐵`

### • Truth table lists all possible combinations of input values and corresponding output ◦ Examples:

## 𝑭𝑭 𝟏𝟏 = 𝑨𝑨+ 𝑩𝑩

## A B F 1

### 0 0 0

### 0 1 1

### 1 0 1

### 1 1 1

## 𝑭𝑭 𝟑𝟑 = 𝑨𝑨+ 𝑩𝑩𝑩𝑩

## A B C F 3

### 0 0 0 0

### 0 0 1 0

### 0 1 0 0

### 0 1 1 1

### 1 0 0 1

### 1 0 1 1

### 1 1 0 1

### 1 1 1 1 ◦ Repeat for 𝐹𝐹 2 and 𝐹𝐹 4

### Table 6

| A B C | F
3 |
| --- | --- |
| 0 0 0
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1
1 1 0
1 1 1 | 0
0
0
1
1
1
1
1 |

### Table 7

| A B | F
1 |
| --- | --- |
| 0 0
0 1
1 0
1 1 | 0
1
1
1 |

## Page 10

EE2026 Digital Design Prof. Massimo Alioto

Using Truth Tables to Prove Theorems

• Exhaustively check validity for all possible input values

### Page 10

**◦ Example: prove De Morgan’s laws**

A B 𝑨𝑨+ 𝑩𝑩 ഥ𝑨𝑨ȉ ഥ𝑩𝑩

### 0 0 1 1

### 0 1 0 0

### 1 0 0 0

### 1 1 0 0
 `𝐴𝐴+ 𝐵𝐵 = ̅𝐴𝐴 ȉ ത𝐵𝐵 𝐴𝐴 ȉ 𝐵𝐵 = ̅𝐴𝐴+ ത𝐵𝐵`

A B 𝑨𝑨 ȉ 𝑩𝑩 ഥ𝑨𝑨 + ഥ𝑩𝑩

### 0 0 1 1

### 0 1 1 1

### 1 0 1 1

### 1 1 0 0
 `equality true for all input values → proved`

**◦ Example: prove other laws**

A B 𝑨𝑨+ ഥ 𝑨𝑨ȉ 𝑩𝑩 𝑨𝑨+ 𝑩𝑩

### 0 0 0 0

### 0 1 1 1

### 1 0 1 1

### 1 1 1 1
 `𝐴𝐴+ ̅𝐴𝐴 ȉ 𝐵𝐵 = 𝐴𝐴+ 𝐵𝐵`

A B 𝑨𝑨 ȉ 𝑨𝑨+ 𝑩𝑩 𝑨𝑨

### 0 0 0 0

### 0 1 0 0

### 1 0 1 1

### 1 1 1 1
 `𝐴𝐴 ȉ 𝐴𝐴+ 𝐵𝐵 = 𝐴𝐴`

### Table 8

| A B | 𝑨𝑨 + 𝑩𝑩 | ഥ ഥ
𝑨𝑨 ȉ 𝑩𝑩 |
| --- | --- | --- |
| 0 0
0 1
1 0
1 1 | 1
0
0
0 | 1
0
0
0 |

### Table 9

| A B | 𝑨𝑨 ȉ 𝑩𝑩 | ഥ ഥ
𝑨𝑨 + 𝑩𝑩 |
| --- | --- | --- |
| 0 0
0 1
1 0
1 1 | 1
1
1
0 | 1
1
1
0 |

### Table 10

| A B | ഥ
𝑨𝑨 + 𝑨𝑨 ȉ 𝑩𝑩 | 𝑨𝑨 + 𝑩𝑩 |
| --- | --- | --- |
| 0 0
0 1
1 0
1 1 | 0
1
1
1 | 0
1
1
1 |

### Table 11

| A B | 𝑨𝑨 ȉ 𝑨𝑨 + 𝑩𝑩 | 𝑨𝑨 |
| --- | --- | --- |
| 0 0
0 1
1 0
1 1 | 0
0
1
1 | 0
0
1
1 |

## Page 11

EE2026 Digital Design Prof. Massimo Alioto

**Special Forms of Boolean Expressions: SOP, POS**

• A Boolean expression can be rewritten in many formally different (but equivalent) forms

### Page 11
 `◦ Sum of products (SOP) ◦ Logic sum of product terms 𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 + ̅𝐴𝐴𝐵𝐵̅𝐶𝐶+ A ത𝐵𝐵𝐶𝐶`

products

sum

### ◦ Example:
 `◦ Product of sums (POS) ◦ Logic product of sum terms ◦ Example: 𝐹𝐹 2 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶⋅𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶 ȉ ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶⋅( ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶) ⋅ ( ̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶)`

sums

product

## Page 12

EE2026 Digital Design Prof. Massimo Alioto
 `◦ Maxterm: product term that contains all variables of the function ◦ examples in Boolean Function 𝑍𝑍 = 𝑓𝑓 ( 𝐴𝐴 , 𝐵𝐵 , 𝐶𝐶 ) ◦ 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 , 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶 , ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 are maxterms (contain all variables) ◦ 𝐴𝐴+ 𝐵𝐵 , ത 𝐵𝐵 + ̅𝐶𝐶 , 𝐵𝐵 are not maxterms (some variable is missing)`

• Definition of minterms and maxterms ◦ Minterm: product term that contains all variables of the function

**Special Forms of Boolean Expressions: Canonical**

### Page 12

“ ⋅ ” often omitted
 `◦ examples in Boolean Function 𝑍𝑍 = 𝑓𝑓 ( 𝐴𝐴 , 𝐵𝐵 , 𝐶𝐶 ) ◦ 𝐴𝐴𝐴𝐴𝐴𝐴 , 𝐴𝐴 ത 𝐵𝐵𝐶𝐶 , ̅ 𝐴𝐴 ത 𝐵𝐵𝐶𝐶 are minterms (contain all variables) ◦ 𝐴𝐴𝐴𝐴 , 𝐴𝐴 ത 𝐵𝐵 , ̅ 𝐴𝐴 are not minterms (some variable is missing)`
 `• Canonical form: SOP = sum of only minterms (POS = product of only maxterms)`

canonical form

non canonical form
 `𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴𝐵𝐵̅𝐶𝐶+ A ത𝐵𝐵̅𝐶𝐶 + A ത𝐵𝐵𝐶𝐶 + 𝐴𝐴𝐴𝐴̅𝐶𝐶`

## SOP
 `𝐹𝐹 2 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴𝐵𝐵̅𝐶𝐶+ A ത𝐵𝐵 + ത𝐵𝐵𝐶𝐶 + 𝐴𝐴𝐴𝐴̅𝐶𝐶`

non minterms
 `𝐹𝐹 3 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶`
 `𝐹𝐹 4 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 𝐴𝐴+ ̅𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶`

## POS

non maxterm

## Page 13

EE2026 Digital Design Prof. Massimo Alioto

A B C minterm

### 0 0 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅ 𝐶𝐶

### 0 0 1 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ 𝐶𝐶

### 0 1 0 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶

### 0 1 1 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶

### 1 0 0 𝐴𝐴 ȉ ത 𝐵𝐵ȉ ̅ 𝐶𝐶

### 1 0 1 𝐴𝐴 ȉ ത 𝐵𝐵ȉ 𝐶𝐶

### 1 1 0 𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶

### 1 1 1 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶

Minterm Association with Input Value

• In n-variable function, there are 2 n different minterms

### Page 13
 `◦ Example with n = 3`
 `◦ Input value such that 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 = 1`
 `◦ There exists at least one input value such that given minterm = 1 (rule: 1 if not complemented, 0 if complemented)`
 `̅𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅𝐶𝐶 = 1 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 = 1`
 `◦ Value of the above minterms is 0 under any other input value (mostly 0, 1 only for specific input) ◦ There exists one and only one input value such that given minterm = 1`
 `• Direct(one-to-one) relation between minterms or values making them 1`

111
 `input value making minterm = 1`

000

011

### Table 12

| A B C | None | None | minterm | None | None |
| --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 |  | ̅ ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |
| 0 | 0 | 1 | ̅ ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |
| 0 | 1 | 0 | ̅ ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |
| 0 | 1 | 1 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |
| 1 | 0 | 0 | ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |
| 1 | 0 | 1 | ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |
| 1 | 1 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |
| 1 | 1 | 1 | 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 |  |  |

## Page 14

EE2026 Digital Design Prof. Massimo Alioto

A B C maxterm

## 0 0 0 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

## 0 0 1 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

## 0 1 0 𝐴𝐴+ ത 𝐵𝐵 + 𝐶𝐶

## 0 1 1 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶

## 1 0 0 ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

## 1 0 1 ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

## 1 1 0 ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶

## 1 1 1 ̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶

Maxterm Association with Input Value

• In n-variable function, there are 2 n different maxterms

### Page 14
 `◦ Example with n = 3`
 `◦ Input value such that 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 = 0`
 `◦ There exists at least one input value such that given maxterm = 0 (rule: 0 if not complemented, 1 if complemented)`
 `̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶 = 0 ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 = 0`
 `◦ Value of the above maxterms is 1 under any other input value (mostly 1, 0 only for specific input) ◦ There exists one and only one input value such that given maxterm = 0`
 `• Direct(one-to-one) relation between maxterms or values making them 0`

000
 `input value making maxterm = 0`

111

100

duality

duality

### Table 13

| A B C | None | None | maxterm | None | None |
| --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 |  | 𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |
| 0 | 0 | 1 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |
| 0 | 1 | 0 | ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |
| 0 | 1 | 1 | ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |
| 1 | 0 | 0 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |
| 1 | 0 | 1 | ̅ ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |
| 1 | 1 | 0 | ̅ ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |
| 1 | 1 | 1 | ̅ ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |  |  |

## Page 15

EE2026 Digital Design Prof. Massimo Alioto

A B C F minterm maxterm

### 0 0 0 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

### 0 0 1 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

### 0 1 0 1 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + 𝐶𝐶

### 0 1 1 0 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶

### 1 0 0 1 𝐴𝐴 ȉ ത 𝐵𝐵ȉ ̅ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

### 1 0 1 0 𝐴𝐴 ȉ ത 𝐵𝐵ȉ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

### 1 1 0 0 𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶

### 1 1 1 0 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 ̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶
 `Convert Truth Table → Canonical Form: SOP(CSOP)`

• In n-variable function, there are 2 n different minterms and maxterms

### Page 15
 `◦ Example with n = 3: sum of 2 products (CSOP)`

### 0 for input 010 0 for input 100

### ◦ If 𝐹𝐹 =1 only for input 010:

### 𝐹𝐹= ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 ◦ If 𝐹𝐹 =1 only for inputs 010 and 100:
 `𝐹𝐹 = ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 + 𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅ 𝐶𝐶`
 `• Each minterm is 1 only for a specific input ◦ no “interference” with other inputs → just add minterms independently`

### Table 14

| A B C | None | None | F | minterm | maxterm |
| --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | ̅ ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | 𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 0 | 1 | 0 | ̅ ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 1 | 0 | 1 | ̅ ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 1 | 1 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 0 | 0 | 1 | ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 0 | 1 | 0 | ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 1 | 0 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 1 | 1 | 0 | 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |

## Page 16

EE2026 Digital Design Prof. Massimo Alioto
 `Convert Truth Table → Canonical Form: SOP(CSOP)`

• In n-variable function, there are 2 n different minterms and maxterms

### Page 16
 `◦ Example with n = 3: sum of 4 products (CSOP)`

A B C F minterm maxterm

### 0 0 0 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

### 0 0 1 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

### 0 1 0 1 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + 𝐶𝐶

### 0 1 1 0 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶

### 1 0 0 1 𝐴𝐴 ȉ ത 𝐵𝐵ȉ ̅ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

### 1 0 1 1 𝐴𝐴 ȉ ത 𝐵𝐵ȉ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

### 1 1 0 0 𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶

### 1 1 1 1 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 ̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶
 `𝐹𝐹 = ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 + 𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅ 𝐶𝐶 + + 𝐴𝐴 ȉ ത 𝐵𝐵ȉ 𝐶𝐶 + 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶`
 `• Truth table is expressed directly with canonical form by 1. Identifying minterms = 1 for the input values making F = 1 2. (Logically) add them up`

### Table 15

| A B C | None | None | F | minterm | maxterm |
| --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | ̅ ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | 𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 0 | 1 | 0 | ̅ ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 1 | 0 | 1 | ̅ ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 1 | 1 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 0 | 0 | 1 | ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 0 | 1 | 1 | ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 1 | 0 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 1 | 1 | 1 | 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |

## Page 17

EE2026 Digital Design Prof. Massimo Alioto
 `Convert Truth Table → Canonical Form: POS(CPOS)`

### Page 17
 `◦ Example with n = 3: product of 3 sums (CPOS)`

A B C F minterm maxterm

### 0 0 0 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ ̅ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

### 0 0 1 0 ̅𝐴𝐴 ȉ ത𝐵𝐵ȉ 𝐶𝐶 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

### 0 1 0 1 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + 𝐶𝐶

### 0 1 1 0 ̅𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶

### 1 0 0 1 𝐴𝐴 ȉ ത 𝐵𝐵ȉ ̅ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶

### 1 0 1 0 𝐴𝐴 ȉ ത 𝐵𝐵ȉ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶

### 1 1 0 0 𝐴𝐴 ȉ 𝐵𝐵ȉ ̅ 𝐶𝐶 ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶

### 1 1 1 1 𝐴𝐴 ȉ 𝐵𝐵ȉ 𝐶𝐶 ̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶
 `𝐹𝐹 = 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 ⋅ 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶 ⋅`
 `each maxterm is 0 only for a specific input (no “interference” with other inputs) → just multiply maxterms independently`

## ⋅ 𝐴𝐴+ ത 𝐵𝐵 + ̅𝐶𝐶
 `• Truth table is expressed directly with canonical form by 1. Identifying maxterms = 0 for the input values making F = 0 2. (Logically) multiply them`

⋅ ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶 ⋅ ⋅ ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶

### Table 16

| A B C | None | None | F | minterm | maxterm |
| --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | ̅ ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | 𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 0 | 1 | 0 | ̅ ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 1 | 0 | 1 | ̅ ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 0 | 1 | 1 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 0 | 0 | 1 | ത ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 0 | 1 | 0 | ത
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 1 | 0 | 0 | ̅
𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ത
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |
| 1 | 1 | 1 | 1 | 𝐴𝐴 ȉ 𝐵𝐵 ȉ 𝐶𝐶 | ̅ ത ̅
𝐴𝐴 + 𝐵𝐵 + 𝐶𝐶 |

## Page 18

EE2026 Digital Design Prof. Massimo Alioto
 `• Just reverse the process: in SOP(POS), fill in the outputs = 1 (0) for the input values associated with the function minterms (maxterms)`

### Convert Canonical Form → Truth Table

### Page 18
 `𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 + ̅𝐴𝐴𝐵𝐵̅𝐶𝐶 + A ത𝐵𝐵𝐶𝐶`

## A B C F

### 0 0 0 0

### 0 0 1 1

### 0 1 0 1

### 0 1 1 0

### 1 0 0 0

### 1 0 1 1

### 1 1 0 0

### 1 1 1 0

**◦ Example: SOP**
 `𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = 𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 + 𝐴𝐴+ ത 𝐵𝐵+ ̅𝐶𝐶 + ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 + + ̅𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶 + ̅𝐴𝐴+ ത𝐵𝐵 + ̅𝐶𝐶`

**◦ Example: POS**

## A B C F

### 0 0 0 0

### 0 0 1 1

### 0 1 0 1

### 0 1 1 0

### 1 0 0 0

### 1 0 1 1

### 1 1 0 0

### 1 1 1 0 • In this example, SOP and POS happen to express the very same function → SOP and POS just different forms

### Table 17

| A B C | F |
| --- | --- |
| 0 0 0
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1
1 1 0
1 1 1 | 0
1
1
0
0
1
0
0 |

### Table 18

### Table 19

### Table 20

| A B C | None | F |
| --- | --- | --- |
| 0 0 0
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1
1 1 0
1 1 1 |  | 0
1
1
0
0
1
0
0 |
|  | 1 1 1 | 0 |

### Table 21

### Table 22

### Table 23

### Table 24

### Table 25

## Page 19

EE2026 Digital Design Prof. Massimo Alioto

### • If starting from SOP, Boolean expression manipulations lead to complement of POS (not POS) ◦ Example:
 `Convert SOP → POS and POS → SOP`

### Page 19
 `𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 + ̅𝐴𝐴𝐵𝐵̅𝐶𝐶 + A ത𝐵𝐵𝐶𝐶`
 `= 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶 ⋅ 𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶 ⋅ ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶`
 `not POS! = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 ⋅ ̅𝐴𝐴𝐵𝐵̅𝐶𝐶 ⋅ A ത𝐵𝐵𝐶𝐶`
 `De Morgan’s laws = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 + ̅𝐴𝐴𝐵𝐵̅𝐶𝐶 + A ത𝐵𝐵𝐶𝐶 complement needed → insert 2 to leave function unaltered`
 `◦ To get POS, the above complement needs to be compensated upfront ◦ start from complemented SOP ◦ manipulate via De Morgan’s laws and derive true POS 𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 + ̅𝐴𝐴𝐵𝐵̅𝐶𝐶 + A ത𝐵𝐵𝐶𝐶`

## = ̅𝐴𝐴 ത𝐵𝐵𝐶𝐶 ⋅ ̅𝐴𝐴𝐵𝐵̅𝐶𝐶 ⋅ A ത𝐵𝐵𝐶𝐶
 `= 𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶 ⋅ 𝐴𝐴+ ത𝐵𝐵 + 𝐶𝐶 ⋅ ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶 ◦ same when starting from POS to derive SOP`

## Page 20

EE2026 Digital Design Prof. Massimo Alioto
 `• First method: non-canonical form → truth table → canonical form Convert Non-Canonical → Canonical via Truth Table`

### Page 20
 `F = 1 for any input such that ̅ 𝐴𝐴 = 1 A B C F`

### 0 0 0 1

### 0 0 1 1

### 0 1 0 1

### 0 1 1 1

### 1 0 0 0

### 1 0 1 0

### 1 1 0 1

### 1 1 1 0

### F = 1 for any input such that 𝐵𝐵 ̅ 𝐶𝐶 = 1 𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶= ̅𝐴𝐴 + 𝐵𝐵̅𝐶𝐶 ◦ Example:
 `𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴 ത 𝐵𝐵̅𝐶𝐶+ ̅𝐴𝐴 ത 𝐵𝐵𝐶𝐶+ ̅𝐴𝐴𝐵𝐵̅𝐶𝐶+ ̅𝐴𝐴𝐵𝐵𝐵𝐵 + 𝐴𝐴𝐴𝐴̅𝐶𝐶`
 `◦ Resulting SOP canonical form (from entries with F = 1)`
 `𝐹𝐹 1 𝐴𝐴, 𝐵𝐵, 𝐶𝐶 = ̅𝐴𝐴+ 𝐵𝐵+ 𝐶𝐶 ̅𝐴𝐴+ 𝐵𝐵+ ̅𝐶𝐶( ̅𝐴𝐴+ ത 𝐵𝐵+ ̅𝐶𝐶)`
 `◦ Resulting POS canonical form (from entries with F = 0)`

### Table 26

| A B C | F |
| --- | --- |
| 0 0 0
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1
1 1 0
1 1 1 | 1
1
1
1
0
0
1
0 |

## Page 21

EE2026 Digital Design Prof. Massimo Alioto

• Use Boolean properties to manipulate the non-canonical expression to let missing literals appear for canonical form
 `Non-Canonical → Canonical via Boolean Algebra`

### Page 21

### ◦ Example:
 `𝐹𝐹𝑥𝑥, 𝑦𝑦, 𝑧𝑧 = ̅𝑥𝑥𝑦𝑦+ 𝑥𝑥𝑥𝑥 SOP → CSOP For missing literals, complete minterms through postulates: A ȉ 1 = 𝐴𝐴 𝑎𝑎𝑎𝑎𝑎𝑎 𝐴𝐴+ ̅𝐴𝐴 = 1`
 `𝐹𝐹𝑥𝑥, 𝑦𝑦, 𝑧𝑧 = ̅𝑥𝑥𝑦𝑦+ 𝑥𝑥𝑥𝑥 SOP → CPOS`

• express SOP as POS a) complement twice b) apply De Morgan’s law c) expand d) re-apply De Morgan’s law

1)
 `= ̅𝑥𝑥𝑦𝑦 ȉ 1 + 𝑥𝑥 ȉ 1 ȉ 𝑧𝑧 = ̅𝑥𝑥𝑦𝑦z + ̅𝑧𝑧+ 𝑥𝑥𝑦𝑦+ ത𝑦𝑦𝑧𝑧 = ̅𝑥𝑥𝑦𝑦𝑧𝑧+ ̅𝑥𝑥𝑦𝑦̅𝑧𝑧+ 𝑥𝑥𝑥𝑥𝑥𝑥+ 𝑥𝑥 ത𝑦𝑦𝑧𝑧`

• for missing literals, complete maxterms through distribution postulate
 `𝐴𝐴+ 𝑩𝑩 𝑪𝑪 = 𝐴𝐴+ 𝑩𝑩 𝐴𝐴+ 𝑪𝑪 (A = incomplete sum, C = NOT(B) = missing literal)`
 `x+𝑦𝑦 = (𝑥𝑥+ 𝑦𝑦) + 𝒛𝒛 ത𝒛𝒛 = (𝑥𝑥+ 𝑦𝑦+ 𝒛𝒛 )(𝑥𝑥+ 𝑦𝑦+ ത𝒛𝒛 )`
 `2) = 𝑥𝑥+ 𝑦𝑦+ 𝑧𝑧⋅𝑥𝑥+ 𝑦𝑦+ ̅𝑧𝑧⋅ ̅𝑥𝑥+ 𝑦𝑦+ 𝑧𝑧⋅ ̅𝑥𝑥+ ത𝑦𝑦 + 𝑧𝑧⋅ ⋅𝑥𝑥+ 𝑦𝑦+ 𝑧𝑧⋅ ̅𝑥𝑥+ 𝑦𝑦+ 𝑧𝑧`
 `a = ̅𝑥𝑥𝑦𝑦+ 𝑥𝑥𝑥𝑥`
 `b = 𝑥𝑥+ ത𝑦𝑦 ̅𝑥𝑥+ ̅𝑧𝑧`
 `c = 𝑥𝑥̅𝑥𝑥+ 𝑥𝑥̅𝑧𝑧+ ̅𝑥𝑥 ത𝑦𝑦 + ത𝑦𝑦̅𝑧𝑧`
 `d = 𝑥𝑥+ 𝑦𝑦 ̅𝑥𝑥+ 𝑧𝑧 𝑦𝑦+ 𝑧𝑧`

## Page 22

EE2026 Digital Design Prof. Massimo Alioto
 `• Postulates and theorems of Boolean algebra • Boolean operators: AND, OR and NOT • Boolean functions and truth tables • Boolean function expressed in SOP and POS form • Obtain SOP or POS from truth table • Minterm, maxterm and canonical form (CSOP, CPOS) • Convert truth table → CSOP and CPOS • Convert CSOP and CPOS → truth table • Convert CSOP → CPOS and vice versa • Non-canonical → canonical form (via truth table, Boolean algebra)`

### Summary

### Page 22