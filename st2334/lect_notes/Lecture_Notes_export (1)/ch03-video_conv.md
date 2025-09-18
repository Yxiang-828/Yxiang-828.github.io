# Joint Distributions

## Page 1

Three
Joint Distributions

## Page 2

1
JOINT DISTRIBUTIONS FOR MULTIPLE RANDOM VARIABLES
Very often, we are interested in more than one random variables si-
multaneously.
• For example, an investigator might be interested in both the height
(H) and the weight (W) of individuals from a certain population.
• Another investigator could be interested in both the hardness (H)
and the tensile strength (T) of a piece of cold-drawn copper.

## Page 3

DEFINITION 1 (TWO-DIMENSIONAL RANDOM VECTOR)
Let E be an experiment and S be a corresponding sample space. Suppose X
and Y are two functions each assigning a real number to each s ∈S.
We call (X,Y) a two-dimensional random vector,
or a two-
dimensional random variable.

## Page 4

DEFINITION 2 (RANGE SPACE)
Similar to the one-dimensional situation, we can denote the range space of
(X,Y) by
RX,Y = {(x,y) | x = X(s),y = Y(s),s ∈S}.

## Page 5

The definitions above can be extended to more than two random vari-
ables.

## Page 6

DEFINITION 3 (n-DIMENSIONAL RANDOM VECTOR)
Let X1,X2,...,Xn be n functions each assigning a real number to every out-
come s ∈S.
We call (X1,X2,...,Xn) a n-dimensional random vector, or a n-
dimensional random variable.

## Page 7

We define the discrete and continuous two-dimensional random vari-
ables as follows.

## Page 8

DEFINITION 4
(X,Y) is a discrete two-dimensional random variable if the number of
possible values of (X(s),Y(s)) are finite or countable. That is, the possible
values of (X(s),Y(s)) may be represented by
(xi,y j),
i = 1,2,3,...; j = 1,2,3,...
(X,Y) is a continuous two-dimensional random variable if the possible
values of (X(s),Y(s)) can assume any value in some region of the Euclidean
space R2.

## Page 9

REMARK
We can view X and Y separately to judge whether (X,Y) is discrete or continuous.
• If both X and Y are discrete random variables, then (X,Y) is discrete.
• If both X and Y are continuous random variables, then (X,Y) is continuous.
• Clearly, there are other cases. For example, X is discrete, but Y is continuous.
These are not the focus of this course.

## Page 10

EXAMPLE 3.1
Consider a TV set that needs to be serviced.
Let X be the age of the set, rounded to the nearest year, and Y be the
numbers of defective components in the set.
Then (X,Y) is a discrete 2-dimensional random variable and its range
space is given as
RX,Y = {(x,y) | x = 0,1,2,...;y = 0,1,2,...,n},
where n is the total number of components in the TV.
For example, (X,Y) = (5,3) means that the TV is 5 years old and has 3
defective components.

## Page 11

Joint Probability Function
We will now introduce the probability functions for discrete and con-
tinuous random vectors.
For the discrete random vector, similar to the one-dimensional case,
we define its probability function by associating a number with each
possible value of the random variable.

## Page 12

DEFINITION 5 (DISCRETE JOINT PROBABILITY FUNCTION)
Let (X,Y) be a 2-dimensional discrete random variable. Its joint proba-
bility (mass) function is defined by
fX,Y(x,y) = P(X = x,Y = y),
for (x,y) ∈RX,Y.

## Page 13

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

## Page 14

EXAMPLE 3.2
Find the value of k such that
f(x,y) = kxy,
for x = 1,2,3 and y = 1,2,3,
can serve as a joint probability function.

## Page 15

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
Using Property (3), we have
1 = ∑∑(x,y)∈RX,Y f(x,y)
= 1k +2k +3k +2k +4k +6k +3k +6k +9k.
This results in k = 1/36.

## Page 16

DEFINITION 6 (CONTINUOUS JOINT PROBABILITY FUNCTION)
Let (X,Y) be a 2-dimensional continuous random variable. Its joint prob-
ability (density) function is a function fX,Y(x,y) such that
P((X,Y) ∈D) =
ZZ
(x,y)∈D fX,Y(x,y)dydx,
for any D ⊂R2. More specifically,
P(a ≤X ≤b,c ≤Y ≤d) =
Z b
a
Z d
c fX,Y(x,y)dydx.

## Page 17

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

## Page 18

