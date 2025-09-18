# Special Probability

## Page 1

Four
Special Probability
Distributions

## Page 2

1
DISCRETE DISTRIBUTIONS
Situations involving uncertainty and probability fall into certain broad
classes, and we can use the same set of rules and principles for all
situations within a class.
So it is beneficial for us to study whole classes of discrete random vari-
ables that arise frequently in applications.

## Page 3

REMARK
Recall that for a discrete random variable X, the number of possible values in the
range space RX is either finite or countable.
Then the elements of RX can be listed as x1,x2,x3,....

## Page 4

Discrete Uniform Distribution
One of the simplest class of a discrete random variable is the discrete
uniform distribution.

## Page 5

DEFINITION 1 (DISCRETE UNIFORM DISTRIBUTION)
If a random variable X assumes the values x1,x2,...,xk with equal probabil-
ity, then X follows a discrete uniform distribution.
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

## Page 6

THEOREM 2
Suppose
X
follows
the
discrete
uniform
distribution
with
RX =
{x1,x2,...,xk}.
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
σ 2
X = V(X) = E(X2)−(E(X))2 = 1
k
k
∑
i=1
x2
i −µ2
X.

## Page 7

EXAMPLE 4.1
A bulb is selected at random from a box that contains a 40-watt bulb,
a 60-watt bulb, a 80-watt bulb, and a 100-watt bulb.
Each bulb has 1/4 probability of being selected.
Let X be the wattage of the bulb being selected. Identify the distribu-
tion of X, and compute its mean and variance.

## Page 8

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

## Page 9

We can compute the expectation as
E(X) = ∑
i
xi fX(xi) = 40·(1/4)+60·(1/4)+80·(1/4)+100·(1/4) = 70.
The variance is also found to be
V(X) = E(X2)−(E(X))2
= 402 ·(1/4)+602 ·(1/4)+802 ·(1/4)+1002(1/4)−702
= 500.

## Page 10

Bernoulli Trial, Bernoulli Random Variable and Bernoulli Process
Numerous experiments have two possible outcomes.
If an item is selected from the assembly line and inspected, it is either
defective or not defective. A piece of fruit is either damaged or not
damaged.
Such experiments are called Bernoulli trials after the Swiss mathemati-
cian Jacob Bernoulli.

## Page 11

DEFINITION 3 (BERNOULLI TRIAL)
A Bernoulli trial is a random experiment with only two possible outcomes.
One is called a "success", and the other a "failure". We often code the two
outcomes as "1" (success) and "0" (failure).

## Page 12

