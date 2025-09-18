# ST2334 Notes: Chapter 4 - Special Probability Distributio- **Example**: If a website gets 3 spam comments per hour on average ($\lambda=3$), what's the chance of exactly 5 in an hour?
  - $P(X=5) = \frac{e^{-3} \times 3^5}{5!} \approx \frac{0.0498 \times 243}{120} \approx \frac{12.15}{120} \approx 0.101$ (10.1\%).

## 1. Discrete Distributions

### Discrete Uniform Distribution
- **What it is**: Each possible outcome is equally likely. Like rolling a fair die—each number 1-6 has the same 1/6 chance.
- **Why "uniform"**: Probability is uniform (same) across all values.
- **Example**: Bulb wattages {40,60,80,100}—each has 1/4 chance.
- **Mean (Average)**: Sum of all values divided by number of values. For bulbs: (40+60+80+100)/4 = 70.
- **Variance (Spread)**: Measures how spread out the values are. Formula: average of squared differences from mean. For bulbs: 500 (calculated as sum of (value-mean)^2 / number of values).
- **Use**: When all outcomes are equally probable, like lottery numbers or random selections.

### Bernoulli and Binomial
- **Bernoulli Trial**: A single yes/no experiment. Like flipping a coin (heads/tails) or checking if a light bulb works.
- **Bernoulli RV**: Counts success in one trial. X=1 if success, 0 if failure. Probability of success is p.
- **Inputs needed for Bernoulli**: p (success probability).
- **PMF**: P(X=1) = p, P(X=0) = 1-p.
- **CDF**: F(x) = 0 for x < 0, 1-p for 0 ≤ x < 1, 1 for x ≥ 1.
- **Example**: Coin flip—$p=0.5$ for heads. $P(X=1)=0.5$, $P(X=0)=0.5$.
- **Mean**: p (average successes per trial).
- **Variance**: p(1-p) (how much it varies; max at p=0.5).
- **Binomial**: Sum of multiple independent Bernoulli trials. Like flipping a coin 10 times and counting heads.
- **Parameters**: n (trials), p (success probability).
- **Inputs needed for Binomial**: n (number of trials), p (success probability per trial), k (number of successes to find P(X=k)).
- **PMF**: $P(X=k) = \binom{n}{k} p^k (1-p)^{n-k}$.
- **CDF**: $F(k) = P(X \leq k) = \sum_{i=0}^{k} \binom{n}{i} p^{i} (1-p)^{n-i}$.
- **Example**: 10 coin flips, $p=0.5$, $P(\text{exactly 5 heads}) = \binom{10}{5} (0.5)^{10} \approx 0.246$.
- **Mean**: n×p (expected successes).
- **Variance**: n×p×(1-p) (spread increases with more trials).
- **Conditions for Using Binomial**:
  - **Fixed Number of Trials**: There are exactly n independent trials. Reason: Defines the scope of the experiment.
  - **Two Outcomes per Trial**: Each trial results in success or failure. Reason: Simplifies to binary outcomes.
  - **Constant Success Probability**: p is the same for each trial. Reason: Ensures identical conditions across trials.
  - **Independent Trials**: Outcomes of trials don't affect each other. Reason: Allows multiplication of probabilities.
  - **Result**: These lead to the binomial formula for the number of successes.
- **Properties**:
  - **Sum of Independent Binomials with Same p**: If $X_1 \sim \text{Binomial}(n_1, p)$ and $X_2 \sim \text{Binomial}(n_2, p)$, independent, then $X_1 + X_2 \sim \text{Binomial}(n_1 + n_2, p)$.
    - **Why?**: Each trial is independent with same success probability, so combining trials is like one big binomial.
    - **Example**: Testing bulbs in two batches: 10 in first, 15 in second, p=0.8. Total good bulbs: Binomial(25, 0.8).
- **Use**: Quality testing, surveys, any repeated yes/no scenarios.

