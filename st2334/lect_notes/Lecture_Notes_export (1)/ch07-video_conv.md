# Hypothesis Tests

## Page 1

Seven
Hypothesis Tests

## Page 2

1
HYPOTHESIS TESTS
One of the most fundamental technique of statistical inference is the
hypothesis test. There are many types of hypothesis tests but all follow
the same logical structure, so we begin with hypothesis testing of a
population mean.

## Page 3

Hypothesis testing begins with a null hypothesis and an alternative
hypothesis. Both the null and the alternative hypotheses are state-
ments about a population. In this chapter, that statement will be a
statement about the mean(s) of the population(s).
We will illustrate using an example.

## Page 4

EXAMPLE 7.1 (MEAN AGE)
We are interested to check if the mean age of a population is µ = 50.
Suppose we have no access to population data. So we take a sample
from the population and obtained a sample mean age of x = 20. Does
this gives evidence for or against the hypothesis that µ = 50?

## Page 7

EXAMPLE 7.2 (NUS STUDENTS’ IQ)
Consider the statement
“NUS students have higher IQ than the general population (100)."
It is difficult/expensive to ask every NUS student to take an IQ test.
So we take a sample.
Suppose the sample average is 110.
• Does that mean we’re right?
• What if the sample average is 101? What about 100.1?
• Does the sample size matter?

## Page 8

HOW TO DO A HYPOTHESIS TEST
There are five main steps to hypothesis testing.
Step 1: Set your competing hypotheses: null and alternative.
Step 2: Set the level of significance.
Step 3: Identify the test statistic, its distribution and the rejection criteria.
Step 4: Compute the observed test statistic value, based on your data.
Step 5: Conclusion.

## Page 9

Let us have a closer look at each step.

## Page 10

Step 1: Null Hypothesis vs Alternative Hypothesis
Our goal is to decide between two competing hypotheses.

## Page 11

NULL VS ALTERNATIVE
In general, we adopt the position of the null hypothesis unless there is overwhelm-
ing evidence against it.
The null hypothesis is typically the default assumption, or the conventional wisdom
about a population. Often it is exactly the thing that a researcher is trying to show
is false.
We usually let the hypothesis that we want to prove be the alternative hypothesis.
The alternative hypothesis states that the null hypothesis is false, often in a partic-
ular way.

## Page 12

The outcome of hypothesis testing is to either reject or fail to reject the
null hypothesis.
A researcher would collect data relating to the population being stud-
ied and use a hypothesis test to determine whether the evidence against
the null hypothesis (if any) is strong enough to reject the null hypoth-
esis in favor of the alternative hypothesis.
We usually phrase the hypotheses in terms of population parameters.

## Page 13

EXAMPLE 7.3 (ONE-SIDED TEST)
Let µ be the average IQ of NUS students. Consider
H0 : µ = 100
vs
H1 : µ > 100.
This is an example of a one-sided hypothesis test.
For this alternative hypothesis, we do not care if µ < 100: the goal here
is just to show NUS students have IQ higher than 100.

## Page 14

EXAMPLE 7.4 (TWO-SIDED TEST)
Sometimes it is more natural to do a two-sided hypothesis test.
For example, let p be the probability of heads for a particular coin.
You want to test if the coin is fair (that is, p = 0.5), as it is equally
problematic if p was larger or smaller.
Hence you set your hypotheses to be
H0 : p = 0.5
vs
H1 : p ̸= 0.5.

## Page 15

Step 2: Level of Significance
For any test of hypothesis, there are two possible conclusions:
• Reject H0 and therefore conclude H1;
• Do not reject H0 and therefore conclude H0.

## Page 16

Whatever decision is made, there is a possibility of making an error.
Do not reject H0
Reject H0
H0 is true Correct Decision
Type I error
H0 is false
Type II error
Correct Decision

## Page 17

DEFINITION 1 (TYPE I VS TYPE II ERROR)
The rejection of H0 when H0 is true is called a Type I error.
Not rejecting H0 when H0 is false is called a Type II error.

## Page 18

DEFINITION 2 (SIGNIFICANCE LEVEL VS POWER)
The probability of making a Type I error is called the level of significance,
denoted by α. That is,
α = P(Type I error) = P(Reject H0 | H0 is true).
Let
β = P(Type II error) = P(Do not reject H0 | H0 is false).
We define 1−β = P(Reject H0 | H0 is false) to be the power of the test.

## Page 19

REMARK
The Type I error is considered a serious error, so we want to control the probability
of making such an error.
Thus prior to conducting a hypothesis test, we set the significance level α to be
small, typically at α = 0.05 or 0.01.

## Page 20

