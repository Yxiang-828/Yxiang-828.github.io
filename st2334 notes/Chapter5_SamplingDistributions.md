# ST2334 Notes: Chapter 5 - Sampling and Sampling Distributions

## 1. Population and Sample

### Key Concepts
- **Population**: The entire group you're interested in studying. Could be all people in a country, all products from a factory, or infinite possibilities like all possible measurements.
- **Sample**: A smaller group taken from the population to study. We use samples because studying the whole population is often impossible or too expensive.
- **Statistic**: A number calculated from the sample, like the average height of sampled people.
- **Parameter**: A number describing the whole population, like the true average height of everyone.

### Types of Sampling
- **Finite Population**: Fixed number, like all students in a class.
- **Infinite Population**: Unlimited possibilities, like all possible test scores.

## 2. Random Sampling

### Simple Random Sample (SRS)
- Every possible sample of the right size has an equal chance of being picked.
- **With Replacement**: You can pick the same item twice (like drawing cards and putting back).
- **Without Replacement**: Each item picked only once (like lottery without replacement).
- Ensures the sample represents the population fairly.

### From Infinite Populations
- Each sample value is like an independent draw from the population distribution.
- All sample values are independent of each other.

## 3. Sampling Distribution of Sample Mean

### Sample Mean (X̄)
- The average of your sample values.
  - **Inputs needed**: sample values.
- If your sample is random, this average is a good estimate of the population average.

### Properties
- The expected value (average) of $\bar{X}$ equals the population mean $\mu$.
- The variance (spread) of $\bar{X}$ is population variance divided by sample size $n$. Smaller $n$ means more spread.

### Central Limit Theorem (CLT)
- **What it says**: No matter what the population looks like, if your sample is large enough (usually $n \geq 30$), the sample mean will be approximately normally distributed.
- **Inputs needed**: Population mean $\mu$, population variance $\sigma^2$, sample size $n$.
- **Conditions for Using CLT**:
  - **Large Sample Size**: n ≥ 30 or population is normal. Reason: Ensures the sampling distribution is approximately normal.
  - **Independent Observations**: Sample values are independent. Reason: Prevents correlation that could bias the distribution.
  - **Finite Variance**: Population has finite variance σ². Reason: CLT requires the variance to exist for convergence.
  - **Result**: Sample mean $\bar{X} \sim \text{Normal}(\mu, \sigma^2/n)$ approximately.
- **Why important**: Allows us to use normal distribution methods even when the original data isn't normal.
- **For Proportions**: The difference between sample proportion and true proportion, scaled by square root of $n$, is approximately normal.

### Sample Variance ($S^2$)
- Measures how spread out your sample is.
- Formula: Average of squared differences from the sample mean.
  - **Inputs needed**: sample values.
- It's an unbiased estimate of the population variance.

## 4. Other Sampling Distributions

### Difference of Two Sample Means
- When comparing two groups, the difference of their sample means follows a normal distribution if samples are large.
  - **Inputs needed**: two sample means, sample sizes, variances.

### Sample Proportion
- The fraction of successes in your sample (e.g., percentage who voted yes).
  - **Inputs needed**: number of successes in sample, sample size n.
- For large samples, it's approximately normal.
- Its average equals the true population proportion $p$.
- Its spread depends on $p$ and sample size $n$ (smaller spread with larger $n$).

### t-Distribution
- Similar to normal, but with thicker tails (accounts for uncertainty when population spread is unknown).
- Used when estimating population mean from small samples or when we don't know the population standard deviation.
- Degrees of freedom: Usually n-1, where n is sample size.
  - **Inputs needed**: sample mean \bar{x}, hypothesized mean \mu_0, sample standard deviation s, sample size n.
- **Conditions for Using t-Distribution**:
  - **Small Sample Size**: n < 30 or population variance unknown. Reason: t-distribution accounts for extra uncertainty in variance estimation.
  - **Normal Population or Large n**: Population is normal or n ≥ 30. Reason: Ensures the sampling distribution is t-shaped.
  - **Independent Observations**: Sample is random and independent. Reason: Maintains unbiasedness.
  - **Result**: Test statistic follows t with df = n-1.

### F-Distribution
- Used to compare variances between two groups.
- Ratio of two sample variances.
- Important in ANOVA (analysis of variance) to test if group means are different.
  - **Inputs needed**: sample variances s1^2, s2^2, sample sizes n1, n2.
- **Conditions for Using F-Distribution**:
  - **Two Independent Samples**: Samples from different populations. Reason: F-tests compare variances between groups.
  - **Normal Populations**: Both populations are normal. Reason: F-distribution assumes normality for variance ratios.
  - **Independent Observations**: Within and between samples. Reason: Ensures unbiased variance estimates.
  - **Result**: F = s1² / s2² follows F with df1 = n1-1, df2 = n2-1.

## 5. Applications

### Estimation
- **Point Estimation**: Using sample statistics to guess population parameters (e.g., sample mean estimates population mean).
- **Interval Estimation**: Giving a range where the true parameter likely lies (confidence intervals), using the distributions above.

### Hypothesis Testing
- Testing claims about populations using sample data.
- Test statistics follow the sampling distributions under the null hypothesis (no difference).

## Summary
Sampling ensures representative data. SRS provides unbiased estimates. CLT enables normal approximations for inference. Sampling distributions (normal, t, F, χ²) form the basis for statistical tests and intervals.