# PDF Content

## Page 1

### Six

### Estimation

## Page 2

### We now learn about a powerful use of statistics:

## S TATISTICAL INFERENCE

about POPULATION PARAMETERS

using SAMPLE DATA .

## Page 3

### In case you wonder about the relevance of learning about probability and sampling distribution, this is why:

• Statistical inference methods use probability calculations that as- sume that the data were gathered with a random sample or a randomized experiment.

• The probability calculations refer to a sampling distribution of a statistic, which is often approximately a normal distribution.

## Page 4

There are two types of statistical inference methods

• estimation of population parameters ; and

• testing hypotheses about the parameter values .

This chapter discusses the first — estimating population parameters.

## Page 5

T WO TYPES OF E STIMATIONS Point estimation

Based on sample data, a single number is calculated to estimate the popula- tion parameter. The rule or formula that describes this calculation is called the point estimator . The resulting number is called a point estimate .

Interval estimation

Based on sample data, two numbers are calculated to form an interval within which the parameter is expected to lie.

## Page 6

**E XAMPLE 6.1 One survey asked, "Do you believe in hell?"**

From sample data, the point estimate for the proportion of adult (in the population ) who would respond "yes" is 0.73. The adjective "point" refers to using a single number as the parameter estimate.

An interval estimate predicts that the proportion of adult (in the pop- ulation ) who believe in hell falls between 0.71 and 0.75.

## Page 7

### Images and Figures

**Figure 1**: JPEG image (Position: 154, 113, Size: 413×238)

*Image content (OCR):*
```
Point estimate (single number) e Op 0.73 07 08 Interval estimate (interval of numbers) 0.71 0.75 07 08 ```

The next figure illustrates the difference between point estimate and interval estimate for the previous example.

## Page 8

## 1 P OINT E STIMATION

Suppose we are interested to estimate the parameter µ , the population mean. Assume that we have the following data, a random sample consisting X 1 , X 2 ,..., X n .

## Page 9

D EFINITION 1 (E STIMATOR ) An estimator is a rule, usually expressed as a formula, that tells us how to calculate an estimate based on information in the sample.

## Page 10
 `E XAMPLE 6.2 (P OINT E STIMATOR ) We want to estimate the average waiting time for a bus ( µ ) for students attending ST2334. The lecturer asked 4 students their waiting times X 1 ,..., X 4 for a bus. The(observed) results are`
 `x 1 = 6 , x 2 = 1 , x 3 = 4 , x 4 = 9 .`
 `We can use X = 1`
 `4 ( X 1 + ··· + X 4 ) to estimate µ . In this case, X is the estimator (for µ ), and the computed value x = 5 is the estimate .`

## Page 11

## Q UESTIONS

• How good is the estimator?

• What would be a criteria for a “good" estimator?

## Page 12

### Unbiased Estimator
 `One of the reasons we think X is a good estimator of µ is because E(X ) = µ . That is, “on average", the estimator is right.`

In general, we represent the parameter of interest by θ . For example, θ can be p , µ , or σ .

## Page 13
 `D EFINITION 2 (U NBIASED E STIMATOR ) Let ˆ Θ be an estimator of θ . Then ˆ Θ is a random variable based on the sample. If E(ˆ Θ ) = θ , we call ˆ Θ an unbiased estimator of θ .`

## Page 14

### Images and Figures

**Figure 2**: JPEG image (Position: 203, 145, Size: 314×192)

*Image content (OCR):* ```
Unbiased estimator Biased estimator True value of parameter ```

R EMARK An unbiased estimator has mean value equals to the true value of the parameter.

## Page 15

E XAMPLE 6.3 (U NBIASED E STIMATOR ) Let X 1 , X 2 ,..., X n be a random sample from the same population with mean µ and variance σ 2 . Then
 `S 2 = 1 n − 1`
 `n ∑ i = 1 ( X i − X ) 2`
 `is an unbiased estimator of σ 2 since E(S 2 ) = σ 2 .`