Step 3: Test Statistic, Distribution and Rejection Region
To test the hypothesis, we first select a suitable test statistic for the
parameter under the hypothesis.
The test statistic serves to quantify just how unlikely it is to observe
the sample, assuming the null hypothesis is true.
As the significance level α is given, a decision rule can be found such
that it divides the set of all possible values of the test statistic into two
regions, one being the rejection region (or critical region) and the other,
the acceptance region.

## Page 21

Step 4 & 5: Calculation and Conclusion
Once a sample is taken, the value of the test statistic is obtained.
We check if it is within our rejection region.
• If it is, our sample was too improbable assuming H0 is true, hence
we reject H0.
• If it is not, we did not accomplish anything. We failed to reject H0
and hence fall back to our original assumption of H0.
Note that in the latter case, we did not “prove” that H0 is true. Hence,
it is prudent to use the term “fail to reject H0” instead of “accept H0."

## Page 22

2
HYPOTHESES CONCERNING THE MEAN
Let’s apply our hypothesis steps to testing a population mean.

## Page 23

Case: Known variance
Let us consider the case where
• the population variance σ 2 is known; AND
• where
– the underlying distribution is NORmal; OR
– n is sufficiently large (say, n ≥30).

## Page 24

Step 1: We set the null and alternatives hypotheses as
H0 : µ = µ0
vs
H1 : µ ̸= µ0.
Note that in this case we are considering a two-sided alterna-
tive hypothesis.

## Page 25

Step 2: Set level of significance: α is typically set to be 0.05.

## Page 26

Step 3: Statistic & its distribution:
With σ 2 known and population NORmal (or n ≥30),
Z = X −µ
σ/√n ∼N(0,1).
When H0 is true, µ = µ0, the above becomes
Z = X −µ0
σ/√n ∼N(0,1),
and will serve as our test statistic.

## Page 27

Rejection region:
Intuitively, we should reject H0 when X is too large or too small
compared with µ0.
This is the same as when Z is too large or too small. In theory,
P(|Z| > zα/2) = α.
Let the observed value of Z be z. Then the rejection region is
defined by |z| > zα/2, which is
z < −zα/2
or
z > zα/2.

## Page 28

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

## Page 29

Step 4: Computations: z should be computed from the statistic above
based upon the observed sample.

## Page 30

Step 5: Conclusion: check whether z is located within rejection region.
If so, reject H0, otherwise do not reject H0.

## Page 31

WHERE DID THE VALUE 0.05 COME FROM?
In 1931, in a famous book called The Design of Experiments, Sir Ronald Fisher dis-
cussed the amount of evidence needed to reject a null hypothesis.
He said that it was situation dependent, but remarked, somewhat casually, that for many
scientific applications, 1 out of 20 might be a reasonable value.
Since then, some people — indeed some entire disciplines — have treated the number 0.05
as sacrosanct.
Sir Ronald Fisher (1890 – 1962) was one of the founders of modern Statistics. For a
biography of Fisher, browse to
http://www-history.mcs.st-andrews.ac.uk/Biographies/Fisher.html

## Page 32

EXAMPLE 7.5
The director of a factory wants to determine if a new machine A is
producing cloths with a breaking strength of 35 kg with a standard
deviation of 1.5 kg.
A random sample of 49 pieces of cloths is tested and found to have a
mean breaking strength of 34.5 kg. Is there evidence that the machine
is not meeting the specifications for mean breaking strength?
Use α = 0.05.

## Page 33

Solution:
Note that n > 30 and σ = 1.5.
Let µ be the mean breaking strength of cloths manufactured by the
new machine.
Step 1: We test
H0 : µ = 35
vs
H1 : µ ̸= 35.
Step 2: Set α = 0.05.

## Page 34

Step 3: As σ 2 is known and n ≥30,
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

## Page 35

Step 5: The observed z value, z = −2.3333, falls inside the critical re-
gion. Hence the null hypothesis H0 : µ = 35 is rejected at the
5% level of significance.

## Page 36

One-sided alternatives
Now the above procedures are establish under
H0 : µ = µ0
vs
H1 : µ ̸= µ0.
Suppose instead we are considering
H0 : µ = µ0
vs
H1 : µ > µ0.

## Page 37

Similar steps can be used to address this problem, we only need to do
the following changes:
• Step 1: H1 is replaced with H1 : µ > µ0.
• Step 3: The test statistic and its distribution are kept the same.
The rejection region should be replaced with z > zα, since now,
we should reject only when x (and therefore z) is large.

## Page 39

The case for
H0 : µ = µ0
vs
H1 : µ < µ0
should be self-evident.

## Page 40

HYPOTHESIS TEST FOR THE MEAN: KNOWN VARIANCE
Consider the case where
• the population variance σ 2 is known; AND
• where
– the underlying distribution is NORmal; OR
– n is sufficiently large (say, n ≥30).
For the null hypothesis H0 : µ = µ0, the test statistics is given by
Z = X −µ0
σ/√n ∼N(0,1).

