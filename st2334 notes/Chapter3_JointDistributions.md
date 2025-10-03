# ST2334 Notes: Chapter 3 - Joint Distributions

## 1. Joint Distributions for Multiple Random Variables

### Two-Dimensional Random Vector
- (X,Y): Pair of RVs giving numbers from outcomes.
- Range: RX,Y = possible (x,y) pairs.
- Extends to n dimensions.

### Types
- Discrete: Finite/countable pairs.
- Continuous: Region in 2D space.

### Example
- TV age and defects: (X,Y) = (5,3).

## 2. Joint Probability Functions

### Discrete Joint PMF
- $f(x,y) = P(X=x \cap Y=y)$.
  - **Inputs needed**: x, y (values).
- Properties: $f \geq 0$, $\sum f = 1$, $P$ in region = sum $f$.
- Example: Dice rolls.

### Continuous Joint PDF
- $f(x,y)$: $P$ in area = $\iint f \, dx \, dy$.
  - **Inputs needed**: x, y (values).
- Properties: $f \geq 0$, $\iint f \, dx \, dy = 1$.
- Example: Heights and weights.

## 3. Marginal Distributions

### What are Marginals?
- The individual probability distributions for one variable, ignoring the other.
- Like looking at just X or just Y from the pair (X,Y).

### How to Get Them
- **Discrete**: For X, sum the joint probabilities over all possible Y values.
  - **Inputs needed**: joint PMF f(x,y), y values.
- **Continuous**: For X, integrate (add up) the joint PDF over all Y values.
  - **Inputs needed**: joint PDF f(x,y), y.
- Think of it as "collapsing" the joint table or graph to one dimension.

### Example
- If (X,Y) is joint for height and weight, marginal of X is just the height distribution across all people.

## 4. Differentiation and Integration Operations

### Starting from Joint CDF F(x,y) = P(X ≤ x, Y ≤ y):

**Differentiate by x**: ∂F(x,y)/∂x → f_Y(y|x) (conditional density of Y given x)
**Differentiate by y**: ∂F(x,y)/∂y → f_X(x|y) (conditional density of X given y)
**Differentiate by both**: ∂²F(x,y)/∂x∂y → f(x,y) (joint PDF)

### Starting from Joint PDF f(x,y):

**Integrate over y**: ∫ f(x,y) dy → f_X(x) (marginal PDF of X)
**Integrate over x**: ∫ f(x,y) dx → f_Y(y) (marginal PDF of Y)
**Double integrate**: ∫∫ f(x,y) dx dy → 1 (total probability)
**Integrate over region R**: ∫∫_R f(x,y) dx dy → P((X,Y) ∈ R)

### Starting from Marginal f_X(x):

**Integrate**: ∫ f_X(x) dx → F_X(x) (marginal CDF of X)
**Differentiate F_X(x)**: dF_X(x)/dx → f_X(x) (back to marginal PDF)

### Summary Chain:
F(x,y) ←→ f(x,y) ←→ f_X(x), f_Y(y) ←→ F_X(x), F_Y(y)
(differentiate/integrate) (integrate/sum) (integrate/differentiate)

## 5. Conditional Distributions

### What is Conditional?
- The probability of Y given that X has a specific value.
- Shows how Y behaves when we know X.

### How to Compute
- Divide the joint probability by the marginal of X.
  - **Inputs needed**: joint probability or PDF, marginal of X, x, y.
- For discrete: P(Y=y | X=x) = P(X=x and Y=y) / P(X=x).
- For continuous: Similar, using PDFs.

### Conditional Expectation
- The average value of Y when X is fixed at x.
  - **Inputs needed**: conditional distribution of Y given X=x, y values.
- Like the expected weight for people of a certain height.

### Independence
- X and Y are independent if knowing X tells you nothing about Y.
- Mathematically: The joint probability factors into separate probabilities for X and Y.
  - **Inputs needed**: joint PMF or PDF f(x,y), marginal f_X(x), f_Y(y).
- **Conditions for Checking Independence**:
  - **Joint and Marginal Functions Known**: f(x,y), f_X(x), f_Y(y) available. Reason: To check factorization f(x,y) = f_X(x) f_Y(y).
  - **Product Space**: Range is all combinations. Reason: Ensures no forced dependence.
  - **No Constraints**: No relations like x + y = constant. Reason: Constraints create dependence.
  - **Result**: If factorization holds, X and Y are independent.
- Example:
  ```
  Coin flip and die roll are independent; knowing the coin doesn't affect the die.
  ```

## 5. Covariance and Correlation

### Covariance
- Measures how two variables change together.
- Positive: Both increase/decrease together (e.g., height and weight).
- Negative: One increases as the other decreases.
- Zero: No linear relationship (but could still be related in other ways).

### How to Calculate
- $\text{Cov} = E[(X - \mu_X)(Y - \mu_Y)]$.
  - **Inputs needed**: X and Y values or E[XY], E[X], E[Y].
- Or: $E[XY] - E[X] E[Y]$.

### Correlation Coefficient
- Standardized covariance, between -1 and 1.
  - **Inputs needed**: Cov(X,Y), Var(X), Var(Y).
- 1: Perfect positive linear relationship.
- -1: Perfect negative.
- 0: No linear relationship.
- Easier to interpret than covariance.

### Example
- Covariance of study time and exam score: Positive, since more study usually means higher score.

## Summary
Joint distributions describe pairs of variables. Marginals give single-variable views; conditionals show dependence. Covariance and correlation measure how variables relate linearly.