## Page 16

Maximum Error of Estimate
 `Typically X ̸ = µ , so X − µ measures the difference between the estima- tor and the true value of the parameter.`

Recall that if the population is normal or if n is large, X − µ
 `σ / √ n follows a`

standard normal or an approximately standard normal distribution.

## Page 17

### Images and Figures

**Figure 3**: JPEG image (Position: 166, 165, Size: 403×164)

*Image content (OCR):* ```
density function of Z va 0 Za ```
 `D EFINITION 3 ( z α ) Define z α to be the number with an upper-tail probability of α for the stan- dard normal distribution Z . That is, P(Z > z α ) = α .`

## Page 18

**From the above definition, we then have**
 `P  − z α / 2 ≤ X − µ`
 `σ / √ n ≤ z α / 2`
 ` = 1 − α .`

In other words,

P  | X − µ |
 `σ / √ n ≤ z α / 2`
 ` = P  | X − µ | ≤ z α / 2 · σ √ n`
 ` = 1 − α .`

## Page 19

### Images and Figures

**Figure 4**: JPEG image (Position: 154, 43, Size: 413×169)

*Image content (OCR):* ```
density function of Z 1 i a/2 a a/2 —Zej2 0 Zo/2 ```

This means that, with probability 1 − α , the error | X − µ | is less than
 `E = z α / 2 · σ √ n .`

## Page 20

D EFINITION 4 (M AXIMUM E RROR O F E STIMATE ) The quantity
 `E = z α / 2 · σ √ n`

is called the maximum error of estimate .

## Page 21

E XAMPLE 6.4 (TV T IME FOR I NTERNET U SERS ) An investigator is interested in the amount of time internet users spend watching television per week.
 `Based on historical experience, he assumes that the standard deviation is σ = 3 . 5 hours.`
 `He proposes to select a random sample of n = 50 internet users, poll them, and take the sample mean to estimate the population mean µ .`

What can he assert with probability 0 . 99 about the maximum error of estimate?

## Page 22

### Solution:
 `As n = 50 ≥ 30 is large, X − µ`
 `σ / √ n is approximately normal.`
 `So we can use the previous result, with σ = 3 . 5 , α = 0 . 01 and z α / 2 = z 0 . 005 = 2 . 576 .`

With probability 0 . 99 , the error is at most
 `E = 2 . 576 × 3 . 5 √`

### 50 ≈ 1 . 27 .

## Page 23

R EMARK z 0 . 005 is the same as the 0.995 quantile of the standard normal. The value of 2.576 can be obtained from tables or software.
 `Use the command qnorm(0.995) or qnorm(0.005, lower.tail = F) to obtain the value via https://rdrr.io/snippets/ .`

Alternatively, you may use Radiant to get the same value as well.

## Page 24

Determination of Sample Size

We often want to know what the minimum sample size should be, so that with probability 1 − α , the error is at most E 0 .

To answer this, consider the fact that we want
 `z α / 2 σ √ n ≤ E 0 .`

Solving for n , we have
 `n ≥  z α / 2 · σ`

## E 0

 2 .

## Page 25

### Different Cases

We had previously understood the sampling distribution of X for a variety of cases. Repeating the same arguments above, we have the following table.

## Page 26

## D IFFERENT C ASES

Population σ n Statistic E n for desired

E 0 and α
 `I Normal known any Z = X − µ`
 `σ / √ n z α / 2 · σ √ n`

 z α / 2 · σ

## E 0

 2
 `II any known large Z = X − µ`
 `σ / √ n z α / 2 · σ √ n`

 z α / 2 · σ

## E 0

 2
 `III Normal unknown small T = X − µ`
 `S / √ n t n − 1; α / 2 · s √ n`

 t n − 1; α / 2 · s

