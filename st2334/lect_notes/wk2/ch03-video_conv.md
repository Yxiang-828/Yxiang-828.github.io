# PDF Content

## Page 1

### Three

### Joint Distributions

## Page 2

### 1 J OINT D ISTRIBUTIONS FOR M ULTIPLE R ANDOM V ARIABLES

Very often, we are interested in more than one random variables si- multaneously .

• For example, an investigator might be interested in both the height ( H ) and the weight ( W ) of individuals from a certain population.

• Another investigator could be interested in both the hardness ( H ) and the tensile strength ( T ) of a piece of cold-drawn copper.

## Page 3

`D EFINITION 1 (T WO - DIMENSIONAL R ANDOM V ECTOR ) Let E be an experiment and S be a corresponding sample space. Suppose X and Y are two functions each assigning a real number to each s ∈ S .`

We call ( X , Y ) a two-dimensional random vector , or a two- dimensional random variable .

## Page 4
 `D EFINITION 2 (R ANGE S PACE ) Similar to the one-dimensional situation, we can denote the range space of ( X , Y ) by R X , Y = { ( x , y ) | x = X(s ) , y = Y(s ) , s ∈ S } .`

## Page 5

The definitions above can be extended to more than two random vari- ables.

## Page 6
 `D EFINITION 3 ( n - DIMENSIONAL R ANDOM V ECTOR ) Let X 1 , X 2 ,..., X n be n functions each assigning a real number to every out- come s ∈ S .`

We call ( X 1 , X 2 ,..., X n ) a n-dimensional random vector , or a n- dimensional random variable .

## Page 7

We define the discrete and continuous two-dimensional random vari- ables as follows.

## Page 8
 `D EFINITION 4 ( X , Y ) is a discrete two-dimensional random variable if the number of possible values of ( X(s ) , Y(s )) are finite or countable. That is, the possible values of ( X(s ) , Y(s )) may be represented by`
 `( x i , y j ) , i = 1 , 2 , 3 ,... ; j = 1 , 2 , 3 ,...`
 `( X , Y ) is a continuous two-dimensional random variable if the possible values of ( X(s ) , Y(s )) can assume any value in some region of the Euclidean space R 2 .`

## Page 9

R EMARK We can view X and Y separately to judge whether ( X , Y ) is discrete or continuous.

• If both X and Y are discrete random variables, then ( X , Y ) is discrete.

• If both X and Y are continuous random variables, then ( X , Y ) is continuous.

• Clearly, there are other cases. For example, X is discrete, but Y is continuous. These are not the focus of this course.

## Page 10

E XAMPLE 3.1 Consider a TV set that needs to be serviced.

Let X be the age of the set, rounded to the nearest year, and Y be the numbers of defective components in the set.
 `Then(X , Y ) is a discrete 2-dimensional random variable and its range space is given as`
 `R X , Y = { ( x , y ) | x = 0 , 1 , 2 ,... ; y = 0 , 1 , 2 ,..., n } ,`

where n is the total number of components in the TV.
 `For example, ( X , Y ) = ( 5 , 3 ) means that the TV is 5 years old and has 3 defective components.`

## Page 11

### Joint Probability Function

We will now introduce the probability functions for discrete and con- tinuous random vectors.

For the discrete random vector, similar to the one-dimensional case, we define its probability function by associating a number with each possible value of the random variable.

## Page 12
 `D EFINITION 5 (D ISCRETE JOINT PROBABILITY FUNCTION ) Let(X , Y ) be a 2-dimensional discrete random variable. Its joint proba- bility (mass) function is defined by`
 `f X , Y(x , y ) = P(X = x , Y = y ) ,`
 `for ( x , y ) ∈ R X , Y .`

## Page 13

### P ROPERTIES OF THE DISCRETE JOINT PROBABILITY FUNCTION The joint probability mass function has the following properties:
 `(1) f X , Y(x , y ) ≥ 0 for any ( x , y ) ∈ R X , Y .`
 `(2) f X , Y(x , y ) = 0 for any ( x , y ) / ∈ R X , Y .`

