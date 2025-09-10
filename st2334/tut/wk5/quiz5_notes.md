# Quiz 5 Notes: Independence of Random Variables

## Problem 1: Independence from Marginals

### Theorem
Two discrete random variables \( X \) and \( Y \) are **independent** if and only if for all possible values \( x \) and \( y \):

\[
P(X = x, Y = y) = P(X = x) \cdot P(Y = y)
\]

That is, the joint probability equals the product of the marginals for all combinations.

---

### Application to the Question
Given:
- \( P(X = 0) = P(X = 1) = 1/2 \)
- \( P(Y = 0) = P(Y = 1) = 1/2 \)

#### Step 1: Marginals Alone
The marginals alone do **not** guarantee independence. We need the joint probabilities.

#### Step 2: What Would Independence Require?
For independence, we must have:
- \( P(X = 0, Y = 0) = 1/4 \)
- \( P(X = 0, Y = 1) = 1/4 \)
- \( P(X = 1, Y = 0) = 1/4 \)
- \( P(X = 1, Y = 1) = 1/4 \)

But unless the joint probabilities are explicitly given as above, **independence is not guaranteed**.

#### Step 3: Counterexample
Suppose instead:
- \( P(X = 0, Y = 0) = 1/2 \)
- \( P(X = 1, Y = 1) = 1/2 \)
- \( P(X = 0, Y = 1) = 0 \)
- \( P(X = 1, Y = 0) = 0 \)

Here, the marginals are still \( 1/2 \) for each value, but the joint probabilities do **not** equal the product of the marginals. So \( X \) and \( Y \) are **not independent**.

#### Conclusion
Knowing only the marginals is not enough to conclude independence.
You must check the joint probabilities. The answer to the question is **FALSE** unless the joint probabilities are given and satisfy the independence condition.

---

## Problem 2: Independence and Expectation

We are given:

* $X$ and $Y$ are **independent** random variables
* $\mathbb{E}[X] = \mathbb{E}[Y] = 0$
* $\text{Var}(X) = 1 \Rightarrow \mathbb{E}[X^2] = 1$
* $\text{Var}(Y) = 2 \Rightarrow \mathbb{E}[Y^2] = 2$
* We are asked: Is $\mathbb{E}[X^2 Y^2] = 2$?

---

### 🧠 **Theorem Behind the Problem:**

This question uses properties of **expectation** and **independence**:

#### ✅ **Key Theorem:**

If $X$ and $Y$ are **independent random variables**, then:

$$
\mathbb{E}[f(X) \cdot g(Y)] = \mathbb{E}[f(X)] \cdot \mathbb{E}[g(Y)]
$$

as long as $f(X)$ and $g(Y)$ are integrable (i.e., have finite expectation).

In our case, use $f(X) = X^2$, $g(Y) = Y^2$. Since $X$ and $Y$ are independent:

$$
\mathbb{E}[X^2 Y^2] = \mathbb{E}[X^2] \cdot \mathbb{E}[Y^2]
$$

---

### 🔍 Step-by-Step Calculation:

We are given:

* $\text{Var}(X) = \mathbb{E}[X^2] - (\mathbb{E}[X])^2 = 1$
* Since $\mathbb{E}[X] = 0$, $\mathbb{E}[X^2] = 1$

Similarly:

* $\text{Var}(Y) = \mathbb{E}[Y^2] - (\mathbb{E}[Y])^2 = 2$
* Since $\mathbb{E}[Y] = 0$, $\mathbb{E}[Y^2] = 2$

Now compute:

$$
\mathbb{E}[X^2 Y^2] = \mathbb{E}[X^2] \cdot \mathbb{E}[Y^2] = 1 \cdot 2 = 2
$$

✅ **True**

---

### 📌 Final Answer:

**The statement is TRUE.**

---

## Problem 3: Expectation from Joint PMF

We are given a **joint probability mass function (pmf)** for discrete random variables $X, Y, Z$, and are asked to compute the **expectation**:

$$
\mathbb{E}(XY + XZ + YZ)
$$

---

### 🧠 **Theorem Behind the Problem**

This uses **the linearity of expectation** and the definition of expectation for discrete random variables.

---

### ✅ **Key Theorem: Linearity of Expectation**

For any random variables $A, B, C$, we have:

$$
\mathbb{E}[A + B + C] = \mathbb{E}[A] + \mathbb{E}[B] + \mathbb{E}[C]
$$

So:

$$
\mathbb{E}[XY + XZ + YZ] = \mathbb{E}[XY] + \mathbb{E}[XZ] + \mathbb{E}[YZ]
$$

---

### ✅ **Definition: Expectation for Discrete Joint PMF**

If the joint pmf of $X, Y, Z$ is known, then:

$$
\mathbb{E}[XY] = \sum_{x,y,z} xy \cdot P(X = x, Y = y, Z = z)
$$

Similarly for $\mathbb{E}[XZ]$ and $\mathbb{E}[YZ]$.

---

### 🔍 Step-by-Step Solution:

We are told the only values with nonzero probability (each = $\frac{1}{4}$) are:

| $X$ | $Y$ | $Z$ | $P(X,Y,Z)$    |
| --- | --- | --- | ------------- |
| 1   | 2   | 3   | $\frac{1}{4}$ |
| 2   | 1   | 1   | $\frac{1}{4}$ |
| 2   | 2   | 1   | $\frac{1}{4}$ |
| 2   | 3   | 2   | $\frac{1}{4}$ |

Let’s compute each component.

---

#### 1. **Compute $\mathbb{E}[XY]$**

$$
\mathbb{E}[XY] = \sum xy \cdot P(X,Y,Z)
$$

$$
= 1 \cdot 2 \cdot \frac{1}{4} + 2 \cdot 1 \cdot \frac{1}{4} + 2 \cdot 2 \cdot \frac{1}{4} + 2 \cdot 3 \cdot \frac{1}{4}
$$

$$
= \frac{2}{4} + \frac{2}{4} + \frac{4}{4} + \frac{6}{4} = \frac{14}{4} = 3.5
$$

---

#### 2. **Compute $\mathbb{E}[XZ]$**

$$
\mathbb{E}[XZ] = \sum xz \cdot P(X,Y,Z)
$$

$$
= 1 \cdot 3 \cdot \frac{1}{4} + 2 \cdot 1 \cdot \frac{1}{4} + 2 \cdot 1 \cdot \frac{1}{4} + 2 \cdot 2 \cdot \frac{1}{4}
$$

$$
= \frac{3}{4} + \frac{2}{4} + \frac{2}{4} + \frac{4}{4} = \frac{11}{4} = 2.75
$$

---

#### 3. **Compute $\mathbb{E}[YZ]$**

$$
\mathbb{E}[YZ] = \sum yz \cdot P(X,Y,Z)
$$

$$
= 2 \cdot 3 \cdot \frac{1}{4} + 1 \cdot 1 \cdot \frac{1}{4} + 2 \cdot 1 \cdot \frac{1}{4} + 3 \cdot 2 \cdot \frac{1}{4}
$$

$$
= \frac{6}{4} + \frac{1}{4} + \frac{2}{4} + \frac{6}{4} = \frac{15}{4} = 3.75
$$

---

### ✅ Final Step: Add Them All

$$
\mathbb{E}[XY + XZ + YZ] = 3.5 + 2.75 + 3.75 = \boxed{10.00}
$$

---

### 🟩 **Answer: 10.00**

---

## Problem 4: Covariance from Joint PMF

We are asked to compute the **covariance** $\text{Cov}(X, Y)$ between two discrete random variables $X$ and $Y$, given their **joint probability mass function**.

---

### 🧠 **Theorem Behind the Problem**

#### ✅ **Definition of Covariance:**
$$
\text{Cov}(X, Y) = \mathbb{E}[XY] - \mathbb{E}[X] \cdot \mathbb{E}[Y]
$$

To compute this, we need:

* $\mathbb{E}[XY]$ – the expected value of the product
* $\mathbb{E}[X]$, $\mathbb{E}[Y]$ – the means

Each of these are computed using the joint pmf:

#### ✅ **Expectation of a function $g(X, Y)$:**
$$
\mathbb{E}[g(X, Y)] = \sum_x \sum_y g(x, y) \cdot P(X = x, Y = y)
$$

---

### 📊 **Given Data:**

| $x$ | $y = 0$ | $y = 5$ | $y = 10$ |
| --- | ------- | ------- | -------- |
| 0   | 0.03    | 0.12    | 0.15     |
| 5   | 0.07    | 0.18    | 0.25     |
| 10  | 0.05    | 0.10    | 0.05     |