## E 0

 2
 `IV any unknown large Z = X − µ`
 `S / √ n z α / 2 · s √ n`

 z α / 2 · s

## E 0

 2

### Table 1

|  | Population | σ | n | Statistic | E | n for desired
E and α
0 |
| --- | --- | --- | --- | --- | --- | --- |
| I | Normal | known | any | X−µ
Z = √
σ/ n | σ
z · √
α/2
n | z ·σ2
α/2
E
0 |
| II | any | known | large | X−µ
Z = √
σ/ n | σ
z · √
α/2
n | z ·σ2
α/2
E
0 |
| III | Normal | unknown | small | X−µ
T = √
S/ n | s
t · √
n−1;α/2
n | t ·s2
n−1;α/2
E
0 |
| IV | any | unknown | large | X−µ
Z = √
S/ n | s
z · √
α/2
n | z ·s2
α/2
E
0 |

## Page 27

## 2 C ONFIDENCE I NTERVALS FOR THE M EAN

Since a point estimate is almost never right, one might be interested in asking for an interval where the parameter lies in.

## Page 28

D EFINITION 5 (C ONFIDENCE I NTERVAL ) An interval estimator is a rule for calculating, from the sample, an in- terval ( a , b ) in which you are fairly certain the parameter of interest lies in.

This “fairly certain” can be quantified by the degree of confidence also known as confidence level ( 1 − α ) , in the sense that
 `P(a < µ < b ) = 1 − α .`

( a , b ) is called the ( 1 − α ) confidence interval .

## Page 29

**Case I: σ known, data normal**

Consider the case where σ is known, and data comes from a normal population.

We learnt previously that
 `P  − z α / 2 ≤ X − µ`
 `σ / √ n ≤ z α / 2`
 ` = 1 − α .`

## Page 30

Rearranging, we have

## P 
 `X − z α / 2 σ √ n ≤ µ ≤ X + z α / 2 σ √ n`
 ` = 1 − α .`

So
 `X ± z α / 2 σ √ n = `
 `X − z α / 2 σ √ n , X + z α / 2 σ √ n`



is a ( 1 − α ) confidence interval.

## Page 31

### E XAMPLE 6.5 In order to set inventory levels, a computer company samples demand during lead time over 25 time periods:

### 235 374 309 499 253 421 361 514 462 369 394 439 348 344 330 261 374 302 466 535 386 316 296 332 334
 `It is known that the (population) standard deviation of demand over lead time is 75 computers. Given that x = 370 . 16 , estimate the mean demand over lead time with 95% confidence. Assume a normal distri- bution for the population.`

## Page 32
 `Solution: Note that z α / 2 = z 0 . 025 = 1 . 96 . The 95% confidence interval is`
 `x ± z α / 2 σ √ n = 370 . 16 ± 1 . 96 75 √`

### 25 = 370 . 16 ± 29 . 4

or ( 340 . 76 , 399 . 56 ) .

## Page 33

R EMARK Notice that our ( 1 − α ) confidence interval can be written as X ± E .

This is not a coincidence: recall that there is ( 1 − α ) confidence that the error | X − µ | is within E .

For the other cases, based on our understanding of the sampling distribution of X , we can construct our confidence intervals for the different cases X ± E , based on the conditions given.

## Page 34

C ONFIDENCE I NTERVALS FOR THE M EAN The table below gives the ( 1 − α ) confidence interval (formulas) for the population mean.

Case Population σ n Confidence Interval
 `I Normal known any x ± z α / 2 · σ / √ n`
 `II any known large x ± z α / 2 · σ / √ n`
 `III Normal unknown small x ± t n − 1; α / 2 · s / √ n`
 `IV any unknown large x ± z α / 2 · s / √ n`
 `Note that n is considered large when n ≥ 30 .`

### Table 2