## Page 41

Let z be the observed Z value. For the alternative hypothesis
• H1 : µ ̸= µ0, the rejection region is
z < −zα/2
or
z > zα/2.
• H1 : µ < µ0, the rejection region is
z < −zα.
• H1 : µ > µ0, the rejection region is
z > zα.

## Page 42

p-value approach to testing
The above technique introduced by Fisher is based on a pre-declared
significance level α.
Today, there is little reason to stick to the arbitrary 1% or 5% levels that
Fisher suggested. We can instead use the idea of the p-value.

## Page 43

DEFINITION 3 (p-VALUE)
The p-value is the probability of obtaining a test statistic at least as extreme
(≤or ≥) than the observed sample value, given H0 is true.
It is also called the observed level of significance.

## Page 44

p-VALUE FOR HYPOTHESIS TESTS
Suppose our computed test statistic was z. For a two sided test, a “worse” result
would be if Z > |z| or Z < −|z|, in other words, |Z| > |z|.
So the p-value is given by
p-value = P(|Z| > |z|) = 2P(Z > |z|) = 2P(Z < −|z|)

## Page 45

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

## Page 46

For the alternative hypothesis H1 : µ < µ0, the p-value is P(Z < −|z|).
That is, only the area in the left tail is used.
For the alternative hypothesis H1 : µ > µ0, the p-value is P(Z > |z|).
That is, only the area in the right tail is used.

## Page 47

density function of Z
0
|z|
p
One−sided test: p−value is represented by the shaded area

## Page 48

REJECTION CRITERIA USING p-VALUE
We see that the p-value is smaller than the significance level if and only if our test
statistic is in the rejection region.
Thus our rejection criteria would be
• If p-value < α, reject H0; else
• If p-value ≥α, do not reject H0.

## Page 49

REMARK
In practice, it is better to report the p-value than to indicate whether H0 is rejected.
• The p-values of 0.049 and 0.001 both result in rejecting H0 when α = 0.05, but
the second case provides much stronger evidence.
• p-values of 0.049 and 0.051 provide, in practical terms, the same amount of
evidence about H0.
Most research articles report the p-value rather than a decision about H0. From the
p-value, readers can view the strength of evidence against H0 and make their own
decision, if they want to.

## Page 50

EXAMPLE 7.6 (MIDTERM EXAM SCORE)
Recall the midterm exam scores example in an earlier chapter. The
data obtained are
20,19,24,22,25.
We were told that the exam scores are approximately NORmal.
The lecturer announced that the variance of the exam score over the
class is 5 (just believe that this is the truth). Test at α = 0.01 significance
level whether the average midterm score is different from 16.

## Page 51

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

## Page 52

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

## Page 53

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

## Page 54

density function of Z
0
−2.576
2.576
Reject H0
Reject H0
Do not reject H0
z=6
p−value is twice the area of the shaded region

## Page 55

We can use our knowledge of the sampling distribution to determine
the test statistic for other situations.

## Page 56

HYPOTHESIS TEST FOR THE MEAN: UNKNOWN VARIANCE
Consider the case where
• the population variance σ 2 is unknown; AND
• the underlying distribution is NORmal.
For the null hypothesis H0 : µ = µ0, the test statistics is given by
T = X −µ0
S/√n ∼tn−1.

## Page 57

Let t be the observed T value. For the alternative hypothesis
• H1 : µ ̸= µ0, the rejection region is
t < −tn−1,α/2
or
t > tn−1,α/2.
• H1 : µ < µ0, the rejection region is
t < −tn−1,α.
• H1 : µ > µ0, the rejection region is
t > tn−1,α.

## Page 58

REMARK
When n ≥30, we can replace tn−1 by Z, the standard NORmal distribution.

## Page 59

3
TWO-SIDED TESTS AND CONFIDENCE INTERVALS
In this section, we establish that the two-sided hypothesis test proce-
dure is equivalent to finding a 100(1−α)% confidence interval for µ.
We illustrate using Case III: NORmal population, small n, unknown σ.
Once again, consider
H0 : µ = µ0
vs
H1 : µ ̸= µ0.

## Page 60

The 100(1−α)% confidence interval for µ in this case is given by

x−tα/2
s
√n, x+tα/2
s
√n

.
If the 100(1−α)% confidence interval contains µ0, we will have
x−tα/2
s
√n ≤µ0 ≤x+tα/2
s
√n.
Rearranging the above inequality, we obtain
−tα/2 ≤x−µ0
s/√n ≤tα/2.

## Page 61

This means that the computed test statistic t = x−µ0
s/√n satisfies
−tα/2 ≤t ≤tα/2.
Note that the rejection region for this case is
t < −tα/2
or
t > tα/2.
This means that when the confidence interval contains µ0, H0 will not
be rejected at level α.

