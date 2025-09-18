# ST2334 Supplementary Notes: Cumulative Distribution Function (CDF)

## What is the CDF?

### Definition
- The Cumulative Distribution Function (CDF) shows the probability that a random variable $X$ is less than or equal to a value $x$: $F(x) = P(X \leq x)$.
- Works for both discrete (countable) and continuous (measurable) variables.

### Key Properties
1. **Right-Continuous**: The function is continuous from the right, meaning it includes jumps at the points.
2. **Boundaries**: As $x \to -\infty$, $F(x) \to 0$; as $x \to \infty$, $F(x) \to 1$.
3. **Increasing**: If $a < b$, then $F(a) \leq F(b)$—probabilities can't decrease.
4. **Jumps for Discrete**: For discrete variables, the CDF jumps up at each possible value by the probability of that value.

### For Discrete Random Variables
- $F(x)$ is the sum of probabilities for all values less than or equal to $x$.
- Example: For a coin flip (0 or 1), $F(x) = 0$ for $x < 0$, $0.5$ for $0 \leq x < 1$, $1$ for $x \geq 1$.

### For Continuous Random Variables
- $F(x)$ is the integral (area under the curve) of the PDF from negative infinity to $x$.
- The PDF is the derivative of the CDF where it exists.

### Why CDFs Matter
- Calculate probabilities between values: $P(a < X \leq b) = F(b) - F(a)$.
  - **Inputs needed**: Lower bound $a$, upper bound $b$, cumulative distribution function $F$.
- Find percentiles: The value where $F(x) = 0.5$ is the median.
  - **Inputs needed**: Desired probability level (e.g., 0.5 for median), cumulative distribution function $F$.
- Survival probability: $P(X > x) = 1 - F(x)$.
  - **Inputs needed**: Value $x$, cumulative distribution function $F$.

## Summary
CDF summarizes the entire distribution. Properties ensure it's a valid probability measure. Use for probabilities, quantiles, and distribution comparisons.