| Case | Population | σ | n | Confidence Interval |
| --- | --- | --- | --- | --- |
| I | Normal | known | any | √
x±z · σ/
α/2 n |
| II | any | known | large | √
x±z · σ/
α/2 n |
| III | Normal | unknown | small | √
x±t · s/
n−1;α/2 n |
| IV | any | unknown | large | √
x±z · s/
α/2 n |

## Page 35
 `E XAMPLE 6.6 (W HICH C ASE ?) The following data set collects n = 41 randomly sampled waiting times of students from ST2334 to receive reply for their email from a survey in the day time.`

2.50 23.28 19.34 4.74 7.03 21.85 2.72 17.73 21.55 9.71 30.24 0.37 31.26 35.24 7.81 16.69 66.54 1.88 14.14 46.59 28.17 0.06 9.32 0.03 10.75 6.97 56.86 2.89 7.67 30.16 0.33 0.44 3.77 25.07 7.05 0.08 10.64 13.10 7.92 112.77 11.93
 `Given that x = 17 . 736 and s = 21 . 7 , construct a 98% confidence interval for the mean waiting time of all ST2334 students .`

## Page 36

**Solution: Note that σ is unknown, and n is large. So we are in Case IV.**
 `Note that z α / 2 = z 0 . 01 = 2 . 326 . So our 98% confidence interval is`
 `x ± z α / 2 s √ n = 17 . 736 ± 2 . 326 × 21 . 7 √`

### 41 = ( 9 . 85 , 25 . 62 ) .

## Page 37

E XAMPLE 6.7 (W HICH C ASE A GAIN ?) The contents of 7 similar containers of sulphuric acid (in litres) are

### 9.8 10.2 10.4 9.8 10.0 10.2 9.6
 `It can shown that x = 10 and s 2 = 0 . 08 . Find a 95% confidence interval for the mean content of all such containers, assuming an approximate normal distribution for container contents.`

## Page 38

**Solution: We are in Case III.**
 `Using software, we obtain t 6;0 . 025 = 2 . 447 .`

Thus a 95% confidence interval for the mean content of all such con- tainers is given as
 `x ± t n − 1; α / 2 · s √ n = 10 ± 2 . 447 ·`
 `√`

### 0 . 08 √

### 7 = ( 9 . 738 , 10 . 262 ) .

## Page 39

## I NTERPRETING C ONFIDENCE I NTERVALS I

• We saw that X ± E has probability ( 1 − α ) of containing µ .

This is a probability statement about the procedure by which we compute the interval — the interval estimator .

• Each time we take a sample, and go through this construction, we get a dif- ferent confidence interval.

• Sometimes we get a confidence interval that contains µ , and sometimes we get one that does not contain µ .

• Once an interval is computed , µ is either in it or not. There is no more ran- domness.

## Page 40

## I NTERPRETING C ONFIDENCE I NTERVALS II

• Since µ is typically not known, there is no way to determine whether a par- ticular confidence interval succeeded in capturing the population mean.

• However, if we repeat this procedure of taking a sample and computing a confidence interval many times, about ( 1 − α ) of the many confidence inter- vals that we get will contain the true parameter.

**This is what "confidence" means — a confidence in the method used .**

### • The following R Shiny app allows us to explore this fact:

**https://istats.shinyapps.io/ExploreCoverage/**

## Page 41

## 3 C OMPARING T WO P OPULATIONS

In real applications, it is quite common to compare the means of two populations.

Imagine that we have two populations

• Population 1 has mean µ 1 , variance σ 2 1 .

• Population 2 has mean µ 2 , variance σ 2 2 .

## Page 42

### Experimental Design

In order to compare two populations, a number of observations from each population need to be collected. Experimental design refers to the manner in which samples from populations are collected.

## Page 43

T WO B ASIC D ESIGNS FOR COMPARING T WO T REATMENTS

• Independent samples — complete randomization.

• Matched pairs samples — randomization between matched pairs.

## Page 44

E XAMPLE 6.8 (I NDEPENDENT S AMPLES ) In order to compare the examination scores of male and female stu- dents attending ST2334,