(3)
 `∞ ∑ i = 1`
 `∞ ∑ j = 1 f X , Y(x i , y j ) =`
 `∞ ∑ i = 1`
 `∞ ∑ j = 1 P(X = x i , Y = y j ) = 1 .`
 `Equivalently, ∑∑ ( x , y ) ∈ R X , Y f ( x , y ) = 1 .`

(4) Let A be any subset of R X , Y , then
 `P(( X , Y ) ∈ A ) = ∑∑ ( x , y ) ∈ A f X , Y(x , y ) .`

## Page 14

E XAMPLE 3.2 Find the value of k such that
 `f ( x , y ) = kxy , for x = 1 , 2 , 3 and y = 1 , 2 , 3 ,`

can serve as a joint probability function.

## Page 15
 `Solution: Note that R X , Y = { ( x , y ) | x = 1 , 2 , 3; y = 1 , 2 , 3 } , and`
 `f ( 1 , 1 ) = k , f ( 1 , 2 ) = 2 k , f ( 1 , 3 ) = 3 k , f ( 2 , 1 ) = 2 k , f ( 2 , 2 ) = 4 k , f ( 2 , 3 ) = 6 k , f ( 3 , 1 ) = 3 k , f ( 3 , 2 ) = 6 k , f ( 3 , 3 ) = 9 k .`
 `Using Property(3), we have`

### 1 = ∑∑ ( x , y ) ∈ R X , Y f ( x , y )
 `= 1 k + 2 k + 3 k + 2 k + 4 k + 6 k + 3 k + 6 k + 9 k .`
 `This results in k = 1 / 36 .`

## Page 16
 `D EFINITION 6 (C ONTINUOUS JOINT PROBABILITY FUNCTION ) Let(X , Y ) be a 2-dimensional continuous random variable. Its joint prob- ability (density) function is a function f X , Y(x , y ) such that`
 `P(( X , Y ) ∈ D ) = ZZ`
 `( x , y ) ∈ D f X , Y(x , y ) dydx ,`

for any D ⊂ R 2 . More specifically,
 `P(a ≤ X ≤ b , c ≤ Y ≤ d ) = Z b`

a

Z d
 `c f X , Y(x , y ) dydx .`

## Page 17

P ROPERTIES OF THE CONTINUOUS JOINT PROBABILITY FUNCTION The joint probability density function has the following properties:
 `(1) f X , Y(x , y ) ≥ 0 , for any ( x , y ) ∈ R X , Y .`
 `(2) f X , Y(x , y ) = 0 , for any ( x , y ) / ∈ R X , Y .`

(3)

## Z ∞

− ∞

## Z ∞
 `− ∞ f X , Y(x , y ) dxdy = 1 .`

Equivalently, ZZ
 `( x , y ) ∈ R X , Y f X , Y(x , y ) dxdy = 1 .`

## Page 18

E XAMPLE 3.3 Find the value c such that f ( x , y ) below can serve as a joint probability density function for a random variable ( X , Y ) :
 `f ( x , y ) =`
 `( cx ( x + y ) , 0 ≤ x ≤ 1;1 ≤ y ≤ 2 , 0 , elsewhere .`

## Page 19

**Solution: In order for f ( x , y ) to be a probability density function, we need**

## 1 = Z ∞

− ∞

## Z ∞
 `− ∞ f ( x , y ) dydx = Z 1`

0

## Z 2

### 1 cx ( x + y ) dydx
 `= c Z 1`

### 0 x  x + 1

### 2 y 2  2

### 1 dx = c Z 1

### 0 x ( x + 1 . 5 ) dx
 `= c  1`

### 3 x 3 + 1 . 5 · 1

### 2 x 2  1

### 0 = c · 13

### 12 .
 `This implies that c = 12 / 13 .`

## Page 20

## 2 M ARGINAL AND C ONDITIONAL D ISTRIBUTIONS

