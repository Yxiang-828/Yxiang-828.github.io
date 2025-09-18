# Random Variables

## Page 1

Two
Random Variables

## Page 2

1
DEFINITION OF A RANDOM VARIABLE
Often, when an experiment is performed, we are interested in some
function (numerical characteristic) of the outcome, rather than the ac-
tual outcome itself.

## Page 3

For example,
• in an experiment involving the examination of 100 electronic com-
ponents, our interest is in the number of defective components.
• in an experiment of flipping a coin 100 times, our interest is in the
number of heads obtained, instead of the "H" and "T" sequence.
This motivates us to assign numerical values to (possible) outcomes of
an experiment.

## Page 4

DEFINITION 1 (RANDOM VARIABLE)
Let S be the sample space of an experiment. A function X, which assigns a
real number to every s ∈S is called a random variable.

## Page 5

REMARK
So a random variable X is a function from S to R:
X : S 7→R.

## Page 6

A random variable maps the sample space into the real line. The random variable X depicted here is
defined on a sample space with 6 elements {s1,s2,...,s6}, and has possible values 0, 1, and 4.

## Page 7

DEFINITION 2 (RANGE SPACE)
The range space of X is the set of real numbers
RX = {x|x = X(s),s ∈S}.
Each possible value x of X corresponds to an event that is a subset or element
of the sample space S.

## Page 8

EXAMPLE 2.1
Let S = {HH,HT,TH,TT} be the sample space associated with the ex-
periment of flipping two fair coins.
Define the random variable:
X = number of heads obtained.
Note that X is a function from S to R, the set of real numbers:
X(HH) = 2,
X(HT) = X(TH) = 1,
X(TT) = 0.
The range of X is RX = {0,1,2}.

## Page 9

NOTATIONS
(i) We use upper case letters X,Y,Z,X1,X2,... to denote random variables.
(ii) We use lower case letters x,y,z,x1,x2,... to denote their observed values in the
experiment.
(iii) The set {X = x} = {s ∈S : X(s) = x} is a subset of S.
(iv) If A is a subset of R, the set {X ∈A} = {s ∈S : X(s) ∈A} is a subset of S.
(v) With the above expressions, we define P(X = x) and P(X ∈A) as
P(X = x) = P({s ∈S : X(s) = x});
P(X ∈A) = P({s ∈S : X(s) ∈A}).

## Page 10

EXAMPLE 2.2
We revisit Example 2.1, where S = {HH,HT,TH,TT} is the sample
space associated with flipping two fair coins, and X is the number of
heads obtained.
We then have
{X = 0} = {TT};
{X = 1} = {HT,TH};
{X = 2} = {HH};
{X ≥1} = {HT,TH,HH}.

## Page 11

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
P(X = x) 1/4 1/2 1/4

## Page 12

2
PROBABILITY DISTRIBUTION
There are two main types of random variables used in practice: dis-
crete and continuous.
Let us denote by X the random variable, and it’s range by RX. For a
• discrete random variable, the number of values in RX is finite or
countable. That is, we can write RX = {x1,x2,x3,...}.
• continuous random variable, RX is an interval or a collection of
intervals.

## Page 13

Discrete random variable
Consider a discrete random variable X with RX = {x1,x2,x3,...}.
For each x ∈RX, let P(X = x) be the probability that X takes the value x.

## Page 14