• 10 scores of female students are randomly sampled — Sample I,

• 8 scores of male students are randomly sampled — Sample II.

## Page 45

Note that all observations are independent —

• Sample I and Sample II are independent;

• Individuals within Sample I are independent;

• Individuals within Sample II are independent.

## Page 46

E XAMPLE 6.9 (M ATCHED P AIRS S AMPLES ) In order to study whether there exists income difference between male and female, 100 married couples are sampled, and their monthly in- comes are collected.

In this example, the treatment groups are the female group and male group.

## Page 47

Note that observations are dependent in a special way —

• Within the pair, the observations are dependent (since they are married to one another);

• Between pairs, observations are independent.

## Page 48

## 4 I NDEPENDENT S AMPLES : U NEQUAL VARIANCES

### Our interest is to make statistical inference on µ 1 − µ 2 . Consider the following assumptions:

## Page 49
 `I NDEPENDENT S AMPLES(K NOWN AND UNEQUAL VARIANCES ) 1. A random sample of size n 1 from population 1 with mean µ 1 and variance σ 2 1 .`

• A random sample of size n 2 from population 2 with mean µ 2 and variance σ 2 2 .

• The two samples are independent .
 `4. The population variances are known and not the same : σ 2 1 ̸ = σ 2 2`

### 5. Either one of the following conditions holds:

• The two populations are normal ; OR
 `• Both samples are large : n 1 ≥ 30 , n 2 ≥ 30 .`

## Page 50

Consider X 1 ,..., X n 1 and Y 1 ,..., Y n 2 , random samples from the two pop- ulations of interest. Let

## X = 1

n 1
 `n 1 ∑ i = 1 X i , and Y = 1`

n 2
 `n 2 ∑ i = 1 Y i`

be the means of random samples. Then,
 `E(X ) = µ 1 , V(X ) = σ 2 1 n 1 , E(Y ) = µ 2 , V(Y ) = σ 2 2 n 2 .`

## Page 51
 `Thus E(X − Y ) = µ 1 − µ 2 = δ ,`

and, using the independence assumption,
 `V(X − Y ) = σ 2 1 n 1 + σ 2 2 n 2 .`

## Page 52

### When

• the two populations are normal, OR

• both samples are large,

we have
 `Z = ( X − Y ) − ( µ 1 − µ 2 ) q`

σ 2 1 n 1 + σ 2 2 n 2

## ≈ N ( 0 , 1 ) .

## Page 53

Confidence Intervals for µ 1 − µ 2 We are interested in the difference
 `δ = µ 1 − µ 2 ,`

with confidence 100 ( 1 − α ) % for any 0 < α < 1 .

## Page 54

If σ 2 1 and σ 2 2 are known , by the distributions above, we have

P



 

( X − Y ) − ( µ 1 − µ 2 ) q

σ 2 1 n 1 + σ 2 2 n 2

< z α / 2


 `  = 1 − α`

or

P



 ( X − Y ) − z α / 2

s

σ 2 1 n 1 + σ 2 2 n 2 < µ 1 − µ 2 < ( X − Y )+ z α / 2

s

σ 2 1 n 1 + σ 2 2 n 2


 ` = 1 − α .`

## Page 55

Thus the 100 ( 1 − α ) % confidence interval for µ 1 − µ 2 is 

 ( X − Y ) − z α / 2

s

σ 2 1 n 1 + σ 2 2 n 2 , ( X − Y )+ z α / 2

s

σ 2 1 n 1 + σ 2 2 n 2





or

( X − Y ) ± z α / 2

s

σ 2 1 n 1 + σ 2 2 n 2 .

## Page 56

C ONFIDENCE I NTERVALS : K NOWN AND UNEQUAL VARIANCES Suppose we have independent populations with known and unequal variances , and that either one of the following conditions holds:

• The two populations are normal ; OR
 `• Both samples are large : n 1 ≥ 30 , n 2 ≥ 30 .`

The 100 ( 1 − α ) % confidence interval for µ 1 − µ 2 , is then given as

( x − y ) ± z α / 2 q

σ 2 1 / n 1 + σ 2 2 / n 2 .

## Page 57

E XAMPLE 6.10 A study was conducted to compare two types of engines, A and B.

Gas mileage, in miles per gallon, was measured. 50 experiments were conducted using engine A. 75 experiments were done for engine type B. The gasoline used and other conditions were held constant.

## Page 58

• The average gas mileage for 50 experiments using engine A was 36 miles per gallon and

• The average gas mileage for the 75 experiments using machine B was 42 miles per gallon.

Find a 96% confidence interval on µ B − µ A , where µ A and µ B are the population mean gas mileage for machine types A and B, respectively.

Assume that the population standard deviations are 6 and 8 for ma- chine types A and B, respectively.

## Page 59
 `Solution: For a 96% confidence interval, α = 0 . 04 and z 0 . 02 = 2 . 05 . We are also given that`
 `n 1 = 50 , x A = 36 , σ 2 1 = 6 2`
 `n 2 = 75 , x B = 42 , σ 2 2 = 8 2`

The sample sizes are large, so a 96% confidence interval for µ B − µ A is

( x B − x A ) ± z α / 2 q

σ 2 2 / n 2 + σ 2 1 / n 1
 `= ( 42 − 36 ) ± 2 . 05 · q`

### 8 2 / 75 + 6 2 / 50
 `= ( 3 . 428 , 8 . 571 ) .`

## Page 60

### We next consider the following assumptions/case:

## Page 61
 `I NDEPENDENT S AMPLES(L ARGE , WITH UNKNOWN VARIANCES ) 1. A random sample of size n 1 from population 1 with mean µ 1 and variance σ 2 1 .`

• A random sample of size n 2 from population 2 with mean µ 2 and variance σ 2 2 .

• The two samples are independent .
 `4. The population variances are unknown and not the same : σ 2 1 ̸ = σ 2 2`
 `5. Both samples are large : n 1 ≥ 30 , n 2 ≥ 30 .`

## Page 62

Since σ 1 and σ 2 are unknown, let
 `S 2 1 = 1 n 1 − 1`
 `n 1 ∑ i = 1 ( X i − X ) 2 , and S 2 2 = 1 n 2 − 1`
 `n 2 ∑ i = 1 ( Y i − Y ) 2`

and use
 `Z = ( X − Y ) − ( µ 1 − µ 2 ) q`

S 2 1 n 1 + S 2 2 n 2

## ≈ N ( 0 , 1 ) .

## Page 63

If σ 2 1 and σ 2 2 are unknown , the 100 ( 1 − α ) % CI for µ 1 − µ 2 is 

 ( X − Y ) − z α / 2

s

S 2 1 n 1 + S 2 2 n 2 , ( X − Y )+ z α / 2

s

S 2 1 n 1 + S 2 2 n 2





or

( X − Y ) ± z α / 2

s

S 2 1 n 1 + S 2 2 n 2 .

## Page 64
 `C ONFIDENCE I NTERVALS : L ARGE , WITH UNKNOWN VARIANCES Suppose we have independent populations with unknown and unequal variances , and that both samples are large : n 1 ≥ 30 , n 2 ≥ 30 .`

The 100 ( 1 − α ) % confidence interval for µ 1 − µ 2 , is then given as

( x − y ) ± z α / 2 q

s 2 1 / n 1 + s 2 2 / n 2 .

## Page 65

## 5 I NDEPENDENT S AMPLES : E QUAL VARIANCES

### Consider the following assumptions:

## Page 66

I NDEPENDENT S AMPLES : S MALL , WITH EQUAL VARIANCES 1. A random sample of size n 1 from population 1 with mean µ 1 and variance σ 2 1 .

