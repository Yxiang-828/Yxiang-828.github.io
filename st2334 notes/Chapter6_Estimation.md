# ST2334 Notes: Chapter 6 - Es- **Example**: For a normal distribution, set sample mean equal to population mean, sample variance to population variance.imation

## 1. Types of Estimations

### Point Estimation
- **What it is**: Guessing a single number for an unknown population parameter.
- **Example**: Using the average height of 100 sampled people to estimate the average height of all people in the country.
- **Estimator**: The formula or rule used (e.g., average of sample).
- **Estimate**: The actual number you get from your data.

### Interval Estimation
- **What it is**: Giving a range of values where the true parameter likely falls.
- **Confidence Interval (CI)**: A range with a certain probability (confidence level) of containing the true value. E.g., 95% CI means if you repeat the sampling many times, 95% of the intervals would contain the true value.
- **Example**: "The average height is between 165cm and 175cm, with 95% confidence."

## 2. Point Estimation

### Good Properties of Estimators
- **Unbiased**: On average, the estimate is correct (not too high or low).
- **Consistent**: As sample size increases, the estimate gets closer to the true value.
- **Efficient**: Among unbiased estimators, it has the least variability (most reliable).

### Method of Moments
- Match sample averages to population averages.
- Example: For a normal distribution, set sample mean equal to population mean, sample variance to population variance.
- **Conditions for Using Method of Moments**:
  - **Known Moments**: Population moments (mean, variance) are expressed in terms of parameters. Reason: Allows matching sample moments to population ones.
  - **Sufficient Sample Size**: Large enough n for moments to be reliable. Reason: Small samples may have biased moment estimates.
  - **Simple Distribution**: For distributions with few parameters. Reason: Easier to equate moments.
  - **Result**: Solves equations like E[X] = sample mean for parameter estimates.

### Maximum Likelihood Estimation (MLE)
- Choose the parameter value that makes your observed data most likely.
- For normal data: The best estimate for mean is sample mean; for variance, it's sample variance (adjusted for bias).
- **Conditions for Using MLE**:
  - **Likelihood Function Exists**: Can write P(data | θ). Reason: MLE maximizes this function.
  - **Differentiable Likelihood**: For finding maximum. Reason: Uses calculus to solve.
  - **Large Sample Size**: For asymptotic properties. Reason: MLE is asymptotically unbiased and efficient.
  - **Result**: θ that maximizes L(θ | data).

## 3. Interval Estimation

### For Population Mean (When Population Spread is Known)
- **Inputs needed**: Sample mean $\bar{x}$, population standard deviation $\sigma$, sample size $n$, confidence level (e.g., 95% for z=1.96).
- Use the sample mean plus/minus a margin based on sample size and known spread.
- The margin comes from the normal distribution.
- **Conditions for Using Z-CI for Mean**:
  - **Known Population σ**: σ is known from prior knowledge. Reason: Allows use of standard normal.
  - **Normal Population or Large n**: Population normal or n ≥ 30. Reason: Ensures sampling distribution is normal.
  - **Independent Random Sample**: Sample is SRS. Reason: Provides unbiased estimate.
  - **Result**: CI = $\bar{x} \pm z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$.

### For Population Mean (When Population Spread is Unknown)
- **Inputs needed**: Sample mean $\bar{x}$, sample standard deviation $s$, sample size $n$, confidence level (for t with df=n-1).
- Use the t-distribution instead (accounts for extra uncertainty).
- **Conditions for Using t-CI for Mean**:
  - **Unknown Population σ**: σ not known. Reason: Use sample s instead.
  - **Normal Population or Large n**: Population normal or n ≥ 30. Reason: t-distribution approximates normal for large n.
  - **Independent Random Sample**: Sample is SRS. Reason: Ensures unbiased s.
  - **Result**: CI = $\bar{x} \pm t_{\alpha/2, n-1} \frac{s}{\sqrt{n}}$.
- Sample standard deviation is used in the margin.

### For Population Proportion
- **Inputs needed**: Sample proportion $\hat{p}$, sample size $n$, confidence level (for z).
- Estimate the percentage of successes in the population.
- CI: Sample proportion plus/minus a margin based on sample size.
- **Conditions for Using CI for Proportion**:
  - **Large Sample Size**: np ≥ 5 and n(1-p) ≥ 5. Reason: Ensures normal approximation for proportion.
  - **Binary Outcomes**: Success/failure trials. Reason: Proportion is defined for binary data.
  - **Independent Trials**: Sample is random. Reason: Provides unbiased \hat{p}.
  - **Result**: CI = $\hat{p} \pm z_{\alpha/2} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$.

### For Population Variance
- **Inputs needed**: Sample variance $s^2$, sample size $n$, confidence level (for chi-squared with df=n-1).
- CI for how spread out the population is.
- **Conditions for Using CI for Variance**:
  - **Normal Population**: Population is normal. Reason: Chi-squared distribution requires normality.
  - **Independent Random Sample**: Sample is SRS. Reason: Ensures unbiased s².
  - **Known Mean or Large n**: For chi-squared to apply. Reason: Variance estimation assumes normality.
  - **Result**: CI = $\left( \frac{(n-1)s^2}{\chi^2_{\alpha/2, n-1}}, \frac{(n-1)s^2}{\chi^2_{1-\alpha/2, n-1}} \right)$.
- Uses chi-squared distribution.

### Choosing Sample Size
- **Inputs needed**: Desired margin of error $E$, population standard deviation $\sigma$ (or proportion $p$), confidence level (for z).
- To get a certain margin of error, calculate needed sample size.
- Larger samples give narrower intervals (more precise estimates).

## Summary
Estimation uses sample data to guess population parameters. Point estimates give single values; intervals give ranges with confidence. Good estimators are unbiased and consistent. Methods like moments and MLE help find estimates.

## 4. Confidence Intervals in Practice

### Interpretation
- 95% CI means 95% of such intervals contain true parameter.
- Not "probability the parameter is in the interval."

### Factors Affecting Width
- Confidence level: Higher → wider.
- Sample size: Larger → narrower.
- Variability: Higher σ → wider.

- **Example Calculations**
  ```
  TV time: n=50, σ=3.5, 99% CI → E ≈ 1.27 hours.
  ```

## Summary
Estimation infers population parameters from samples. Point estimates give single values; intervals provide ranges with confidence. Use CLT for large samples, t for small. Proper sample size ensures precision.