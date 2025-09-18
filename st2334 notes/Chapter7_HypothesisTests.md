# ST2334 Notes: Chapter 7 - Hypothesis Tests

## 1. Hypothesis Testing Framew### Chi-squared goodness-of-fit: Tests if data matches a expected distribution.
- **Inputs needed**: Observed frequencies $O_i$, expected frequencies $E_i$.rk

### Null vs. Alternative Hypotheses
- **Null Hypothesis (H0)**: The default assumption, often "no difference" or "no effect" (e.g., the drug has no effect).
- **Alternative Hypothesis (H1)**: What you're trying to prove (e.g., the drug does have an effect).
- **Types of Tests**:
  - Two-sided: Testing if there's any difference (e.g., mean ≠ 100).
  - One-sided: Testing if it's higher or lower (e.g., mean > 100).

### Steps in Hypothesis Testing
1. **State Hypotheses**: Clearly define H0 and H1.
2. **Choose Significance Level (α)**: How much risk you're willing to take of being wrong (usually 0.05, or 5%).
3. **Pick the Test**: Based on what you're testing (mean, proportion, etc.).
4. **Set Rejection Rule**: Decide when to reject H0 based on the data.
5. **Collect Data and Compute**: Calculate the test statistic from your sample.
6. **Decide**: If the statistic is extreme enough, reject H0; otherwise, don't.

### Types of Errors
- **Type I Error**: Falsely rejecting H0 (thinking there's an effect when there isn't). Probability is α.
- **Type II Error**: Falsely not rejecting H0 (missing a real effect). Probability is β.
- **Power**: The chance of correctly detecting a real effect (1 - β). Higher power is better.

## 2. Tests for Population Mean

### Z-Test (When Population Spread is Known)
- **Inputs needed**: Sample mean $\bar{x}$, hypothesized mean $\mu_0$, population standard deviation $\sigma$, sample size $n$.
- Used to test if the population mean equals a specific value.
- Test statistic compares sample mean to hypothesized mean, adjusted for sample size.
- Follows normal distribution under H0.
- **Conditions for Using Z-Test**:
  - **Known Population σ**: σ is known. Reason: Allows use of standard normal.
  - **Normal Population or Large n**: Population normal or n ≥ 30. Reason: Ensures test statistic is normal.
  - **Independent Random Sample**: Sample is SRS. Reason: Provides unbiased \bar{x}.
  - **Result**: Z = $\frac{\bar{x} - \mu_0}{\sigma / \sqrt{n}}$ ~ Normal(0,1) under H0.

### t-Test (When Population Spread is Unknown)
- **Inputs needed**: Sample mean $\bar{x}$, hypothesized mean $\mu_0$, sample standard deviation $s$, sample size $n$.
- Similar to Z-test, but uses sample spread instead.
- Works for one sample, paired samples, or two independent samples.
- Uses t-distribution, which accounts for small samples.
- **Conditions for Using t-Test**:
  - **Unknown Population σ**: σ not known. Reason: Use sample s.
  - **Normal Population or Large n**: Population normal or n ≥ 30. Reason: t-distribution requires normality or large n.
  - **Independent Random Sample**: Sample is SRS. Reason: Ensures unbiased s.
  - **Result**: t = $\frac{\bar{x} - \mu_0}{s / \sqrt{n}}$ ~ t(df=n-1) under H0.

### Example
- Testing if average IQ is 100. Sample of 50 people has average 105. Is this significantly higher?

## 3. Tests for Proportions

### Z-Test for Proportion
- **Inputs needed**: Sample proportion $\hat{p}$, hypothesized proportion $p_0$, sample size $n$.
- Tests if the population proportion (e.g., percentage voting yes) equals a specific value.
- Uses sample proportion and compares to hypothesized proportion.
- **Conditions for Using Z-Test for Proportion**:
  - **Large Sample Size**: np0 ≥ 5 and n(1-p0) ≥ 5. Reason: Ensures normal approximation.
  - **Binary Outcomes**: Success/failure. Reason: Proportion is for binary data.
  - **Independent Trials**: Sample is random. Reason: Provides unbiased \hat{p}.
  - **Result**: Z = $\frac{\hat{p} - p_0}{\sqrt{\frac{p_0(1-p_0)}{n}}}$ ~ Normal(0,1) under H0.

## 4. Tests for Variances

### Chi-Squared Test
- **Inputs needed**: Sample variance $s^2$, hypothesized variance $\sigma_0^2$, sample size $n$.
- Tests if population variance equals a specific value.
- Uses sample variance and chi-squared distribution.
- **Conditions for Using Chi-Squared Test for Variance**:
  - **Normal Population**: Population is normal. Reason: Chi-squared assumes normality.
  - **Independent Random Sample**: Sample is SRS. Reason: Ensures unbiased s².
  - **Known Mean**: Or large n. Reason: Variance test requires normality.
  - **Result**: $\chi^2 = \frac{(n-1)s^2}{\sigma_0^2}$ ~ Chi-squared(df=n-1) under H0.

### F-Test
- **Inputs needed**: Sample variances $s_1^2$ and $s_2^2$, sample sizes $n_1$ and $n_2$.
- Compares variances of two populations.
- Used to check if two groups have the same spread.
- **Conditions for Using F-Test**:
  - **Two Independent Samples**: From different populations. Reason: Compares variances between groups.
  - **Normal Populations**: Both normal. Reason: F-distribution requires normality.
  - **Independent Observations**: Within samples. Reason: Ensures unbiased variances.
  - **Result**: F = $\frac{s_1^2}{s_2^2}$ ~ F(df1=n1-1, df2=n2-1) under H0.

## 5. p-Values

### What is a p-Value?
- The probability of getting data as extreme as yours (or more) if the null hypothesis is true.
- If p-value is small (less than α), reject H0—your data is unlikely under H0.

### How to Interpret
- p < 0.05: Strong evidence against H0.
- p > 0.05: Not enough evidence to reject H0.
- It's not the probability that H0 is true.

## 6. Non-Parametric Tests

### When to Use Them
- When data doesn't follow normal distribution, sample is small, or data is ranked/ordinal.

### Examples
- Sign test: For matched pairs, tests if one is consistently higher.
- Wilcoxon rank-sum: Compares two independent groups.
- Chi-squared goodness-of-fit: Tests if data matches a expected distribution.

## Summary
Hypothesis testing decides if sample data supports rejecting a default assumption. Choose test based on parameter (mean, proportion, variance). p-values help decide significance. Non-parametric tests for non-normal data.
Hypothesis testing decides between H0 and H1 using sample data. Choose test based on parameter and assumptions. Control α; interpret results carefully. p-values provide evidence strength.