We now consider the marginal distributions.

Put simply, the marginal distribution of X is the individual distribu- tion of X , ignoring the value of Y .

## Page 21
 `D EFINITION 7 (M ARGINAL PROBABILITY DISTRIBUTION ) Let(X , Y ) be a two-dimensional random variable with joint probability function f X , Y(x , y ) . We define the marginal distribution of X as follows.`

If Y is a discrete random variable, then for any x ,
 `f X(x ) = ∑ y f X , Y(x , y ) .`

If Y is a continuous random variable, then for any x ,
 `f X(x ) = Z ∞`
 `− ∞ f X , Y(x , y ) dy .`

## Page 22

## R EMARK
 `• f Y(y ) for Y is defined in the same way as that of X .`
 `• We can view the marginal distribution as the “projection" of the 2D function f X , Y(x , y ) to the 1D function.`

• Intuitively, it is the distribution of X by ignoring the presence of Y .

For example, consider a person from a certain community.
 `– Suppose X = body weight, Y = height, and ( X , Y ) has joint distribution f X , Y(x , y ) .`
 `– The marginal distribution f X(x ) of X is the distribution of body weights for all people in the community .`

## Page 23
 `• f X(x ) should not involve the variable y . This can be viewed from its definition: y is either summed out or integrated over.`
 `• f X(x ) is a probability function ; so it satisfies all the properties of the proba- bility function.`

## Page 24

E XAMPLE 3.4 We revisit Example 3.2 . The joint probability function is given by
 `f ( x , y ) = 1`

### 36 xy , for x = 1 , 2 , 3 and y = 1 , 2 , 3 .

**Note that X has three possible values: 1, 2, and 3. The marginal distri- bution for X is given by**
 `• for x = 1 , f X(1 ) = f ( 1 , 1 )+ f ( 1 , 2 )+ f ( 1 , 3 ) = 6 / 36 = 1 / 6 .`
 `• for x = 2 , f X(2 ) = f ( 2 , 1 )+ f ( 2 , 2 )+ f ( 2 , 3 ) = 12 / 36 = 1 / 3 .`
 `• for x = 3 , f X(3 ) = f ( 3 , 1 )+ f ( 3 , 2 )+ f ( 3 , 3 ) = 18 / 36 = 1 / 2 .`
 `For other values of x , f X(x ) = 0 .`

## Page 25
 `Alternatively, for each x ∈{ 1 , 2 , 3 } ,`
 `f X(x ) = ∑ y f ( x , y ) =`

### 3 ∑ y = 1

### 1 36 xy = 1

### 36 x

### 3 ∑ y = 1 y = 1

### 6 x .

## Page 26
 `D EFINITION 8 (C ONDITIONAL D ISTRIBUTION ) Let(X , Y ) be a random variable with joint probability function f X , Y(x , y ) . Let f X(x ) be the marginal probability function for X . Then for any x such that f X(x ) > 0 , the conditional probability function of Y given X = x is defined to be`
 `f Y | X(y | x ) = f X , Y(x , y )`
 `f X(x ) .`

## Page 27

## R EMARK
 `• For any y such that f Y(y ) > 0 , we can similarly define the conditional distri- bution of X given Y = y as`
 `f X | Y(x | y ) = f X , Y(x , y )`
 `f Y(y ) .`
 `• f Y | X(y | x ) is defined only for x such that f X(x ) > 0 ; likewise f X | Y(x | y ) is defined only for y such that f Y(y ) > 0 .`
 `• The intuitive meaning of f Y | X(y | x ) : the distribution of Y given that the random variable X is observed to take the value x .`

## Page 28
 `• Considering y as the variable (and x as a fixed value), f Y | X(y | x ) is a probability function, so it must satisfy all the properties of a probability function.`
 `• However, f Y | X(y | x ) is not a probability function for x . This means that there is NO requirement that`

–