DEFINITION 4 (BERNOULLI RANDOM VARIABLE)
Let X be the number of success in a Bernoulli trial. Then X has only two
possible values: 1 or 0, and is called a Bernoulli random variable.
Denote by p, where 0 ≤p ≤1, the probability of success for a Bernoulli
trial. Then X has the probability mass function
fX(x) = P(X = x) =
(
p,
x = 1;
1−p,
x = 0.
This probability mass function can also be written as
fX(x) = px(1−p)1−x,
for x = 0,1.

## Page 13

REMARK
We denote a Bernoulli random variable by X ∼Bernoulli(p), and write q = 1−p.
Then the probability mass function becomes
fX(1) = p,
fX(0) = q.

## Page 14

THEOREM 5
For a Bernoulli random variable defined as above, we have
µX = E(X) = p,
σ 2
X = V(X) = p(1−p) = pq.

## Page 15

PARAMETERS
In certain instances, fX(x) may rely on one or more unknown quantities: different
values of the quantities lead to different probability distributions.
Such a quantity is called the parameter of the distribution.
For example, p is the parameter for the Bernoulli distribution.
The collection of distributions that are determined by one or more unknown pa-
rameters is called a family of probability distributions.
Thus the aforementioned Bernoulli distributions determined by the parameter p is
a family of probability distributions.

## Page 16

EXAMPLE 4.2
The following are all examples of Bernoulli trials:
A coin toss
Say we want heads. Then "heads" is a success, and "tails" is a
failure.
Rolling a die
Say we only care about rolling a 6. Then the outcome space is
binarized to "success"= {6} and "failure" = {1,2,3,4,5}.
Polls
Choosing a voter at random to ascertain if he will vote "yes" in
an upcoming referendum.

## Page 17

EXAMPLE 4.3
A box contains 4 blue and 6 red balls. Draw a ball from the box at
random.
What is the probability that a blue ball is chosen?

## Page 18

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

## Page 19

DEFINITION 6 (BERNOULLI PROCESS)
A Bernoulli process consists of a sequence of repeatedly performed inde-
pendent and identical Bernoulli trials.
Consequently, a Bernoulli process generates a sequence of independent
and identically distributed Bernoulli random variables: X1,X2,X3,....

## Page 20

Several distributions useful in applications are based on the Bernoulli
trial and Bernoulli process. We will look at them in the next subsec-
tions:
• Binomial distribution;
• Negative Binomial distribution; Geometric distribution;
• Poisson distribution.

## Page 21

Binomial Distribution
Suppose we have n independent and identically distributed Bernoulli
trials. We can use the binomial distribution to address some interest-
ing questions. For example,
• A student randomly guesses at 5 multiple-choice questions. What
is the number of questions the student guessed correctly?
• Randomly pick a family with 4 kids. What is the number of girls
amongst the kids?
• A urn has 4 black balls and 3 white balls. Draw 5 balls with
replacement. How many black balls will there be?

## Page 22

DEFINITION 7 (BINOMIAL RANDOM VARIABLE)
A Binomial random variable counts the number of successes in n trials
of a Bernoulli Process. That is, suppose we have n trials where
• the probability of success for each trial is the same p,
• the trials are independent.
Then the number of successes, denoted by X, in the n trials is a binomial
random variable.
We say X has a binomial distribution and write it as X ∼Bin(n, p).

## Page 23

The probability of getting exactly x successes is given as
P(X = x) =
n
x

px(1−p)n−x, for x = 0,1,2,...,n.
It can be shown that E (X) = np, and V(X) = np(1−p).

## Page 24

REMARK
When n = 1, the probability mass function for the binomial random variable X is
reduced to
fX(x) = px(1−p)1−x,
for x = 0,1.
This is the probability mass function for the Bernoulli distribution. Therefore the
Bernoulli distribution is a special case of the binomial distribution.

## Page 25

BINOMIAL PROBABILITY MASS FUNCTION
The probability mass function for Bin(10,0.2), Bin(10,0.5), and Bin(10,0.8).

## Page 26

EXAMPLE 4.4
Flip a fair coin independently 10 times. What is the probability of
observing exactly 6 heads?

## Page 27

Solution:
Let X be the number of heads in 10 flips of the coin.
Each flip of the coin can be observed as a Bernoulli trial, with the prob-
ability of getting head (success) p = 0.5. Then X is the number success
out of 10 Bernoulli trials; so X ∼Bin(10,0.5).
We can compute
P(X = 6) =
10
6

(0.5)6(1−0.5)10−6 = 0.205.

## Page 28

Negative Binomial Distribution
Consider a Bernoulli process, where the Bernoulli trials can be re-
peated as many times as desired or necessary.
Suppose we are interested in the number of trials needed so that k
number of successes occur.

## Page 29

DEFINITION 8 (NEGATIVE BINOMIAL DISTRIBUTION)
Let X
be the number of independent and identically distributed
Bernoulli(p) trials needed until the kth success occurs. Then X follows
a Negative Binomial distribution, denoted by X ∼NB(k, p).
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

## Page 30

EXAMPLE 4.5
Keep rolling a fair die, until the 6th time we get the number 6. What is
the probability that we need to roll the die 10 times?

## Page 31

Solution:
Let X be the number of rolls needed to get the 6th number 6. Then
X ∼NB(6,1/6).
Using the probability mass function of the negative binomial distribu-
tion:
P(X = 10) =
10−1
6−1

(1/6)6(1−1/6)4 = 0.001302.

## Page 32

Geometric Distribution
The Geometric distribution is a special case of the negative binomial
distribution.

## Page 33

DEFINITION 9 (GEOMETRIC DISTRIBUTION)
Let X
be the number of independent and identically distributed
Bernoulli(p) trials needed until the first success occurs. Then X follows
a Geometric distribution, denote by X ∼Geom(p).
The probability mass function of X is given by
fX(x) = P(X = x) = (1−p)x−1p.
It can be shown that E(X) = 1
p and V(X) = 1−p
p2 .

## Page 34

Poisson Distribution
A number of probability distributions come about through limiting
arguments applied to other distributions. One useful distribution of
this type is called the Poisson distribution.

## Page 35

DEFINITION 10 (POISSON RANDOM VARIABLE)
The Poisson random variable X denotes the number of events occurring
in a fixed period of time or fixed region.
We denote X ∼Poisson(λ), where the parameter λ > 0 is the expected
number of occurrences during the given period/region. Its probability mass
function is given by
fX(k) = P(X = k) = e−λλ k
k!
,
where k = 0,1,... is the number of occurrences of such events.
It can be shown that E(X) = λ and V(X) = λ.

## Page 36

POISSON PROBABILITY MASS FUNCTION
The probability mass function for Poisson(1), Poisson(4), and Poisson(9).

## Page 37

EXAMPLE 4.6
The "fixed period of time" given in the definition can be a time period
of any length: a minute, a day, a week, a month, etc. The "fixed region"
can be of any size.
Here are some examples of events that may be modeled by the Poisson
distribution:
(a) The number of spelling mistakes one makes while typing a single
page.
(b) The number of times a web server is accessed per minute.
(c) The number of road kill (animals killed) found per unit length of
road.

## Page 38

(d) The number of mutations in a given stretch of DNA after a certain
amount of radiation exposure.
(e) The number of unstable atomic nuclei that decayed within a given
period of time in a piece of radioactive substance.
(f) The distribution of visual receptor cells in the retina of the human
eye.
(g) The number of light bulbs that burn out in a certain amount of
time.

## Page 39

DEFINITION 11 (POISSON PROCESS)
The Poisson process is a continuous time process. We count the number
of occurrences within some interval of time. The defining properties of a
Poisson process with rate parameter α are
• the expected number of occurrences in an interval of length T is αT;
• there are no simultaneous occurrences;
• the number of occurrences in disjoint time intervals are independent.
The number of occurrences in any interval T of a Poisson process follows a
Poisson(αT) distribution.

## Page 40

EXAMPLE 4.7
The average number of robberies in a day is four in a certain big city.
What is the probability that six robberies occurring in two days?

## Page 41

Solution:
Let X1 be the number of robberies in one day. Then X1 ∼Poisson(4)
from the given conditions.
Let X be the number of robberies in two days. Then
X ∼Poisson(2×4) = Poisson(8).
We then have
P(X = 6) = e−886
6!
= 0.1222.

## Page 42

Poisson Approximation to Binomial
The Poisson random variable has a tremendous range of applications
in diverse areas because it may be used as an approximation for a bi-
nomial random variable under certain conditions.
The following result shows us how.

## Page 43

PROPOSITION 12 (POISSON APPROXIMATION TO BINOMIAL)
Let X ∼Bin(n, p). Suppose that n →∞and p →0 in such a way that
λ = np remains a constant. Then approximately, X ∼Poisson(np).
That is
lim
p→0;n→∞P(X = x) = e−np(np)x
x!
.

## Page 44

REMARK
The approximation is good when
• n ≥20 and p ≤0.05, or if
• n ≥100 and np ≤10.

## Page 45

EXAMPLE 4.8
The probability, p, of an individual car having an accident at a junction
is 0.0001.
If there are 1000 cars passing through the junction during certain pe-
riod of a day, what is the probability of two or more accidents occur-
ring during that period?

## Page 46

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

## Page 47

We can also use the Poisson approximation.
We have n = 1000 and p = 0.0001. Hence np = λ = 0.1.
Thus
P(X ≥2) = 1−P(X = 0)−P(X = 1)
= 1−e−0.1 −e−0.1(0.1)1/1!
= 0.0047.

## Page 48

2
CONTINUOUS DISTRIBUTION
There are many "natural" random variables whose set of possible val-
ues is uncountable. For example, consider
• the lifetime of an electrical appliance; or
• the amount of rainfall we get in a month.
How then, can we model such variables?
To achieve this aim, we shall now study some classes of continuous
random variables.

## Page 49

Continuous Uniform Distribution
Intuitively, a uniform random variable on the interval (a,b) is a com-
pletely random number between a and b. We formalize the notion of
"completely random" on an interval by specifying that the probability
density function should be constant over the interval.

## Page 50

DEFINITION 13 (CONTINUOUS UNIFORM DISTRIBUTION)
A random variable X is said to follow a uniform distribution over the
interval (a,b) if its probability density function is given by
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

## Page 51

The probability density function for the continuous uniform distribu-
tion can be drawn as below.
x
y
0
a
b
1
b−a

## Page 52

The cumulative distribution function for the continuous uniform dis-
tribution is given by
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

## Page 53

EXAMPLE 4.9
A point is chosen at random on the line segment [0,2].
What is the probability that the chosen point lies between 1 and 3
2?

## Page 54

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

## Page 55

Exponential Distribution
The exponential distribution is the continuous counterpart to the ge-
ometric distribution. It is often used to model the waiting time to the
first success in continuous time.

## Page 56

DEFINITION 14 (EXPONENTIAL DISTRIBUTION)
A continuous random variable X is said to follow an exponential distri-
bution with parameter λ > 0 if its probability density function is given
by
fX(x) =
(
λe−λx,
if x ≥0;
0,
if x < 0.
We denote X ∼Exp(λ).
It can be shown that E(X) = 1
λ and V(X) = 1
λ 2.

## Page 57

The probability density function for Exp(1).
x
y = e−x
a
b
0
1
Area of shaded region = P(a < X < b)

## Page 58

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

## Page 59

The cumulative distribution function of X ∼Exp(λ) is given by
FX(x) =
(
1−e−λx,
x ≥0;
0,
x < 0.

## Page 60

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

## Page 61

EXAMPLE 4.10
Suppose that the failure time, T, of a system is exponentially dis-
tributed, with a mean of 5 years.
What is the probability that at least two out of five of these systems
are still functioning at the end of 8 years?

## Page 62

Solution:
Since E(T) = 5, therefore λ = 1/5.
We then have T ∼Exp(1/5), and so
P(T > 8) = 1−P(T ≤8) = 1−FX(8) = e−(1/5)×8 = e−1.6 ≈0.2.
Now let X be the number of systems out of 5 that are still functioning
after 8 years. We see tha X ∼Bin(5,0.2). Hence,
P(X ≥2) = 0.2627.

## Page 63

THEOREM 15
Suppose that X has an exponential distribution with parameter λ > 0. Then
for any two positive numbers s and t, we have
P(X > s+t|X > s) = P(X > t).

## Page 64

REMARK
The above theorem states that the exponential distribution has "no memory" or is
"memoryless".
To illustrate, suppose X ∼Exp(λ) is the life length of a bulb. Then
P(X > s+t|X > s) = P(X > t).
This means that, if the bulb has lasted s time units (that is, X > s), the probability
that it will last for another t units (that is, X > s +t), is the same as the probability
that it will last for the first t units as a brand new bulb.

## Page 65

NORmal Distribution
We next look at one of the most important class of continuous random
variables.

## Page 66

DEFINITION 16 (NORMAL DISTRIBUTION)
A random variable X is said to follow a NORmal distribution with param-
eters µ and σ 2 if its probability density function is given by
fX(x) =
1
√
2πσ e−(x−µ)2/(2σ2),
−∞< x < ∞.
We denote X ∼N(µ,σ 2).
It can be shown that E(X) = µ and V(X) = σ 2.

## Page 67

The probability density function of the NORmal distribution is positive
over the whole real line, symmetrical about x = µ, and bell-shaped.
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
2πe−(x−µ)2
2σ2
1
σ
√
2π

## Page 68

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
2σ 2

dx = 1.
This validates that fX(·) is a probability density function.

## Page 69

(2) Two NORmal curves are identical in shape if they have the same σ 2. But they are
centered at different positions when their means are different.
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

## Page 70

(3) As σ increases, the curve flattens; and vice versa.
x
N(0,1)
N(0,22)
N(0,0.52)

## Page 71

(4) Given X ∼N(µ,σ 2), let
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

## Page 72

REMARK
• Calculating NORmal probabilities is a challenge because
– there is no close formula for the integration,
– and the computation relies on numerical integration.
• Fortunately we can use Property 4 from above.
Suppose X ∼N(µ,σ 2) and we seek P(x1 < X < x2). Consider
x1 < X < x2 ⇐⇒x1−µ
σ
< X−µ
σ
< x2−µ
σ .
Consider the transformation Z = X−µ
σ , and let z1 = x1−µ
σ
and z2 = x2−µ
σ . Then
P(x1 < X < x2) = P(z1 < Z < z2).

## Page 73

• By convention, we use φ(·) and Φ(·) to denote the probability density func-
tion and cumulative distribution function of the standard NORmal. That is,
φ(z) = fZ(z) =
1
√
2πe−z2/2
Φ(z) =
Z z
−∞φ(t)dt =
1
√
2π
Z z
−∞e−t2/2dt.
Then for X ∼N(µ,σ 2) and any real numbers x1,x2,
P(x1 < X < x2) = Φ
 x2−µ
σ

−Φ
 x1−µ
σ

.

## Page 74

• Thus we can use the standard NORmal to calculate any NORmal probability.
To do so, Φ(z) can be tabulated, or computed using statistical software.
• The standard NORmal distribution has the following properties:
– P(Z ≥0) = P(Z ≤0) = Φ(0) = 0.5;
– For any z, Φ(z) = P(Z ≤z) = P(Z ≥−z) = 1−Φ(−z);
– If Z ∼N(0,1), then −Z ∼N(0,1);
– If Z ∼N(0,1), then σZ + µ ∼N(µ,σ 2).

## Page 75

EXAMPLE 4.11
Given X ∼N(50,100), compute P(45 < X < 62).

## Page 76

Solution:
We have µ = 50, σ = 10. Then
P(45 < X < 62) = P
 45−50
10
< X−50
10 < 62−50
10

= P(−0.5 < Z < 1.2)
= P(Z < 1.2)−P(Z ≤−0.5)
= Φ(1.2)−Φ(−0.5),
where Φ(1.2) and Φ(−0.5) can either be computed using software or
obtained from a statistical table.

## Page 77

DEFINITION 17 (QUANTILE)
The αth (upper) quantile, where 0 ≤α ≤1, of the random variable X is
the number xα that satisfies
P(X ≥xα) = α.

## Page 78

THE Z UPPER QUANTILE
Specifically, we denote by zα the αth (upper) quantile, or the 100α percentage point,
of Z ∼N(0,1). That is
P(Z ≥zα) = α.
Here are some common values of zα:
z0.05 = 1.645,
z0.01 = 2.326.
Since φ(z), the probability density function of Z, is symmetrical about 0, then
P(Z ≥zα) = P(Z ≤−zα) = α.

## Page 79

EXAMPLE 4.12
Find z such that
(a) P(Z < z) = 0.95;
(b) P(|Z| ≤z) = 0.98.

## Page 80

Solution:
(a) We need z such that
P(Z > z) = 1−P(Z < z) = 0.05.
Therefore z = z0.05 = 1.645.
(b) We have
0.98 = P(|Z| ≤z) = 1−P(|Z| > z)
= 1−P(Z > z)−P(Z < −z) = 1−2P(Z > z).
This means that P(Z > z) = 0.01. Therefore z = z0.01 = 2.326.

## Page 81

NORmal Approximation to Binomial
Recall that when n →∞, p →0, and np remains a constant, we can use
the Poisson distribution to approximate the binomial distribution.
When n →∞, but p remains a constant (practically, p is not very close
to 0 or 1), we can use the NORmal distribution to approximate the bino-
mial distribution.
A good rule of thumb is to use the NORmal approximation when
np > 5
and
n(1−p) > 5.

## Page 82

PROPOSITION 18 (NORMAL APPROXIMATION TO BINOMIAL)
Let X ∼Bin(n, p), so that E(X) = np and V(X) = np(1 −p). Then as
n →∞,
Z = X −E(X)
p
V(X)
=
X −np
p
np(1−p)
is approximately ∼N(0,1).