---

### 🔍 Step-by-Step Calculation:

#### **Step 1: Compute $\mathbb{E}[X]$**

$$
\mathbb{E}[X] = \sum_x x \cdot P(X = x)
$$

We first compute marginal $P(X = x)$:

* $P(X = 0) = 0.03 + 0.12 + 0.15 = 0.30$
* $P(X = 5) = 0.07 + 0.18 + 0.25 = 0.50$
* $P(X = 10) = 0.05 + 0.10 + 0.05 = 0.20$

So:

$$
\mathbb{E}[X] = 0 \cdot 0.30 + 5 \cdot 0.50 + 10 \cdot 0.20 = 0 + 2.5 + 2 = 4.5
$$

---

#### **Step 2: Compute $\mathbb{E}[Y]$**

We compute marginal $P(Y = y)$:

* $P(Y = 0) = 0.03 + 0.07 + 0.05 = 0.15$
* $P(Y = 5) = 0.12 + 0.18 + 0.10 = 0.40$
* $P(Y = 10) = 0.15 + 0.25 + 0.05 = 0.45$

$$
\mathbb{E}[Y] = 0 \cdot 0.15 + 5 \cdot 0.40 + 10 \cdot 0.45 = 0 + 2 + 4.5 = 6.5
$$

---

#### **Step 3: Compute $\mathbb{E}[XY]$**

We compute:

$$
\mathbb{E}[XY] = \sum_{x,y} x \cdot y \cdot P(x, y)
$$

Go cell by cell:

* $0 \cdot 0 \cdot 0.03 = 0$
* $0 \cdot 5 \cdot 0.12 = 0$
* $0 \cdot 10 \cdot 0.15 = 0$
* $5 \cdot 0 \cdot 0.07 = 0$
* $5 \cdot 5 \cdot 0.18 = 25 \cdot 0.18 = 4.5$
* $5 \cdot 10 \cdot 0.25 = 50 \cdot 0.25 = 12.5$
* $10 \cdot 0 \cdot 0.05 = 0$
* $10 \cdot 5 \cdot 0.10 = 50 \cdot 0.10 = 5$
* $10 \cdot 10 \cdot 0.05 = 100 \cdot 0.05 = 5$

Add them:

$$
\mathbb{E}[XY] = 0 + 0 + 0 + 0 + 4.5 + 12.5 + 0 + 5 + 5 = 27.0
$$

---

#### **Step 4: Compute Covariance**

$$
\text{Cov}(X, Y) = \mathbb{E}[XY] - \mathbb{E}[X] \cdot \mathbb{E}[Y] = 27.0 - 4.5 \cdot 6.5
$$

$$
= 27.0 - 29.25 = \boxed{-2.25}
$$

---

### ✅ Final Answer: **$-2.25$**

---

## Problem 5: Covariance of Functions of Independent Random Variables

We are given:

* $X$ and $Y$ are **independent** random variables.
* You are asked whether:

$$
\text{Cov}(X^2, Y^2) = 0
$$

---

### 🧠 **Theorem Behind the Problem**

#### ✅ **1. Covariance Definition**

For any two random variables $A$, $B$:

$$
\text{Cov}(A, B) = \mathbb{E}[AB] - \mathbb{E}[A]\mathbb{E}[B]
$$

Apply it to our case:

$$
\text{Cov}(X^2, Y^2) = \mathbb{E}[X^2Y^2] - \mathbb{E}[X^2] \cdot \mathbb{E}[Y^2]
$$

---

#### ✅ **2. Independence Implies Factorization of Expectations**

If $X$ and $Y$ are independent, then:

$$
\mathbb{E}[f(X)g(Y)] = \mathbb{E}[f(X)] \cdot \mathbb{E}[g(Y)]
$$

for **any functions** $f$ and $g$, provided the expectations exist.

In our case:

* $f(X) = X^2$
* $g(Y) = Y^2$

So since $X$ and $Y$ are independent:

$$
\mathbb{E}[X^2Y^2] = \mathbb{E}[X^2] \cdot \mathbb{E}[Y^2]
$$

Substitute into the covariance formula:

$$
\text{Cov}(X^2, Y^2) = \mathbb{E}[X^2] \cdot \mathbb{E}[Y^2] - \mathbb{E}[X^2] \cdot \mathbb{E}[Y^2] = 0
$$