EXAMPLE 3.3
Find the value c such that f(x,y) below can serve as a joint probability
density function for a random variable (X,Y):
f(x,y) =
(
cx(x+y),
0 ≤x ≤1;1 ≤y ≤2,
0,
elsewhere.

## Page 19

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

## Page 20

2
MARGINAL AND CONDITIONAL DISTRIBUTIONS
We now consider the marginal distributions.
Put simply, the marginal distribution of X is the individual distribu-
tion of X, igNORing the value of Y.

## Page 21

DEFINITION 7 (MARGINAL PROBABILITY DISTRIBUTION)
Let (X,Y) be a two-dimensional random variable with joint probability
function fX,Y(x,y). We define the marginal distribution of X as follows.
If Y is a discrete random variable, then for any x,
fX(x) = ∑
y
fX,Y(x,y).
If Y is a continuous random variable, then for any x,
fX(x) =
Z ∞
−∞fX,Y(x,y)dy.

## Page 22

REMARK
• fY(y) for Y is defined in the same way as that of X.
• We can view the marginal distribution as the “projection" of the 2D function
fX,Y(x,y) to the 1D function.
• Intuitively, it is the distribution of X by igNORing the presence of Y.
For example, consider a person from a certain community.
– Suppose X = body weight, Y = height, and (X,Y) has joint distribution
fX,Y(x,y).
– The marginal distribution fX(x) of X is the distribution of body weights
for all people in the community.

## Page 23

• fX(x) should not involve the variable y. This can be viewed from its definition:
y is either summed out or integrated over.
• fX(x) is a probability function; so it satisfies all the properties of the proba-
bility function.

## Page 24

EXAMPLE 3.4
We revisit Example 3.2. The joint probability function is given by
f(x,y) = 1
36xy,
for x = 1,2,3 and y = 1,2,3.
Note that X has three possible values: 1, 2, and 3. The marginal distri-
bution for X is given by
• for x = 1, fX(1) = f(1,1)+ f(1,2)+ f(1,3) = 6/36 = 1/6.
• for x = 2, fX(2) = f(2,1)+ f(2,2)+ f(2,3) = 12/36 = 1/3.
• for x = 3, fX(3) = f(3,1)+ f(3,2)+ f(3,3) = 18/36 = 1/2.
For other values of x, fX(x) = 0.

## Page 25

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

## Page 26

DEFINITION 8 (CONDITIONAL DISTRIBUTION)
Let (X,Y) be a random variable with joint probability function fX,Y(x,y).
Let fX(x) be the marginal probability function for X. Then for any x such
that fX(x) > 0, the conditional probability function of Y given X = x
is defined to be
fY|X(y|x) = fX,Y(x,y)
fX(x) .

## Page 27

REMARK
• For any y such that fY(y) > 0, we can similarly define the conditional distri-
bution of X given Y = y as
fX|Y(x|y) = fX,Y(x,y)
fY(y)
.
• fY|X(y|x) is defined only for x such that fX(x) > 0; likewise fX|Y(x|y) is defined
only for y such that fY(y) > 0.
• The intuitive meaning of fY|X(y|x): the distribution of Y given that the random
variable X is observed to take the value x.

## Page 28

• Considering y as the variable (and x as a fixed value), fY|X(y|x) is a probability
function, so it must satisfy all the properties of a probability function.
• However, fY|X(y|x) is not a probability function for x. This means that there is
NO requirement that
–
Z ∞
−∞fY|X(y|x)dx = 1, for X continuous; or
– ∑
x
fY|X(y|x) = 1, for X discrete.
• With this definition, we immediately have
– If fX(x) > 0, fX,Y(x,y) = fX(x)fY|X(y|x).
– If fY(y) > 0, fX,Y(x,y) = fY(y)fX|Y(x|y).

## Page 29

• One immediate application of the conditional distribution is to compute, for
continuous random variable,
P(Y ≤y|X = x) =
Z y
−∞fY|X(y|x)dy;
E(Y|X = x) =
Z ∞
−∞yfY|X(y|x)dy.
Their interpretations are clear: the former is the probability that Y ≤y, given
X = x; the latter is the average value of Y given X = x.
For the discrete case, the results can be similarly established, based on the
definition of fY|X(y|x).

## Page 30

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

## Page 31

We can also compute
P(Y = 2|X = 1) = fY|X(2|1) = 1
6 ×2 = 1/3;
P(Y ≤2|X = 1) = P(Y = 1|X = 1)+P(Y = 2|X = 1)
= fY|X(1|1)+ fY|X(2|1) = 1/6+1/3 = 1/2;
E(Y|X = 2) = 1· fY|X(1|2)+2· fY|X(2|2)+3· fY|X(3|2)
= 1·(1/6)+2·(2/6)+3·(3/6) = 7/3.

## Page 32

3
INDEPENDENT RANDOM VARIABLES
We next discuss independence for random variables.

## Page 33

DEFINITION 9 (INDEPENDENT RANDOM VARIABLES)
Random variables X and Y are independent if and only if for any x and y,
fX,Y(x,y) = fX(x)fY(y).
Random variables X1,X2,...,Xn are independent if and only if for any
x1,x2,...,xn,
fX1,X2,...,Xn(x1,x2,...xn) = fX1(x1)fX2(x2)··· fXn(xn).

## Page 34

REMARK
• The above definition is applicable whether (X,Y) is continuous or discrete.
• The “product feature" in the definition implies one necessary condition for
independence: RX,Y needs to be a product space. In the sense that if X and Y
are independent, for any x ∈RX and any y ∈RY, we have
fX,Y(x,y) = fX(x)fY(y) > 0,
implying RX,Y = {(x,y)|x ∈RX;y ∈Ry} = RX ×RY.
Conclusion:
If RX,Y is not a product space, then X and Y are not independent!

## Page 35

PROPERTIES OF INDEPENDENT RANDOM VARIABLES
Suppose X,Y are independent random variables.
(1) If A and B are arbitrary subsets of R, the events X ∈A and Y ∈B are independent
events in S. Thus
P(X ∈A;Y ∈B) = P(X ∈A)P(Y ∈B).
In particular, for any real numbers x,y,
P(X ≤x;Y ≤y) = P(X ≤x)P(Y ≤y).

## Page 36

(2) For arbitrary functions g1(·) and g2(·), g1(X) and g2(Y) are independent. For
example,
• X2 and Y are independent.
• sin(X) and cos(Y) are independent.
• eX and log(Y) are independent.
(3) Independence is connected with conditional distribution.
• If fX(x) > 0, then fY|X(y|x) = fY(y).
• If fY(y) > 0, then fX|Y(x|y) = fX(x).

## Page 37

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
0.15 0.3 0.15
0.6
fY(y) 0.25 0.5 0.25
1
Are X and Y independent?

## Page 38

Solution:
We need to check that for every x and y combination, whether we have
fX,Y(x,y) = fX(x)fY(y).
For example, from the table, we have fX,Y(2,1) = 0.1; fX(2) = 0.4, fY(1) =
0.25. Therefore
fX,Y(2,1) = 0.1 = 0.4×0.25 = fX(2)fY(1).
In fact, we can check for each x ∈{2,4} and y ∈{1,3,5} combination,
the equality holds. Therefore X and Y are independent.

## Page 39

4
EXPECTATION AND COVARIANCE
Similar to one dimensional random variable, we can talk about the
expectation of a random vector.

## Page 40

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

## Page 41

If we let
g(X,Y) = (X −E(X))(Y −E(Y)) = (X −µX)(Y −µy),
the expectation E[g(X,Y)] leads to the covariance of X and Y.

## Page 42

DEFINITION 11 (COVARIANCE)
The covariance of X and Y is defined to be
cov(X,Y) = E[(X −E(X))(Y −E(Y))].

## Page 43

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

## Page 44

PROPERTIES OF THE COVARIANCE
The covariance has the following properties.
(1) cov(X,Y) = E(XY)−E(X)E(Y).
This is true because
cov(X,Y) = E[(X −µX)(Y −µY)] = E[XY −Y µX −XµY + µXµY]
= E(XY)−µXE(Y)−µYE(X)+ µXµY
= E(XY)−µXµY −µYµX + µXµY = E(XY)−µXµY.

## Page 45

(2) If X and Y are independent, then cov(X,Y) = 0. However, cov(X,Y) = 0 does not
imply that X and Y are independent.
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
xiy j fX(xi)fY(yj)
= ∑
i
xi fX(xi)∑
j
y j fY(yj) = E(X)E(Y).

## Page 46

(3) cov(aX +b,cY +d) = ac·cov(X,Y).
This can be derived using the following 3 formulas:
(i) cov(X,Y) = cov(Y,X);
(ii) cov(X +b,Y) = cov(X,Y);
(iii) cov(aX,Y) = acov(X,Y).
(4) V(aX +bY) = a2V(X)+b2V(Y)+2ab·cov(X,Y).
This can be derived using the following 2 formulas:
(i) V(aX) = a2V(X);
(ii) V(X +Y) = V(X)+V(Y)+2cov(X,Y).

## Page 47

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
1/8 1/4 1/8
0
1/2
1
0
1/8 1/4 1/8
1/2
fY(y) 1/8 3/8 3/8 1/8
1
(i) Find E(Y −X).
(ii) Find cov(X,Y).

## Page 48

Solution:
(i) Method 1:
E(Y −X) = (0−0)(1/8)+(1−0)(1/4)+(2−0)(1/8)
+...+(3−1)(1/8) = 1.
Method 2:
E(Y −X) = E(Y)−E(X) = 1.5−0.5 = 1,
where
E(Y) = 0·(1/8)+1·(3/8)+2·(3/8)+3·(1/8) = 1.5
E(X) = 0·(1/2)+1·(1/2) = 0.5.

## Page 49

(ii) We use cov(X,Y) = E(XY)−E(X)E(Y) to compute. Note that we
have computed E(X) and E(Y) in Part (i).
E(XY) = (0)(0)(1/8)+(0)(1)(1/4)+(0)(2)(1/8)
+...+(1)(3)(1/8) = 1.
Therefore
cov(X,Y) = E(XY)−E(X)E(Y) = 1−(0.5)(1.5) = 0.25.