## Z ∞
 `− ∞ f Y | X(y | x ) dx = 1 , for X continuous; or`
 `– ∑ x f Y | X(y | x ) = 1 , for X discrete.`

• With this definition, we immediately have
 `– If f X(x ) > 0 , f X , Y(x , y ) = f X(x ) f Y | X(y | x ) .`
 `– If f Y(y ) > 0 , f X , Y(x , y ) = f Y(y ) f X | Y(x | y ) .`

## Page 29

• One immediate application of the conditional distribution is to compute, for continuous random variable,
 `P(Y ≤ y | X = x ) = Z y`
 `− ∞ f Y | X(y | x ) dy;`
 `E(Y | X = x ) = Z ∞`
 `− ∞ yf Y | X(y | x ) dy .`
 `Their interpretations are clear: the former is the probability that Y ≤ y , given X = x ; the latter is the average value of Y given X = x .`
 `For the discrete case, the results can be similarly established, based on the definition of f Y | X(y | x ) .`

## Page 30

E XAMPLE 3.5 We revisit Examples 3.2 and 3.4 . The joint probability function for ( X , Y ) is given by
 `f ( x , y ) = xy / 36 , for x = 1 , 2 , 3 and y = 1 , 2 , 3 .`

The marginal probability function for X is
 `f X(x ) = x / 6 , for x = 1 , 2 , 3 .`

### Therefore f Y | X ( y | x ) is defined for any x = 1 , 2 , 3 :
 `f Y | X(y | x ) = f ( x , y )`
 `f X(x ) = ( xy / 36 )`
 `( x / 6 ) = y / 6 , for y = 1 , 2 , 3 .`

## Page 31

We can also compute
 `P(Y = 2 | X = 1 ) = f Y | X(2 | 1 ) = 1`

### 6 × 2 = 1 / 3;
 `P(Y ≤ 2 | X = 1 ) = P(Y = 1 | X = 1 )+ P(Y = 2 | X = 1 ) = f Y | X(1 | 1 )+ f Y | X(2 | 1 ) = 1 / 6 + 1 / 3 = 1 / 2;`
 `E(Y | X = 2 ) = 1 · f Y | X(1 | 2 )+ 2 · f Y | X(2 | 2 )+ 3 · f Y | X(3 | 2 ) = 1 · ( 1 / 6 )+ 2 · ( 2 / 6 )+ 3 · ( 3 / 6 ) = 7 / 3 .`

## Page 32

## 3 I NDEPENDENT R ANDOM V ARIABLES

We next discuss independence for random variables.

## Page 33

D EFINITION 9 (I NDEPENDENT R ANDOM V ARIABLES ) Random variables X and Y are independent if and only if for any x and y ,
 `f X , Y(x , y ) = f X(x ) f Y(y ) .`

Random variables X 1 , X 2 ,..., X n are independent if and only if for any x 1 , x 2 ,..., x n ,
 `f X 1 , X 2 ,..., X n ( x 1 , x 2 ,... x n ) = f X 1 ( x 1 ) f X 2 ( x 2 ) ··· f X n ( x n ) .`

## Page 34

## R EMARK

• The above definition is applicable whether ( X , Y ) is continuous or discrete.
 `• The “product feature" in the definition implies one necessary condition for independence: R X , Y needs to be a product space. In the sense that if X and Y are independent, for any x ∈ R X and any y ∈ R Y , we have`
 `f X , Y(x , y ) = f X(x ) f Y(y ) > 0 ,`
 `implying R X , Y = { ( x , y ) | x ∈ R X ; y ∈ R y } = R X × R Y .`

**Conclusion: If R X , Y is not a product space, then X and Y are not independent!**

## Page 35

P ROPERTIES OF INDEPENDENT RANDOM VARIABLES Suppose X , Y are independent random variables.
 `(1) If A and B are arbitrary subsets of R , the events X ∈ A and Y ∈ B are independent events in S . Thus`
 `P(X ∈ A ; Y ∈ B ) = P(X ∈ A ) P(Y ∈ B ) .`