---

## ✅ **Conclusion: TRUE**

So:

> If $X$ and $Y$ are independent random variables, then
>
> $$
> \text{Cov}(X^2, Y^2) = 0
> $$

✅ **True**

---

### 🔗 Linking Each Step to Theorem

| Step | Action                                | Theorem Used                                                                   |
| ---- | ------------------------------------- | ------------------------------------------------------------------------------ |
| 1    | Define covariance of $X^2, Y^2$       | $\text{Cov}(A, B) = \mathbb{E}[AB] - \mathbb{E}[A]\mathbb{E}[B]$               |
| 2    | Recognize $X$ and $Y$ are independent | Independence implies $\mathbb{E}[f(X)g(Y)] = \mathbb{E}[f(X)]\mathbb{E}[g(Y)]$ |
| 3    | Apply with $f(X) = X^2$, $g(Y) = Y^2$ | Get $\mathbb{E}[X^2Y^2] = \mathbb{E}[X^2]\mathbb{E}[Y^2]$                      |
| 4    | Plug back into covariance formula     | Final result is 0                                                              |

---

## Problem 6: Variance of Linear Combinations

This is a classic **variance algebra** problem involving **linear combinations of random variables**.

Let’s unpack it step by step and explain the **theorem behind** it, then compute the answer.

---

## 🎯 **Given:**

* $\text{Var}(X + Y) = 10$
* $\text{Var}(X) = 4$
* $\text{Var}(Y) = 8$

We are to find:

$$
\text{Var}(X - Y) = \, ?
$$

---

## 🧠 **Theorem Behind the Problem**

### ✅ Variance of a Linear Combination

If $X$ and $Y$ are any two random variables (not necessarily independent), then:

$$
\text{Var}(aX + bY) = a^2 \text{Var}(X) + b^2 \text{Var}(Y) + 2ab \cdot \text{Cov}(X, Y)
$$

This is a **core identity** for the variance of a linear combination of random variables.

---

### 📌 Step-by-Step Application

We are dealing with:

1. $\text{Var}(X + Y)$
   Using $a = 1, b = 1$:

   $$
   \text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2 \cdot \text{Cov}(X, Y)
   $$

   Plug in values:

   $$
   10 = 4 + 8 + 2 \cdot \text{Cov}(X, Y)
   \Rightarrow 10 = 12 + 2 \cdot \text{Cov}(X, Y)
   \Rightarrow \text{Cov}(X, Y) = \frac{-2}{2} = -1
   $$

2. Now compute $\text{Var}(X - Y)$

   Using $a = 1, b = -1$:

   $$
   \text{Var}(X - Y) = \text{Var}(X) + \text{Var}(Y) - 2 \cdot \text{Cov}(X, Y)
   $$

   Plug in known values:

   $$
   \text{Var}(X - Y) = 4 + 8 - 2 \cdot (-1) = 12 + 2 = \boxed{14}
   $$

---

### ✅ Final Answer: **14**

---

## 🔗 Linking Each Step to the Theorem

| Step | Action                              | Theorem Used                                                                   |
| ---- | ----------------------------------- | ------------------------------------------------------------------------------ |
| 1    | Use formula for $\text{Var}(X + Y)$ | $\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2 \cdot \text{Cov}(X, Y)$ |
| 2    | Solve for $\text{Cov}(X, Y)$        | Algebra                                                                        |
| 3    | Use formula for $\text{Var}(X - Y)$ | $\text{Var}(X - Y) = \text{Var}(X) + \text{Var}(Y) - 2 \cdot \text{Cov}(X, Y)$ |
| 4    | Plug in values                      | Direct substitution                                                            |

---

## Problem 7: Survival Probability and Binomial Distribution

Let's solve this step-by-step and explain the **theorems** and concepts that are used at each stage.

---

## 🎯 **Problem Overview:**

* **PDF:** $f(x) = \frac{10}{x^2}$ for $x > 10$
* **Devices:** 6 independent devices.
* **Event:** We want the probability that **at least 5 out of 6** function for **at least 15 hours**.
* **Goal:** Compute the probability of this event.

---

## 🧠 Theorems and Concepts Used

We will need:

1. **Integration of PDF to find probability**
2. **Binomial distribution** for "number of successes out of trials"
3. **Summation of binomial probabilities**

---

## ✅ Step 1: Compute Single Device Survival Probability

Let $X$ be the lifetime of a device.

We are asked:
What is $P(X \geq 15)$, given that $f(x) = \frac{10}{x^2}$ for $x > 10$?

### 🔹 **Theorem:**

$$
P(X \geq a) = \int_{a}^{\infty} f(x)\, dx
$$

So:

$$
P(X \geq 15) = \int_{15}^{\infty} \frac{10}{x^2}\, dx
$$

### 🔹 **Solve the Integral:**

$$
\int_{15}^{\infty} \frac{10}{x^2} dx
= \left[-\frac{10}{x}\right]_{15}^{\infty}
= 0 + \frac{10}{15} = \frac{2}{3}
$$

### ✅ Result:

$$
p = P(\text{device lasts} \geq 15) = \frac{2}{3}
$$

---

## ✅ Step 2: Model as a Binomial Distribution

We now have a binomial experiment:

* Number of devices: $n = 6$
* Probability of success (lasting ≥15 hours): $p = \frac{2}{3}$
* Let $Z \sim \text{Binomial}(n = 6, p = \frac{2}{3})$

We want:

$$
P(Z \geq 5) = P(Z = 5) + P(Z = 6)
$$

---

## ✅ Step 3: Use Binomial PMF

### 🔹 Theorem:

$$
P(Z = k) = \binom{n}{k} p^k (1 - p)^{n - k}
$$

### 🔹 Compute for $Z = 5$:

$$
P(Z = 5) = \binom{6}{5} \left(\frac{2}{3}\right)^5 \left(\frac{1}{3}\right)^1 = 6 \cdot \frac{32}{243} \cdot \frac{1}{3} = \frac{192}{729}
$$

### 🔹 Compute for $Z = 6$:

$$
P(Z = 6) = \binom{6}{6} \left(\frac{2}{3}\right)^6 = 1 \cdot \frac{64}{729}
$$

---

## ✅ Step 4: Add the Two Probabilities

$$
P(Z \geq 5) = \frac{192}{729} + \frac{64}{729} = \frac{256}{729}
$$

Convert to decimal:

$$
\frac{256}{729} \approx \boxed{0.351}
$$

---

## ✅ Final Answer: $\boxed{0.351}$

---

## 🔗 Summary Table (Theorem → Application)

| Step | Theorem                                    | Description                                               |
| ---- | ------------------------------------------ | --------------------------------------------------------- |
| 1    | $P(X \geq a) = \int_a^\infty f(x) dx$      | Integrate the tail of the PDF to get survival probability |
| 2    | Binomial distribution                      | Used because we have multiple independent trials          |
| 3    | Binomial PMF: $\binom{n}{k}p^k(1-p)^{n-k}$ | Calculated exact probabilities for 5 and 6 successes      |
| 4    | Total probability                          | Summed two binomial terms: $P(5) + P(6)$                  |

---

## Problem 8: Expectation of a Function of a Discrete Random Variable

This is a **discrete expectation** problem involving a function of a random variable. Let’s break it down step by step and link every step to the relevant **probability theorem**.

---

## 🧠 **Theorem Behind the Problem**

We’re asked to compute:

$$
\mathbb{E}\left[\frac{1}{1 + X}\right]
$$

Where:

* $X$ is a discrete random variable
* $\mathbb{E}[g(X)] = \sum_x g(x) \cdot P(X = x)$

This is the **expected value of a function of a discrete random variable**.

---

## 🎯 Step-by-Step Solution

### 🎲 **Step 1: Understand the Random Variable $X$**

* A fair die is rolled **twice independently**.
* We define $X$ = number of times the result is **greater than 2** (i.e., one of {3, 4, 5, 6}).

$$
P(\text{face} > 2) = \frac{4}{6} = \frac{2}{3}
$$

$$
P(\text{face} \leq 2) = \frac{2}{6} = \frac{1}{3}
$$

So, $X \in \{0, 1, 2\}$, since we roll the die twice and count how many times it's >2.

### ✅ $X$ follows a **Binomial distribution**:

$$
X \sim \text{Binomial}(n=2, p=2/3)
$$

---

### 📊 **Step 2: Get PMF of $X$**