DEFINITION 3 (PROBABILITY MASS FUNCTION)
For a discrete random variable X, define
f(x) =
(
P(X = x),
for x ∈RX;
0,
for x /∈RX.
Then f(x) is known as the probability function (pf), or probability
mass function (pmf) of X.
The collection of pairs (xi, f(xi)),i = 1,2,3,..., is called the probability
distribution of X.

## Page 15

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
P(X ∈B) = ∑
xi∈B∩RX
f(xi).

## Page 16

EXAMPLE 2.3
We revisit Examples 2.1 and 2.2.
Recall that random variable X is the number of heads observed when
we flip two fair coins.
The probability function of X is given below
x
0
1
2
f(x) 1/4 1/2 1/4

## Page 17

Note that f(x) satisfies
(1) f(xi) ≥0 for xi = 0,1, or 2;
(2) f(x) = 0 for x /∈RX;
(3) f(0)+ f(1)+ f(2) = 1.
When B = [1,∞),
P(X ∈B) = f(1)+ f(2) = 3/4.

## Page 18

Continuous random variable
For a continuous random variable X, RX is an interval or a collection
of intervals.
We next define the probability function (pf), or probability density
function (pdf), to quantify the probability that X is in a certain range.

## Page 19

DEFINITION 4 (PROBABILITY DENSITY FUNCTION)
The probability density function of a continuous random variable X,
denoted by f(x), is a function that satisfies:
(1) f(x) ≥0 for all x ∈RX; and f(x) = 0 for x /∈RX;
(2)
Z
RX
f(x)dx = 1;
(3) For any a and b such that a ≤b,
P(a ≤X ≤b) =
Z b
a f(x)dx.

## Page 20

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
The gives an example of “P(A) = 0, but A is not necessarily /0."

## Page 21

• Furthermore, we have
P(a < X < b) = P(a < X ≤b) = P(a ≤X < b) = P(a ≤X ≤b) =
Z b
a f(x)dx.
They all represent the area under the graph of f(x) between x = a and x = b.
P(a < X < b)
a
b
f(x)

## Page 22

• To check that a function f(x) is a probability density function, it suffices to
check Conditions (1) and (2). Namely,
(1) f(x) ≥0 for all x ∈RX; and f(x) = 0 for x /∈RX.
(2)
Z
RX
f(x)dx = 1.

## Page 23

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

## Page 24

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

## Page 25

3
CUMULATIVE DISTRIBUTION FUNCTION
Another function that describes the distribution of a random variable
is the cumulative distribution function (cdf).

## Page 26

DEFINITION 5 (CUMULATIVE DISTRIBUTION FUNCTION)
For any random variable X, we define its cumulative distribution func-
tion (cdf) by
F(x) = P(X ≤x).

## Page 27

REMARK
This definition is applicable whether X is a discrete or continuous random variable.

## Page 28

CDF: DISCRETE RANDOM VARIABLE
If X is a discrete random variable, we have
F(x) =
∑
t∈RX;t≤x
f(t)
=
∑
t∈RX;t≤x
P(X = t)
The cumulative distribution function of a discrete
random variable is a step function.

## Page 29

For any two numbers a < b, we have
P(a ≤X ≤b) = P(X ≤b)−P(X < a) = F(b)−F(a−),
where "a−" represents the "largest value in RX that is smaller than a". Mathemati-
cally,
F(a−) = lim
x↑a F(x).

## Page 30

EXAMPLE 2.5
We revisit Examples 2.1 and 2.2. The random variable X is the number
of heads observed when we flip two fair coins, and has the probability
function
x
0
1
2
f(x) 1/4 1/2 1/4
We have
F(0) = f(0) = 1/4, F(1) = f(0)+ f(1) = 3/4, F(2) = f(0)+ f(1)+ f(2) = 1.

## Page 31

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

## Page 32

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
Derive the corresponding probability function. 1
1Let us pretend for a while that the cumulative distribution function is the only information
available for this distribution.

## Page 33

Solution:
As F(·) only has four possible values, the distribution is a discrete
distribution.
We obtain RX = {0,1,2}, which are the jumping points of F(·). It is also
the set where f(x) is non-zero.
We have
f(0) = P(X = 0) = F(0)−F(0−) = 1/4−0 = 1/4;
f(1) = P(X = 1) = F(1)−F(1−) = 3/4−1/4 = 1/2;
f(2) = P(X = 2) = F(2)−F(2−) = 1−3/4 = 1/4.

## Page 34

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

## Page 35

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

## Page 36

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
2Let us pretend for a while that the cumulative distribution function is the only information
available for this distribution.

## Page 37

Solution:
F(x) is a cumulative distribution function for a continuous distribu-
tion, because when it is not equal to 0 and 1, it assumes different val-
ues in the interval x ∈[0,1).
f(x) = 0 when x /∈[0,1) because d
dx(0) = d
dx(1) = 0.
f(x) = d
dx(x2) = 2x when x ∈[0,1).

## Page 38

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

## Page 39

4
EXPECTATION AND VARIANCE
For a random variable X, one natural question to ask is: what is the
average value of X, if the corresponding experiment is repeated many
times?
For example, suppose X is the number obtained when we roll a die.
We may want to know the average value obtained if we roll the die
continuously.
Such an average, over the long run, is called the mean or expectation
of X.

## Page 40

DEFINITION 6 (EXPECTATION: DISCRETE RANDOM VARIABLE)
Let X be a discrete random variable with RX = {x1,x2,x3,....} and proba-
bility function f(x). The expectation or mean of X is defined by
E(X) = ∑
xi∈RX
xi f(xi).
By convention, we also denote µX = E(X).

## Page 41

DEFINITION 7 (EXPECTATION: CONTINUOUS RANDOM VARIABLE)
Let X be a continuous random variable with probability function f(x). The
expectation or mean of X is defined by
µX = E(X) =
Z ∞
−∞x f(x)dx =
Z
x∈RX
x f(x)dx.

## Page 42

REMARK
The mean of X is not necessarily a possible value of the random variable X.

## Page 43

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

## Page 44

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
E(X) =
Z ∞
−∞x f(x)dx =
Z 1
0
3x
2 (1−x2)dx
= 3
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

## Page 45

PROPERTIES OF EXPECTATION
(1) Let X be a random variable, and let a and b be any real numbers. Then
E(aX +b) = aE(X)+b.
(2) Let X and Y be two random variables. We have
E(X +Y) = E(X)+E(Y).

## Page 46

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

## Page 47

Variance
Let g(x) = (x−µX)2, then E[g(X)] is defined as the variance for X.

## Page 48

DEFINITION 8 (VARIANCE)
Let X be a random variable. The variance of X is defined as
σ 2
X = V(X) = E(X −µX)2.

## Page 49

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

## Page 50

• V(X) ≥0 for any X. Equality holds if and only P(X = E(X)) = 1, that is, when
X is a constant.
• Let a and b be any real numbers, then V(aX +b) = a2V(X).
• The variance can also be computed by an alternative formula:
V(X) = E(X2)−[E(X)]2.
• The positive square root of the variance is defined as the standard deviation
of X:
σX =
p
V(X).

## Page 51

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

## Page 52

Solution:
The mean is given as
E(X) = ∑
x∈RX
x f(x)
= (−1)
 1
8

+0
 2
8

+1
 1
8

+2
 4
8

= 1.
The variance is given as
V(X) = ∑
x∈RX
[x−E(X)]2 f(x) = ∑
x∈RX
[x−1]2 f(x)
= (−1−1)2 1
8

+(0−1)2 2
8

+(1−1)2 1
8

+(2−1)2 4
8

= 5
4.

## Page 53

EXAMPLE 2.12
Denote by X the amount of time that a book on reserve at the library
is checked out by a randomly selected student. Suppose X has the
probability density function
f(x) =
 x/2, 0 ≤x < 2,
0,
otherwise.
Compute E(X), V(X), and σX.

## Page 54

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