In particular, for any real numbers x , y ,
 `P(X ≤ x ; Y ≤ y ) = P(X ≤ x ) P(Y ≤ y ) .`

## Page 36

(2) For arbitrary functions g 1 ( · ) and g 2 ( · ) , g 1 ( X ) and g 2 ( Y ) are independent. For example,

• X 2 and Y are independent.

• sin ( X ) and cos ( Y ) are independent.

• e X and log ( Y ) are independent.

(3) Independence is connected with conditional distribution.
 `• If f X(x ) > 0 , then f Y | X(y | x ) = f Y(y ) .`
 `• If f Y(y ) > 0 , then f X | Y(x | y ) = f X(x ) .`

## Page 37

E XAMPLE 3.6 The joint probability function of ( X , Y ) is given below.
 `x y f X(x ) 1 3 5 2 0.1 0.2 0.1 0.4 4 0.15 0.3 0.15 0.6 f Y(y ) 0.25 0.5 0.25 1`

Are X and Y independent?

### Table 1

| x | y | None | None | f (x)
X |
| --- | --- | --- | --- | --- |
|  | 1 | 3 | 5 |  |
| 2 | 0.1 | 0.2 | 0.1 | 0.4 |
| 4 | 0.15 | 0.3 | 0.15 | 0.6 |
| f (y)
Y | 0.25 | 0.5 | 0.25 | 1 |

## Page 38

**Solution: We need to check that for every x and y combination, whether we have**
 `f X , Y(x , y ) = f X(x ) f Y(y ) .`
 `For example, from the table, we have f X , Y(2 , 1 ) = 0 . 1 ; f X(2 ) = 0 . 4 , f Y(1 ) = 0 . 25 . Therefore`
 `f X , Y(2 , 1 ) = 0 . 1 = 0 . 4 × 0 . 25 = f X(2 ) f Y(1 ) .`
 `In fact, we can check for each x ∈{ 2 , 4 } and y ∈{ 1 , 3 , 5 } combination, the equality holds. Therefore X and Y are independent.`

## Page 39

## 4 E XPECTATION AND C OVARIANCE

Similar to one dimensional random variable, we can talk about the expectation of a random vector.

## Page 40

D EFINITION 10 (E XPECTATION ) Consider any two variable function g ( x , y ) .
 `If(X , Y ) is a discrete random variable,`
 `E(g ( X , Y )) = ∑ x ∑ y g ( x , y ) f X , Y(x , y ) .`
 `If(X , Y ) is a continuous random variable,`
 `E(g ( X , Y )) = Z ∞`

− ∞

## Z ∞
 `− ∞ g ( x , y ) f X , Y(x , y ) dydx .`

## Page 41

If we let
 `g ( X , Y ) = ( X − E(X ))( Y − E(Y )) = ( X − µ X )( Y − µ y ) ,`

the expectation E [ g ( X , Y )] leads to the covariance of X and Y .

## Page 42

D EFINITION 11 (C OVARIANCE ) The covariance of X and Y is defined to be
 `cov ( X , Y ) = E [( X − E(X ))( Y − E(Y ))] .`

## Page 43

R EMARK If X and Y are discrete random variables,
 `cov ( X , Y ) = ∑ x ∑ y ( x − µ X )( y − µ Y ) f X , Y(x , y ) .`

If X and Y are continuous random variables,
 `cov ( X , Y ) = Z ∞`

− ∞

## Z ∞
 `− ∞ ( x − µ X )( y − µ Y ) f X , Y(x , y ) dxdy .`

## Page 44

P ROPERTIES OF THE COVARIANCE The covariance has the following properties.
 `(1) cov ( X , Y ) = E(XY ) − E(X ) E(Y ) .`

This is true because
 `cov ( X , Y ) = E [( X − µ X )( Y − µ Y )] = E [ XY − Y µ X − X µ Y + µ X µ Y ] = E(XY ) − µ X E(Y ) − µ Y E(X )+ µ X µ Y = E(XY ) − µ X µ Y − µ Y µ X + µ X µ Y = E(XY ) − µ X µ Y .`