$$
P(X = k) = \binom{2}{k} \left(\frac{2}{3}\right)^k \left(\frac{1}{3}\right)^{2 - k}
$$

* $P(X = 0) = \binom{2}{0} \left(\frac{2}{3}\right)^0 \left(\frac{1}{3}\right)^2 = 1 \cdot 1 \cdot \frac{1}{9} = \frac{1}{9}$
* $P(X = 1) = \binom{2}{1} \left(\frac{2}{3}\right)^1 \left(\frac{1}{3}\right)^1 = 2 \cdot \frac{2}{3} \cdot \frac{1}{3} = \frac{4}{9}$
* $P(X = 2) = \binom{2}{2} \left(\frac{2}{3}\right)^2 \left(\frac{1}{3}\right)^0 = 1 \cdot \frac{4}{9} \cdot 1 = \frac{4}{9}$

---

### 🧮 **Step 3: Compute $\mathbb{E}\left[\frac{1}{1 + X}\right]$**

Using the expectation formula:

$$
\mathbb{E}\left[\frac{1}{1 + X}\right] = \sum_{x=0}^{2} \frac{1}{1 + x} \cdot P(X = x)
$$

Break it down:

* $x = 0 \Rightarrow \frac{1}{1+0} \cdot \frac{1}{9} = 1 \cdot \frac{1}{9} = \frac{1}{9}$
* $x = 1 \Rightarrow \frac{1}{1+1} \cdot \frac{4}{9} = \frac{1}{2} \cdot \frac{4}{9} = \frac{2}{9}$
* $x = 2 \Rightarrow \frac{1}{1+2} \cdot \frac{4}{9} = \frac{1}{3} \cdot \frac{4}{9} = \frac{4}{27}$

Now add:

$$
\frac{1}{9} + \frac{2}{9} + \frac{4}{27} = \frac{3}{9} + \frac{4}{27} = \frac{1}{3} + \frac{4}{27}
$$

Get common denominator:

$$
= \frac{9}{27} + \frac{4}{27} = \boxed{\frac{13}{27}}
$$

---

### ✅ Final Answer: **(c) $\frac{13}{27}$**

---

## 🔗 Summary Table (Theorem → Step Mapping)

| Step | Concept/Theorem Used                                          | Explanation                                                                  |
| ---- | ------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| 1    | Binomial Distribution                                         | Because each die roll is an independent Bernoulli trial (success = roll > 2) |
| 2    | PMF of Binomial                                               | Used to compute $P(X = 0), P(X = 1), P(X = 2)$                               |
| 3    | Expectation of a function $\mathbb{E}[g(X)] = \sum g(x) P(x)$ | Main formula used to evaluate $\mathbb{E}\left[\frac{1}{1+X}\right]$         |

---

## Problem 9: Memoryless Property of the Geometric Distribution (True/False)

This is a **True/False** question testing your understanding of the **memoryless property** of the **geometric distribution**.

---

## 🧠 Theorem: **Memoryless Property of the Geometric Distribution**

A **geometric random variable** $X$, which models the number of trials until the first success, satisfies the **memoryless property**:

$$
\boxed{P(X > n + k \mid X > n) = P(X > k)}
$$

This says:

> "Given that the first success did not occur in the first $n$ trials, the probability that it takes more than an additional $k$ trials is the same as it originally taking more than $k$ trials."

This is **unique** to the **geometric** and **exponential** distributions.

---

## 🔍 Step-by-Step Derivation

Let $X \sim \text{Geometric}(p)$
Then:

$$
P(X > m) = (1 - p)^m
$$

So,

### Step 1: Apply the conditional probability formula

$$
P(X > n + k \mid X > n) = \frac{P(X > n + k \text{ and } X > n)}{P(X > n)} = \frac{P(X > n + k)}{P(X > n)}
$$

### Step 2: Plug in the geometric probability:

$$
= \frac{(1 - p)^{n + k}}{(1 - p)^n} = (1 - p)^k = P(X > k)
$$

✅ **So the equation is true.**

---

## ✅ Final Answer: **True**

---

## 🔗 Summary Table

| Concept                 | Used                         |
| ----------------------- | ---------------------------- |
| Geometric Distribution  | Yes                          |
| Memoryless Property     | Yes                          |
| Conditional Probability | Yes                          |
| Simplification          | Done via powers of $(1 - p)$ |