## Page 62

Similarly, when the confidence interval does not contain µ0, then
t > tα/2
or
t < −tα/2.
Thus t falls within the rejection region and so H0 will be rejected.
Therefore confidence intervals can be used to perform two-sided tests.

## Page 63

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

## Page 64

The interval does not contain 16, so the following test of hypothesis
should be rejected at α = 0.01:
H0 : µ = 16
vs
H1 : µ ̸= 16.
What about
H0 : µ = 17
vs
H1 : µ ̸= 17?

## Page 65

4
TESTS COMPARING MEANS: INDEPENDENT SAMPLES
Suppose two independent samples are drawn from two populations
with means µ1 and µ2. We are interested in testing
H0 : µ1 −µ2 = δ0
against a suitable alternative hypothesis.

## Page 66

COMPARING MEANS: INDEPENDENT SAMPLES I
(A) Consider the case where
• the population variances σ 2
1 and σ 2
2 are known; AND
• where
– the underlying distributions are NORmal; OR
– n1,n2 are sufficiently large (say, n1 ≥30,n2 ≥30).
For the null hypothesis H0 : µ1 −µ2 = δ0, the test statistics is given by
Z = (X −Y)−δ0
q
σ2
1
n1 +
σ2
2
n2
∼N(0,1).

## Page 67

(B) Consider the case where
• the population variances σ 2
1 and σ 2
2 are unknown; AND
• n1,n2 are sufficiently large (say, n1 ≥30,n2 ≥30).
For the null hypothesis H0 : µ1 −µ2 = δ0, the test statistics is given by
Z = (X −Y)−δ0
q
S2
1
n1 +
S2
2
n2
∼N(0,1).

## Page 68

The rejection regions or p-values can be established similarly as before.

## Page 69

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
µ1 −µ2 ̸= δ0 z > zα/2 or z < −zα/2
2P(Z > |z|)

## Page 70

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

## Page 71

Solution:
Let µ1 and µ2 be the mean strength of cold-rolled steel and two-side
galvanized steel respectively.
Step 1: Note that δ0 = 0 in this example. So the hypotheses are
H0 : µ1 −µ2 = 0
vs
H1 : µ1 −µ2 ̸= 0.
Step 2: Set α = 0.01.

## Page 72

Step 3: Test statistic and its distribution is given below:
Z = (X −Y)−0
q
σ2
1
n1 +
σ2
2
n2
≈N(0,1).
Note that zα/2 = z0.005 = 2.5782. Thus the rejection region is
z > 2.5782
or
z < −2.5782.

## Page 73

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

## Page 74

Alternatively, we can compute the p-value to be
2×P(Z < −3.652) = 0.00026 < 0.01 = α.
Thus we reject the null hypothesis at α = 0.01 level.

## Page 75

COMPARING MEANS: INDEPENDENT SAMPLES II
Consider the case where
• the population variances σ 2
1 and σ 2
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

## Page 76

5
TESTS COMPARING MEANS: PAIRED DATA
Comparing means with matched-pairs data is easy. We merely use
methods we have already learned for single samples.

## Page 77

COMPARING MEANS: PAIRED DATA
For paired data, define Di = Xi −Yi.
For the null hypothesis H0 : µD = µD0, the test statistics is given by
T = D−µD0
SD/√n .
• If n < 30 and the population is NORmally distributed then
T ∼tn−1.
• If n ≥30, then
T ∼N(0,1).

## Page 78

EXAMPLE 7.9 (TREATING CATALYST SURFACES)
Prof X developed a new procedure for treating catalyst surfaces which
he claims will result in a significant enhancement in the number of
active sites.
The number of active sites can be determined by absorption of H2 gas.
Prof X tested each sample before and after the treatment and obtained
the following H2 uptake in terms of mmol/g.

## Page 79

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

## Page 80

Solution:
Note that in such a setup the two samples are not independent, and so
the two sample t-test does not apply.
Define Di =Yi−Xi, where Xi and Yi are the "before treatment" and "after
treatment" readings.
The question is now reduced to:
Do the data give any evidence that µD > 0?

## Page 81

Step 1: We set the null and alternative to be
H0 : µD = 0
vs
H1 : µD > 0.
Step 2: Set α = 0.05.
Step 3: We use the paired t-test with the test statistics
T = D−0
SD/√n.
The rejection region is t > t7,0.05 = 1.895.

## Page 82

Step 4: The observed t value is
t = d −0
sD/√n = 24.25−0
25.34/
√
8 = 2.70 > 1.895.
Step 5: Since t = 2.70 > t7,0.05 = 1.895, we reject H0 and conclude that
there is evidence that treatment of catalysts increases the num-
ber of active sites.
As an aside, the p-value is
P(t7 > t) = P(t7 > 2.70) = 0.0153,
which is smaller than 0.05.