## Page 45
 `(2) If X and Y are independent, then cov ( X , Y ) = 0 . However, cov ( X , Y ) = 0 does not imply that X and Y are independent.`

### Take note that the two statements can be summarised as:
 `(i) X ⊥ Y ⇒ cov ( X , Y ) = 0 ;`
 `(ii) X ⊥ Y ̸⇐ cov ( X , Y ) = 0 .`
 `For(i), note that if X and Y are independent, then f X , Y(x , y ) = f X(x ) f Y(y ) . So`
 `E(XY ) = ∑ i ∑ j x i y j f X , Y(x i , y j ) = ∑ i ∑ j x i y j f X(x i ) f Y(y j )`
 `= ∑ i x i f X(x i ) ∑ j y j f Y(y j ) = E(X ) E(Y ) .`

## Page 46
 `(3) cov ( aX + b , cY + d ) = ac · cov ( X , Y ) .`

### This can be derived using the following 3 formulas:
 `(i) cov ( X , Y ) = cov ( Y , X ) ;`
 `(ii) cov ( X + b , Y ) = cov ( X , Y ) ;`
 `(iii) cov ( aX , Y ) = a cov ( X , Y ) .`
 `(4) V(aX + bY ) = a 2 V(X )+ b 2 V(Y )+ 2 ab · cov ( X , Y ) .`

### This can be derived using the following 2 formulas:
 `(i) V(aX ) = a 2 V(X ) ;`
 `(ii) V(X + Y ) = V(X )+ V(Y )+ 2cov ( X , Y ) .`

## Page 47

### E XAMPLE 3.7 We are given the joint distribution for ( X , Y ) :
 `x y f X(x ) 0 1 2 3 0 1 / 8 1 / 4 1 / 8 0 1 / 2 1 0 1 / 8 1 / 4 1/8 1 / 2 f Y(y ) 1 / 8 3 / 8 3 / 8 1 / 8 1`
 `(i) Find E(Y − X ) .`

(ii) Find cov ( X , Y ) .

### Table 2

| x | y | None | None | None | f (x)
X |
| --- | --- | --- | --- | --- | --- |
|  | 0 | 1 | 2 | 3 |  |
| 0 | 1/8 | 1/4 | 1/8 | 0 | 1/2 |
| 1 | 0 | 1/8 | 1/4 | 1/8 | 1/2 |
| f (y)
Y | 1/8 | 3/8 | 3/8 | 1/8 | 1 |

## Page 48

### Solution:

### (i) Method 1:
 `E(Y − X ) = ( 0 − 0 )( 1 / 8 )+( 1 − 0 )( 1 / 4 )+( 2 − 0 )( 1 / 8 ) + ... +( 3 − 1 )( 1 / 8 ) = 1 .`

### Method 2:
 `E(Y − X ) = E(Y ) − E(X ) = 1 . 5 − 0 . 5 = 1 ,`

where
 `E(Y ) = 0 · ( 1 / 8 )+ 1 · ( 3 / 8 )+ 2 · ( 3 / 8 )+ 3 · ( 1 / 8 ) = 1 . 5 E(X ) = 0 · ( 1 / 2 )+ 1 · ( 1 / 2 ) = 0 . 5 .`

## Page 49
 `(ii) We use cov ( X , Y ) = E(XY ) − E(X ) E(Y ) to compute. Note that we have computed E(X ) and E(Y ) in Part(i).`
 `E(XY ) = ( 0 )( 0 )( 1 / 8 )+( 0 )( 1 )( 1 / 4 )+( 0 )( 2 )( 1 / 8 ) + ... +( 1 )( 3 )( 1 / 8 ) = 1 .`

### Therefore
 `cov ( X , Y ) = E(XY ) − E(X ) E(Y ) = 1 − ( 0 . 5 )( 1 . 5 ) = 0 . 25 .`