### Geometric and Negative Binomial
- **Geometric**: Trials until first success. P(X=k) = (1-p)^{k-1} p.
- **Mean/Variance**: μ=1/p, σ²=(1-p)/p².
- **Properties**:
  - **Sum of Independent Geometrics**: If you have k independent Geometric(p) RVs, their sum is Negative Binomial(k, p).
    - **Why?**: Negative Binomial counts trials until k successes, which is sum of k geometrics (trials for each success).
    - **Example**: Time until 3 sales calls succeed: Negative Binomial(3, p).
- **Negative Binomial**: Trials until r successes. More general.

### Poisson
- **What it is**: Models the number of rare, random events happening in a fixed time/space interval. The random variable X represents the count of these events (e.g., X=0,1,2,... colonies). Like counting typos in a book or calls to a helpline.
- **Why "rare"**: Events are uncommon, and each happens independently (one doesn't affect another).
- **Parameter λ (lambda)**: The average number of events expected. If λ=2, you expect about 2 events on average.
- **Inputs needed**: λ (average rate), k (number of events to find P(X=k)).
- **Probability Formula**: $P(X = k) = \frac{e^{-\lambda} \lambda^k}{k!}$
  - $e$ is about 2.718 (a math constant).
  - $k!$ means $k$ factorial (e.g., $3! = 6$).
  - This gives the chance of exactly $k$ events.
- **CDF**: $F(k) = P(X \leq k) = \sum_{i=0}^{k} \frac{e^{-\lambda} \lambda^{i}}{i!}$.
- **Example**: If a website gets 3 spam comments per hour on average ($\lambda=3$), what's the chance of exactly 5 in an hour?
  - $P(X=5) = \frac{e^{-3} \times 3^5}{5!} \approx \frac{0.0498 \times 243}{120} \approx \frac{12.15}{120} \approx 0.101$ (10.1%).
- **Another Example**: Water quality testing. Number of bacterial colonies per 1 cc follows Poisson with mean 0.6. For a 2 cc sample, the mean is $\lambda = 2 \times 0.6 = 1.2$, so $X \sim \text{Poisson}(1.2)$. We want $P$(at least 2 out of 5 samples have 2 or more colonies).
  - First, $P$(one sample has $\geq 2$ colonies) $= 1 - P(X=0) - P(X=1) = 1 - e^{-1.2} - 1.2 e^{-1.2}$.
  - $e^{-1.2} \approx 0.3012$, so $P(X=0) \approx 0.3012$, $P(X=1) \approx 1.2 \times 0.3012 = 0.3614$, $P(X \geq 2) \approx 1 - 0.3012 - 0.3614 = 0.3374$.
  - This is like a success. Number of successes in 5 samples $\sim \text{Binomial}(5, 0.3374)$.
  - Binomial formula: $P(S = k) = \binom{5}{k} p^k (1-p)^{5-k}$, where $\binom{5}{k} = \frac{5!}{k! (5-k)!}$, $p=0.3374$.
  - $P$(at least 2 successes) $= 1 - P(0) - P(1) = 1 - (1-p)^5 - 5 p (1-p)^4$.
  - $1-p \approx 0.6626$, $(0.6626)^5 \approx 0.1276$, $5 \times 0.3374 \times (0.6626)^4 \approx 5 \times 0.3374 \times 0.1927 \approx 0.3245$.
  - Thus, $P \approx 1 - 0.1276 - 0.3245 = 0.5479 \approx 0.547$ (to 3 decimal places).
- **Mean (Average)**: Always equals λ. So if λ=3, average events = 3.
- **Variance (Spread)**: Also equals λ. So spread = 3. Variance measures how much the counts vary around the average.
- **Why mean = variance?**: For Poisson, the spread equals the average—unusual for other distributions, showing it's for "clumpy" rare events.
- **Conditions for Using Poisson**:
  - **Independent Events**: Events occur independently of each other. Reason: Ensures no influence between events, leading to additive counts.
  - **Constant Rate (Stationarity)**: The average rate λ is constant over time or space. Reason: Maintains a steady probability of events, resulting in exponential waiting times.
  - **No Simultaneous Events**: Two events cannot occur at exactly the same time. Reason: Prevents clustering, making the number in small intervals 0 or 1, which gives the Poisson formula.
  - **Result**: These conditions naturally lead to Var(X) = E[X] = λ, as in a Poisson process.
- **Properties**:
  - **Sum of Independent Poissons**: If $X_1 \sim \text{Poisson}(\lambda_1)$ and $X_2 \sim \text{Poisson}(\lambda_2)$, and they are independent, then $X_1 + X_2 \sim \text{Poisson}(\lambda_1 + \lambda_2)$.
    - **Why?**: The events from each source are independent and rare, so total events combine additively.
    - **Example**: Calls to two helplines: one gets 2/hour, other 3/hour. Total calls: Poisson(5/hour).
- **Real-World Use**: Quality control (defects), traffic accidents, radioactive decay.
- **Approximation**: When you have many trials with small success probability (binomial with n large, p small), it approximates Poisson with λ = n×p.

## 2. Continuous Distributions

### Continuous Uniform
- **What it is**: Equal probability density over a range [a,b]. Like picking a random point on a line segment.
- **Inputs needed**: a and b (range endpoints), x (value to find PDF or CDF at).
- **PDF**: $f(x) = \frac{1}{b-a}$ for $x \in [a,b]$, 0 otherwise.
- **CDF**: $F(x) = \frac{x-a}{b-a}$ for $a \leq x \leq b$.
- **Mean/Variance**: $\mu = \frac{a+b}{2}$, $\sigma^2 = \frac{(b-a)^2}{12}$.

### Normal (Gaussian)
- **What it is**: The "bell curve"—symmetric, most values cluster around the average, tails go to infinity.
- **Why common**: Many natural phenomena (heights, test scores) follow it due to Central Limit Theorem.
- **Parameters**: μ (mean/center), σ (standard deviation/spread).
- **Inputs needed**: μ (mean), σ (standard deviation), x (value to find PDF or probability for).
- **PDF Formula**: Complex, but shape depends on μ and σ.
- **CDF**: $F(x) = P(X \leq x) = \Phi\left( \frac{x - \mu}{\sigma} \right)$, where $\Phi$ is the standard normal CDF.
- **Standard Normal**: Z = (X - μ)/σ, has mean 0, σ=1. Used for calculations.
- **Inputs needed for standard normal**: z (standardized value) to find P(Z ≤ z).
- **68-95-99.7 Rule**: 68% within 1σ, 95% within 2σ, 99.7% within 3σ of mean.
- **Example**: IQ scores: mean 100, $\sigma=15$. 68% between 85-115, 95% between 70-130.
- **Conditions for Using Normal**:
  - **Central Limit Theorem Applies**: Large sample size (n ≥ 30) or population is normal. Reason: CLT ensures sums/averages are approximately normal.
  - **No Extreme Outliers**: Data is symmetric and bell-shaped. Reason: Normal distribution assumes symmetry around the mean.
  - **Independent Observations**: Data points are independent. Reason: Prevents bias in variance estimation.
  - **Result**: These conditions allow modeling with mean μ and variance σ².
- **Properties**:
  - **Sum of Independent Normals**: If $X_1 \sim \text{Normal}(\mu_1, \sigma_1^2)$ and $X_2 \sim \text{Normal}(\mu_2, \sigma_2^2)$, independent, then $X_1 + X_2 \sim \text{Normal}(\mu_1 + \mu_2, \sigma_1^2 + \sigma_2^2)$.
    - **Why?**: Normals add up nicely due to their symmetric shape and the Central Limit Theorem underpinnings.
    - **Example**: Heights of two people: one N(170,10²), other N(165,8²). Sum: N(335, 10²+8²=164).
- **Use**: Modeling continuous data, basis for statistical tests.

### Exponential
- **What it is**: Models time between events, like waiting for a bus or machine failure.
- **Key Property**: Memoryless—probability of waiting longer doesn't depend on how long you've already waited.
- **Parameter**: λ (rate, e.g., events per unit time).
- **Inputs needed**: λ (rate), x (time value to find PDF or CDF at).
- **PDF**: $f(x) = \lambda e^{-\lambda x}$ for $x > 0$ (decreases exponentially).
- **CDF**: $F(x) = 1 - e^{-\lambda x}$ for $x \geq 0$ (cumulative probability up to x).
- **Survival Function**: $S(x) = e^{-\lambda x}$ for $x \geq 0$ (probability of exceeding x, i.e., P(X > x)).
- **Mean**: $\frac{1}{\lambda}$ (average wait time).
- **Variance**: $\frac{1}{\lambda^2}$ (spread).
- **Example**: If buses arrive every 10 minutes on average ($\lambda=0.1$ per minute), mean wait = 10 minutes. P(wait > 5 min) = $e^{-0.1 \times 5} = e^{-0.5} \approx 0.606$.
- **Conditions for Using Exponential**:
  - **Constant Rate of Events**: Events occur at a constant average rate λ. Reason: Ensures the waiting time follows exponential decay.
  - **Memoryless Property Holds**: Probability of waiting longer is independent of how long you've waited. Reason: Matches the no-memory assumption for inter-arrival times.
  - **Independent Events**: Events are independent. Reason: Prevents influence between waiting times.
  - **Result**: These lead to the exponential distribution for time between events.
- **Properties**:
  - **Minimum of Independent Exponentials**: If you have n independent objects, each with failure rate λ, the time until the first failure is Exponential with rate nλ, mean $\frac{1}{n\lambda}$.
    - **Why?**: The minimum of n independent Exponentials follows Exponential with combined rate.
    - **Example**: 5 machines, each fails at rate λ=0.01 per hour. Time to first failure: Exponential(0.05), mean 20 hours.
  - **Sum of Independent Exponentials**: If $X_1 \sim \text{Exponential}(\lambda)$, ..., $X_n \sim \text{Exponential}(\lambda)$, independent, then $\sum X_i \sim \text{Gamma}(n, 1/\lambda)$.
    - **Why?**: Exponential models waiting times, and sum of n waits is Gamma with shape n.
    - **Example**: Time for 3 buses to arrive: Gamma(3, 10 minutes).
- **Use**: Reliability, queuing theory.

### Gamma and Beta
- **Gamma**: Generalization of exponential. Shape k, scale θ.
- **Inputs needed**: k (shape), θ (scale), x (value).
- **Conditions for Using Gamma**:
  - **Sum of Exponentials**: When modeling sum of k independent exponential RVs. Reason: Gamma is the distribution of sums of exponentials.
  - **Positive Values**: Data is positive and continuous. Reason: Gamma is defined for x > 0.
  - **Shape Parameter k**: Represents number of events or stages. Reason: Determines the distribution's shape.
  - **Result**: Used for waiting times or sums of exponentials.
- **Beta**: For proportions, parameters α,β.
- **Inputs needed**: α, β, x (between 0 and 1).
- **Conditions for Using Beta**:
  - **Proportions or Probabilities**: Data is between 0 and 1. Reason: Beta models bounded continuous variables.
  - **Conjugate Prior**: Often used in Bayesian statistics. Reason: Beta is conjugate to binomial.
  - **Parameters α, β**: Represent successes and failures. Reason: Shape depends on these.
  - **Result**: Models uncertainty in proportions.

## 3. Sampling Distributions

### Chi-Squared
- **Definition**: Sum of k independent Z², χ²_k.
- **Mean/Variance**: μ=k, σ²=2k.

### t-Distribution
- **Definition**: Z / √(χ²_k / k), for small samples.
- **Degrees of Freedom**: k.

### F-Distribution
- **Definition**: Ratio of two χ² distributions.
- **Used in ANOVA**: Compare variances.

## 4. Transformations and Moments

### Moment Generating Functions (MGF)
- M(t) = E[e^{tX}].
- Uniquely determines distribution.
- Used to find sums of RVs.

### Central Limit Theorem (CLT)
- Sample mean X̄ ≈ N(μ, σ²/n) for large n.
- Key for inference.

## Summary
Special distributions model common scenarios: uniform for equal chance, binomial for trials, normal for averages, exponential for waiting times. Sampling distributions enable hypothesis testing and confidence intervals.