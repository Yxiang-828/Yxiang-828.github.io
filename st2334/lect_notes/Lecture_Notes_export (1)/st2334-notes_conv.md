# ST2334

## Page 1

ST2334
Probability and Statistics
Academic Year 2025/2026
Semester I
David Chew
Department of Statistics and Data Science
email: david.chew@nus.edu.sg
Typesetted using the MiKTEX sytem.

## Page 3

Contents
Contents
iii
1
Basic Concepts of Probability
1
1
Probability Concepts and Definitions . . . . . . . . . . . . . . .
1
2
Event Operations & Relationships
. . . . . . . . . . . . . . . .
2
3
Counting Methods
. . . . . . . . . . . . . . . . . . . . . . . . .
6
4
Probability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
9
5
Conditional Probability . . . . . . . . . . . . . . . . . . . . . . .
14
6
Independence . . . . . . . . . . . . . . . . . . . . . . . . . . . .
17
7
The Law of Total Probability . . . . . . . . . . . . . . . . . . . .
18
8
Bayes’ Theorem . . . . . . . . . . . . . . . . . . . . . . . . . . .
20
2
Random Variables
23
1
Definition of a Random Variable
. . . . . . . . . . . . . . . . .
23
2
Probability Distribution
. . . . . . . . . . . . . . . . . . . . . .
26
3
Cumulative Distribution Function
. . . . . . . . . . . . . . . .
29
4
Expectation and Variance
. . . . . . . . . . . . . . . . . . . . .
32
3
Joint Distributions
39
1
Joint Distributions for Multiple Random Variables . . . . . . .
39
2
Marginal and Conditional Distributions . . . . . . . . . . . . .
43
3
Independent Random Variables . . . . . . . . . . . . . . . . . .
46
4
Expectation and Covariance . . . . . . . . . . . . . . . . . . . .
48
4
Special Probability Distributions
53
1
Discrete Distributions . . . . . . . . . . . . . . . . . . . . . . . .
53
2
Continuous Distribution . . . . . . . . . . . . . . . . . . . . . .
63
5
Sampling and Sampling Distributions
75
1
Population and Sample . . . . . . . . . . . . . . . . . . . . . . .
75
2
Random Sampling
. . . . . . . . . . . . . . . . . . . . . . . . .
76
3
Sampling Distribution of Sample Mean
. . . . . . . . . . . . .
78
4
Central Limit Theorem . . . . . . . . . . . . . . . . . . . . . . .
81
iii

## Page 4

iv
Contents
5
Other Sampling Distributions . . . . . . . . . . . . . . . . . . .
82
6
Estimation
89
1
Point Estimation . . . . . . . . . . . . . . . . . . . . . . . . . . .
90
2
Confidence Intervals for the Mean
. . . . . . . . . . . . . . . .
95
3
Comparing Two Populations
. . . . . . . . . . . . . . . . . . .
98
4
Independent Samples: Unequal variances . . . . . . . . . . . .
100
5
Independent Samples: Equal variances . . . . . . . . . . . . . .
103
6
Paired Data
. . . . . . . . . . . . . . . . . . . . . . . . . . . . .
106
7
Hypothesis Tests
109
1
Hypothesis Tests
. . . . . . . . . . . . . . . . . . . . . . . . . .
109
2
Hypotheses concerning the Mean . . . . . . . . . . . . . . . . .
113
3
Two-sided Tests and Confidence Intervals . . . . . . . . . . . .
121
4
Tests Comparing Means: Independent Samples . . . . . . . . .
123
5
Tests Comparing Means: Paired Data . . . . . . . . . . . . . . .
125

## Page 5

One
Basic Concepts of Probability
1
PROBABILITY CONCEPTS AND DEFINITIONS
In this section we introduce the basic terminology of probability theory: ex-
periment, outcomes, sample space, events.
DEFINITION 1 (EXPERIMENT, SAMPLE SPACE, EVENT)
A statistical experiment is any procedure that produces data or observations.
The sample space, denoted by S, is the set of all possible outcomes of a statistical
experiment. The sample space depends on the problem of interest!
A sample point is an outcome (element) in the sample space.
An event is a subset of the sample space.
EXAMPLE 1.1
Consider the experiment of rolling a die.
(i) If the problem of interest is “the number that shows on the top
face”, then
• Sample space: S = {1,2,3,4,5,6}.
• Sample point: 1 or 2 or 3 or 4 or 5 or 6.
• Some possible events are:
– an event where an odd number occurs = {1,3,5};
– an event where a number greater than 4 occurs = {5,6}.
(ii) If the problem of interest is “whether the number is even or
odd”, then
• Sample space: S = {even, odd}.
• Sample point: “even” or “odd”.
• A possible event is:
– an event where an odd number occurs = {odd}.
1

## Page 6

2
Basic Concepts of Probability
REMARK
The sample space is itself an event and is called a sure event.
An event that contains no element is the empty set, denoted by /0, and is called a
null event.
2
EVENT OPERATIONS & RELATIONSHIPS
Let A and B be two events in the sample space S. We shall go through some
event operations and relationships involving A and B.
• Event operations:
(i) Union;
(ii) Intersection;
(iii) Complement.
• Event relationships:
(i) Contained;
(ii) Equivalent;
(iii) Mutually exclusive.
Union
The union of events A and B, denoted by A ∪B, is the event containing all
elements that belong to A or B or both. That is
A∪B = {x : x ∈A or x ∈B}.
A
B
A∩B
S
Intersection
The intersection of events A and B, denoted by A ∩B or simply AB, is the
event containing elements that belong to both A and B. That is
A∩B = {x : x ∈A and x ∈B}.

## Page 7