• A random sample of size n 2 from population 2 with mean µ 2 and variance σ 2 2 .

• The two samples are independent .
 `4. The population variances are unknown and the same : σ 2 1 = σ 2 2 = σ 2 .`

• Both samples are small : n 1 < 30 , n 2 < 30

• Both populations are normally distributed .

## Page 67

T HE E QUAL V ARIANCE A SSUMPTION In real applications, the equal variance assumption is usually unknown and needs to be checked.

## Page 68

Based upon the normal distribution and equal variance assumptions
 `Z = ( X − Y ) − ( µ 1 − µ 2 )`

σ q

### 1 n 1 + 1

n 2

## ∼ N ( 0 , 1 ) .

Since σ is unknown, we shall estimate it.

Note that S 2 1 and S 2 2 are both unbiased estimators of σ 2 under the equal variance assumption.

We can use the pooled estimator to estimate σ 2 better.

## Page 69

**D EFINITION 6 (T HE P OOLED ESTIMATOR : S 2 p ) σ 2 can be estimated by the pooled sample variance**
 `S 2 p = ( n 1 − 1 ) S 2 1 +( n 2 − 1 ) S 2 2 n 1 + n 2 − 2 ,`

with S 2 1 and S 2 2 being the sample variances of the first and second samples respectively.

## Page 70

When we estimate σ 2 using S 2 p , the resulting statistic
 `T = ( X − Y ) − ( µ 1 − µ 2 )`

S p q

### 1 n 1 + 1

n 2

∼ t n 1 + n 2 − 2

follows a t -distribution with degrees of freedom n 1 + n 2 − 2 .

## Page 71

We then have

P



  − t n 1 + n 2 − 2; α / 2 < ( X − Y ) − ( µ 1 − µ 2 )

S p q

### 1 n 1 + 1

n 2

< t n 1 + n 2 − 2; α / 2


 `  = 1 − α .`

## Page 72

C ONFIDENCE I NTERVALS : S MALL , WITH EQUAL VARIANCES Suppose we have independent, normal populations with unknown and equal vari- ances , and that both samples are small : n 1 < 30 , n 2 < 30 .

A 100 ( 1 − α ) % confidence interval for µ 1 − µ 2 is given as

( X − Y ) ± t n 1 + n 2 − 2; α / 2 S p

r

### 1 n 1 + 1

n 2 .

## Page 73

E XAMPLE 6.11 A course in mathematics is taught to 12 students by the conventional classroom procedure. A second group of 10 students was given the same course by means of programmed materials.

At the end of the semester the same examination was given to each group.

## Page 74

• The 12 students meeting in the classroom made an average grade of 85 with standard deviation of 4.

• The 10 students using programmed materials made an average of 81 with a standard deviation of 5.

Find a 90% confidence interval for the difference between the popu- lation means, assuming the populations are approximately normally distributed with equal variances.

## Page 75

Solution: Let µ 1 and µ 2 represent the average grades of all students who might take this course by the classroom and programmed presentations re- spectively.
 `So x − y = 85 − 81 = 4 is the point estimate for µ 1 − µ 2 .`

As we assume equal population variance, we estimate it by the pooled variance
 `s 2 p = ( 12 − 1 ) × 4 2 +( 10 − 1 ) × 5 2`

### 12 + 10 − 2 = 20 . 05 .

## Page 76
 `In this case, t n 1 + n 2 − 2; α / 2 = t 20;0 . 05 = 1 . 7247 . Thus a 90% confidence inter- val for µ 1 − µ 2 is given as`

( x − y ) ± t n 1 + n 2 − 2; α / 2 s p

r

### 1 n 1 + 1

n 2
 `= ( 85 − 81 ) ± 1 . 7247 × √`

### 20 . 05 ×

r

### 1 12 + 1

### 10 = ( 0 . 693 , 7 . 307 ) .

## Page 77

