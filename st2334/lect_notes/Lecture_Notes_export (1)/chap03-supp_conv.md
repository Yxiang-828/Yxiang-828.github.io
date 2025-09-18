# Supplementary Materials

## Page 1

Three
Supplementary Materials
CHECKING INDEPENDENCE
We have a handy way to check independence.
X and Y are independent if and only if both of the following hold:
(a) RX,Y, the range where the probability function is positive, is a product space.
(b) For any (x,y) ∈RX,Y, we have
fX,Y(x,y) = C ×g1(x)×g2(y).
That is, fX,Y(x,y) can be “factorized” as the product of two functions g1 and g2,
where g1 depends on x only, g2 depends on y only, and C is a constant not
depending on both x and y.
Note: g1(x) and g2(y) on their own NEED NOT be probability functions.
EXAMPLE 3.1
Consider the joint probability function
f(x,y) = 1
36xy,
for x = 1,2,3, y = 1,2,3.
Note that we can write
A1 = {1,2,3},
A2 = {1,2,3}.
So RX,Y = A1 ×A2 is a product space.
We can also let
C = 1/36,
g1(x) = x,
g2(y) = y.
Then fX,Y(x,y) = C ×g1(x)×g2(y). Thus X and Y are independent.
The advantage of this method is that we do not need to find the
marginal distributions fX(x) and fY(y) and check if fX,Y(x,y) = fX(x)fY(y).
1

## Page 2

2
Supplementary Materials
EXAMPLE 3.2
The joint probability function of (X,Y) is given below.
fX,Y(x,y) =
(
1
3x(1+y),
for 0 < x < 2,0 < y < 1,
0,
elsewhere.
Are X and Y independent?
Solution:
We can set A1 = (0,2) and A2 = (0,1). Then
RX,Y = A1 ×A2
is a product space.
Notice that fX,Y(x,y) in RX,Y can be factorized by letting
C = 1
3,
g1(x) = x,
g2(y) = 1+y.
Therefore, we conclude that X and Y are independent.