# ST2334 Notes: Chapter 2 - Random Variables

## 1. Definition of a Random Variable

### What is a Random Variable?
- A **random variable** (RV) is a function that assigns a real number to each outcome in the sample space S.
- Notation: X: S → ℝ (real numbers).
- It transforms qualitative outcomes into quantitative values for analysis.
- Example: In coin flips, X = number of heads (X maps {HH, HT, TH, TT} to {0, 1, 2}).

### Range Space (RX)
- The set of all possible values X can take: RX = {x | x = X(s) for some s ∈ S}.
- For discrete RVs, RX is finite or countable (e.g., {0, 1, 2}).
- For continuous RVs, RX is an interval or collection of intervals (e.g., [0, ∞)).

### Events with RVs
- {X = x}: Set of outcomes where X takes value x.
- {X ∈ A}: Set of outcomes where X is in set A ⊂ ℝ.
- Probabilities: P(X = x) = P({s ∈ S | X(s) = x}), etc.

## 2. Probability Distribution

### Discrete Random Variables
- **Probability Mass Function (PMF)**: $f(x) = P(X = x)$ for each $x$ in $R_X$.
  - **Inputs needed**: x (value in range).
- Properties: $f(x) \geq 0$, $\sum f(x) = 1$.
- Example: Die rolls—$f(1)=\frac{1}{6}$, etc.

### Continuous Random Variables
- **Probability Density Function (PDF)**: $f(x)$, $P(a \leq X \leq b) = \int_a^b f(x) \, dx$.
  - **Inputs needed**: x (value), a, b (interval bounds).
- Properties: $f(x) \geq 0$, $\int_{-\infty}^{\infty} f(x) \, dx = 1$.
- $P(X = x) = 0$ (no single point probability).

### Cumulative Distribution Function (CDF)
- $F(x) = P(X \leq x)$.
  - **Inputs needed**: x (value).
- Properties: Right-continuous, $F(-\infty)=0$, $F(\infty)=1$, non-decreasing.
- For discrete: Jumps at values.
- For continuous: Smooth, F'(x) = f(x).

## 3. Expectation and Variance

### Expectation (Mean)
- **What it is**: The "average" value you expect if you repeat the experiment many times. Like the center of gravity.
- **For Discrete**: $E[X] = \sum (\text{each value} \times \text{its probability})$. Weighted average.
  - **Inputs needed**: values x and their probabilities P(X=x).
- **For Continuous**: $E[X] = \int x f(x) \, dx$ over possible values.
  - **Inputs needed**: f(x) (PDF).
- **General Expectation of a Function**: For any function g(X), $E[g(X)] = \sum g(x) P(X=x)$ (discrete) or $E[g(X)] = \int g(x) f(x) \, dx$ (continuous).
  - **Inputs needed**: g(x) (function), P(X=x) or f(x).
- **Properties**: $E[aX + b] = a E[X] + b$ (linearity). $E[X+Y] = E[X] + E[Y]$ for independent RVs.
- **Example**: Coin flip (X=1 heads, 0 tails): $E[X] = 1 \times 0.5 + 0 \times 0.5 = 0.5$.

### Variance
- **What it is**: Measures how spread out the values are around the mean. Like how "variable" the RV is.
- **Formula**: $\text{Var}(X) = E[(X - \mu)^2] = E[X^2] - (E[X])^2$.
  - **Inputs needed**: E[X], E[X^2] (or the values and probabilities to compute them).
- **Standard Deviation**: $\sigma = \sqrt{\text{Var}(X)}$, in same units as X.
- **Properties**: $\text{Var}(aX + b) = a^2 \text{Var}(X)$. $\text{Var}(X+Y) = \text{Var}(X) + \text{Var}(Y)$ if independent.
- **Example**: Coin flip: $\text{Var}(X) = E[X^2] - (0.5)^2 = (1^2 \times 0.5 + 0^2 \times 0.5) - 0.25 = 0.5 - 0.25 = 0.25$. $\sigma=0.5$.

### Higher Moments
- Skewness, Kurtosis: Measures of shape beyond mean and variance.

## 4. Common Distributions

### Discrete
- **Bernoulli**: $P(X=1)=p$, $P(X=0)=1-p$. $E[X]=p$, $\text{Var}(X)=p(1-p)$.
  - **Inputs needed**: p (success probability).
- **Binomial**: Sum of n independent Bernoulli trials. PMF: $\binom{n}{k} p^k (1-p)^{n-k}$.
  - **Inputs needed**: n (trials), p (success probability), k (successes).
- **Poisson**: For rare events. PMF: $\frac{e^{-\lambda} \lambda^k}{k!}$.
  - **Inputs needed**: λ (rate), k (events).

### Continuous
- **Uniform**: Equal density over $[a,b]$. $f(x)=\frac{1}{b-a}$.
  - **Inputs needed**: a (lower bound), b (upper bound), x (value).
- **Normal**: Bell curve, mean $\mu$, spread $\sigma$.
  - **Inputs needed**: μ (mean), σ (standard deviation), x (value).
- **Exponential**: Time to event, rate $\lambda$.
  - **Inputs needed**: λ (rate), x (value).

## Summary
Random variables bridge outcomes and numbers, enabling statistical analysis. Discrete RVs use PMFs and sums; continuous use PDFs and integrals. Expectation and variance quantify center and spread. CDF provides cumulative probabilities.