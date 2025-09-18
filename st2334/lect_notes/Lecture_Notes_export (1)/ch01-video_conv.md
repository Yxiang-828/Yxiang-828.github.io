# ST2334

## Page 1

ST2334
Probability and Statistics
Academic Year 2025/2026
Semester I

## Page 3

One
Basic Concepts of
Probability

## Page 4

1
PROBABILITY CONCEPTS AND DEFINITIONS
In this section we introduce the basic terminology of probability the-
ory: experiment, outcomes, sample space, events.

## Page 5

DEFINITION 1 (EXPERIMENT, SAMPLE SPACE, EVENT)
A statistical experiment is any procedure that produces data or observa-
tions.
The sample space, denoted by S, is the set of all possible outcomes of a
statistical experiment. The sample space depends on the problem of
interest!
A sample point is an outcome (element) in the sample space.
An event is a subset of the sample space.

## Page 6

EXAMPLE 1.1
Consider the experiment of rolling a die.
(i) If the problem of interest is “the number that shows on the top
face", then
• Sample space: S = {1,2,3,4,5,6}.
• Sample point: 1 or 2 or 3 or 4 or 5 or 6.
• Some possible events are:
– an event where an odd number occurs = {1,3,5};
– an event where a number greater than 4 occurs = {5,6}.

## Page 7

(ii) If the problem of interest is “whether the number is even or odd",
then
• Sample space: S = {even, odd}.
• Sample point: “even" or “odd".
• A possible event is:
– an event where an odd number occurs = {odd}.

## Page 8

REMARK
The sample space is itself an event and is called a sure event.
An event that contains no element is the empty set, denoted by /0, and is called a
null event.

## Page 9

2
EVENT OPERATIONS & RELATIONSHIPS
Let A and B be two events in the sample space S. We shall go through
some event operations and relationships involving A and B.
• Event operations:
(i) Union;
(ii) Intersection;
(iii) Complement.
• Event relationships:
(i) Contained;
(ii) Equivalent;
(iii) Mutually exclusive.

## Page 10

Union
The union of events A and B, denoted by A∪B, is the event containing
all elements that belong to A or B or both. That is
A∪B = {x : x ∈A or x ∈B}.
A
B
A∩B
S

## Page 11

Intersection
The intersection of events A and B, denoted by A∩B or simply AB, is
the event containing elements that belong to both A and B. That is
A∩B = {x : x ∈A and x ∈B}.
A
B
A∩B
S

## Page 12