Event Operations & Relationships
3
A
B
A∩B
S
We can also consider the union and intersection of n events: A1,A2,...,An.
• Union:
n[
i=1
Ai = A1 ∪A2 ...∪An = {x : x ∈A1 or x ∈A2 or ... or x ∈An},
comprises of elements that belong to one or more of A1,...,An.
• Intersection:
n\
i=1
Ai = A1 ∩A2 ...∩An = {x : x ∈A1 and x ∈A2 and ... and x ∈An},
comprises of elements that belong to every A1,...,An.
Complement
The complement of the event A with respect to S, denoted by A′, is the event
with elements in S, which are not in A. That is
A′ = {x : x ∈S but x /∈A}.
A
A′
S

## Page 8

4
Basic Concepts of Probability
Mutually Exclusive
Events A and B are said to be mutually exclusive or disjoint, if A ∩B = /0.
That is, A and B have no element in common.
A
B
S
Contained and Equivalent
If all elements in A are also elements in B, then we say A is contained in B,
denoted by A ⊂B, or equivalently B ⊃A.
B
A
S
If A ⊂B and B ⊂A, then A = B. That is, set A and B are equivalent.

## Page 9

Event Operations & Relationships
5
EXAMPLE 1.2
Consider the sample space and events:
S = {1,2,3,4,5,6},
A = {1,2,3},
B = {1,3,5},
C = {2,4,6}.
Then
(i) A∪B = {1,2,3,5};
A∪C = {1,2,3,4,6};
B∪C = S.
(ii) A∩B = {1,3};
A∩C = {2};
B∩C = /0.
(iii) A∪B∪C = S;
A∩B∩C = /0.
(iv) A′ = {4,5,6};
B′ = {2,4,6} = C.
Note that B and C are mutually exclusive, since B ∩C = /0. On the
other hand, A and B are not mutually exclusive as A∩B = {1,3} ̸= /0.
MORE EVENT OPERATIONS
(a) A∩A′ = /0
(b) A∩/0 = /0
(c) A∪A′ = S
(d) (A′)′ = A
(e) A∪(B∩C) = (A∪B)∩(A∪C)
(f) A∩(B∪C) = (A∩B)∪(A∩C)
(g) A∪B = A∪(B∩A′)
(h) A = (A∩B)∪(A∩B′)
DE MORGAN’S LAW
For any n events A1,A2,...,An,
(i) (A1 ∪A2 ∪...∪An)′ = A′
1 ∩A′
2 ∩...∩A′
n.
A special case: (A∪B)′ = A′ ∩B′.
(j) (A1 ∩A2 ∩...∩An)′ = A′
1 ∪A′
2 ∪...∪A′
n.
A special case: (A∩B)′ = A′ ∪B′.

## Page 10

6
Basic Concepts of Probability
EXAMPLE 1.3
We return to Example 1.2 where
S = {1,2,3,4,5,6},
A = {1,2,3},
B = {1,3,5},
C = {2,4,6}.
We have
A′ = {4,5,6},
B′ = {2,4,6},
C′ = {1,3,5}.
We check that
(A∪B)′ = {1,2,3,5}′ = {4,6};
A′ ∩B′ = {4,5,6}∩{2,4,6} = {4,6}.
This agrees with (A∪B)′ = A′ ∩B′.
Also,
(A∩B)′ = {1,3}′ = {2,4,5,6};
A′∪B′ = {4,5,6}∩{2,4,6} = {2,4,5,6}.
This agrees with (A∩B)′ = A′ ∪B′.
Similarly, we can check that
(A∪B∪C)′ = /0 = A′ ∩B′ ∩C′
and
(A∩B∩C)′ = S = A′ ∪B′ ∪C′.
3
COUNTING METHODS
In many instances, we need to count the number of ways that some opera-
tions can be carried out or that certain situations can happen.
There are two fundamental principles in counting:
Multiplication principle
Addition principle
They can be applied to derive some important counting methods:
permutation and combination.
MULTIPLICATION PRINCIPLE
Suppose that r different experiments are to be performed sequentially. Suppose
experiment 1 results in n1 possible outcomes;
for each outcome above, experiment 2 results in n2 possible outcomes;
··· ··· ··· ··· ···
for each outcome above, experiment r results in nr possible outcomes.
Then there are n1n2 ···nr possible outcomes for the r experiments.

## Page 11

Counting Methods
7
EXAMPLE 1.4
How many possible outcomes are there when a die and a coin are
thrown together?
Solution:
Note that for
• experiment 1: throwing a die, there are 6 possible outcomes:
{1,2,3,4,5,6}.
• experiment 2: throwing a coin, with each outcome of experi-
ment 1, there are 2 possible outcomes: {H,T}.
So altogether there are 6×2 = 12 possible outcomes.
In fact, the sample space is given by
S = {(x,y) : x = 1,...,6;y = H or T}.
ADDITION PRINCIPLE
Suppose that an experiment can be performed by k different procedures.
Procedure 1 can be carried out in n1 ways;
Procedure 2 can be carried out in n2 ways;
··· ··· ··· ··· ···
Procedure k can be carried out in nk ways.
Suppose that the “ways” under different procedures do not overlap. Then the total
number of ways we can perform the experiment is
n1 +n2 +...+nk.
EXAMPLE 1.5 (ORCHARD ROAD)
We can take the MRT or bus from home to Orchard road. Suppose
there are three bus routes and two MRT routes. How many ways can
we go from home to Orchard road?
Solution:
Consider the trip from home to Orchard road as an experiment. Two
procedures can used to complete the experiment:
Procedure 1: take MRT – 2 ways.
Procedure 2: take bus – 3 ways.
These ways do not overlap. So the total number of ways we can go
from home to Orchard road is 2+3 = 5.

## Page 12

8
Basic Concepts of Probability
PERMUTATION
A permutation is a selection and arrangement of r objects out of n. In this case,
order is taken into consideration.
The number of ways to choose and arrange r objects out of n, where r ≤n, is de-
noted by Pn
r , where
Pn
r =
n!
(n−r)! = n(n−1)(n−2)...(n−(r −1)).
obj 1
obj 2
obj 3
···
obj r
n ways
(n−1) ways
(n−2) ways
···
(n−(r −1)) ways
REMARK
When r = n, Pn
n = n!.
Essentially, it is the number of ways to arrange n objects in order.
EXAMPLE 1.6
Find the number of possible four-letter code words in which all let-
ters are different.
Solution:
Note that there are n = 26 alphabets, and r = 4 in our case.
So the number of possible four-letter code words is
P26
4 = (26)(25)(24)(23) = 358800.
COMBINATION
A combination is a selection of r objects out of n, without regard to the order.
The number of combinations of choosing r objects out of n, denoted by Cn
r or
 n
r

, is
given by as
n
r

=
n!
r!(n−r)!.
Note that this formula immediately implies
 n
r

=
  n
n−r

.
The derivation is as follows.

## Page 13

Probability
9
(A) Thinking in terms of permutation, the number of ways to choose and arrange
r objects out of n is Pn
r .
(B) On the other hand, the same permutation task can be achieved by con-
ducting the following two experiments sequentially:
(1) Select r objects out of n without regard to the order:
 n
r

ways.
(2) For each such combination, permute its r objects: Pr
r ways.
(C) Therefore, by the multiplication rule, the number of ways to choose and ar-
range r objects out of n is
 n
r

×Pr
r .
(D) As a consequence,
 n
r

×Pr
r = Pn
r , and so we obtain
n
r

= Pn
r
Prr
= n!/(n−r)!
r!
=
n!
r!(n−r)!.
EXAMPLE 1.7
From 4 women and 3 men, find the number of committees of size 3
that can be formed with 2 women and 1 man.
Solution:
The number of ways to select 2 women from 4 is
 4
2

= 6.
The number of ways to select 1 man from 3 is
 3
1

= 3.
By the multiplication rule, the number of committees formed with 2
women and 1 man is
4
2

×
3
1

= 6×3 = 18.
4
PROBABILITY
Intuitively, the term probability is understood as the chance or how likely a
certain event may occur.
More specifically, let A be an event in an experiment. We typically associate a
number, called probability, to quantify how likely the event A occurs. This is
denoted as P(A).
Let us now investigate how we can obtain such a number.
You will discover that the fundamental concept of probability is extended
from an idea based on intuition to a rigorous, abstract, and advanced mathe-
matical theory. It has also wide applications in various scientific disciplines.

## Page 14

10
Basic Concepts of Probability
INTERPRETATION OF PROBABILITY: RELATIVE FREQUENCY
Suppose that we repeat an experiment E for a total of n times.
Let nA be the number of times that the event A occurs.
Then fA = nA/n is called the relative frequency of the event A in the n repetitions of
E.
Clearly, fA may not equal to P(A) exactly. However when n grows large, we expect
fA to be close to P(A); in the sense that fA ≈P(A). Or mathematically,
fA →P(A),
as n →∞.
Thus fA “mimics” P(A), and has the following properties:
(a) 0 ≤fA ≤1.
(b) fA = 1 if A occurs in every repetition.
(c) If A and B are mutually exclusive events, fA∪B = fA + fB.
Extending this idea, we can define probability on a sample space mathemat-
ically.
AXIOMS OF PROBABILITY
Probability, denoted by P(·), is a function on the collection of events of the sample
space S, satisfying:
Axiom 1. For any event A,
0 ≤P(A) ≤1.
Axiom 2. For the sample space,
P(S) = 1.
Axiom 3. For any two mutually exclusive events A and B, that is, A∩B = /0,
P(A∪B) = P(A)+P(B).
EXAMPLE 1.8
Let H denote the event of getting a head when a coin is tossed. Find
P(H), if
(i) the coin is fair;
(ii) the coin is biased and a head is twice as likely to appear as a tail.

## Page 15

Probability
11
Solution:
The sample space is S = {H,T}.
(i) “The coin is fair” means that P(H) = P(T).
The events {H} and {T} are mutually exclusive. Thus based on
Axioms 2 and 3, we have
1 = P(S) = P({H}∪{T}) = P(H)+P(T) = 2P(H).
This gives P(H) = 1/2.
(ii) “A head is twice likely to appear as a tail” means P(H) = 2P(T);
therefore
1 = P(S) = P({H}∪{T}) = P(H)+P(T) = 3P(T).
This gives P(T) = 1/3 and P(H) = 2/3.
Basic Properties of Probability
Using the axioms, we can derive the following propositions.
PROPOSITION 2
The probability of the empty set /0 is P(/0) = 0.
Proof
Since /0∩/0 = /0 and /0 = /0∪/0, applying Axiom 3 leads to
P(/0) = P(/0∪/0) = P(/0)+P(/0) = 2P(/0).
This implies that P(/0) = 0.
✠
PROPOSITION 3
If A1,A2,...,An are mutually exclusive events, that is Ai ∩Aj = /0 for any i ̸= j,
then
P(A1 ∪A2 ∪···∪An) = P(A1)+P(A2)+...+P(An).
Proof
This proposition can be established easily using induction and Ax-
iom 3.
✠
PROPOSITION 4
For any event A, we have
P(A′) = 1−P(A).

## Page 16

12
Basic Concepts of Probability
Proof
Since S = A∪A′ and A∩A′ = /0, based on Axioms 2 and 3, we have
1 = P(S) = P(A∪A′) = P(A)+P(A′).
The result follows.
✠
PROPOSITION 5
For any two events A and B,
P(A) = P(A∩B)+P(A∩B′).
Proof
Based on the properties
A = (A∩B)∪(A∩B′)
and
(A∩B)∩(A∩B′) = /0,
we have
P(A) = P(A∩B)+P(A∩B′).
✠
PROPOSITION 6
For any two events A and B,
P(A∪B) = P(A)+P(B)−P(A∩B).
Proof
Based on the event operations
A∪B = B∪(A∩B′)
and
B∩(A∩B′) = /0,
and Proposition 5 which states
P(A∩B′) = P(A)−P(A∩B),
we have
P(A∪B) = P(B)+P(A∩B′) = P(B)+P(A)−P(A∩B).
✠
PROPOSITION 7
If A ⊂B, then P(A) ≤P(B).

## Page 17

Probability
13
Proof
Since A ⊂B, we have A∪B = B. Also, we have
A∪B = A∪(B∩A′)
and
A∩(B∩A′) = /0.
Thus we obtain
P(B) = P(A∪B) = P(A∪(B∩A′)) = P(A)+P(B∩A′) ≥P(A).
✠
EXAMPLE 1.9
A retail establishment accepts either the American Express or the
VISA credit card.
A total of 24% of its customers carry an American Express card, 61%
carry a VISA card, and 11% carry both.
What is the probability that a customer carries a credit card that the
establishment will accept?
Solution:
Let
A = {the customer carries an American Express Card}
and
V = {the customer carries an VISA Card}.
Then
P(A) = 0.24,
P(V) = 0.61,
P(A∩V) = 0.11.
The question asked for P(A∪V), which is given as
P(A∪V) = P(A)+P(V)−P(A∩V) = 0.24+0.61−0.11 = 0.74.
FINITE SAMPLE SPACE WITH EQUALLY LIKELY OUTCOMES
Consider a sample space S = {a1,a2,...,ak}.
Assume that all outcomes in the sample space are equally likely to occur, i.e.,
P(a1) = P(a2) = ··· = P(ak).
Then for any event A ⊂S,
P(A) = number of sample points in A
number of sample points in S .

## Page 18

14
Basic Concepts of Probability
EXAMPLE 1.10
A box contains 50 bolts and 150 nuts. Half of the bolts and half of the
nuts are rusted.
If one item is chosen at random, what is the probability that it is
rusted or is a bolt?
Solution:
We define the following events
A = {the item is rusted},
B = {the item is a bolt},
S = {all the items}.
Since the item is selected at random, each of the 200 elements in S is
equally likely to be chosen.
• A consists of 25+75 = 100 elements;
• B consists of 50 elements; and
• A∩B consists of 25 elements.
These give
P(A) = 100/200
,
P(B) = 50/200
,
P(A∩B) = 25/200.
Therefore the required probability is
P(A∪B) = P(A)+P(B)−P(A∩B) = 5/8.
5
CONDITIONAL PROBABILITY
Sometimes we need to compute the probability of some events when some
partial information is available.
Specifically, we might need to compute the probability of an event B, given
that we have the information “an event A has occurred”.
Mathematically, we denote
P(B|A)
as the conditional probability of the event B, given that event A has occurred.
DEFINITION 8 (CONDITIONAL PROBABILITY)
For any two events A and B with P(A) > 0, the conditional probability of B
given that A has occurred is defined by
P(B|A) = P(A∩B)
P(A)
.

## Page 19

Conditional Probability
15
EXAMPLE 1.11
A fair die is rolled twice.
(i) What is the probability that the sum of the 2 rolls is even?
(ii) Given that the first roll is a 5, what is the (conditional) probabil-
ity that the sum of the 2 rolls is even?
Solution:
We define the following events:
B
=
{the sum of the 2 rolls is even},
A
=
{the first roll is a 5}.
(i) The sample space is given by
2nd roll
1
2
3
4
5
6
1
(1,1)
(1,2)
(1,3)
(1,4)
(1,5)
(1,6)
2
(2,1)
(2,2)
(2,3)
(2,4)
(2,5)
(2,6)
1st roll
3
(3,1)
(3,2)
(3,3)
(3,4)
(3,5)
(3,6)
4
(4,1)
(4,2)
(4,3)
(4,4)
(4,5)
(4,6)
5
(5,1)
(5,2)
(5,3)
(5,4)
(5,5)
(5,6)
6
(6,1)
(6,2)
(6,3)
(6,4)
(6,5)
(6,6)
It is easy to see that P(B) = 18/36.
(ii) Since we know that A has already happened, we can just look at
the fifth row:
2nd roll
1
2
3
4
5
6
1st roll
5
(5,1)
(5,2)
(5,3)
(5,4)
(5,5)
(5,6)
We are interested to look for instances along this row that gives
an even sum. So P(B|A) = 3/6.
Alternatively, we can use the formula:
P(B|A) = P(AB)
P(A) =
3
36
6
36
.

## Page 20

16
Basic Concepts of Probability
REMARK (REDUCED SAMPLE SPACE)
P(B|A) is read as:
“the conditional probability that B occurs given that A has occurred.”
Since we know that A has occurred, regard A as our new, or reduced sample space.
The conditional probability that the event B given A will equal the probability of
A∩B relative to the probability of A.
MULTIPLICATION RULE
Starting from the definition of conditional probability, and rearranging the terms,
we have
P(A∩B)
=
P(A)P(B|A),
if P(A) ̸= 0
or
P(A∩B)
=
P(B)P(A|B),
if P(B) ̸= 0.
This is known as the Multiplication Rule.
INVERSE PROBABILITY FORMULA
The multiplication rule together with the definition of the conditional probability
gives us:
P(A|B) = P(A)P(B|A)
P(B)
.
This is known as the Inverse Probability Formula.
EXAMPLE 1.12
Deal 2 cards from a regular playing deck without replacement. What
is the probability that both cards are aces?
Solution:
P(both aces) = P(1st card is ace and 2nd card is ace)
= P(1st card ace)·P(2nd card ace|1st card ace)
= 4
52 · 3
51 =
1
221.

## Page 21

Independence
17
6
INDEPENDENCE
We saw several examples where conditioning on one event changes our be-
liefs about the probability of another event.
In this section, we discuss the important concept of independence, where
learning that the event B occurred gives us no information that would change
our probabilities for another event A occurring.
DEFINITION 9 (INDEPENDENCE)
Two events A and B are independent if and only if
P(A∩B) = P(A)P(B).
We denote this by A ⊥B.
If A and B are not independent, they are said to be dependent, denoted by A ̸⊥B.
REMARK
If P(A) ̸= 0, A ⊥B if and only if P(B|A) = P(B).
This follows from the definition of conditional probability –
A ⊥B ⇔P(B|A) = P(A∩B)
P(A)
= P(A)P(B)
P(A)
= P(B).
Intuitively, this is the same as saying that A and B are independent if the knowledge
of A does not change the probability of B.
Likewise, if P(B) ̸= 0, A ⊥B if and only if P(A|B) = P(A).
EXAMPLE 1.13
Suppose we roll 2 fair dice.
(i) Let
A6 = {the sum of two dice is 6},
B = {the first die equals 4}.
Thus
P(A6) = 5/36,
P(B) = 6/36 = 1/6
and
P(A6 ∩B) = 1/36.
As P(A6 ∩B) ̸= P(A6)P(B), we say that A6 and B are dependent.

## Page 22

18
Basic Concepts of Probability
(ii) Let
A7 = {the sum of two dice is 7}.
Then
P(A7 ∩B) = 1/36,
P(A7) = 1/6
and
P(B) = 1/6.
As P(A7∩B) = P(A7)P(B), we say that A7 and B are independent.
INDEPENDENT VS MUTUALLY EXCLUSIVE
Independence and mutually exclusivity are totally different concepts:
A,B independent ⇔P(A∩B) = P(A)P(B)
A,B mutually exclusive ⇔A∩B = /0
“Mutually exclusivity” can be illustrated by a Venn diagram (like below), but we
can not do that for “independence”.
A
B
S
7
THE LAW OF TOTAL PROBABILITY
The definition of conditional probability has far-reaching consequences.
In this section we look at the Law of Total Probability (LOTP), which relates
conditional probability to unconditional probability.
DEFINITION 10 (PARTITION)
If A1,A2,...,An are mutually exclusive events and ∪n
i=1Ai = S, we call
A1,A2,...,An a partition of S.

## Page 23

The Law of Total Probability
19
THEOREM 11 (LAW OF TOTAL PROBABILITY)
Suppose A1,A2,...,An is a partition of S. Then for any event B, we have
P(B) =
n
∑
i=1
P(B∩Ai) =
n
∑
i=1
P(Ai)P(B|Ai).
SPECIAL CASE: LAW OF TOTAL PROBABILITY
For any events A and B, we have
P(B) = P(A)P(B|A)+P(A′)P(B|A′).
EXAMPLE 1.14 (FRYING FISH)
At a nasi lemak stall, the chef and his assistant take turns to fry fish.
The chef burns his fish with probability 0.1, his assistant burns his
fish with probability 0.23.
If the chef is frying fish 80% of the time, what is the probability that
the fish you order is burnt?
Solution:
Let
B
=
{the fish is burnt},
C
=
{the fish is fried by the chef}.
We then need to compute P(B). Using the Law of Total Probability,
P(B) = P(C)P(B|C)+P(C′)P(B|C′) = 0.8×0.1+0.2×0.23.

## Page 24

20
Basic Concepts of Probability
8
BAYES’ THEOREM
We now discuss Bayes’ Theorem (or Bayes’ Rule), which will allow us to
relate P(A|B) to P(B|A) and compute conditional probabilities in a wide range
of problems.
THEOREM 12 (BAYES’ THEOREM)
Let A1,A2,...,An be a partition of S, then for any event B and k = 1,2,...,n,
P(Ak|B) =
P(Ak)P(B|Ak)
∑n
i=1 P(Ai)P(B|Ai).
Proof
Bayes’ Theorem can be derived based on the definition of condi-
tional probability, the Multiplication Rule, and the Law of Total Probability.
In particular,
P(Ak|B)
=
P(Ak ∩B)
P(B)
= P(Ak)P(B|Ak)
∑n
i=1 P(B∩Ai)
=
P(Ak)P(B|Ak)
∑n
i=1 P(Ai)P(B|Ai).
✠
SPECIAL CASE: BAYES’ THEOREM
Let us consider a special case of Bayes’ Theorem when n = 2.
{A,A′} becomes a partition of S, and we have
P(A|B) =
P(A)P(B|A)
P(A)P(B|A)+P(A′)P(B|A′).
EXAMPLE 1.15
The previous formula is practically meaningful.
For example, consider the events
A = disease status of a person,
B = symptom observed.
Then
• P(A): probability of a disease in general;
• P(B|A): if diseased, probability of observing symptom;
• P(A|B): if symptom observed, probability of diseased.

## Page 25

Bayes’ Theorem
21
EXAMPLE 1.16
Historically, we observe the collapse of some newly constructed house.
The chance that the design of the house is faulty is 1%. If the design
is faulty, the chance that the house collapses is 75%; otherwise, the
chance is 0.01%.
We observe that a newly constructed house collapsed, what is the
probability that the design is faulty?
Solution:
Let
B = {The design is faulty},
A = {The house collapses}.
We then have
P(B) = 0.01,
P(A|B) = 0.75,
and
P(A|B′) = 0.0001.
The question asked for P(B|A). We will compute it using Bayes’ The-
orem.
The denominator can be computed using the Law of Total Probabil-
ity:
P(A)
=
P(B)P(A|B)+P(B′)P(A|B′)
=
(0.01)(0.75)+(0.99)(0.0001) = 0.007599.
The numerator is
P(A|B)P(B) = 0.75(0.01) = 0.0075.
As a consequence,
P(B|A) = P(A|B)P(B)
P(A)
= 0.9870.

## Page 26

22
Basic Concepts of Probability

## Page 27

Two
Random Variables
1
DEFINITION OF A RANDOM VARIABLE
Often, when an experiment is performed, we are interested in some function
(numerical characteristic) of the outcome, rather than the actual outcome it-
self.
For example,
• in an experiment involving the examination of 100 electronic compo-
nents, our interest is in the number of defective components.
• in an experiment of flipping a coin 100 times, our interest is in the num-
ber of heads obtained, instead of the ”H” and ”T” sequence.
This motivates us to assign numerical values to (possible) outcomes of an
experiment.
DEFINITION 1 (RANDOM VARIABLE)
Let S be the sample space of an experiment. A function X, which assigns a real
number to every s ∈S is called a random variable.
REMARK
So a random variable X is a function from S to R:
X : S 7→R.
23

## Page 28

24
Random Variables
A random variable maps the sample space into the real line. The random variable X depicted
here is defined on a sample space with 6 elements {s1,s2,...,s6}, and has possible values 0, 1,
and 4.
DEFINITION 2 (RANGE SPACE)
The range space of X is the set of real numbers
RX = {x|x = X(s),s ∈S}.
Each possible value x of X corresponds to an event that is a subset or element of
the sample space S.
EXAMPLE 2.1
Let S = {HH,HT,TH,TT} be the sample space associated with the
experiment of flipping two fair coins.
Define the random variable:
X = number of heads obtained.
Note that X is a function from S to R, the set of real numbers:
X(HH) = 2,
X(HT) = X(TH) = 1,
X(TT) = 0.
The range of X is RX = {0,1,2}.

## Page 29

Definition of a Random Variable
25
NOTATIONS
(i) We use upper case letters X,Y,Z,X1,X2,... to denote random variables.
(ii) We use lower case letters x,y,z,x1,x2,... to denote their observed values in the
experiment.
(iii) The set {X = x} = {s ∈S : X(s) = x} is a subset of S.
(iv) If A is a subset of R, the set {X ∈A} = {s ∈S : X(s) ∈A} is a subset of S.
(v) With the above expressions, we define P(X = x) and P(X ∈A) as
P(X = x)
=
P({s ∈S : X(s) = x});
P(X ∈A)
=
P({s ∈S : X(s) ∈A}).
EXAMPLE 2.2
We revisit Example 2.1, where S = {HH,HT,TH,TT} is the sample
space associated with flipping two fair coins, and X is the number of
heads obtained.
We then have
{X = 0} = {TT};
{X = 1} = {HT,TH};
{X = 2} = {HH};
{X ≥1} = {HT,TH,HH}.
Thus
P(X = 0) = P(TT) = 1/4;
P(X = 1) = P({HT,TH}) = 2/4;
P(X = 2) = P(HH) = 1/4;
P(X ≥1) = P({HT,TH,HH}) = 3/4.
We can then summarize the probabilities of the random variable X
using a table:
x
0
1
2
P(X = x)
1/4
1/2
1/4

## Page 30

26
Random Variables
2
PROBABILITY DISTRIBUTION
There are two main types of random variables used in practice: discrete and
continuous.
Let us denote by X the random variable, and it’s range by RX. For a
• discrete random variable, the number of values in RX is finite or count-
able. That is, we can write RX = {x1,x2,x3,...}.
• continuous random variable, RX is an interval or a collection of inter-
vals.
Discrete random variable
Consider a discrete random variable X with RX = {x1,x2,x3,...}.
For each x ∈RX, let P(X = x) be the probability that X takes the value x.
DEFINITION 3 (PROBABILITY MASS FUNCTION)
For a discrete random variable X, define
f(x) =
(
P(X = x),
for x ∈RX;
0,
for x /∈RX.
Then f(x) is known as the probability function (pf), or probability mass
function (pmf) of X.
The collection of pairs (xi, f(xi)),i = 1,2,3,..., is called the probability distri-
bution of X.
PROPERTIES OF THE PROBABILITY MASS FUNCTION
The probability mass function f(x) of a discrete random variable must satisfy:
(1) f(xi) ≥0 for all xi ∈RX;
(2) f(x) = 0 for all x /∈RX;
(3)
∞
∑
i=1
f(xi) = 1, or ∑
xi∈RX
f(xi) = 1.
For any set B ⊂R, we have
P(X ∈B) =
∑
xi∈B∩RX
f(xi).

## Page 31

Probability Distribution
27
EXAMPLE 2.3
We revisit Examples 2.1 and 2.2.
Recall that random variable X is the number of heads observed when
we flip two fair coins.
The probability function of X is given below
x
0
1
2
f(x)
1/4
1/2
1/4
Note that f(x) satisfies
(1) f(xi) ≥0 for xi = 0,1, or 2;
(2) f(x) = 0 for x /∈RX;
(3) f(0)+ f(1)+ f(2) = 1.
When B = [1,∞),
P(X ∈B) = f(1)+ f(2) = 3/4.
Continuous random variable
For a continuous random variable X, RX is an interval or a collection of inter-
vals.
We next define the probability function (pf), or probability density function
(pdf), to quantify the probability that X is in a certain range.
DEFINITION 4 (PROBABILITY DENSITY FUNCTION)
The probability density function of a continuous random variable X, denoted
by f(x), is a function that satisfies:
(1) f(x) ≥0 for all x ∈RX; and f(x) = 0 for x /∈RX;
(2)
Z
RX
f(x)dx = 1;
(3) For any a and b such that a ≤b,
P(a ≤X ≤b) =
Z b
a f(x)dx.

## Page 32

28
Random Variables
REMARK
• Note that Condition (2) is equivalent to
Z ∞
−∞f(x)dx = 1,
since f(x) = 0 for x /∈RX.
• For any specific value x0, we have
P(X = x0) =
Z x0
x0
f(x)dx = 0.
The gives an example of “P(A) = 0, but A is not necessarily /0.”
• Furthermore, we have
P(a < X < b) = P(a < X ≤b) = P(a ≤X < b) = P(a ≤X ≤b) =
Z b
a f(x)dx.
They all represent the area under the graph of f(x) between x = a and x = b.
P(a < X < b)
a
b
f(x)
• To check that a function f(x) is a probability density function, it suffices to
check Conditions (1) and (2). Namely,
(1) f(x) ≥0 for all x ∈RX; and f(x) = 0 for x /∈RX.
(2)
Z
RX
f(x)dx = 1.

## Page 33

Cumulative Distribution Function
29
EXAMPLE 2.4
Let X be a continuous random variable with probability density func-
tion given by
f(x) =
(
cx,
for 0 < x < 1;
0,
otherwise .
(i) Find the value of c;
(ii) Find P(X ≤1/2).
Solution:
(i) Since
Z ∞
−∞f(x)dx =
Z 1
0 cxdx = c· x2
2

1
0
= c/2,
we set c/2 = 1. This results in c = 2.
(ii)
P(X ≤1/2) =
Z 1/2
−∞f(x)dx =
Z 1/2
0
2xdx = 1/4.
3
CUMULATIVE DISTRIBUTION FUNCTION
Another function that describes the distribution of a random variable is the
cumulative distribution function (cdf).
DEFINITION 5 (CUMULATIVE DISTRIBUTION FUNCTION)
For any random variable X, we define its cumulative distribution function
(cdf) by
F(x) = P(X ≤x).
REMARK
This definition is applicable whether X is a discrete or continuous random variable.

## Page 34

30
Random Variables
CDF: DISCRETE RANDOM VARIABLE
If X is a discrete random variable, we have
F(x)
=
∑
t∈RX;t≤x
f(t)
=
∑
t∈RX;t≤x
P(X = t)
The cumulative distribution function of a discrete
random variable is a step function.
For any two numbers a < b, we have
P(a ≤X ≤b) = P(X ≤b)−P(X < a) = F(b)−F(a−),
where ”a−” represents the ”largest value in RX that is smaller than a”. Mathemati-
cally,
F(a−) = lim
x↑a F(x).
EXAMPLE 2.5
We revisit Examples 2.1 and 2.2. The random variable X is the num-
ber of heads observed when we flip two fair coins, and has the prob-
ability function
x
0
1
2
f(x)
1/4
1/2
1/4
We have
F(0) = f(0) = 1/4, F(1) = f(0)+ f(1) = 3/4, F(2) = f(0)+ f(1)+ f(2) = 1.
We can therefore obtain the cumulative distribution function:
F(x) =











0,
x < 0
1/4,
0 ≤x < 1
3/4,
1 ≤x < 2
1,
2 ≤x
.
EXAMPLE 2.6
Consider the cumulative distribution function from Example 2.5:
F(x) =











0,
x < 0
1/4,
0 ≤x < 1
3/4,
1 ≤x < 2
1,
2 ≤x
.

## Page 35

Cumulative Distribution Function
31
Derive the corresponding probability function. 1
Solution:
As F(·) only has four possible values, the distribution is a discrete
distribution.
We obtain RX = {0,1,2}, which are the jumping points of F(·). It is
also the set where f(x) is non-zero.
We have
f(0)
=
P(X = 0) = F(0)−F(0−) = 1/4−0 = 1/4;
f(1)
=
P(X = 1) = F(1)−F(1−) = 3/4−1/4 = 1/2;
f(2)
=
P(X = 2) = F(2)−F(2−) = 1−3/4 = 1/4.
CDF: CONTINUOUS RANDOM VARIABLE
If X is a continuous random variable,
F(x) =
Z x
−∞f(t)dt,
and
f(x) = dF(x)
dx
.
Further
P(a ≤X ≤b) = P(a < X < b) = F(b)−F(a).
EXAMPLE 2.7
Suppose the probability density function of a random variable X is
f(x) =
(
2x,
0 ≤x < 1
0,
elsewhere .
The cumulative distribution function of X is then
F(x) =
Z x
−∞f(t)dt =





0,
x < 0
x2,
0 ≤x < 1
1,
1 ≤x
.
1Let us pretend for a while that the cumulative distribution function is the only informa-
tion available for this distribution.

## Page 36

32
Random Variables
EXAMPLE 2.8
Consider the cumulative distribution function from Example 2.7:
F(x) =





0,
x < 0
x2,
0 ≤x < 1
1,
1 ≤x
.
Derive the corresponding probability function. 2
Solution:
F(x) is a cumulative distribution function for a continuous distribu-
tion, because when it is not equal to 0 and 1, it assumes different
values in the interval x ∈[0,1).
f(x) = 0 when x /∈[0,1) because d
dx(0) = d
dx(1) = 0.
f(x) = d
dx(x2) = 2x when x ∈[0,1).
REMARK
(i) No matter if X is discrete or continuous, F(x) is non-decreasing. In the sense
that for any x1 < x2, F(x1) ≤F(x2).
(ii) The probability function and cumulative distribution function have a one-to-
one correspondence. That is, for any probability function given, the cumula-
tive distribution function is uniquely determined; and vice versa.
(iii) The ranges of F(x) and f(x) satisfy:
• 0 ≤F(x) ≤1;
• for discrete distributions, 0 ≤f(x) ≤1;
• for continuous distributions, f(x) ≥0, but not necessary that f(x) ≤1.
4
EXPECTATION AND VARIANCE
For a random variable X, one natural question to ask is: what is the average
value of X, if the corresponding experiment is repeated many times?
For example, suppose X is the number obtained when we roll a die. We may
want to know the average value obtained if we roll the die continuously.
Such an average, over the long run, is called the mean or expectation of X.
2Let us pretend for a while that the cumulative distribution function is the only informa-
tion available for this distribution.

## Page 37

Expectation and Variance
33
DEFINITION 6 (EXPECTATION: DISCRETE RANDOM VARIABLE)
Let X be a discrete random variable with RX = {x1,x2,x3,....} and probability
function f(x). The expectation or mean of X is defined by
E(X) = ∑
xi∈RX
xi f(xi).
By convention, we also denote µX = E(X).
DEFINITION 7 (EXPECTATION: CONTINUOUS RANDOM VARIABLE)
Let X be a continuous random variable with probability function f(x). The ex-
pectation or mean of X is defined by
µX = E(X) =
Z ∞
−∞x f(x)dx =
Z
x∈RX
x f(x)dx.
REMARK
The mean of X is not necessarily a possible value of the random variable X.
EXAMPLE 2.9
Suppose we toss a fair die and the upper face is recorded as X. We
have
P(X = k) = 1/6,
for k = 1,2,...,6,
and
E (X) = 1× 1
6 +2× 1
6 +···+6× 1
6 = 3.5.
Here we have a random variable whose mean is not a value that X
assumes.
EXAMPLE 2.10
The probability density function of weekly gravel sales X is
f(x) =
(
3
2(1−x2),
0 < x < 1
0,
otherwise .
We then have
E(X)
=
Z ∞
−∞x f(x)dx =
Z 1
0
3x
2 (1−x2)dx
=
3
2
Z 1
0 (x−x3)dx = 3
2

x2
2 −x4
4

1
0 = 3/8.

## Page 38

34
Random Variables
PROPERTIES OF EXPECTATION
(1) Let X be a random variable, and let a and b be any real numbers. Then
E(aX +b) = aE(X)+b.
(2) Let X and Y be two random variables. We have
E(X +Y) = E(X)+E(Y).
(3) Let g(·) be an arbitrary function.
• If X is a discrete random variable with probability mass function f(x) and
range RX,
E[g(X)] = ∑
x∈RX
g(x)f(x).
• If X is a continuous random variable with probability density function
f(x) and range RX,
E[g(X)] =
Z
RX
g(x)f(x)dx.
Variance
Let g(x) = (x−µX)2, then E[g(X)] is defined as the variance for X.
DEFINITION 8 (VARIANCE)
Let X be a random variable. The variance of X is defined as
σ2
X = V(X) = E(X −µX)2.
REMARK
• This definition is applicable whether X is discrete or continuous.
• If X is a discrete random variable with probability mass function f(x) and
range RX,
V(X) = ∑
x∈RX
(x−µX)2 f(x).
• If X is a continuous random variable with probability density function f(x),
V(X) =
Z ∞
−∞(x−µX)2 f(x)dx.
• V(X) ≥0 for any X. Equality holds if and only P(X = E(X)) = 1, that is, when
X is a constant.

## Page 39

Expectation and Variance
35
• Let a and b be any real numbers, then V(aX +b) = a2V(X).
• The variance can also be computed by an alternative formula:
V(X) = E(X2)−[E(X)]2.
• The positive square root of the variance is defined as the standard deviation
of X:
σX =
p
V(X).
EXAMPLE 2.11
Let the probability function of a random variable X be given by
x
−1
0
1
2
f(x)
1/8
2/8
1/8
4/8
Find E(X) and V(X).
Solution:
The mean is given as
E(X)
=
∑
x∈RX
x f(x)
=
(−1)
  1
8

+0
 2
8

+1
  1
8

+2
  4
8

= 1.
The variance is given as
V(X)
=
∑
x∈RX
[x−E(X)]2 f(x) = ∑
x∈RX
[x−1]2 f(x)
=
(−1−1)2   1
8

+(0−1)2   2
8

+(1−1)2   1
8

+(2−1)2   4
8

= 5
4.
EXAMPLE 2.12
Denote by X the amount of time that a book on reserve at the library
is checked out by a randomly selected student. Suppose X has the
probability density function
f(x) =
 x/2,
0 ≤x < 2,
0,
otherwise.
Compute E(X), V(X), and σX.

## Page 40

36
Random Variables
Solution:
We can compute
E(X) =
Z ∞
−∞x f(x)dx =
Z 2
0 x·x/2dx = x3
6

2
0
= 4/3;
E(X2) =
Z ∞
−∞x2 f(x)dx =
Z 2
0 x2 ·x/2dx = x4
8

2
0
= 2.
Using V(X) = E(X2)−[E(X)]2, we obtain
V(X) = 2−(4/3)2 = 2/9
and
σX =
p
V(X) =
√
2/3.

## Page 41

Expectation and Variance
37

## Page 43

Three
Joint Distributions
1
JOINT DISTRIBUTIONS FOR MULTIPLE RANDOM VARIABLES
Very often, we are interested in more than one random variables simultane-
ously.
• For example, an investigator might be interested in both the height (H)
and the weight (W) of individuals from a certain population.
• Another investigator could be interested in both the hardness (H) and
the tensile strength (T) of a piece of cold-drawn copper.
DEFINITION 1 (TWO-DIMENSIONAL RANDOM VECTOR)
Let E be an experiment and S be a corresponding sample space. Suppose X and Y
are two functions each assigning a real number to each s ∈S.
We call (X,Y) a two-dimensional random vector, or a two-dimensional
random variable.
DEFINITION 2 (RANGE SPACE)
Similar to the one-dimensional situation, we can denote the range space of (X,Y)
by
RX,Y = {(x,y) | x = X(s),y = Y(s),s ∈S}.
The definitions above can be extended to more than two random variables.
DEFINITION 3 (n-DIMENSIONAL RANDOM VECTOR)
Let X1,X2,...,Xn be n functions each assigning a real number to every outcome
s ∈S.
We call (X1,X2,...,Xn) a n-dimensional random vector, or a n-dimensional
random variable.
39

## Page 44

40
Joint Distributions
We define the discrete and continuous two-dimensional random variables as
follows.
DEFINITION 4
(X,Y) is a discrete two-dimensional random variable if the number of pos-
sible values of (X(s),Y(s)) are finite or countable. That is, the possible values of
(X(s),Y(s)) may be represented by
(xi,y j),
i = 1,2,3,...; j = 1,2,3,...
(X,Y) is a continuous two-dimensional random variable if the possible val-
ues of (X(s),Y(s)) can assume any value in some region of the Euclidean space
R2.
REMARK
We can view X and Y separately to judge whether (X,Y) is discrete or continuous.
• If both X and Y are discrete random variables, then (X,Y) is discrete.
• If both X and Y are continuous random variables, then (X,Y) is continuous.
• Clearly, there are other cases. For example, X is discrete, but Y is continuous.
These are not the focus of this course.
EXAMPLE 3.1
Consider a TV set that needs to be serviced.
Let X be the age of the set, rounded to the nearest year, and Y be the
numbers of defective components in the set.
Then (X,Y) is a discrete 2-dimensional random variable and its range
space is given as
RX,Y = {(x,y) | x = 0,1,2,...;y = 0,1,2,...,n},
where n is the total number of components in the TV.
For example, (X,Y) = (5,3) means that the TV is 5 years old and has
3 defective components.

## Page 45

Joint Distributions for Multiple Random Variables
41
Joint Probability Function
We will now introduce the probability functions for discrete and continuous
random vectors.
For the discrete random vector, similar to the one-dimensional case, we de-
fine its probability function by associating a number with each possible value
of the random variable.
DEFINITION 5 (DISCRETE JOINT PROBABILITY FUNCTION)
Let (X,Y) be a 2-dimensional discrete random variable. Its joint probability
(mass) function is defined by
fX,Y(x,y) = P(X = x,Y = y),
for (x,y) ∈RX,Y.
PROPERTIES OF THE DISCRETE JOINT PROBABILITY FUNCTION
The joint probability mass function has the following properties:
(1) fX,Y(x,y) ≥0 for any (x,y) ∈RX,Y.
(2) fX,Y(x,y) = 0 for any (x,y) /∈RX,Y.
(3)
∞
∑
i=1
∞
∑
j=1
fX,Y(xi,y j) =
∞
∑
i=1
∞
∑
j=1
P(X = xi,Y = yj) = 1.
Equivalently, ∑∑(x,y)∈RX,Y f(x,y) = 1.
(4) Let A be any subset of RX,Y, then
P((X,Y) ∈A) = ∑∑(x,y)∈A fX,Y(x,y).
EXAMPLE 3.2
Find the value of k such that
f(x,y) = kxy,
for x = 1,2,3 and y = 1,2,3,
can serve as a joint probability function.
Solution:
Note that RX,Y = {(x,y) | x = 1,2,3;y = 1,2,3}, and
f(1,1) = k,
f(1,2) = 2k,
f(1,3) = 3k,
f(2,1) = 2k,
f(2,2) = 4k,
f(2,3) = 6k,
f(3,1) = 3k,
f(3,2) = 6k,
f(3,3) = 9k.

## Page 46

42
Joint Distributions
Using Property (3), we have
1
= ∑∑(x,y)∈RX,Y f(x,y)
=
1k +2k +3k +2k +4k +6k +3k +6k +9k.
This results in k = 1/36.
DEFINITION 6 (CONTINUOUS JOINT PROBABILITY FUNCTION)
Let (X,Y) be a 2-dimensional continuous random variable. Its joint probabil-
ity (density) function is a function fX,Y(x,y) such that
P((X,Y) ∈D) =
ZZ
(x,y)∈D fX,Y(x,y)dydx,
for any D ⊂R2. More specifically,
P(a ≤X ≤b,c ≤Y ≤d) =
Z b
a
Z d
c fX,Y(x,y)dydx.
PROPERTIES OF THE CONTINUOUS JOINT PROBABILITY FUNCTION
The joint probability density function has the following properties:
(1) fX,Y(x,y) ≥0, for any (x,y) ∈RX,Y.
(2) fX,Y(x,y) = 0, for any (x,y) /∈RX,Y.
(3)
Z ∞
−∞
Z ∞
−∞fX,Y(x,y)dxdy = 1.
Equivalently,
ZZ
(x,y)∈RX,Y
fX,Y(x,y)dxdy = 1.

## Page 47

Marginal and Conditional Distributions
43
EXAMPLE 3.3
Find the value c such that f(x,y) below can serve as a joint probability
density function for a random variable (X,Y):
f(x,y) =
(
cx(x+y),
0 ≤x ≤1;1 ≤y ≤2,
0,
elsewhere.
Solution:
In order for f(x,y) to be a probability density function, we need
1 =
Z ∞
−∞
Z ∞
−∞f(x,y)dydx =
Z 1
0
Z 2
1 cx(x+y)dydx
= c
Z 1
0 x

x+ 1
2y2
2
1
dx = c
Z 1
0 x(x+1.5)dx
= c
1
3x3 +1.5· 1
2x2
1
0
= c· 13
12.
This implies that c = 12/13.
2
MARGINAL AND CONDITIONAL DISTRIBUTIONS
We now consider the marginal distributions.
Put simply, the marginal distribution of X is the individual distribution of X,
igNORing the value of Y.
DEFINITION 7 (MARGINAL PROBABILITY DISTRIBUTION)
Let (X,Y) be a two-dimensional random variable with joint probability function
fX,Y(x,y). We define the marginal distribution of X as follows.
If Y is a discrete random variable, then for any x,
fX(x) = ∑
y
fX,Y(x,y).
If Y is a continuous random variable, then for any x,
fX(x) =
Z ∞
−∞fX,Y(x,y)dy.

## Page 48

44
Joint Distributions
REMARK
• fY(y) for Y is defined in the same way as that of X.
• We can view the marginal distribution as the “projection” of the 2D function
fX,Y(x,y) to the 1D function.
• Intuitively, it is the distribution of X by igNORing the presence of Y.
For example, consider a person from a certain community.
– Suppose X = body weight, Y = height, and (X,Y) has joint distribution
fX,Y(x,y).
– The marginal distribution fX(x) of X is the distribution of body
weights for all people in the community.
• fX(x) should not involve the variable y. This can be viewed from its defini-
tion: y is either summed out or integrated over.
• fX(x) is a probability function; so it satisfies all the properties of the proba-
bility function.
EXAMPLE 3.4
We revisit Example 3.2. The joint probability function is given by
f(x,y) = 1
36xy,
for x = 1,2,3 and y = 1,2,3.
Note that X has three possible values: 1, 2, and 3. The marginal dis-
tribution for X is given by
• for x = 1, fX(1) = f(1,1)+ f(1,2)+ f(1,3) = 6/36 = 1/6.
• for x = 2, fX(2) = f(2,1)+ f(2,2)+ f(2,3) = 12/36 = 1/3.
• for x = 3, fX(3) = f(3,1)+ f(3,2)+ f(3,3) = 18/36 = 1/2.
For other values of x, fX(x) = 0.
Alternatively, for each x ∈{1,2,3},
fX(x) = ∑
y
f(x,y) =
3
∑
y=1
1
36xy = 1
36x
3
∑
y=1
y = 1
6x.
DEFINITION 8 (CONDITIONAL DISTRIBUTION)
Let (X,Y) be a random variable with joint probability function fX,Y(x,y). Let
fX(x) be the marginal probability function for X. Then for any x such that fX(x) >
0, the conditional probability function of Y given X = x is defined to be
fY|X(y|x) = fX,Y(x,y)
fX(x)
.

## Page 49

Marginal and Conditional Distributions
45
REMARK
• For any y such that fY(y) > 0, we can similarly define the conditional distri-
bution of X given Y = y as
fX|Y(x|y) = fX,Y(x,y)
fY(y)
.
• fY|X(y|x) is defined only for x such that fX(x) > 0; likewise fX|Y(x|y) is defined
only for y such that fY(y) > 0.
• The intuitive meaning of fY|X(y|x): the distribution of Y given that the ran-
dom variable X is observed to take the value x.
• Considering y as the variable (and x as a fixed value), fY|X(y|x) is a probability
function, so it must satisfy all the properties of a probability function.
• However, fY|X(y|x) is not a probability function for x. This means that there
is NO requirement that
–
Z ∞
−∞fY|X(y|x)dx = 1, for X continuous; or
– ∑
x
fY|X(y|x) = 1, for X discrete.
• With this definition, we immediately have
– If fX(x) > 0, fX,Y(x,y) = fX(x)fY|X(y|x).
– If fY(y) > 0, fX,Y(x,y) = fY(y)fX|Y(x|y).
• One immediate application of the conditional distribution is to compute, for
continuous random variable,
P(Y ≤y|X = x)
=
Z y
−∞fY|X(y|x)dy;
E(Y|X = x)
=
Z ∞
−∞yfY|X(y|x)dy.
Their interpretations are clear: the former is the probability that Y ≤y, given
X = x; the latter is the average value of Y given X = x.
For the discrete case, the results can be similarly established, based on the
definition of fY|X(y|x).

## Page 50

46
Joint Distributions
EXAMPLE 3.5
We revisit Examples 3.2 and 3.4. The joint probability function for
(X,Y) is given by
f(x,y) = xy/36,
for x = 1,2,3 and y = 1,2,3.
The marginal probability function for X is
fX(x) = x/6,
for x = 1,2,3.
Therefore fY|X(y|x) is defined for any x = 1,2,3:
fY|X(y|x) = f(x,y)
fX(x) = (xy/36)
(x/6) = y/6,
for y = 1,2,3.
We can also compute
P(Y = 2|X = 1)
=
fY|X(2|1) = 1
6 ×2 = 1/3;
P(Y ≤2|X = 1)
=
P(Y = 1|X = 1)+P(Y = 2|X = 1)
=
fY|X(1|1)+ fY|X(2|1) = 1/6+1/3 = 1/2;
E(Y|X = 2)
=
1· fY|X(1|2)+2· fY|X(2|2)+3· fY|X(3|2)
=
1·(1/6)+2·(2/6)+3·(3/6) = 7/3.
3
INDEPENDENT RANDOM VARIABLES
We next discuss independence for random variables.
DEFINITION 9 (INDEPENDENT RANDOM VARIABLES)
Random variables X and Y are independent if and only if for any x and y,
fX,Y(x,y) = fX(x)fY(y).
Random variables X1,X2,...,Xn are independent if and only if for any
x1,x2,...,xn,
fX1,X2,...,Xn(x1,x2,...xn) = fX1(x1)fX2(x2)··· fXn(xn).

## Page 51

Independent Random Variables
47
REMARK
• The above definition is applicable whether (X,Y) is continuous or discrete.
• The “product feature” in the definition implies one necessary condition for
independence: RX,Y needs to be a product space. In the sense that if X and Y
are independent, for any x ∈RX and any y ∈RY, we have
fX,Y(x,y) = fX(x)fY(y) > 0,
implying RX,Y = {(x,y)|x ∈RX;y ∈Ry} = RX ×RY.
Conclusion:
If RX,Y is not a product space, then X and Y are not independent!
PROPERTIES OF INDEPENDENT RANDOM VARIABLES
Suppose X,Y are independent random variables.
(1) If A and B are arbitrary subsets of R, the events X ∈A and Y ∈B are independent
events in S. Thus
P(X ∈A;Y ∈B) = P(X ∈A)P(Y ∈B).
In particular, for any real numbers x,y,
P(X ≤x;Y ≤y) = P(X ≤x)P(Y ≤y).
(2) For arbitrary functions g1(·) and g2(·), g1(X) and g2(Y) are independent. For
example,
• X2 and Y are independent.
• sin(X) and cos(Y) are independent.
• eX and log(Y) are independent.
(3) Independence is connected with conditional distribution.
• If fX(x) > 0, then fY|X(y|x) = fY(y).
• If fY(y) > 0, then fX|Y(x|y) = fX(x).

## Page 52

48
Joint Distributions
EXAMPLE 3.6
The joint probability function of (X,Y) is given below.
x
y
fX(x)
1
3
5
2
0.1
0.2
0.1
0.4
4
0.15
0.3
0.15
0.6
fY(y)
0.25
0.5
0.25
1
Are X and Y independent?
Solution:
We need to check that for every x and y combination, whether we
have
fX,Y(x,y) = fX(x)fY(y).
For example, from the table, we have fX,Y(2,1) = 0.1; fX(2) = 0.4,
fY(1) = 0.25. Therefore
fX,Y(2,1) = 0.1 = 0.4×0.25 = fX(2)fY(1).
In fact, we can check for each x ∈{2,4} and y ∈{1,3,5} combination,
the equality holds. Therefore X and Y are independent.
4
EXPECTATION AND COVARIANCE
Similar to one dimensional random variable, we can talk about the expecta-
tion of a random vector.
DEFINITION 10 (EXPECTATION)
Consider any two variable function g(x,y).
If (X,Y) is a discrete random variable,
E(g(X,Y)) = ∑
x ∑
y
g(x,y)fX,Y(x,y).
If (X,Y) is a continuous random variable,
E(g(X,Y)) =
Z ∞
−∞
Z ∞
−∞g(x,y)fX,Y(x,y)dydx.
If we let
g(X,Y) = (X −E(X))(Y −E(Y)) = (X −µX)(Y −µy),
the expectation E[g(X,Y)] leads to the covariance of X and Y.

## Page 53

Expectation and Covariance
49
DEFINITION 11 (COVARIANCE)
The covariance of X and Y is defined to be
cov(X,Y) = E[(X −E(X))(Y −E(Y))].
REMARK
If X and Y are discrete random variables,
cov(X,Y) = ∑
x ∑
y
(x−µX)(y−µY)fX,Y(x,y).
If X and Y are continuous random variables,
cov(X,Y) =
Z ∞
−∞
Z ∞
−∞(x−µX)(y−µY)fX,Y(x,y)dxdy.

## Page 54

50
Joint Distributions
PROPERTIES OF THE COVARIANCE
The covariance has the following properties.
(1) cov(X,Y) = E(XY)−E(X)E(Y).
This is true because
cov(X,Y) = E[(X −µX)(Y −µY)] = E[XY −Y µX −XµY + µXµY]
= E(XY)−µXE(Y)−µYE(X)+ µXµY
= E(XY)−µXµY −µY µX + µXµY = E(XY)−µXµY.
(2) If X and Y are independent, then cov(X,Y) = 0. However, cov(X,Y) = 0 does
not imply that X and Y are independent.
Take note that the two statements can be summarised as:
(i) X ⊥Y ⇒cov(X,Y) = 0;
(ii) X ⊥Y ̸⇐cov(X,Y) = 0.
For (i), note that if X and Y are independent, then fX,Y(x,y) = fX(x)fY(y). So
E(XY) = ∑
i ∑
j
xiy j fX,Y(xi,y j) = ∑
i ∑
j
xiyj fX(xi)fY(y j)
= ∑
i
xi fX(xi)∑
j
yj fY(y j) = E(X)E(Y).
(3) cov(aX +b,cY +d) = ac·cov(X,Y).
This can be derived using the following 3 formulas:
(i) cov(X,Y) = cov(Y,X);
(ii) cov(X +b,Y) = cov(X,Y);
(iii) cov(aX,Y) = acov(X,Y).
(4) V(aX +bY) = a2V(X)+b2V(Y)+2ab·cov(X,Y).
This can be derived using the following 2 formulas:
(i) V(aX) = a2V(X);
(ii) V(X +Y) = V(X)+V(Y)+2cov(X,Y).

## Page 55

Expectation and Covariance
51
EXAMPLE 3.7
We are given the joint distribution for (X,Y):
x
y
fX(x)
0
1
2
3
0
1/8
1/4
1/8
0
1/2
1
0
1/8
1/4
1/8
1/2
fY(y)
1/8
3/8
3/8
1/8
1
(i) Find E(Y −X).
(ii) Find cov(X,Y).
Solution:
(i) Method 1:
E(Y −X)
=
(0−0)(1/8)+(1−0)(1/4)+(2−0)(1/8)
+...+(3−1)(1/8) = 1.
Method 2:
E(Y −X) = E(Y)−E(X) = 1.5−0.5 = 1,
where
E(Y)
=
0·(1/8)+1·(3/8)+2·(3/8)+3·(1/8) = 1.5
E(X)
=
0·(1/2)+1·(1/2) = 0.5.
(ii) We use cov(X,Y) = E(XY)−E(X)E(Y) to compute. Note that we
have computed E(X) and E(Y) in Part (i).
E(XY)
=
(0)(0)(1/8)+(0)(1)(1/4)+(0)(2)(1/8)
+...+(1)(3)(1/8) = 1.
Therefore
cov(X,Y) = E(XY)−E(X)E(Y) = 1−(0.5)(1.5) = 0.25.

## Page 57

Four
Special Probability Distributions
1
DISCRETE DISTRIBUTIONS
Situations involving uncertainty and probability fall into certain broad classes,
and we can use the same set of rules and principles for all situations within a
class.
So it is beneficial for us to study whole classes of discrete random variables
that arise frequently in applications.
REMARK
Recall that for a discrete random variable X, the number of possible values in the
range space RX is either finite or countable.
Then the elements of RX can be listed as x1,x2,x3,....
Discrete Uniform Distribution
One of the simplest class of a discrete random variable is the discrete uniform
distribution.
DEFINITION 1 (DISCRETE UNIFORM DISTRIBUTION)
If a random variable X assumes the values x1,x2,...,xk with equal probability,
then X follows a discrete uniform distribution.
The probability mass function for X is given by
fX(x) =



1
k,
x = x1,x2,...,xk;
0,
otherwise.
53

## Page 58

54
Special Probability Distributions
THEOREM 2
Suppose X follows the discrete uniform distribution with RX = {x1,x2,...,xk}.
The expectation of X is given by
µX = E(X) =
k
∑
i=1
xi fX(xi) = 1
k
k
∑
i=1
xi.
The variance of X is given by
σ2
X = V(X) = E(X2)−(E(X))2 = 1
k
k
∑
i=1
x2
i −µ2
X.
EXAMPLE 4.1
A bulb is selected at random from a box that contains a 40-watt bulb,
a 60-watt bulb, a 80-watt bulb, and a 100-watt bulb.
Each bulb has 1/4 probability of being selected.
Let X be the wattage of the bulb being selected. Identify the distribu-
tion of X, and compute its mean and variance.
Solution:
X follows a uniform distribution and
RX = {40,60,80,100}.
Further, the probability mass function for X is given as
fX(x) =



1
4,
x = 40,60,80,100;
0,
otherwise.
We can compute the expectation as
E(X) =∑
i
xi fX(xi) = 40·(1/4)+60·(1/4)+80·(1/4)+100·(1/4) = 70.
The variance is also found to be
V(X)
=
E(X2)−(E(X))2
=
402 ·(1/4)+602 ·(1/4)+802 ·(1/4)+1002(1/4)−702
=
500.

## Page 59

Discrete Distributions
55
Bernoulli Trial, Bernoulli Random Variable and Bernoulli Process
Numerous experiments have two possible outcomes.
If an item is selected from the assembly line and inspected, it is either defec-
tive or not defective. A piece of fruit is either damaged or not damaged.
Such experiments are called Bernoulli trials after the Swiss mathematician
Jacob Bernoulli.
DEFINITION 3 (BERNOULLI TRIAL)
A Bernoulli trial is a random experiment with only two possible outcomes.
One is called a ”success”, and the other a ”failure”. We often code the two out-
comes as ”1” (success) and ”0” (failure).
DEFINITION 4 (BERNOULLI RANDOM VARIABLE)
Let X be the number of success in a Bernoulli trial. Then X has only two possible
values: 1 or 0, and is called a Bernoulli random variable.
Denote by p, where 0 ≤p ≤1, the probability of success for a Bernoulli trial.
Then X has the probability mass function
fX(x) = P(X = x) =
(
p,
x = 1;
1−p,
x = 0.
This probability mass function can also be written as
fX(x) = px(1−p)1−x,
for x = 0,1.
REMARK
We denote a Bernoulli random variable by X ∼Bernoulli(p), and write q = 1−p.
Then the probability mass function becomes
fX(1) = p,
fX(0) = q.
THEOREM 5
For a Bernoulli random variable defined as above, we have
µX
=
E(X) = p,
σ2
X
=
V(X) = p(1−p) = pq.

## Page 60

56
Special Probability Distributions
PARAMETERS
In certain instances, fX(x) may rely on one or more unknown quantities: different
values of the quantities lead to different probability distributions.
Such a quantity is called the parameter of the distribution.
For example, p is the parameter for the Bernoulli distribution.
The collection of distributions that are determined by one or more unknown pa-
rameters is called a family of probability distributions.
Thus the aforementioned Bernoulli distributions determined by the parameter p is
a family of probability distributions.
EXAMPLE 4.2
The following are all examples of Bernoulli trials:
A coin toss
Say we want heads. Then ”heads” is a success, and ”tails” is a
failure.
Rolling a die
Say we only care about rolling a 6. Then the outcome space is
binarized to ”success”= {6} and ”failure” = {1,2,3,4,5}.
Polls
Choosing a voter at random to ascertain if he will vote ”yes” in
an upcoming referendum.
EXAMPLE 4.3
A box contains 4 blue and 6 red balls. Draw a ball from the box at
random.
What is the probability that a blue ball is chosen?
Solution:
Let X = 1 if a blue ball is drawn; and X = 0 otherwise.
Then X is a Bernoulli random variable and
P(X = 1) = 4/10 = 0.4.
Furthermore, the probability mass function for X is given by
fX(x) =
(
0.4,
x = 1;
0.6,
x = 0.

## Page 61

Discrete Distributions
57
DEFINITION 6 (BERNOULLI PROCESS)
A Bernoulli process consists of a sequence of repeatedly performed independent
and identical Bernoulli trials.
Consequently, a Bernoulli process generates a sequence of independent and
identically distributed Bernoulli random variables: X1,X2,X3,....
Several distributions useful in applications are based on the Bernoulli trial
and Bernoulli process. We will look at them in the next subsections:
• Binomial distribution;
• Negative Binomial distribution; Geometric distribution;
• Poisson distribution.
Binomial Distribution
Suppose we have n independent and identically distributed Bernoulli trials.
We can use the binomial distribution to address some interesting questions.
For example,
• A student randomly guesses at 5 multiple-choice questions. What is
the number of questions the student guessed correctly?
• Randomly pick a family with 4 kids. What is the number of girls amongst
the kids?
• A urn has 4 black balls and 3 white balls. Draw 5 balls with replace-
ment. How many black balls will there be?

## Page 62

58
Special Probability Distributions
DEFINITION 7 (BINOMIAL RANDOM VARIABLE)
A Binomial random variable counts the number of successes in n trials of a
Bernoulli Process. That is, suppose we have n trials where
• the probability of success for each trial is the same p,
• the trials are independent.
Then the number of successes, denoted by X, in the n trials is a binomial random
variable.
We say X has a binomial distribution and write it as X ∼Bin(n, p).
The probability of getting exactly x successes is given as
P(X = x) =
n
x

px(1−p)n−x, for x = 0,1,2,...,n.
It can be shown that E (X) = np, and V(X) = np(1−p).
REMARK
When n = 1, the probability mass function for the binomial random variable X is
reduced to
fX(x) = px(1−p)1−x,
for x = 0,1.
This is the probability mass function for the Bernoulli distribution. Therefore the
Bernoulli distribution is a special case of the binomial distribution.
BINOMIAL PROBABILITY MASS FUNCTION
The probability mass function for Bin(10,0.2), Bin(10,0.5), and Bin(10,0.8).

## Page 63

Discrete Distributions
59
EXAMPLE 4.4
Flip a fair coin independently 10 times. What is the probability of
observing exactly 6 heads?
Solution:
Let X be the number of heads in 10 flips of the coin.
Each flip of the coin can be observed as a Bernoulli trial, with the
probability of getting head (success) p = 0.5. Then X is the number
success out of 10 Bernoulli trials; so X ∼Bin(10,0.5).
We can compute
P(X = 6) =
10
6

(0.5)6(1−0.5)10−6 = 0.205.
Negative Binomial Distribution
Consider a Bernoulli process, where the Bernoulli trials can be repeated as
many times as desired or necessary.
Suppose we are interested in the number of trials needed so that k number of
successes occur.
DEFINITION 8 (NEGATIVE BINOMIAL DISTRIBUTION)
Let X be the number of independent and identically distributed Bernoulli(p) tri-
als needed until the kth success occurs. Then X follows a Negative Binomial
distribution, denoted by X ∼NB(k, p).
The probability mass function of X is given by
fX(x) = P(X = x) =
x−1
k −1

pk(1−p)x−k,
for x = k,k +1,k +2,...
It can be shown that E(X) = k
p and V(X) = (1−p)k
p2
.
EXAMPLE 4.5
Keep rolling a fair die, until the 6th time we get the number 6. What
is the probability that we need to roll the die 10 times?
Solution:
Let X be the number of rolls needed to get the 6th number 6. Then
X ∼NB(6,1/6).

## Page 64

60
Special Probability Distributions
Using the probability mass function of the negative binomial distri-
bution:
P(X = 10) =
10−1
6−1

(1/6)6(1−1/6)4 = 0.001302.
Geometric Distribution
The Geometric distribution is a special case of the negative binomial distri-
bution.
DEFINITION 9 (GEOMETRIC DISTRIBUTION)
Let X be the number of independent and identically distributed Bernoulli(p) tri-
als needed until the first success occurs. Then X follows a Geometric distribu-
tion, denote by X ∼Geom(p).
The probability mass function of X is given by
fX(x) = P(X = x) = (1−p)x−1p.
It can be shown that E(X) = 1
p and V(X) = 1−p
p2 .
Poisson Distribution
A number of probability distributions come about through limiting argu-
ments applied to other distributions. One useful distribution of this type
is called the Poisson distribution.
DEFINITION 10 (POISSON RANDOM VARIABLE)
The Poisson random variable X denotes the number of events occurring in a
fixed period of time or fixed region.
We denote X ∼Poisson(λ), where the parameter λ > 0 is the expected number
of occurrences during the given period/region. Its probability mass function is
given by
fX(k) = P(X = k) = e−λλ k
k!
,
where k = 0,1,... is the number of occurrences of such events.
It can be shown that E(X) = λ and V(X) = λ.

## Page 65

Discrete Distributions
61
POISSON PROBABILITY MASS FUNCTION
The probability mass function for Poisson(1), Poisson(4), and Poisson(9).
EXAMPLE 4.6
The ”fixed period of time” given in the definition can be a time period
of any length: a minute, a day, a week, a month, etc. The ”fixed
region” can be of any size.
Here are some examples of events that may be modeled by the Pois-
son distribution:
(a) The number of spelling mistakes one makes while typing a single
page.
(b) The number of times a web server is accessed per minute.
(c) The number of road kill (animals killed) found per unit length of
road.
(d) The number of mutations in a given stretch of DNA after a cer-
tain amount of radiation exposure.
(e) The number of unstable atomic nuclei that decayed within a given
period of time in a piece of radioactive substance.
(f) The distribution of visual receptor cells in the retina of the human
eye.
(g) The number of light bulbs that burn out in a certain amount of
time.

## Page 66

62
Special Probability Distributions
DEFINITION 11 (POISSON PROCESS)
The Poisson process is a continuous time process. We count the number of
occurrences within some interval of time. The defining properties of a Poisson
process with rate parameter α are
• the expected number of occurrences in an interval of length T is αT;
• there are no simultaneous occurrences;
• the number of occurrences in disjoint time intervals are independent.
The number of occurrences in any interval T of a Poisson process follows a
Poisson(αT) distribution.
EXAMPLE 4.7
The average number of robberies in a day is four in a certain big city.
What is the probability that six robberies occurring in two days?
Solution:
Let X1 be the number of robberies in one day. Then X1 ∼Poisson(4)
from the given conditions.
Let X be the number of robberies in two days. Then
X ∼Poisson(2×4) = Poisson(8).
We then have
P(X = 6) = e−886
6!
= 0.1222.
Poisson Approximation to Binomial
The Poisson random variable has a tremendous range of applications in di-
verse areas because it may be used as an approximation for a binomial ran-
dom variable under certain conditions.
The following result shows us how.
PROPOSITION 12 (POISSON APPROXIMATION TO BINOMIAL)
Let X ∼Bin(n, p). Suppose that n →∞and p →0 in such a way that λ = np
remains a constant. Then approximately, X ∼Poisson(np).
That is
lim
p→0;n→∞P(X = x) = e−np(np)x
x!
.

## Page 67

Continuous Distribution
63
REMARK
The approximation is good when
• n ≥20 and p ≤0.05, or if
• n ≥100 and np ≤10.
EXAMPLE 4.8
The probability, p, of an individual car having an accident at a junc-
tion is 0.0001.
If there are 1000 cars passing through the junction during certain pe-
riod of a day, what is the probability of two or more accidents occur-
ring during that period?
Solution:
Let X be the number of accidents among the 1000 cars.
Then X ∼Bin(1000,0.0001). If we compute using the binomial distri-
bution,
P(X ≥2) =
1000
∑
x=2
1000
x

0.0001x0.99991000−x.
We can also use the Poisson approximation.
We have n = 1000 and p = 0.0001. Hence np = λ = 0.1.
Thus
P(X ≥2)
=
1−P(X = 0)−P(X = 1)
=
1−e−0.1 −e−0.1(0.1)1/1!
=
0.0047.
2
CONTINUOUS DISTRIBUTION
There are many ”natural” random variables whose set of possible values is
uncountable. For example, consider
• the lifetime of an electrical appliance; or
• the amount of rainfall we get in a month.
How then, can we model such variables?
To achieve this aim, we shall now study some classes of continuous random
variables.

## Page 68

64
Special Probability Distributions
Continuous Uniform Distribution
Intuitively, a uniform random variable on the interval (a,b) is a completely
random number between a and b. We formalize the notion of ”completely
random” on an interval by specifying that the probability density function
should be constant over the interval.
DEFINITION 13 (CONTINUOUS UNIFORM DISTRIBUTION)
A random variable X is said to follow a uniform distribution over the interval
(a,b) if its probability density function is given by
fX(x) =



1
b−a,
a ≤x ≤b;
0,
otherwise.
We denote this by X ∼U(a,b).
It can be shown that E(X) = a+b
2
and V(X) = (b−a)2
12
.
The probability density function for the continuous uniform distribution can
be drawn as below.
x
y
0
a
b
1
b−a
The cumulative distribution function for the continuous uniform distribution
is given by
FX(x) =







0,
x < a;
x−a
b−a,
a ≤x ≤b;
1,
x > b.

## Page 69

Continuous Distribution
65
EXAMPLE 4.9
A point is chosen at random on the line segment [0,2].
What is the probability that the chosen point lies between 1 and 3
2?
Solution:
Let X be the position of the point. Then X ∼U(0,2), and we have
fX(x) =
(
1
2,
0 ≤x ≤2;
0,
otherwise.
Then the required probability is
P
 1 ≤X ≤3
2

=
Z 3/2
1
1
2 dx = 1
2 [x]3/2
1
= 1
4.
Exponential Distribution
The exponential distribution is the continuous counterpart to the geometric
distribution. It is often used to model the waiting time to the first success in
continuous time.
DEFINITION 14 (EXPONENTIAL DISTRIBUTION)
A continuous random variable X is said to follow an exponential distribution
with parameter λ > 0 if its probability density function is given by
fX(x) =
(
λe−λx,
if x ≥0;
0,
if x < 0.
We denote X ∼Exp(λ).
It can be shown that E(X) = 1
λ and V(X) = 1
λ 2 .

## Page 70

66
Special Probability Distributions
The probability density function for Exp(1).
x
y = e−x
a
b
0
1
Area of shaded region = P(a < X < b)
The probability density function for Exp(λ), where λ = 1,2,4.
x
y
1
0
Exp(1)
Exp(4)
4
Exp(2)
2
The cumulative distribution function of X ∼Exp(λ) is given by
FX(x) =
(
1−e−λx,
x ≥0;
0,
x < 0.

## Page 71

Continuous Distribution
67
ALTERNATIVE FORM OF THE EXPONENTIAL
The probability density function of the exponential distribution can be written in
the following alternative form
fX(x) =



1
µ e−x/µ,
x ≥0;
0,
x < 0.
The parameters µ and λ have the relationship µ = 1/λ.
We will then have
E(X) = µ,
V(X) = µ2,
and
FX(x) = 1−e−x/µ,
for x ≥0.
EXAMPLE 4.10
Suppose that the failure time, T, of a system is exponentially dis-
tributed, with a mean of 5 years.
What is the probability that at least two out of five of these systems
are still functioning at the end of 8 years?
Solution:
Since E(T) = 5, therefore λ = 1/5.
We then have T ∼Exp(1/5), and so
P(T > 8) = 1−P(T ≤8) = 1−FX(8) = e−(1/5)×8 = e−1.6 ≈0.2.
Now let X be the number of systems out of 5 that are still functioning
after 8 years. We see tha X ∼Bin(5,0.2). Hence,
P(X ≥2) = 0.2627.
THEOREM 15
Suppose that X has an exponential distribution with parameter λ > 0. Then for
any two positive numbers s and t, we have
P(X > s+t|X > s) = P(X > t).

## Page 72

68
Special Probability Distributions
REMARK
The above theorem states that the exponential distribution has ”no memory” or is
”memoryless”.
To illustrate, suppose X ∼Exp(λ) is the life length of a bulb. Then
P(X > s+t|X > s) = P(X > t).
This means that, if the bulb has lasted s time units (that is, X > s), the probability
that it will last for another t units (that is, X > s+t), is the same as the probability
that it will last for the first t units as a brand new bulb.
NORmal Distribution
We next look at one of the most important class of continuous random vari-
ables.
DEFINITION 16 (NORMAL DISTRIBUTION)
A random variable X is said to follow a NORmal distribution with parameters µ
and σ2 if its probability density function is given by
fX(x) =
1
√
2πσ e−(x−µ)2/(2σ2),
−∞< x < ∞.
We denote X ∼N(µ,σ2).
It can be shown that E(X) = µ and V(X) = σ2.
The probability density function of the NORmal distribution is positive over
the whole real line, symmetrical about x = µ, and bell-shaped.
µ
µ +σ
µ −σ
µ +2σ
µ −2σ
σ
fX(x) =
1
σ
√
2π e−(x−µ)2
2σ2
1
σ
√
2π

## Page 73

Continuous Distribution
69
PROPERTIES OF THE NORMAL DISTRIBUTION
We go through some important properties of the NORmal distribution.
(1) The total area under the curve and above the horizontal axis is equal to 1.
Z ∞
−∞fX(x)dx =
Z ∞
−∞
1
σ
√
2π exp

−(x−µ)2
2σ2

dx = 1.
This validates that fX(·) is a probability density function.
(2) Two NORmal curves are identical in shape if they have the same σ2. But they
are centered at different positions when their means are different.
x
N(0,1)
N(1,1)
N(−1.5,1)
−1.5
0
1
1
√
2π
(3) As σ increases, the curve flattens; and vice versa.
x
N(0,1)
N(0,22)
N(0,0.52)
(4) Given X ∼N(µ,σ2), let
Z = X −µ
σ
.
Then Z follows the N(0,1) distribution, with E(Z) = 0 and V(Z) = 1.
We say that Z has a standardized NORmal or standard NORmal distribution, and
the probability density function of Z is given by
fZ(z) =
1
√
2π exp

−z2
2

.

## Page 74

70
Special Probability Distributions
REMARK
• Calculating NORmal probabilities is a challenge because
– there is no close formula for the integration,
– and the computation relies on numerical integration.
• Fortunately we can use Property 4 from above.
Suppose X ∼N(µ,σ2) and we seek P(x1 < X < x2). Consider
x1 < X < x2 ⇐⇒x1−µ
σ
< X−µ
σ
< x2−µ
σ
.
Consider the transformation Z = X−µ
σ , and let z1 = x1−µ
σ
and z2 = x2−µ
σ
. Then
P(x1 < X < x2) = P(z1 < Z < z2).
• By convention, we use φ(·) and Φ(·) to denote the probability density func-
tion and cumulative distribution function of the standard NORmal. That is,
φ(z)
=
fZ(z) =
1
√
2π e−z2/2
Φ(z)
=
Z z
−∞φ(t)dt =
1
√
2π
Z z
−∞e−t2/2 dt.
Then for X ∼N(µ,σ2) and any real numbers x1,x2,
P(x1 < X < x2) = Φ
  x2−µ
σ

−Φ
  x1−µ
σ

.
• Thus we can use the standard NORmal to calculate any NORmal probability.
To do so, Φ(z) can be tabulated, or computed using statistical software.
• The standard NORmal distribution has the following properties:
– P(Z ≥0) = P(Z ≤0) = Φ(0) = 0.5;
– For any z, Φ(z) = P(Z ≤z) = P(Z ≥−z) = 1−Φ(−z);
– If Z ∼N(0,1), then −Z ∼N(0,1);
– If Z ∼N(0,1), then σZ + µ ∼N(µ,σ2).

## Page 75

Continuous Distribution
71
EXAMPLE 4.11
Given X ∼N(50,100), compute P(45 < X < 62).
Solution:
We have µ = 50, σ = 10. Then
P(45 < X < 62)
=
P
  45−50
10
< X−50
10
< 62−50
10

=
P(−0.5 < Z < 1.2)
=
P(Z < 1.2)−P(Z ≤−0.5)
=
Φ(1.2)−Φ(−0.5),
where Φ(1.2) and Φ(−0.5) can either be computed using software or
obtained from a statistical table.
DEFINITION 17 (QUANTILE)
The αth (upper) quantile, where 0 ≤α ≤1, of the random variable X is the
number xα that satisfies
P(X ≥xα) = α.
THE Z UPPER QUANTILE
Specifically, we denote by zα the αth (upper) quantile, or the 100α percentage point,
of Z ∼N(0,1). That is
P(Z ≥zα) = α.
Here are some common values of zα:
z0.05 = 1.645,
z0.01 = 2.326.
Since φ(z), the probability density function of Z, is symmetrical about 0, then
P(Z ≥zα) = P(Z ≤−zα) = α.

## Page 76

72
Special Probability Distributions
EXAMPLE 4.12
Find z such that
(a) P(Z < z) = 0.95;
(b) P(|Z| ≤z) = 0.98.
Solution:
(a) We need z such that
P(Z > z) = 1−P(Z < z) = 0.05.
Therefore z = z0.05 = 1.645.
(b) We have
0.98
=
P(|Z| ≤z) = 1−P(|Z| > z)
=
1−P(Z > z)−P(Z < −z) = 1−2P(Z > z).
This means that P(Z > z) = 0.01. Therefore z = z0.01 = 2.326.

## Page 77

Continuous Distribution
73
NORmal Approximation to Binomial
Recall that when n →∞, p →0, and np remains a constant, we can use the
Poisson distribution to approximate the binomial distribution.
When n →∞, but p remains a constant (practically, p is not very close to 0 or
1), we can use the NORmal distribution to approximate the binomial distribu-
tion.
A good rule of thumb is to use the NORmal approximation when
np > 5
and
n(1−p) > 5.
PROPOSITION 18 (NORMAL APPROXIMATION TO BINOMIAL)
Let X ∼Bin(n, p), so that E(X) = np and V(X) = np(1−p). Then as n →∞,
Z = X −E(X)
p
V(X)
=
X −np
p
np(1−p)
is approximately ∼N(0,1).

## Page 78

74
Special Probability Distributions

## Page 79

Five
Sampling and Sampling
Distributions
1
POPULATION AND SAMPLE
The aim of Statistical Inference is to say something about the population based
on a sample.
DEFINITION 1 (POPULATION & SAMPLE)
The totality of all possible outcomes or observations of a survey or experiment is
called a population.
A sample is any subset of a population.
Every outcome or observation can be recorded as a numerical or categorical value.
So each member of a population can be regarded as a value of a random variable.
Note that a population can be finite or infinite.
FINITE POPULATION
A finite population consists of a finite number of elements.
For example, it can be
• the monthly income of Singaporeans;
• all the books in the Central Library; or
• the CAP scores of students in NUS.
75

## Page 80

76
Sampling and Sampling Distributions
INFINITE POPULATION
An infinite population is one that consists of an infinitely (countable and uncount-
able) large number of elements.
For example, it can be
• the results of all possible rolls of a pair of dice;
• the depths at all conceivable positions of a lake; or
• the PSI level in the air at various parts of Singapore.
REMARK
Some finite populations are so large that in theory we assume them to be infinite,
since it may be impractical/uneconomical to observe all its values.
2
RANDOM SAMPLING
We often know that the population belongs to (or can be modeled using) a
known (family of) distribution(s).
However, the values of parameters (for example, p, µ or σ) that specify the
distribution(s) are unknown.
For example:
• A pollster is sure that the responses to his “agree/disagree” question
will follow a binomial distribution, but p, the proportion of those who
“agree” in the population, is unknown.
• An agronomist believes that the yield per acre of a variety of wheat is
approximately NORmally distributed, but the mean µ and the standard
deviation σ of the yields are unknown.
Thus we rely on a sample to learn about these parameters and study the
properties of the population.
• The sample should be representative of the population. We have differ-
ent types of sampling schemes attempting to do that.
• For the probability methods, it is possible to fully describe the quanti-
tative properties of the sample.
• We will focus on the simple random sample. It is often known simply
as a random sample.

## Page 81

Random Sampling
77
DEFINITION 2 (SIMPLE RANDOM SAMPLE)
A set of n members taken from a given population is called a sample of size n.
A simple random sample (SRS) of n members is a sample that is chosen such
that every subset of n observations of the population has the same probability of
being selected.
REMARK
With simple random sampling, everyone has the same chance of inclusion in the
sample, so it is fair.
It tends to yield a sample that resembles the population. This reduces the chance
that the sample is seriously biased in some way, leading to inaccurate inferences
about the population.
EXAMPLE 5.1 (DRUG EXPERIMENT)
Suppose that a researcher in a medical center plans to compare two
drugs for some adverse condition. She has four patients with this
condition, and she wants to randomly select two to use each drug.
Denote the four patients by P1, P2, P3, and P4.
In selecting n = 2 subjects to use the first drug, the six possible sam-
ples are
(P1,P2),(P1,P3),(P1,P4),(P2,P3),(P2,P4),(P3,P4).
REMARK
More generally, let N denote the population size. The population has
N
n

possible
samples of size n.
For large values of N and n, one can use software easily to select the sample from a
list of the population members using a random number generator.
Sampling from an Infinite Population
When lists are available and items are readily numbered, it is easy to draw
random samples from finite populations.
Unfortunately, it is often impossible to proceed in the way we have just de-
scribed for an infinite population.

## Page 82

78
Sampling and Sampling Distributions
DEFINITION 3 (SIMPLE RANDOM SAMPLE: INFINITE POPULATION)
Let X be a random variable with certain probability distribution fX(x).
Let X1,X2,...,Xn be n independent random variables each having the same distri-
bution as X. Then (X1,X2,...,Xn) is called a random sample of size n from a
population with distribution fX(x).
The joint probability function of (X1,X2,...Xn) is given by
fX1,X2,...,Xn(x1,x2,...,xn) = fX1(x1)fX2(x2)··· fXn(xn),
where fX(x) is the probability function of the population.
3
SAMPLING DISTRIBUTION OF SAMPLE MEAN
Our main purpose in selecting random samples is to elicit information about
the unknown population parameters.
For instance, we wish to know the proportion of people in Singapore who
prefer a certain brand of coffee.
A large random sample is then selected from the population and the propor-
tion of this sample favouring the brand of coffee in question is calculated.
This value is now used to make some inference concerning the true propor-
tion in the population.
DEFINITION 4 (STATISTIC)
Suppose a random sample of n observations (X1,...,Xn) has been taken. A func-
tion of (X1,...,Xn) is called a statistic.
EXAMPLE 5.2 (SAMPLE MEAN)
The sample mean, defined as
X = 1
n
n
∑
i=1
Xi,
is a statistic.
If the values in a random sample are observed and they are (x1,...,xn),
then the realization of the statistic X is given by
x = 1
n
n
∑
i=1
xi.

## Page 83

Sampling Distribution of Sample Mean
79
EXAMPLE 5.3 (SAMPLE VARIANCE)
The sample variance, defined as
S2 =
1
n−1
n
∑
i=1
(Xi −X)2,
is a statistic.
Similarly, if the values in a random sample are observed and they are
(x1,...,xn), then the realization of the statistic S2 is given by
s2 =
1
n−1
n
∑
i=1
(xi −x)2.
STATISTICS ARE RANDOM VARIABLES
• Note that X1 is a random variable and so are X2,...,Xn.
• Thus X and S2 are random variables as well.
• As many random samples are possible from the same population, we expect
the statistic to vary somewhat from sample to sample.
• Hence a statistic is a random variable. It is meaningful to consider the prob-
ability distribution of a statistic.
DEFINITION 5 (SAMPLING DISTRIBUTION)
The probability distribution of a statistic is called a sampling distribution.
Two Results
We next present two key results about the sampling distribution of the sam-
ple mean.
• Theorem 6 provides formulas for the center and the spread of the sam-
pling distribution.
• Theorem 9 describes the shape of the sampling distribution, showing
that it is often approximately NORmal.

## Page 84

80
Sampling and Sampling Distributions
THEOREM 6 (MEAN AND VARIANCE OF X)
For random samples of size n taken from an infinite population with mean µX and
variance σ2
X, the sampling distribution of the sample mean X has mean µX and
variance σ2
X
n . That is,
µX = E
 X

= µX
and
σ2
X = V
 X

= σ2
X
n .
VALIDITY OF X AS AN ESTIMATOR FOR µX
• The expectation of X is equal to the population mean µX.
• In “the long run”, X does not introduce any systematic bias as an estimator
of µX. So X can serve as a valid estimator of µX.
• For an infinite population, when n gets larger and larger, σ2
X/n, the variance
of X, becomes smaller and smaller, that is, the accuracy of X as an estimator
of µX keeps improving.
DEFINITION 7 (STANDARD ERROR)
The spread of a sampling distribution is described by its standard deviation,
which is called the standard error.
The standard deviation of the sampling distribution of X is called the standard
error of X. We denote it by σX.
REMARK
The standard error of X describes how much x tends to vary from sample to sample
of size n.
The symbol σX (instead of σ) and the terminology standard error (instead of stan-
dard deviation) distinguishes this measure from the standard deviation σ of the
population.
Because σ2
X/n decreases as n increases, X tends to be closer to µX as n in-
creases. The result that X converges to µX as n grows indefinitely is called the
Law of Large Numbers.

## Page 85

Central Limit Theorem
81
THEOREM 8 (LAW OF LARGE NUMBERS (LLN))
If X1,...,Xn are independent random variables with the same mean µ and vari-
ance σ2, then for any ε ∈R,
P(|X −µ| > ε) →0 as n →∞.
REMARK
This says that as the sample size increases, the probability that the sample mean
differs from the population mean goes to zero.
Another way of looking at this is that it is increasingly likely that X is close to µX,
as n gets larger.
4
CENTRAL LIMIT THEOREM
The result that the sampling distribution of X is approximately NORmal is
called the Central Limit Theorem.
THEOREM 9 (CENTRAL LIMIT THEOREM (CLT))
If X is the mean of a random sample of size n taken from a population having
mean µ and finite variance σ2, then, as n →∞,
X −µ
σ/√n →Z ∼N(0,1).
Equivalently, this means
X →N

µ, σ2
n

.
WHAT IS THE BIG DEAL?
The Central Limit Theorem states that, under rather general conditions, for large n,
sums and means of random samples drawn from a population follows the NORmal
distribution closely.
Note that if the random sample comes from a NORmal population, X is NORmally
distributed regardless of the value of n.

## Page 86

82
Sampling and Sampling Distributions
RULE OF THUMB
The Central Limit Theorem says that, if you take the mean of a large number of
independent samples, then the distribution of that mean will be approximately
NORmal.
• If the population you are sampling from is symmetric with no outliers, a
good approximation to NORmality appears after as few as 15-20 samples.
• If the population is moderately skewed, such as exponential or χ2, then it
can take between 30-50 samples before getting a good approximation.
• Data with extreme skewness, such as some financial data where most en-
tries are 0, a few are small, and even fewer are extremely large, may not be
appropriate for the Central Limit Theorem even with 1000 samples.
EXAMPLE 5.4 (BOWLING LEAGUE)
In a bowling league season, bowlers bowl 50 games and the average
score is ranked at the end of the season. Historically, John averages
175 a game with a standard deviation of 30. What is the probability
that John will average more than 180 this season?
Solution:
We do not know the distribution of X, but we know that µ = 175,
σ = 30 and n = 50. Let X be the sample mean.
By CLT, we can approximate X by N(µ,σ2/n). The question asks for
the probability
P(X > 180) = P
 X −µ
σ/√n > 180−µ
σ/√n

≈P(Z > 1.18) = 0.119.
5
OTHER SAMPLING DISTRIBUTIONS
We next describe the χ2, t, and F distributions, which are examples of distri-
butions that are derived from random samples from a NORmal distribution.
The emphasis is on understanding the relationships between the random
variables and how they can be used to describe distributions related to the
sample statistics X and S2.
Your goal should be to get comfortable with the idea that sample statistics
have known distributions.

## Page 87

Other Sampling Distributions
83
DEFINITION 10 (THE χ2 DISTRIBUTION)
Let Z be a standard NORmal random variable. A random variable with the same
distribution as Z2 is called a χ2 random variable with one degree of freedom.
Let Z1,...,Zn be n independent and identically distributed standard NORmal ran-
dom variables. A random variable with the same distribution as Z2
1 +···+Z2
n is
called a χ2 random variable with n degrees of freedom.
REMARK
We denote a χ2 random variable with n degrees of freedom as χ2(n).
PROPERTIES OF χ2 DISTRIBUTIONS
1. If Y ∼χ2(n), then E(Y) = n and V(Y) = 2n.
2. For large n, χ2(n) is approximately N(n,2n).
3. If Y1 and Y2 are independent χ2 random variables with m and n degrees of
freedom respectively, then Y1 +Y2 is a χ2 random variable with m+n degrees
of freedom.
4. The χ2 distribution is a family of curves, each determined by the degrees of
freedom n. All the density functions have a long right tail.
DEFINITION 11
Define χ2(n;α) such that for Y ∼χ2(n),
P(Y > χ2(n;α)) = α.
!2
"
"
0
!2 distribution with # = 5

## Page 88

84
Sampling and Sampling Distributions
The sampling distribution of (n−1)S2/σ2
Recall that for X1,...,Xn independent and identically distributed with E(X) =
µ and V(X) = σ2, the sample variance is defined as
S2 =
1
n−1
n
∑
i=1
(Xi −X)2.
Though it can be shown that E(S2) = σ2, the sampling distribution of the
random variable S2 has little practical application in statistics.
We shall instead consider the sampling distribution of the random variable
(n−1)S2
σ2
when Xi ∼N(µ,σ2), for all i.
THEOREM 12
If S2 is the variance of a random sample of size n taken from a NORmal population
having the variance σ2, then the random variable
(n−1)S2
σ2
= ∑n
i=1(Xi −X)2
σ2
has a χ2 distribution with n−1 degrees of freedom.
DEFINITION 13 (THE t-DISTRIBUTION)
Suppose Z ∼N(0,1) and U ∼χ2(n). If Z and U are independent, then
T =
Z
p
U/n
follows the t-distribution with n degrees of freedom.
PROPERTIES OF THE t-DISTRIBUTION
• The t-distribution with n degrees of freedom, also called the Student’s t-
distribution, is denoted by t(n).
• The t-distribution approaches N(0,1) as the parameter n →∞. When n ≥30,
we can replace it by N(0,1).
• If T ∼t(n), then E(T) = 0 and V(T) = n/(n−2) for n > 2.
• The graph of the t-distribution is symmetric about the vertical axis and re-
sembles the graph of the standard NORmal distribution.

## Page 89

Other Sampling Distributions
85
DEFINITION 14
Define tn;α such that for T ∼t(n),
P(T > tn;α) = α.
THE IMPORTANCE OF THE t-DISTRIBUTION
The t-distribution will play an important role in the later chapters, where it appears
as the result of random sampling.
The following theorem establishes the connection between a random sample
X1,...,Xn and the t-distribution.
THEOREM 15
If X1,...,Xn are independent and identically distributed NORmal random variables
with mean µ and variance σ2, then
X −µ
S/√n
follows a t-distribution with n−1 degrees of freedom.
EXAMPLE 5.5 (MIDTERM SCORE)
The lecturer of a class announced that the mean score of the midterm
is 16 out of 30. A student doubts it, so he randomly chose 5 class-
mates and asked them for their scores: 20, 19, 24, 22, 25.
Should the student believe that the mean score is 16? Assume the
scores are approximately NORmally distributed.

## Page 90

86
Sampling and Sampling Distributions
Solution:
The student has n = 5 sampled data
x1 = 20,x2 = 19,x3 = 24,x4 = 22,x5 = 25.
If µ = 16,
T = X −µ
S/√n = X −16
S/
√
5
should follow a t-distribution with 5−1 = 4 degrees of freedom.
With the observed data x = 22 and s = 2.55 so
t = 22−16
2.55/
√
5
= 5.26.
Using software, P(t(4) > 5.26) = 0.003. This says that there is only a
0.003 chance that T is 5.26 (or larger), provided the lecturer is telling
the truth that µ = 16.
So should the student believe him based on his findings?
DRINK BEER AND DO STATISTICS!
The t-distributions were discovered by William S. Gosset in 1908. Gosset was a
statistician employed by the Guinness brewing company which had stipulated that
he not publish under his own name. He therefore wrote under the pen name “Stu-
dent”.
For a biography of Gosset, browse to
http://www-history.mcs.st-andrews.ac.uk/Biographies/Gosset.html
DEFINITION 16 (THE F-DISTRIBUTION)
Suppose U ∼χ2(m) and V ∼χ2(n) are independent. Then the distribution of the
random variable
F = U/m
V/n
is called a F-distribution with (m,n) degrees of freedom.

## Page 91

Other Sampling Distributions
87
PROPERTIES OF THE F-DISTRIBUTION
• The F-distribution with (m,n) degrees of freedom is denoted by F(m,n).
• If X ∼F(m,n), then
E(X) =
n
n−2,
for n > 2
and
V(X) = 2n2(m+n−2)
m(n−2)2(n−4),
for n > 4.
• If F ∼F(n,m), then 1/F ∼F(m,n). This follows immediately from the defini-
tion of the F-distribution.
• Values of the F-distribution can be found in the statistical tables or software.
The values of interests are F(m,n;α) such that
P(F > F(m,n;α)) = α,
where F ∼F(m,n).
• It can be shown that
F(m,n;1−α) = 1/F(n,m;α).
EXAMPLE 5.6
For example,
F(4,5;0.05) = 5.19
means that P(F > 5.19) = 0.05, where F ∼F(4,5).

## Page 92

88
Sampling and Sampling Distributions

## Page 93

Six
Estimation
We now learn about a powerful use of statistics:
STATISTICAL INFERENCE
about POPULATION PARAMETERS
using SAMPLE DATA.
In case you wonder about the relevance of learning about probability and
sampling distribution, this is why:
• Statistical inference methods use probability calculations that assume
that the data were gathered with a random sample or a randomized
experiment.
• The probability calculations refer to a sampling distribution of a statis-
tic, which is often approximately a NORmal distribution.
There are two types of statistical inference methods
• estimation of population parameters; and
• testing hypotheses about the parameter values.
This chapter discusses the first — estimating population parameters.
TWO TYPES OF ESTIMATIONS
Point estimation
Based on sample data, a single number is calculated to estimate the popula-
tion parameter. The rule or formula that describes this calculation is called
the point estimator. The resulting number is called a point estimate.
Interval estimation
Based on sample data, two numbers are calculated to form an interval within
which the parameter is expected to lie.
89

## Page 94

90
Estimation
EXAMPLE 6.1
One survey asked, ”Do you believe in hell?”
From sample data, the point estimate for the proportion of adult
(in the population) who would respond ”yes” is 0.73. The adjective
”point” refers to using a single number as the parameter estimate.
An interval estimate predicts that the proportion of adult (in the pop-
ulation) who believe in hell falls between 0.71 and 0.75.
The next figure illustrates the difference between point estimate and interval
estimate for the previous example.
1
POINT ESTIMATION
Suppose we are interested to estimate the parameter µ, the population mean.
Assume that we have the following data, a random sample consisting
X1,X2,...,Xn.
DEFINITION 1 (ESTIMATOR)
An estimator is a rule, usually expressed as a formula, that tells us how to
calculate an estimate based on information in the sample.
EXAMPLE 6.2 (POINT ESTIMATOR)
We want to estimate the average waiting time for a bus (µ) for stu-
dents attending ST2334. The lecturer asked 4 students their waiting
times X1,...,X4 for a bus. The (observed) results are
x1 = 6,x2 = 1,x3 = 4,x4 = 9.
We can use X = 1
4(X1 + ··· + X4) to estimate µ. In this case, X is the
estimator (for µ), and the computed value x = 5 is the estimate.

## Page 95

Point Estimation
91
QUESTIONS
• How good is the estimator?
• What would be a criteria for a “good” estimator?
Unbiased Estimator
One of the reasons we think X is a good estimator of µ is because E(X) = µ.
That is, “on average”, the estimator is right.
In general, we represent the parameter of interest by θ. For example, θ can
be p,µ, or σ.
DEFINITION 2 (UNBIASED ESTIMATOR)
Let ˆΘ be an estimator of θ. Then ˆΘ is a random variable based on the sample. If
E( ˆΘ) = θ, we call ˆΘ an unbiased estimator of θ.
REMARK
An unbiased estimator has mean value equals to the true value of the parameter.
EXAMPLE 6.3 (UNBIASED ESTIMATOR)
Let X1,X2,...,Xn be a random sample from the same population with
mean µ and variance σ2. Then
S2 =
1
n−1
n
∑
i=1
(Xi −X)2
is an unbiased estimator of σ2 since E(S2) = σ2.

## Page 96

92
Estimation
Maximum Error of Estimate
Typically X ̸= µ, so X −µ measures the difference between the estimator and
the true value of the parameter.
Recall that if the population is NORmal or if n is large, X −µ
σ/√n follows a stan-
dard NORmal or an approximately standard NORmal distribution.
DEFINITION 3 (zα)
Define zα to be the number with an upper-tail probability of α for the standard
NORmal distribution Z. That is, P(Z > zα) = α.
From the above definition, we then have
P

−zα/2 ≤X −µ
σ/√n ≤zα/2

= 1−α.
In other words,
P
|X −µ|
σ/√n ≤zα/2

= P

|X −µ| ≤zα/2 · σ
√n

= 1−α.
This means that, with probability 1−α, the error |X −µ| is less than
E = zα/2 · σ
√n.

## Page 97

Point Estimation
93
DEFINITION 4 (MAXIMUM ERROR OF ESTIMATE)
The quantity
E = zα/2 · σ
√n
is called the maximum error of estimate.
EXAMPLE 6.4 (TV TIME FOR INTERNET USERS)
An investigator is interested in the amount of time internet users
spend watching television per week.
Based on historical experience, he assumes that the standard devia-
tion is σ = 3.5 hours.
He proposes to select a random sample of n = 50 internet users, poll
them, and take the sample mean to estimate the population mean µ.
What can he assert with probability 0.99 about the maximum error of
estimate?
Solution:
As n = 50 ≥30 is large, X −µ
σ/√n is approximately NORmal.
So we can use the previous result, with σ = 3.5, α = 0.01 and zα/2 =
z0.005 = 2.576.
With probability 0.99, the error is at most
E = 2.576× 3.5
√
50
≈1.27.
REMARK
z0.005 is the same as the 0.995 quantile of the standard NORmal. The value of 2.576
can be obtained from tables or software.
Use the command qNORm(0.995) or qNORm(0.005, lower.tail=F) to obtain
the value via https://rdrr.io/snippets/.
Alternatively, you may use Radiant to get the same value as well.

## Page 98

94
Estimation
Determination of Sample Size
We often want to know what the minimum sample size should be, so that
with probability 1−α, the error is at most E0.
To answer this, consider the fact that we want
zα/2
σ
√n ≤E0.
Solving for n, we have
n ≥
zα/2 ·σ
E0
2
.
Different Cases
We had previously understood the sampling distribution of X for a variety of
cases. Repeating the same arguments above, we have the following table.
DIFFERENT CASES
Population
σ
n
Statistic
E
n for desired
E0 and α
I
NORmal
known
any
Z = X−µ
σ/√n
zα/2 · σ
√n
zα/2 ·σ
E0
2
II
any
known
large
Z = X−µ
σ/√n
zα/2 · σ
√n
zα/2 ·σ
E0
2
III
NORmal
unknown
small
T = X−µ
S/√n
tn−1;α/2 · s
√n
tn−1;α/2 ·s
E0
2
IV
any
unknown
large
Z = X−µ
S/√n
zα/2 · s
√n
zα/2 ·s
E0
2

## Page 99

Confidence Intervals for the Mean
95
2
CONFIDENCE INTERVALS FOR THE MEAN
Since a point estimate is almost never right, one might be interested in asking
for an interval where the parameter lies in.
DEFINITION 5 (CONFIDENCE INTERVAL)
An interval estimator is a rule for calculating, from the sample, an interval
(a,b) in which you are fairly certain the parameter of interest lies in.
This “fairly certain” can be quantified by the degree of confidence also known
as confidence level (1−α), in the sense that
P(a < µ < b) = 1−α.
(a,b) is called the (1−α) confidence interval.
Case I: σ known, data NORmal
Consider the case where σ is known, and data comes from a NORmal popula-
tion.
We learnt previously that
P

−zα/2 ≤X −µ
σ/√n ≤zα/2

= 1−α.
Rearranging, we have
P

X −zα/2
σ
√n ≤µ ≤X +zα/2
σ
√n

= 1−α.
So
X ±zα/2
σ
√n =

X −zα/2
σ
√n, X +zα/2
σ
√n

is a (1−α) confidence interval.

## Page 100

96
Estimation
EXAMPLE 6.5
In order to set inventory levels, a computer company samples de-
mand during lead time over 25 time periods:
235 374 309 499 253 421 361 514 462 369 394 439
348 344 330 261 374 302 466 535 386 316 296 332 334
It is known that the (population) standard deviation of demand over
lead time is 75 computers. Given that x = 370.16, estimate the mean
demand over lead time with 95% confidence. Assume a NORmal dis-
tribution for the population.
Solution:
Note that zα/2 = z0.025 = 1.96. The 95% confidence interval is
x±zα/2
σ
√n = 370.16±1.96 75
√
25
= 370.16±29.4
or (340.76,399.56).
REMARK
Notice that our (1−α) confidence interval can be written as X ±E.
This is not a coincidence: recall that there is (1−α) confidence that the error |X −µ|
is within E.
For the other cases, based on our understanding of the sampling distribution of X,
we can construct our confidence intervals for the different cases X ± E, based on
the conditions given.
CONFIDENCE INTERVALS FOR THE MEAN
The table below gives the (1−α) confidence interval (formulas) for the population
mean.
Case
Population
σ
n
Confidence Interval
I
NORmal
known
any
x±zα/2 · σ/√n
II
any
known
large
x±zα/2 · σ/√n
III
NORmal
unknown
small
x±tn−1;α/2 · s/√n
IV
any
unknown
large
x±zα/2 · s/√n
Note that n is considered large when n ≥30.

## Page 101

Confidence Intervals for the Mean
97
EXAMPLE 6.6 (WHICH CASE?)
The following data set collects n = 41 randomly sampled waiting
times of students from ST2334 to receive reply for their email from
a survey in the day time.
2.50
23.28
19.34
4.74
7.03
21.85
2.72
17.73
21.55
9.71
30.24
0.37
31.26
35.24
7.81
16.69
66.54
1.88
14.14
46.59
28.17
0.06
9.32
0.03
10.75
6.97
56.86
2.89
7.67
30.16
0.33
0.44
3.77
25.07
7.05
0.08
10.64
13.10
7.92 112.77
11.93
Given that x = 17.736 and s = 21.7, construct a 98% confidence inter-
val for the mean waiting time of all ST2334 students.
Solution:
Note that σ is unknown, and n is large. So we are in Case IV.
Note that zα/2 = z0.01 = 2.326. So our 98% confidence interval is
x±zα/2
s
√n = 17.736±2.326× 21.7
√
41
= (9.85,25.62).
EXAMPLE 6.7 (WHICH CASE AGAIN?)
The contents of 7 similar containers of sulphuric acid (in litres) are
9.8
10.2
10.4
9.8
10.0
10.2
9.6
It can shown that x = 10 and s2 = 0.08. Find a 95% confidence interval
for the mean content of all such containers, assuming an approximate
NORmal distribution for container contents.
Solution:
We are in Case III.
Using software, we obtain t6;0.025 = 2.447.
Thus a 95% confidence interval for the mean content of all such con-
tainers is given as
x±tn−1;α/2 · s
√n = 10±2.447·
√
0.08
√
7
= (9.738,10.262).

## Page 102

98
Estimation
INTERPRETING CONFIDENCE INTERVALS I
• We saw that X ±E has probability (1−α) of containing µ.
This is a probability statement about the procedure by which we compute
the interval — the interval estimator.
• Each time we take a sample, and go through this construction, we get a dif-
ferent confidence interval.
• Sometimes we get a confidence interval that contains µ, and sometimes we
get one that does not contain µ.
• Once an interval is computed, µ is either in it or not. There is no more ran-
domness.
INTERPRETING CONFIDENCE INTERVALS II
• Since µ is typically not known, there is no way to determine whether a par-
ticular confidence interval succeeded in capturing the population mean.
• However, if we repeat this procedure of taking a sample and computing a
confidence interval many times, about (1−α) of the many confidence inter-
vals that we get will contain the true parameter.
This is what ”confidence” means — a confidence in the method used.
• The following R Shiny app allows us to explore this fact:
https://istats.shinyapps.io/ExploreCoverage/
3
COMPARING TWO POPULATIONS
In real applications, it is quite common to compare the means of two popu-
lations.
Imagine that we have two populations
• Population 1 has mean µ1, variance σ2
1 .
• Population 2 has mean µ2, variance σ2
2 .
Experimental Design
In order to compare two populations, a number of observations from each
population need to be collected. Experimental design refers to the manner in
which samples from populations are collected.

## Page 103

Comparing Two Populations
99
TWO BASIC DESIGNS FOR COMPARING TWO TREATMENTS
• Independent samples — complete randomization.
• Matched pairs samples — randomization between matched pairs.
EXAMPLE 6.8 (INDEPENDENT SAMPLES)
In order to compare the examination scores of male and female stu-
dents attending ST2334,
• 10 scores of female students are randomly sampled — Sample I,
• 8 scores of male students are randomly sampled — Sample II.
Note that all observations are independent —
• Sample I and Sample II are independent;
• Individuals within Sample I are independent;
• Individuals within Sample II are independent.
EXAMPLE 6.9 (MATCHED PAIRS SAMPLES)
In order to study whether there exists income difference between
male and female, 100 married couples are sampled, and their monthly
incomes are collected.
In this example, the treatment groups are the female group and male
group.
Note that observations are dependent in a special way —
• Within the pair, the observations are dependent (since they are
married to one another);
• Between pairs, observations are independent.

## Page 104

100
Estimation
4
INDEPENDENT SAMPLES: UNEQUAL VARIANCES
Our interest is to make statistical inference on µ1−µ2. Consider the following
assumptions:
INDEPENDENT SAMPLES (KNOWN AND UNEQUAL VARIANCES)
1. A random sample of size n1 from population 1 with mean µ1 and variance σ2
1 .
2. A random sample of size n2 from population 2 with mean µ2 and variance σ2
2 .
3. The two samples are independent.
4. The population variances are known and not the same: σ2
1 ̸= σ2
2
5. Either one of the following conditions holds:
• The two populations are NORmal; OR
• Both samples are large: n1 ≥30, n2 ≥30.
Consider X1,...,Xn1 and Y1,...,Yn2, random samples from the two populations
of interest. Let
X = 1
n1
n1
∑
i=1
Xi, and Y = 1
n2
n2
∑
i=1
Yi
be the means of random samples.
Then,
E(X) = µ1,
V(X) = σ2
1
n1
,
E(Y) = µ2,
V(Y) = σ2
2
n2
.
Thus
E(X −Y) = µ1 −µ2 = δ,
and, using the independence assumption,
V(X −Y) = σ2
1
n1
+ σ2
2
n2
.
When
• the two populations are NORmal, OR
• both samples are large,
we have
Z = (X −Y)−(µ1 −µ2)
q
σ2
1
n1 + σ2
2
n2
≈N(0,1).

## Page 105

Independent Samples: Unequal variances
101
Confidence Intervals for µ1 −µ2
We are interested in the difference
δ = µ1 −µ2,
with confidence 100(1−α)% for any 0 < α < 1.
If σ2
1 and σ2
2 are known, by the distributions above, we have
P



(X −Y)−(µ1 −µ2)
q
σ2
1
n1 + σ2
2
n2

< zα/2

= 1−α
or
P

(X −Y)−zα/2
s
σ2
1
n1
+ σ2
2
n2
< µ1 −µ2 < (X −Y)+zα/2
s
σ2
1
n1
+ σ2
2
n2

= 1−α.
Thus the 100(1−α)% confidence interval for µ1 −µ2 is

(X −Y)−zα/2
s
σ2
1
n1
+ σ2
2
n2
, (X −Y)+zα/2
s
σ2
1
n1
+ σ2
2
n2


or
(X −Y)±zα/2
s
σ2
1
n1
+ σ2
2
n2
.
CONFIDENCE INTERVALS: KNOWN AND UNEQUAL VARIANCES
Suppose we have independent populations with known and unequal variances,
and that either one of the following conditions holds:
• The two populations are NORmal; OR
• Both samples are large: n1 ≥30, n2 ≥30.
The 100(1−α)% confidence interval for µ1 −µ2, is then given as
(x−y)±zα/2
q
σ2
1/n1 + σ2
2/n2.

## Page 106

102
Estimation
EXAMPLE 6.10
A study was conducted to compare two types of engines, A and B.
Gas mileage, in miles per gallon, was measured. 50 experiments were
conducted using engine A. 75 experiments were done for engine type
B. The gasoline used and other conditions were held constant.
• The average gas mileage for 50 experiments using engine A was
36 miles per gallon and
• The average gas mileage for the 75 experiments using machine
B was 42 miles per gallon.
Find a 96% confidence interval on µB −µA, where µA and µB are the
population mean gas mileage for machine types A and B, respec-
tively.
Assume that the population standard deviations are 6 and 8 for ma-
chine types A and B, respectively.
Solution:
For a 96% confidence interval, α = 0.04 and z0.02 = 2.05. We are also
given that
n1 = 50,xA = 36, σ2
1 = 62
n2 = 75,xB = 42, σ2
2 = 82
The sample sizes are large, so a 96% confidence interval for µB −µA is
(xB −xA)±zα/2
q
σ2
2/n2 + σ2
1/n1
= (42−36)±2.05·
q
82/75+ 62/50
= (3.428,8.571).
We next consider the following assumptions/case:
INDEPENDENT SAMPLES (LARGE, WITH UNKNOWN VARIANCES)
1. A random sample of size n1 from population 1 with mean µ1 and variance σ2
1 .
2. A random sample of size n2 from population 2 with mean µ2 and variance σ2
2 .
3. The two samples are independent.
4. The population variances are unknown and not the same: σ2
1 ̸= σ2
2
5. Both samples are large: n1 ≥30, n2 ≥30.

## Page 107

Independent Samples: Equal variances
103
Since σ1 and σ2 are unknown, let
S2
1 =
1
n1 −1
n1
∑
i=1
(Xi −X)2, and S2
2 =
1
n2 −1
n2
∑
i=1
(Yi −Y)2
and use
Z = (X −Y)−(µ1 −µ2)
q
S2
1
n1 + S2
2
n2
≈N(0,1).
If σ2
1 and σ2
2 are unknown, the 100(1−α)% CI for µ1 −µ2 is

(X −Y)−zα/2
s
S2
1
n1
+ S2
2
n2
, (X −Y)+zα/2
s
S2
1
n1
+ S2
2
n2


or
(X −Y)±zα/2
s
S2
1
n1
+ S2
2
n2
.
CONFIDENCE INTERVALS: LARGE, WITH UNKNOWN VARIANCES
Suppose we have independent populations with unknown and unequal variances,
and that both samples are large: n1 ≥30, n2 ≥30.
The 100(1−α)% confidence interval for µ1 −µ2, is then given as
(x−y)±zα/2
q
s2
1/n1 + s2
2/n2.
5
INDEPENDENT SAMPLES: EQUAL VARIANCES
Consider the following assumptions:
INDEPENDENT SAMPLES: SMALL, WITH EQUAL VARIANCES
1. A random sample of size n1 from population 1 with mean µ1 and variance σ2
1 .
2. A random sample of size n2 from population 2 with mean µ2 and variance σ2
2 .
3. The two samples are independent.
4. The population variances are unknown and the same: σ2
1 = σ2
2 = σ2.
5. Both samples are small: n1 < 30, n2 < 30
6. Both populations are NORmally distributed.

## Page 108

104
Estimation
THE EQUAL VARIANCE ASSUMPTION
In real applications, the equal variance assumption is usually unknown and
needs to be checked.
Based upon the NORmal distribution and equal variance assumptions
Z = (X −Y)−(µ1 −µ2)
σ
q
1
n1 + 1
n2
∼N(0,1).
Since σ is unknown, we shall estimate it.
Note that S2
1 and S2
2 are both unbiased estimators of σ2 under the equal vari-
ance assumption.
We can use the pooled estimator to estimate σ2 better.
DEFINITION 6 (THE POOLED ESTIMATOR: S2
p)
σ2 can be estimated by the pooled sample variance
S2
p = (n1 −1)S2
1 +(n2 −1)S2
2
n1 +n2 −2
,
with S2
1 and S2
2 being the sample variances of the first and second samples respec-
tively.
When we estimate σ2 using S2
p, the resulting statistic
T = (X −Y)−(µ1 −µ2)
Sp
q
1
n1 + 1
n2
∼tn1+n2−2
follows a t-distribution with degrees of freedom n1 +n2 −2.
We then have
P

−tn1+n2−2;α/2 < (X −Y)−(µ1 −µ2)
Sp
q
1
n1 + 1
n2
< tn1+n2−2;α/2

= 1−α.

## Page 109

Independent Samples: Equal variances
105
CONFIDENCE INTERVALS: SMALL, WITH EQUAL VARIANCES
Suppose we have independent, NORmal populations with unknown and equal vari-
ances, and that both samples are small: n1 < 30, n2 < 30.
A 100(1−α)% confidence interval for µ1 −µ2 is given as
(X −Y)±tn1+n2−2;α/2 Sp
r
1
n1
+ 1
n2
.
EXAMPLE 6.11
A course in mathematics is taught to 12 students by the conventional
classroom procedure. A second group of 10 students was given the
same course by means of programmed materials.
At the end of the semester the same examination was given to each
group.
• The 12 students meeting in the classroom made an average grade
of 85 with standard deviation of 4.
• The 10 students using programmed materials made an average
of 81 with a standard deviation of 5.
Find a 90% confidence interval for the difference between the popu-
lation means, assuming the populations are approximately NORmally
distributed with equal variances.
Solution:
Let µ1 and µ2 represent the average grades of all students who might
take this course by the classroom and programmed presentations re-
spectively.
So x−y = 85−81 = 4 is the point estimate for µ1 −µ2.
As we assume equal population variance, we estimate it by the pooled
variance
s2
p = (12−1)×42 +(10−1)×52
12+10−2
= 20.05.
In this case, tn1+n2−2;α/2 = t20;0.05 = 1.7247. Thus a 90% confidence in-
terval for µ1 −µ2 is given as
(x−y)±tn1+n2−2;α/2 sp
r
1
n1
+ 1
n2
= (85−81)±1.7247×
√
20.05×
r
1
12 + 1
10
= (0.693,7.307).

## Page 110

106
Estimation
Independent Large Samples with Equal Variance
Note that for large samples such that n1 ≥30, n2 ≥30, we can replace tn1+n2−2;α/2
by zα/2 in the previous formula.
CONFIDENCE INTERVALS: LARGE, WITH EQUAL VARIANCES
Suppose we have independent populations with unknown and equal variances,
and that both samples are large: n1 ≥30, n2 ≥30.
A 100(1−α)% confidence interval for µ1 −µ2 is given as
(X −Y)±zα/2 Sp
r
1
n1
+ 1
n2
.
6
PAIRED DATA
Some times, like in the couple income example, it makes sense to take matched
pairs instead of independent samples.
Because of dependence in the sample, the methods discussed previously are
not applicable.
Consider the assumptions that follows.
PAIRED DATA
1. (X1,Y1),...,(Xn,Yn) are matched pairs, where X1,...,Xn is a random sample from
population 1, Y1,...,Yn is a random sample from population 2.
2. Xi and Yi are dependent.
3. (Xi,Yi) and (Xj,Yj) are independent for any i ̸= j.
4. For matched pairs, define Di = Xi −Yi,
µD = µ1 −µ2.
5. Now we can treat D1,D2,...,Dn as a random sample from a single population
with mean µD and variance σ2
D.
All techniques derived for a single population can now be employed.
• We consider the statistic
T = D−µD
SD/√n,
where
D = ∑n
i=1 Di
n
,
S2
D = ∑n
i=1(Di−D)2
n−1
.
• If n < 30 and the population is NORmally distributed then
T ∼tn−1.

## Page 111

Paired Data
107
• If n ≥30, then
T ∼N(0,1).
CONFIDENCE INTERVALS: PAIRED DATA
For paired data, if n is small (n < 30) and the population is NORmally distributed, a
(1−α)100% confidence interval for µD is
d ±tn−1;α/2 · sD
√n.
If n is large (n ≥30), a (1−α)100% confidence interval for µD is
d ±zα/2 · sD
√n.
EXAMPLE 6.12
Twenty students were divided into 10 pairs, each member of the pair
having approximately the same IQ.
One of each pair was selected at random and assigned to a mathe-
matics section using programmed materials only. The other member
of each pair was assigned to a section in which the professor lectured.
At the end of the semester each group was given the same examina-
tion and the following results were recorded.
Pair
1
2
3
4
5
6
7
8
9
10
P.M.
76
60
85
58
91
75
82
64
79
88
Lecture
81
52
87
70
86
77
90
63
85
83
d
–5
8
–2
–12
5
–2
–8
1
–6
5
Given that d = −1.6 and s2
D = 40.71, compute a 98% confidence inter-
val for the true difference in the two learning procedures.
Solution:
Since α = 0.02, we have tn−1;α/2 = t9,0.01 = 2.821. Thus a 98% confi-
dence interval for the true difference µD is given as
d ±tn−1;α/2 · sD
√n = −1.6±2.821×
r
40.71
10
= (−7.292,4.092).

## Page 112

108
Estimation

## Page 113

Seven
Hypothesis Tests
1
HYPOTHESIS TESTS
One of the most fundamental technique of statistical inference is the hypoth-
esis test. There are many types of hypothesis tests but all follow the same
logical structure, so we begin with hypothesis testing of a population mean.
Hypothesis testing begins with a null hypothesis and an alternative hypothe-
sis. Both the null and the alternative hypotheses are statements about a pop-
ulation. In this chapter, that statement will be a statement about the mean(s)
of the population(s).
We will illustrate using an example.
EXAMPLE 7.1 (MEAN AGE)
We are interested to check if the mean age of a population is µ = 50.
Suppose we have no access to population data. So we take a sample
from the population and obtained a sample mean age of x = 20. Does
this gives evidence for or against the hypothesis that µ = 50?
109

## Page 114

110
Hypothesis Tests
EXAMPLE 7.2 (NUS STUDENTS’ IQ)
Consider the statement
“NUS students have higher IQ than the general population (100).”
It is difficult/expensive to ask every NUS student to take an IQ test.
So we take a sample.
Suppose the sample average is 110.
• Does that mean we’re right?
• What if the sample average is 101? What about 100.1?
• Does the sample size matter?
HOW TO DO A HYPOTHESIS TEST
There are five main steps to hypothesis testing.
Step 1: Set your competing hypotheses: null and alternative.
Step 2: Set the level of significance.
Step 3: Identify the test statistic, its distribution and the rejection criteria.
Step 4: Compute the observed test statistic value, based on your data.
Step 5: Conclusion.
Let us have a closer look at each step.

## Page 115

Hypothesis Tests
111
Step 1: Null Hypothesis vs Alternative Hypothesis
Our goal is to decide between two competing hypotheses.
NULL VS ALTERNATIVE
In general, we adopt the position of the null hypothesis unless there is overwhelm-
ing evidence against it.
The null hypothesis is typically the default assumption, or the conventional wis-
dom about a population. Often it is exactly the thing that a researcher is trying to
show is false.
We usually let the hypothesis that we want to prove be the alternative hypothe-
sis. The alternative hypothesis states that the null hypothesis is false, often in a
particular way.
The outcome of hypothesis testing is to either reject or fail to reject the null
hypothesis.
A researcher would collect data relating to the population being studied and
use a hypothesis test to determine whether the evidence against the null hy-
pothesis (if any) is strong enough to reject the null hypothesis in favor of the
alternative hypothesis.
We usually phrase the hypotheses in terms of population parameters.
EXAMPLE 7.3 (ONE-SIDED TEST)
Let µ be the average IQ of NUS students. Consider
H0 : µ = 100
vs
H1 : µ > 100.
This is an example of a one-sided hypothesis test.
For this alternative hypothesis, we do not care if µ < 100: the goal
here is just to show NUS students have IQ higher than 100.
EXAMPLE 7.4 (TWO-SIDED TEST)
Sometimes it is more natural to do a two-sided hypothesis test.
For example, let p be the probability of heads for a particular coin.
You want to test if the coin is fair (that is, p = 0.5), as it is equally
problematic if p was larger or smaller.
Hence you set your hypotheses to be
H0 : p = 0.5
vs
H1 : p ̸= 0.5.

## Page 116

112
Hypothesis Tests
Step 2: Level of Significance
For any test of hypothesis, there are two possible conclusions:
• Reject H0 and therefore conclude H1;
• Do not reject H0 and therefore conclude H0.
Whatever decision is made, there is a possibility of making an error.
Do not reject H0
Reject H0
H0 is true
Correct Decision
Type I error
H0 is false
Type II error
Correct Decision
DEFINITION 1 (TYPE I VS TYPE II ERROR)
The rejection of H0 when H0 is true is called a Type I error.
Not rejecting H0 when H0 is false is called a Type II error.
DEFINITION 2 (SIGNIFICANCE LEVEL VS POWER)
The probability of making a Type I error is called the level of significance, de-
noted by α. That is,
α = P(Type I error) = P(Reject H0 | H0 is true).
Let
β = P(Type II error) = P(Do not reject H0 | H0 is false).
We define 1−β = P(Reject H0 | H0 is false) to be the power of the test.
REMARK
The Type I error is considered a serious error, so we want to control the probability
of making such an error.
Thus prior to conducting a hypothesis test, we set the significance level α to be
small, typically at α = 0.05 or 0.01.

## Page 117

Hypotheses concerning the Mean
113
Step 3: Test Statistic, Distribution and Rejection Region
To test the hypothesis, we first select a suitable test statistic for the parameter
under the hypothesis.
The test statistic serves to quantify just how unlikely it is to observe the sam-
ple, assuming the null hypothesis is true.
As the significance level α is given, a decision rule can be found such that it
divides the set of all possible values of the test statistic into two regions, one
being the rejection region (or critical region) and the other, the acceptance
region.
Step 4 & 5: Calculation and Conclusion
Once a sample is taken, the value of the test statistic is obtained.
We check if it is within our rejection region.
• If it is, our sample was too improbable assuming H0 is true, hence we
reject H0.
• If it is not, we did not accomplish anything. We failed to reject H0 and
hence fall back to our original assumption of H0.
Note that in the latter case, we did not “prove” that H0 is true. Hence, it is
prudent to use the term “fail to reject H0” instead of “accept H0.”
2
HYPOTHESES CONCERNING THE MEAN
Let’s apply our hypothesis steps to testing a population mean.
Case: Known variance
Let us consider the case where
• the population variance σ2 is known; AND
• where
– the underlying distribution is NORmal; OR
– n is sufficiently large (say, n ≥30).
Step 1: We set the null and alternatives hypotheses as
H0 : µ = µ0
vs
H1 : µ ̸= µ0.
Note that in this case we are considering a two-sided alternative hy-
pothesis.
Step 2: Set level of significance: α is typically set to be 0.05.

## Page 118

114
Hypothesis Tests
Step 3: Statistic & its distribution:
With σ2 known and population NORmal (or n ≥30),
Z = X −µ
σ/√n ∼N(0,1).
When H0 is true, µ = µ0, the above becomes
Z = X −µ0
σ/√n ∼N(0,1),
and will serve as our test statistic.
Rejection region:
Intuitively, we should reject H0 when X is too large or too small com-
pared with µ0.
This is the same as when Z is too large or too small. In theory,
P(|Z| > zα/2) = α.
Let the observed value of Z be z. Then the rejection region is defined
by |z| > zα/2, which is
z < −zα/2
or
z > zα/2.
density function of Z
0
1 −α
−zα 2
α 2
zα 2
α 2
Reject H0
Reject H0
Do not reject H0
Step 4: Computations: z should be computed from the statistic above based
upon the observed sample.
Step 5: Conclusion: check whether z is located within rejection region. If so,
reject H0, otherwise do not reject H0.

## Page 119

Hypotheses concerning the Mean
115
WHERE DID THE VALUE 0.05 COME FROM?
In 1931, in a famous book called The Design of Experiments, Sir Ronald Fisher dis-
cussed the amount of evidence needed to reject a null hypothesis.
He said that it was situation dependent, but remarked, somewhat casually, that for many
scientific applications, 1 out of 20 might be a reasonable value.
Since then, some people — indeed some entire disciplines — have treated the number
0.05 as sacrosanct.
Sir Ronald Fisher (1890 – 1962) was one of the founders of modern Statistics. For a
biography of Fisher, browse to
http://www-history.mcs.st-andrews.ac.uk/Biographies/Fisher.html
EXAMPLE 7.5
The director of a factory wants to determine if a new machine A is
producing cloths with a breaking strength of 35 kg with a standard
deviation of 1.5 kg.
A random sample of 49 pieces of cloths is tested and found to have a
mean breaking strength of 34.5 kg. Is there evidence that the machine
is not meeting the specifications for mean breaking strength?
Use α = 0.05.
Solution:
Note that n > 30 and σ = 1.5.
Let µ be the mean breaking strength of cloths manufactured by the
new machine.
Step 1: We test
H0 : µ = 35
vs
H1 : µ ̸= 35.
Step 2: Set α = 0.05.
Step 3: As σ2 is known and n ≥30,
Z = X −µ0
σ/√n ∼N(0,1)
will serve as our test statistic.
Since zα/2 = z0.025 = 1.96, the critical/rejection region is
z < −1.96
or
z > 1.96.
Step 4: z is computed to be
z = x−µ0
σ/√n = 34.5−35
1.5/
√
49 = −2.3333 < −1.96.

## Page 120

116
Hypothesis Tests
Step 5: The observed z value, z = −2.3333, falls inside the critical re-
gion. Hence the null hypothesis H0 : µ = 35 is rejected at the
5% level of significance.
One-sided alternatives
Now the above procedures are establish under
H0 : µ = µ0
vs
H1 : µ ̸= µ0.
Suppose instead we are considering
H0 : µ = µ0
vs
H1 : µ > µ0.
Similar steps can be used to address this problem, we only need to do the
following changes:
• Step 1: H1 is replaced with H1 : µ > µ0.
• Step 3: The test statistic and its distribution are kept the same. The
rejection region should be replaced with z > zα, since now, we should
reject only when x (and therefore z) is large.
The case for
H0 : µ = µ0
vs
H1 : µ < µ0
should be self-evident.

## Page 121

Hypotheses concerning the Mean
117
HYPOTHESIS TEST FOR THE MEAN: KNOWN VARIANCE
Consider the case where
• the population variance σ2 is known; AND
• where
– the underlying distribution is NORmal; OR
– n is sufficiently large (say, n ≥30).
For the null hypothesis H0 : µ = µ0, the test statistics is given by
Z = X −µ0
σ/√n ∼N(0,1).
Let z be the observed Z value. For the alternative hypothesis
• H1 : µ ̸= µ0, the rejection region is
z < −zα/2
or
z > zα/2.
• H1 : µ < µ0, the rejection region is
z < −zα.
• H1 : µ > µ0, the rejection region is
z > zα.
p-value approach to testing
The above technique introduced by Fisher is based on a pre-declared signifi-
cance level α.
Today, there is little reason to stick to the arbitrary 1% or 5% levels that Fisher
suggested. We can instead use the idea of the p-value.
DEFINITION 3 (p-VALUE)
The p-value is the probability of obtaining a test statistic at least as extreme (≤
or ≥) than the observed sample value, given H0 is true.
It is also called the observed level of significance.

## Page 122

118
Hypothesis Tests
p-VALUE FOR HYPOTHESIS TESTS
Suppose our computed test statistic was z. For a two sided test, a “worse” result
would be if Z > |z| or Z < −|z|, in other words, |Z| > |z|.
So the p-value is given by
p-value = P(|Z| > |z|) = 2P(Z > |z|) = 2P(Z < −|z|)
density function of Z
0
−zα 2
α
2
zα 2
α
2
Reject H0
Reject H0
Do not reject H0
|z|
p
2
z falls in the rejection region if and only if p < α
For the alternative hypothesis H1 : µ < µ0, the p-value is P(Z < −|z|).
That is, only the area in the left tail is used.
For the alternative hypothesis H1 : µ > µ0, the p-value is P(Z > |z|).
That is, only the area in the right tail is used.
density function of Z
0
|z|
p
One−sided test: p−value is represented by the shaded area
REJECTION CRITERIA USING p-VALUE
We see that the p-value is smaller than the significance level if and only if our test
statistic is in the rejection region.
Thus our rejection criteria would be
• If p-value < α, reject H0; else
• If p-value ≥α, do not reject H0.

## Page 123

Hypotheses concerning the Mean
119
REMARK
In practice, it is better to report the p-value than to indicate whether H0 is rejected.
• The p-values of 0.049 and 0.001 both result in rejecting H0 when α = 0.05, but
the second case provides much stronger evidence.
• p-values of 0.049 and 0.051 provide, in practical terms, the same amount of
evidence about H0.
Most research articles report the p-value rather than a decision about H0. From the
p-value, readers can view the strength of evidence against H0 and make their own
decision, if they want to.
EXAMPLE 7.6 (MIDTERM EXAM SCORE)
Recall the midterm exam scores example in an earlier chapter. The
data obtained are
20,19,24,22,25.
We were told that the exam scores are approximately NORmal.
The lecturer announced that the variance of the exam score over the
class is 5 (just believe that this is the truth). Test at α = 0.01 signifi-
cance level whether the average midterm score is different from 16.
Solution:
Let µ be the average midterm score for the whole class.
Step 1: H0 : µ = 16
vs
H1 : µ ̸= 16.
Step 2: Choose α = 0.01.
Step 3: In this example σ =
√
5 is known, data are NORmal, and n = 5.
Therefore the test statistic and its distribution is
Z = X −µ0
σ/√n ∼N(0,1).
Now zα/2 = z0.005 = 2.576. Thus the rejection region is
z < −2.576
or
z > 2.576.

## Page 124

120
Hypothesis Tests
density function of Z
0
−2.576
0.005
2.576
0.005
Reject H0
Reject H0
Do not reject H0
z=6
Step 4: z = (22−16)/(
√
5/
√
5) = 6 > 2.576.
Step 5: As z = 6 falls in rejection region, H0 is rejected.
Alternatively, we can use the p-value approach.
Note that the p-value is given, using a computer, as
2P(Z > 6) = 1.973175×10−9,
which is smaller than α = 0.01. So we reject H0.
density function of Z
0
−2.576
2.576
Reject H0
Reject H0
Do not reject H0
z=6
p−value is twice the area of the shaded region
We can use our knowledge of the sampling distribution to determine the test
statistic for other situations.

## Page 125

Two-sided Tests and Confidence Intervals
121
HYPOTHESIS TEST FOR THE MEAN: UNKNOWN VARIANCE
Consider the case where
• the population variance σ2 is unknown; AND
• the underlying distribution is NORmal.
For the null hypothesis H0 : µ = µ0, the test statistics is given by
T = X −µ0
S/√n ∼tn−1.
Let t be the observed T value. For the alternative hypothesis
• H1 : µ ̸= µ0, the rejection region is
t < −tn−1,α/2
or
t > tn−1,α/2.
• H1 : µ < µ0, the rejection region is
t < −tn−1,α.
• H1 : µ > µ0, the rejection region is
t > tn−1,α.
REMARK
When n ≥30, we can replace tn−1 by Z, the standard NORmal distribution.
3
TWO-SIDED TESTS AND CONFIDENCE INTERVALS
In this section, we establish that the two-sided hypothesis test procedure is
equivalent to finding a 100(1−α)% confidence interval for µ.
We illustrate using Case III: NORmal population, small n, unknown σ.
Once again, consider
H0 : µ = µ0
vs
H1 : µ ̸= µ0.
The 100(1−α)% confidence interval for µ in this case is given by

x−tα/2
s
√n, x+tα/2
s
√n

.

## Page 126

122
Hypothesis Tests
If the 100(1−α)% confidence interval contains µ0, we will have
x−tα/2
s
√n ≤µ0 ≤x+tα/2
s
√n.
Rearranging the above inequality, we obtain
−tα/2 ≤x−µ0
s/√n ≤tα/2.
This means that the computed test statistic t = x−µ0
s/√n satisfies
−tα/2 ≤t ≤tα/2.
Note that the rejection region for this case is
t < −tα/2
or
t > tα/2.
This means that when the confidence interval contains µ0, H0 will not be re-
jected at level α.
Similarly, when the confidence interval does not contain µ0, then
t > tα/2
or
t < −tα/2.
Thus t falls within the rejection region and so H0 will be rejected.
Therefore confidence intervals can be used to perform two-sided tests.
EXAMPLE 7.7 (MIDTERM EXAM SCORE III)
Back to Example 7.6, regarding midterm exam scores. Assume that
the lecturer did not announce the variance, i.e., σ is unknown.
The student constructed a 99% (α = 0.01) confidence interval for the
average score of students for the midterm:
x±tα/2
s
√n = 22±4.604× 2.55
√
5
= (16.75,27.25).
The interval does not contain 16, so the following test of hypothesis
should be rejected at α = 0.01:
H0 : µ = 16
vs
H1 : µ ̸= 16.
What about
H0 : µ = 17
vs
H1 : µ ̸= 17?

## Page 127

Tests Comparing Means: Independent Samples
123
4
TESTS COMPARING MEANS: INDEPENDENT SAMPLES
Suppose two independent samples are drawn from two populations with
means µ1 and µ2. We are interested in testing
H0 : µ1 −µ2 = δ0
against a suitable alternative hypothesis.
COMPARING MEANS: INDEPENDENT SAMPLES I
(A) Consider the case where
• the population variances σ2
1 and σ2
2 are known; AND
• where
– the underlying distributions are NORmal; OR
– n1,n2 are sufficiently large (say, n1 ≥30,n2 ≥30).
For the null hypothesis H0 : µ1 −µ2 = δ0, the test statistics is given by
Z = (X −Y)−δ0
r
σ2
1
n1 + σ2
2
n2
∼N(0,1).
(B) Consider the case where
• the population variances σ2
1 and σ2
2 are unknown; AND
• n1,n2 are sufficiently large (say, n1 ≥30,n2 ≥30).
For the null hypothesis H0 : µ1 −µ2 = δ0, the test statistics is given by
Z = (X −Y)−δ0
r
S2
1
n1 + S2
2
n2
∼N(0,1).
The rejection regions or p-values can be established similarly as before.
REJECTION REGIONS AND p-VALUES
For the null hypothesis H0 : µ1 −µ2 = δ0, and specified alternative H1, the rejection
regions and p-values are given below.
H1
Rejection Region
p-value
µ1 −µ2 > δ0
z > zα
P(Z > |z|)
µ1 −µ2 < δ0
z < −zα
P(Z < −|z|)
µ1 −µ2 ̸= δ0
z > zα/2 or z < −zα/2
2P(Z > |z|)

## Page 128

124
Hypothesis Tests
EXAMPLE 7.8
Analysis of a random sample consisting of n1 = 20 specimens of cold-
rolled steel to determine yield strengths resulted in a sample average
strength of x = 29.8 ksi.
A second random sample of n2 = 25 two-side galvanized steel speci-
mens gave a sample average strength of y = 34.7 ksi.
Assuming that the two yield strength distributions are NORmal with
σ1 = 4.0 and σ2 = 5.0, does the data indicate that the corresponding
true average yield strengths µ1 and µ2 are different?
Use α = 0.01.
Solution:
Let µ1 and µ2 be the mean strength of cold-rolled steel and two-side
galvanized steel respectively.
Step 1: Note that δ0 = 0 in this example. So the hypotheses are
H0 : µ1 −µ2 = 0
vs
H1 : µ1 −µ2 ̸= 0.
Step 2: Set α = 0.01.
Step 3: Test statistic and its distribution is given below:
Z = (X −Y)−0
q
σ2
1
n1 + σ2
2
n2
≈N(0,1).
Note that zα/2 = z0.005 = 2.5782. Thus the rejection region is
z > 2.5782
or
z < −2.5782.
Step 4: Plug in the data,
z = (29.8−34.7)−0
q
16
20 + 25
25
= −3.652 < −2.5782 = −zα/2.
Step 5: Since z = −3.652 falls inside the critical region, hence H0 : µ1 =
µ2 is rejected at the 1% level of significance. We conclude that
the sample data strongly suggest that the true average yield
strength for cold-rolled steel differs from that for galvanized
steel.
Alternatively, we can compute the p-value to be
2×P(Z < −3.652) = 0.00026 < 0.01 = α.
Thus we reject the null hypothesis at α = 0.01 level.

## Page 129

Tests Comparing Means: Paired Data
125
COMPARING MEANS: INDEPENDENT SAMPLES II
Consider the case where
• the population variances σ2
1 and σ2
2 are unknown but equal;
• the underlying distributions are NORmal;
• n1,n2 are small (say, n1 < 30,n2 < 30).
For the null hypothesis H0 : µ1 −µ2 = δ0, the test statistics is given by
Z = (X −Y)−δ0
Sp
q
1
n1 + 1
n2
∼tn1+n2−2.
5
TESTS COMPARING MEANS: PAIRED DATA
Comparing means with matched-pairs data is easy. We merely use methods
we have already learned for single samples.
COMPARING MEANS: PAIRED DATA
For paired data, define Di = Xi −Yi.
For the null hypothesis H0 : µD = µD0, the test statistics is given by
T = D−µD0
SD/√n .
• If n < 30 and the population is NORmally distributed then
T ∼tn−1.
• If n ≥30, then
T ∼N(0,1).

## Page 130

126
Hypothesis Tests
EXAMPLE 7.9 (TREATING CATALYST SURFACES)
Prof X developed a new procedure for treating catalyst surfaces which
he claims will result in a significant enhancement in the number of
active sites.
The number of active sites can be determined by absorption of H2
gas.
Prof X tested each sample before and after the treatment and obtained
the following H2 uptake in terms of mmol/g.
Sample No.
Before treatment (X)
After treatment (Y)
Difference (D)
1
165
172
7
2
146
189
43
3
174
168
−6
4
186
176
−10
5
147
198
51
6
153
184
31
7
132
188
56
8
175
197
22
The summary statistics for the variable D are d = 24.25 and sD = 25.34.
Has the treatment resulted in an increase in the number of active sites
on the catalyst surfaces? Assume NORmality, and test at α = 0.05 level.
Solution:
Note that in such a setup the two samples are not independent, and
so the two sample t-test does not apply.
Define Di = Yi −Xi, where Xi and Yi are the ”before treatment” and
”after treatment” readings.
The question is now reduced to:
Do the data give any evidence that µD > 0?
Step 1: We set the null and alternative to be
H0 : µD = 0
vs
H1 : µD > 0.
Step 2: Set α = 0.05.
Step 3: We use the paired t-test with the test statistics
T = D−0
SD/√n.
The rejection region is t > t7,0.05 = 1.895.
Step 4: The observed t value is
t = d −0
sD/√n = 24.25−0
25.34/
√
8 = 2.70 > 1.895.

## Page 131

Tests Comparing Means: Paired Data
127
Step 5: Since t = 2.70 > t7,0.05 = 1.895, we reject H0 and conclude that
there is evidence that treatment of catalysts increases the num-
ber of active sites.
As an aside, the p-value is
P(t7 > t) = P(t7 > 2.70) = 0.0153,
which is smaller than 0.05.