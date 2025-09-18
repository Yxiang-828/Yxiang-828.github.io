# ST2334 Supplementary Notes: Checking Independence

## What is Independence for Random Variables?

### Definition
- Two random variables X and Y are independent if knowing the value of one doesn't give information about the other.
- Mathematically: Their joint probability function equals the product of their individual functions.
  - **Inputs needed**: Joint probability mass/density function $f(x,y)$, marginal functions $f_X(x)$, $f_Y(y)$.

### How to Check Independence
1. **Possible Values**: The range of (X,Y) must be a "product space"—like all combinations of X's values and Y's values.
2. **Factorization**: The joint function must be expressible as a constant times a function of X only times a function of Y only.
  - **Inputs needed**: Joint function $f(x,y)$.

### Examples

#### Discrete Example
- Suppose $f(x,y) = \frac{1}{36} x y$ for $x=1,2,3$ and $y=1,2,3$.
- The possible pairs are all combinations (product space).
- It factors as $\frac{1}{36} \times x \times y$, where $x$ depends only on $X$, $y$ on $Y$.
- So $X$ and $Y$ are independent.

#### Continuous Example
- $f(x,y) = \frac{1}{3} x (1+y)$ for $0 < x < 2$, $0 < y < 1$.
- The region is a rectangle (product space).
- It factors as $\frac{1}{3} \times x \times (1+y)$.
- So $X$ and $Y$ are independent.

### When They Are Not Independent
- If the possible values are constrained (e.g., x + y = 10).
- If the joint function can't be separated into parts depending only on X or only on Y.

### Implications
- Independent RVs: Cov(X,Y)=0, but converse not true.
- Joint moments: E[XY] = E[X] E[Y].
- Conditional distributions equal marginals.

## Summary
Check product space and factorization to verify independence. Useful for modeling joint behaviors in probability problems.