We can also consider the union and intersection of n events: A1,A2,...,An.
• Union:
n[
i=1
Ai = A1 ∪A2...∪An = {x : x ∈A1 or x ∈A2 or ... or x ∈An},
comprises of elements that belong to one or more of A1,...,An.
• Intersection:
n\
i=1
Ai = A1 ∩A2...∩An = {x : x ∈A1 and x ∈A2 and ... and x ∈An},
comprises of elements that belong to every A1,...,An.

## Page 13

Complement
The complement of the event A with respect to S, denoted by A′, is the
event with elements in S, which are not in A. That is
A′ = {x : x ∈S but x /∈A}.
A
A′
S

## Page 14

Mutually Exclusive
Events A and B are said to be mutually exclusive or disjoint, if A∩B =
/0. That is, A and B have no element in common.
A
B
S

## Page 15

Contained and Equivalent
If all elements in A are also elements in B, then we say A is contained
in B, denoted by A ⊂B, or equivalently B ⊃A.
B
A
S
If A ⊂B and B ⊂A, then A = B. That is, set A and B are equivalent.

## Page 16

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

## Page 17

Note that B and C are mutually exclusive, since B∩C = /0. On the other
hand, A and B are not mutually exclusive as A∩B = {1,3} ̸= /0.

## Page 18

MORE EVENT OPERATIONS
(a) A∩A′ = /0
(b) A∩/0 = /0
(c) A∪A′ = S
(d) (A′)′ = A
(e) A∪(B∩C) = (A∪B)∩(A∪C)
(f) A∩(B∪C) = (A∩B)∪(A∩C)
(g) A∪B = A∪(B∩A′)
(h) A = (A∩B)∪(A∩B′)

## Page 19

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

## Page 20

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

## Page 21

Also,
(A∩B)′ = {1,3}′ = {2,4,5,6};
A′ ∪B′ = {4,5,6}∩{2,4,6} = {2,4,5,6}.
This agrees with (A∩B)′ = A′ ∪B′.
Similarly, we can check that
(A∪B∪C)′ = /0 = A′ ∩B′ ∩C′
and
(A∩B∩C)′ = S = A′ ∪B′ ∪C′.

## Page 22

3
COUNTING METHODS
In many instances, we need to count the number of ways that some
operations can be carried out or that certain situations can happen.
There are two fundamental principles in counting:
Multiplication principle
Addition principle
They can be applied to derive some important counting methods:
permutation and combination.

## Page 23

MULTIPLICATION PRINCIPLE
Suppose that r different experiments are to be performed sequentially. Suppose
experiment 1 results in n1 possible outcomes;
for each outcome above, experiment 2 results in n2 possible outcomes;
··· ··· ··· ··· ···
for each outcome above, experiment r results in nr possible outcomes.
Then there are n1n2···nr possible outcomes for the r experiments.

## Page 24

EXAMPLE 1.4
How many possible outcomes are there when a die and a coin are
thrown together?

## Page 25

Solution:
Note that for
• experiment 1: throwing a die, there are 6 possible outcomes:
{1,2,3,4,5,6}.
• experiment 2: throwing a coin, with each outcome of experiment
1, there are 2 possible outcomes: {H,T}.
So altogether there are 6×2 = 12 possible outcomes.
In fact, the sample space is given by
S = {(x,y) : x = 1,...,6;y = H or T}.

## Page 26

ADDITION PRINCIPLE
Suppose that an experiment can be performed by k different procedures.
Procedure 1 can be carried out in n1 ways;
Procedure 2 can be carried out in n2 ways;
··· ··· ··· ··· ···
Procedure k can be carried out in nk ways.
Suppose that the “ways" under different procedures do not overlap. Then the total
number of ways we can perform the experiment is
n1 +n2 +...+nk.

## Page 27

EXAMPLE 1.5 (ORCHARD ROAD)
We can take the MRT or bus from home to Orchard road. Suppose
there are three bus routes and two MRT routes. How many ways can
we go from home to Orchard road?

## Page 28

Solution:
Consider the trip from home to Orchard road as an experiment. Two
procedures can used to complete the experiment:
Procedure 1: take MRT – 2 ways.
Procedure 2: take bus – 3 ways.
These ways do not overlap. So the total number of ways we can go
from home to Orchard road is 2+3 = 5.

## Page 29

PERMUTATION
A permutation is a selection and arrangement of r objects out of n. In this case, order
is taken into consideration.
The number of ways to choose and arrange r objects out of n, where r ≤n, is denoted
by Pn
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

## Page 30

REMARK
When r = n, Pn
n = n!.
Essentially, it is the number of ways to arrange n objects in order.

## Page 31

EXAMPLE 1.6
Find the number of possible four-letter code words in which all letters
are different.

## Page 32

Solution:
Note that there are n = 26 alphabets, and r = 4 in our case.
So the number of possible four-letter code words is
P26
4 = (26)(25)(24)(23) = 358800.

## Page 33

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

## Page 34

The derivation is as follows.
(A) Thinking in terms of permutation, the number of ways to choose and
arrange r objects out of n is Pn
r .
(B) On the other hand, the same permutation task can be achieved by
conducting the following two experiments sequentially:
(1) Select r objects out of n without regard to the order:
 n
r

ways.
(2) For each such combination, permute its r objects: Pr
r ways.

## Page 35

(C) Therefore, by the multiplication rule, the number of ways to choose
and arrange r objects out of n is
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

## Page 36

EXAMPLE 1.7
From 4 women and 3 men, find the number of committees of size 3
that can be formed with 2 women and 1 man.

## Page 37

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

## Page 38

4
PROBABILITY
Intuitively, the term probability is understood as the chance or how
likely a certain event may occur.
More specifically, let A be an event in an experiment. We typically
associate a number, called probability, to quantify how likely the event
A occurs. This is denoted as P(A).

## Page 39

Let us now investigate how we can obtain such a number.
You will discover that the fundamental concept of probability is ex-
tended from an idea based on intuition to a rigorous, abstract, and ad-
vanced mathematical theory. It has also wide applications in various
scientific disciplines.

## Page 40

INTERPRETATION OF PROBABILITY: RELATIVE FREQUENCY
Suppose that we repeat an experiment E for a total of n times.
Let nA be the number of times that the event A occurs.
Then fA = nA/n is called the relative frequency of the event A in the n repetitions of
E.
Clearly, fA may not equal to P(A) exactly. However when n grows large, we expect
fA to be close to P(A); in the sense that fA ≈P(A). Or mathematically,
fA →P(A),
as n →∞.

## Page 41

Thus fA “mimics" P(A), and has the following properties:
(a) 0 ≤fA ≤1.
(b) fA = 1 if A occurs in every repetition.
(c) If A and B are mutually exclusive events, fA∪B = fA + fB.

## Page 42

Extending this idea, we can define probability on a sample space
mathematically.

## Page 43

AXIOMS OF PROBABILITY
Probability, denoted by P(·), is a function on the collection of events of the sample
space S, satisfying:
Axiom 1. For any event A,
0 ≤P(A) ≤1.
Axiom 2. For the sample space,
P(S) = 1.
Axiom 3. For any two mutually exclusive events A and B, that is, A∩B = /0,
P(A∪B) = P(A)+P(B).

## Page 44

EXAMPLE 1.8
Let H denote the event of getting a head when a coin is tossed. Find
P(H), if
(i) the coin is fair;
(ii) the coin is biased and a head is twice as likely to appear as a tail.

## Page 45

Solution:
The sample space is S = {H,T}.
(i) “The coin is fair" means that P(H) = P(T).
The events {H} and {T} are mutually exclusive. Thus based on
Axioms 2 and 3, we have
1 = P(S) = P({H}∪{T}) = P(H)+P(T) = 2P(H).
This gives P(H) = 1/2.

## Page 46

(ii) “A head is twice likely to appear as a tail" means P(H) = 2P(T);
therefore
1 = P(S) = P({H}∪{T}) = P(H)+P(T) = 3P(T).
This gives P(T) = 1/3 and P(H) = 2/3.

## Page 47

Basic Properties of Probability
Using the axioms, we can derive the following propositions.

## Page 48

PROPOSITION 2
The probability of the empty set /0 is P(/0) = 0.

## Page 49

Proof
Since /0∩/0 = /0 and /0 = /0∪/0, applying Axiom 3 leads to
P(/0) = P(/0∪/0) = P(/0)+P(/0) = 2P(/0).
This implies that P(/0) = 0.
✠

## Page 50

PROPOSITION 3
If A1,A2,...,An are mutually exclusive events, that is Ai ∩Aj = /0 for any
i ̸= j, then
P(A1 ∪A2 ∪···∪An) = P(A1)+P(A2)+...+P(An).

## Page 51

Proof
This proposition can be established easily using induction and
Axiom 3.
✠

## Page 52

PROPOSITION 4
For any event A, we have
P(A′) = 1−P(A).

## Page 53

Proof
Since S = A ∪A′ and A ∩A′ = /0, based on Axioms 2 and 3, we
have
1 = P(S) = P(A∪A′) = P(A)+P(A′).
The result follows.
✠

## Page 54

PROPOSITION 5
For any two events A and B,
P(A) = P(A∩B)+P(A∩B′).

## Page 55

Proof
Based on the properties
A = (A∩B)∪(A∩B′)
and
(A∩B)∩(A∩B′) = /0,
we have
P(A) = P(A∩B)+P(A∩B′).
✠

## Page 56

PROPOSITION 6
For any two events A and B,
P(A∪B) = P(A)+P(B)−P(A∩B).

## Page 57

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

## Page 58

PROPOSITION 7
If A ⊂B, then P(A) ≤P(B).

## Page 59

Proof
Since A ⊂B, we have A∪B = B. Also, we have
A∪B = A∪(B∩A′)
and
A∩(B∩A′) = /0.
Thus we obtain
P(B) = P(A∪B) = P(A∪(B∩A′)) = P(A)+P(B∩A′) ≥P(A).
✠

## Page 60

EXAMPLE 1.9
A retail establishment accepts either the American Express or the VISA
credit card.
A total of 24% of its customers carry an American Express card, 61%
carry a VISA card, and 11% carry both.
What is the probability that a customer carries a credit card that the
establishment will accept?

## Page 61

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

## Page 62

FINITE SAMPLE SPACE WITH EQUALLY LIKELY OUTCOMES
Consider a sample space S = {a1,a2,...,ak}.
Assume that all outcomes in the sample space are equally likely to occur, i.e.,
P(a1) = P(a2) = ··· = P(ak).
Then for any event A ⊂S,
P(A) = number of sample points in A
number of sample points in S.

## Page 63

EXAMPLE 1.10
A box contains 50 bolts and 150 nuts. Half of the bolts and half of the
nuts are rusted.
If one item is chosen at random, what is the probability that it is rusted
or is a bolt?

## Page 64

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

## Page 65

These give
P(A) = 100/200
,
P(B) = 50/200
,
P(A∩B) = 25/200.
Therefore the required probability is
P(A∪B) = P(A)+P(B)−P(A∩B) = 5/8.

## Page 66

5
CONDITIONAL PROBABILITY
Sometimes we need to compute the probability of some events when
some partial information is available.
Specifically, we might need to compute the probability of an event B,
given that we have the information “an event A has occurred".
Mathematically, we denote
P(B|A)
as the conditional probability of the event B, given that event A has
occurred.

## Page 67

DEFINITION 8 (CONDITIONAL PROBABILITY)
For any two events A and B with P(A) > 0, the conditional probability
of B given that A has occurred is defined by
P(B|A) = P(A∩B)
P(A)
.

## Page 68

EXAMPLE 1.11
A fair die is rolled twice.
(i) What is the probability that the sum of the 2 rolls is even?
(ii) Given that the first roll is a 5, what is the (conditional) probability
that the sum of the 2 rolls is even?

## Page 69

Solution:
We define the following events:
B = {the sum of the 2 rolls is even},
A = {the first roll is a 5}.

## Page 70

(i) The sample space is given by
2nd roll
1
2
3
4
5
6
1 (1,1) (1,2)
(1,3)
(1,4) (1,5) (1,6)
2 (2,1) (2,2)
(2,3)
(2,4) (2,5) (2,6)
1st roll 3 (3,1) (3,2)
(3,3)
(3,4) (3,5) (3,6)
4 (4,1) (4,2)
(4,3)
(4,4) (4,5) (4,6)
5 (5,1) (5,2)
(5,3)
(5,4) (5,5) (5,6)
6 (6,1) (6,2)
(6,3)
(6,4) (6,5) (6,6)
It is easy to see that P(B) = 18/36.

## Page 71

(ii) Since we know that A has already happened, we can just look at
the fifth row:
2nd roll
1
2
3
4
5
6
1st roll 5 (5,1) (5,2)
(5,3)
(5,4) (5,5) (5,6)
We are interested to look for instances along this row that gives
an even sum. So P(B|A) = 3/6.

## Page 72

Alternatively, we can use the formula:
P(B|A) = P(AB)
P(A) =
3
36
6
36
.

## Page 73

REMARK (REDUCED SAMPLE SPACE)
P(B|A) is read as:
“the conditional probability that B occurs given that A has occurred."
Since we know that A has occurred, regard A as our new, or reduced sample space.
The conditional probability that the event B given A will equal the probability of
A∩B relative to the probability of A.

## Page 74

MULTIPLICATION RULE
Starting from the definition of conditional probability, and rearranging the terms,
we have
P(A∩B) = P(A)P(B|A),
if P(A) ̸= 0
or
P(A∩B) = P(B)P(A|B),
if P(B) ̸= 0.
This is known as the Multiplication Rule.

## Page 75

INVERSE PROBABILITY FORMULA
The multiplication rule together with the definition of the conditional probability
gives us:
P(A|B) = P(A)P(B|A)
P(B)
.
This is known as the Inverse Probability Formula.

## Page 76

EXAMPLE 1.12
Deal 2 cards from a regular playing deck without replacement. What
is the probability that both cards are aces?

## Page 77

Solution:
P(both aces) = P(1st card is ace and 2nd card is ace)
= P(1st card ace)·P(2nd card ace|1st card ace)
= 4
52 · 3
51 = 1
221.

## Page 78

6
INDEPENDENCE
We saw several examples where conditioning on one event changes
our beliefs about the probability of another event.
In this section, we discuss the important concept of independence,
where learning that the event B occurred gives us no information that
would change our probabilities for another event A occurring.

## Page 79

DEFINITION 9 (INDEPENDENCE)
Two events A and B are independent if and only if
P(A∩B) = P(A)P(B).
We denote this by A ⊥B.
If A and B are not independent, they are said to be dependent, denoted by
A ̸⊥B.

## Page 80

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

## Page 81

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

## Page 82

(ii) Let
A7 = {the sum of two dice is 7}.
Then
P(A7 ∩B) = 1/36,
P(A7) = 1/6
and
P(B) = 1/6.
As P(A7 ∩B) = P(A7)P(B), we say that A7 and B are independent.

## Page 83

INDEPENDENT VS MUTUALLY EXCLUSIVE
Independence and mutually exclusivity are totally different concepts:
A,B independent ⇔P(A∩B) = P(A)P(B)
A,B mutually exclusive ⇔A∩B = /0
“Mutually exclusivity" can be illustrated by a Venn diagram (like below), but we
can not do that for “independence".
A
B
S

## Page 84

7
THE LAW OF TOTAL PROBABILITY
The definition of conditional probability has far-reaching consequences.
In this section we look at the Law of Total Probability (LOTP), which
relates conditional probability to unconditional probability.

## Page 85

DEFINITION 10 (PARTITION)
If A1,A2,...,An are mutually exclusive events and ∪n
i=1Ai = S, we call
A1,A2,...,An a partition of S.

## Page 86

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

## Page 87

SPECIAL CASE: LAW OF TOTAL PROBABILITY
For any events A and B, we have
P(B) = P(A)P(B|A)+P(A′)P(B|A′).

## Page 88

EXAMPLE 1.14 (FRYING FISH)
At a nasi lemak stall, the chef and his assistant take turns to fry fish.
The chef burns his fish with probability 0.1, his assistant burns his fish
with probability 0.23.
If the chef is frying fish 80% of the time, what is the probability that
the fish you order is burnt?

## Page 89

Solution:
Let
B = {the fish is burnt},
C = {the fish is fried by the chef}.
We then need to compute P(B). Using the Law of Total Probability,
P(B) = P(C)P(B|C)+P(C′)P(B|C′) = 0.8×0.1+0.2×0.23.

## Page 90

8
BAYES’ THEOREM
We now discuss Bayes’ Theorem (or Bayes’ Rule), which will allow us
to relate P(A|B) to P(B|A) and compute conditional probabilities in a
wide range of problems.

## Page 91

THEOREM 12 (BAYES’ THEOREM)
Let A1,A2,...,An be a partition of S, then for any event B and k = 1,2,...,n,
P(Ak|B) =
P(Ak)P(B|Ak)
∑n
i=1P(Ai)P(B|Ak).

## Page 92

Proof
Bayes’ Theorem can be derived based on the definition of con-
ditional probability, the Multiplication Rule, and the Law of Total Prob-
ability.
In particular,
P(Ak|B) = P(Ak ∩B)
P(B)
= P(Ak)P(B|Ak)
∑n
i=1P(B∩Ai)
=
P(Ak)P(B|Ak)
∑n
i=1P(Ai)P(B|Ai).
✠

## Page 93

SPECIAL CASE: BAYES’ THEOREM
Let us consider a special case of Bayes’ Theorem when n = 2.
{A,A′} becomes a partition of S, and we have
P(A|B) =
P(A)P(B|A)
P(A)P(B|A)+P(A′)P(B|A′).

## Page 94

EXAMPLE 1.15
The previous formula is practically meaningful.
For example, consider the events
A = disease status of a person,
B = symptom observed.
Then
• P(A): probability of a disease in general;
• P(B|A): if diseased, probability of observing symptom;
• P(A|B): if symptom observed, probability of diseased.

## Page 95

EXAMPLE 1.16
Historically, we observe the collapse of some newly constructed house.
The chance that the design of the house is faulty is 1%. If the design
is faulty, the chance that the house collapses is 75%; otherwise, the
chance is 0.01%.
We observe that a newly constructed house collapsed, what is the
probability that the design is faulty?

## Page 96

Solution:
Let
B = {The design is faulty},
A = {The house collapses}.
We then have
P(B) = 0.01,
P(A|B) = 0.75,
and
P(A|B′) = 0.0001.
The question asked for P(B|A). We will compute it using Bayes’ Theo-
rem.

## Page 97

The denominator can be computed using the Law of Total Probability:
P(A) = P(B)P(A|B)+P(B′)P(A|B′)
= (0.01)(0.75)+(0.99)(0.0001) = 0.007599.
The numerator is
P(A|B)P(B) = 0.75(0.01) = 0.0075.
As a consequence,
P(B|A) = P(A|B)P(B)
P(A)
= 0.9870.