Independent Large Samples with Equal Variance
 `Note that for large samples such that n 1 ≥ 30 , n 2 ≥ 30 , we can replace t n 1 + n 2 − 2; α / 2 by z α / 2 in the previous formula.`

## Page 78
 `C ONFIDENCE I NTERVALS : L ARGE , WITH EQUAL VARIANCES Suppose we have independent populations with unknown and equal variances , and that both samples are large : n 1 ≥ 30 , n 2 ≥ 30 .`

A 100 ( 1 − α ) % confidence interval for µ 1 − µ 2 is given as

( X − Y ) ± z α / 2 S p

r

### 1 n 1 + 1

n 2 .

## Page 79

## 6 P AIRED D ATA

Some times, like in the couple income example, it makes sense to take matched pairs instead of independent samples. Because of dependence in the sample, the methods discussed previ- ously are not applicable.

Consider the assumptions that follows.

## Page 80

P AIRED D ATA 1. ( X 1 , Y 1 ) ,..., ( X n , Y n ) are matched pairs, where X 1 ,..., X n is a random sample from population 1, Y 1 ,..., Y n is a random sample from population 2.

• X i and Y i are dependent.
 `3. ( X i , Y i ) and ( X j , Y j ) are independent for any i ̸ = j .`
 `4. For matched pairs, define D i = X i − Y i , µ D = µ 1 − µ 2 .`

• Now we can treat D 1 , D 2 ,..., D n as a random sample from a single population with mean µ D and variance σ 2 D .

## Page 81

All techniques derived for a single population can now be employed.

• We consider the statistic
 `T = D − µ D`
 `S D / √ n , where D = ∑ n i = 1 D i`
 `n , S 2 D = ∑ n i = 1 ( D i − D ) 2`

n − 1 .

• If n < 30 and the population is normally distributed then

T ∼ t n − 1 .
 `• If n ≥ 30 , then T ∼ N(0 , 1 ) .`

## Page 82

C ONFIDENCE I NTERVALS : P AIRED D ATA For paired data , if n is small ( n < 30 ) and the population is normally distributed , a ( 1 − α ) 100% confidence interval for µ D is
 `d ± t n − 1; α / 2 · s D √ n .`
 `If n is large ( n ≥ 30 ), a ( 1 − α ) 100% confidence interval for µ D is`
 `d ± z α / 2 · s D √ n .`

## Page 83

E XAMPLE 6.12 Twenty students were divided into 10 pairs, each member of the pair having approximately the same IQ.

One of each pair was selected at random and assigned to a mathemat- ics section using programmed materials only. The other member of each pair was assigned to a section in which the professor lectured.

## Page 84

At the end of the semester each group was given the same examination and the following results were recorded.

Pair 1 2 3 4 5 6 7 8 9 10 P.M. 76 60 85 58 91 75 82 64 79 88 Lecture 81 52 87 70 86 77 90 63 85 83 d –5 8 –2 –12 5 –2 –8 1 –6 5
 `Given that d = − 1 . 6 and s 2 D = 40 . 71 , compute a 98% confidence interval for the true difference in the two learning procedures.`

### Table 3

| Pair | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P.M. | 76 | 60 | 85 | 58 | 91 | 75 | 82 | 64 | 79 | 88 |
| Lecture | 81 | 52 | 87 | 70 | 86 | 77 | 90 | 63 | 85 | 83 |
| d | –5 | 8 | –2 | –12 | 5 | –2 | –8 | 1 | –6 | 5 |

## Page 85
 `Solution: Since α = 0 . 02 , we have t n − 1; α / 2 = t 9 , 0 . 01 = 2 . 821 . Thus a 98% confidence interval for the true difference µ D is given as`
 `d ± t n − 1; α / 2 · s D √ n = − 1 . 6 ± 2 . 821 ×`

r

### 40 . 71

### 10 = ( − 7 . 292 , 4 . 092 ) .