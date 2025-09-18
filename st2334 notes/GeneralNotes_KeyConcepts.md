# ST2334 General Notes and Key Concepts

## Overview
This document summarizes key concepts from ST2334 Probability and Statistics. It explains fundamental ideas across chapters, with examples and plain language.

## 1. Basic Probability
- **Sample Space**: All possible outcomes of an experiment.
- **Events**: Groups of outcomes we're interested in.
- **Probability Basics**: Probabilities are between 0 and 1, total probability is 1, add probabilities for mutually exclusive events.
- **Key Rules**: Probability of not A is 1 minus P(A). For two events, P(A or B) = P(A) + P(B) - P(both). Conditional probability P(A given B) = P(A and B)/P(B).
- **Independence**: Two events are independent if knowing one doesn't affect the other's probability.
- **Bayes' Theorem**: Updates probabilities based on new evidence.

## 2. Random Variables
- **Discrete**: Counts things, like number of heads. Probability for each value, average (mean), spread (variance).
- **Continuous**: Measures things, like height. Probability density, cumulative probability up to a point.
- **Common Distributions**:
  - Binomial: Number of successes in fixed trials, like coin flips.
  - Normal: Bell-shaped curve, many natural measurements.
  - Poisson: Rare events, like accidents per day.

## 3. Joint Distributions
- **Joint**: Probabilities for pairs of variables, like height and weight.
- **Marginal**: Probability for one variable alone.
- **Conditional**: Probability of one given the other.
- **Independence**: No relationship between variables.
- **Covariance**: Measures how two variables vary together.
- **Correlation**: Standardized covariance, shows strength and direction of linear relationship.

## 4. Sampling
- **Random Sample**: Each observation equally likely, represents population.
- **Central Limit Theorem**: Averages of samples become normal-shaped, even if original data isn't.
- **Sample Statistics**: Sample mean estimates population mean; sample variance estimates population variance.

## 5. Estimation
- **Point Estimation**: Best guess for a population value using sample.
- **Interval Estimation**: Range likely containing the true value, with confidence level (e.g., 95% sure the true mean is in this range).
- **Sample Size**: How many observations needed for desired precision.

## 6. Hypothesis Testing
- **Null Hypothesis (H0)**: No effect or difference.
- **Alternative Hypothesis (H1)**: There is an effect or difference.
- **Significance Level (α)**: Risk of falsely claiming an effect (usually 5%).
- **Test Statistic**: Calculated value to decide.
- **p-Value**: Probability of data if H0 is true; small p means reject H0.
- **Decision**: Reject H0 if evidence is strong enough.

## 7. Key Theorems
- **Central Limit Theorem**: Averages tend to normal distribution.
- **Law of Large Numbers**: More data, better estimates.
- **De Morgan's Laws**: Rules for negating combined events.

## Formulas Cheat Sheet
- E[X+Y] = E[X]+E[Y]
  - **Inputs needed**: Expected values E[X], E[Y].
- Var(X+Y) = Var(X)+Var(Y) + 2Cov(X,Y)
  - **Inputs needed**: Variances Var(X), Var(Y), covariance Cov(X,Y).
- Binomial: μ=np, σ²=npq
  - **Inputs needed**: Number of trials n, success probability p.
- Normal: 68% within 1σ, 95% within 2σ, 99.7% within 3σ
  - **Inputs needed**: Standard deviation σ.
- t-CI: X̄ ± t_{α/2,n-1} S/√n
  - **Inputs needed**: Sample mean X̄, sample standard deviation S, sample size n, significance level α.
- Z-test: Z = (X̄ - μ0)/(σ/√n)
  - **Inputs needed**: Sample mean X̄, hypothesized mean μ0, population standard deviation σ, sample size n.

## Tips for Exams
- Identify distribution first.
- Check assumptions (normality, independence).
- Use CLT for large samples.
- Interpret results in context.
- Practice calculations and interpretations.

## Summary
ST2334 builds from basic probability to advanced inference. Master distributions, CLT, and testing procedures. Apply concepts to real data for understanding.