# ST2334 Notes: Chapter 1 - Basic Concepts of Probability

## 1. Probability Concepts and Definitions

### Experiment, Sample Space, and Events
- **Experiment**: Any activity with uncertain outcomes, like rolling a die or flipping a coin. We study what might happen.
- **Sample Space (S)**: The complete list of all possible results. It depends on what you're measuring.
  - Example: Rolling a die for the number: S = {1,2,3,4,5,6}.
  - If measuring even/odd: S = {even, odd}.
- **Sample Point**: One specific outcome, like "3" or "even".
- **Event**: A group of outcomes you're interested in, like "rolling an even number" = {2,4,6}.
  - Sure event: S (always happens).
  - Null event: Empty set ∅ (never happens).

### Key Points
- The sample space is not fixed; it changes based on the problem's focus.
- Events can be simple (one outcome) or compound (multiple outcomes).

## 2. Event Operations and Relationships

### Basic Operations
- **Union (A ∪ B)**: Outcomes in A or B or both. "A or B happens." Example: Rolling 1 or 2 = {1,2}.
- **Intersection (A ∩ B or AB)**: Outcomes in both A and B. "Both A and B happen." Example: Even and >3 = {4,6}.
- **Complement (A')**: Outcomes not in A. "A does not happen." Example: Not even = {1,3,5}.
- **Union/Intersection of Multiple**: Extends to more events.

### Relationships
- **Mutually Exclusive**: A and B can't both happen (A ∩ B = ∅). Example: Rolling 1 and 2 (impossible).
- **Contained (A ⊂ B)**: All of A is part of B. Example: {2} ⊂ {2,4,6}.
- **Equivalent**: A = B if they have the same outcomes.

### De Morgan's Laws
- (A ∪ B)' = A' ∩ B' (not A or B = not A and not B).
- (A ∩ B)' = A' ∪ B' (not both = not A or not B).
- Example: Not (even or odd) = not even and not odd = impossible.

### Properties
- A and not A = nothing (A ∩ A' = ∅).
- A or not A = everything (A ∪ A' = S).
- Not not A = A.
- Distributive: A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C).

## 3. Counting Methods

### Fundamental Principles
- **Multiplication**: If choice 1 has m options, choice 2 has n, total = m × n. Example: 3 shirts × 2 pants = 6 outfits.
- **Addition**: If mutually exclusive choices, total = sum. Example: 3 ways to go left + 2 right = 5 total.

### Permutations and Combinations
- **Permutation**: Ordered arrangements. $P(n,r) = \frac{n!}{(n-r)!}$ — ways to pick r from n in order.
  - **Inputs needed**: n (total items), r (items to arrange).
  - Example: Arrange 3 books from 5: $5 \times 4 \times 3 = 60$.
- **Combination**: Unordered groups. $C(n,r) = \frac{n!}{r! (n-r)!}$ — ways to pick r from n without order.
  - **Inputs needed**: n (total items), r (items to choose).
  - Example: Teams of 3 from 5: 10 ways.
- **Combinations with Repetition**: Unordered groups where items can repeat. $C(n + r - 1, r)$ — ways to choose r items from n with replacement/order irrelevant.
  - **Inputs needed**: n (distinct items), r (selections).
  - **Logic**: Uses "stars and bars" theorem. Imagine r identical "stars" (selections) and n-1 "bars" (dividers between n groups). Total positions: r + (n-1) = n+r-1. Choose r positions for stars: C(n+r-1, r).
    - **How it works for dice**: For 2 dice (r=2) from 1-6 (n=6), arrange 2 stars and 5 bars in a line. Each arrangement represents counts in 6 bins (e.g., * * | | | | | | = 2 in bin1 → (1,1); * | * | | | | | = 1 in bin1, 1 in bin2 → (1,2)). Since bins are ordered (1-6), (1,2) is distinct from (2,1)—order doesn't matter because we treat the pair as unordered.
  - Example: Two dice (1-6), order doesn't matter: C(6+2-1, 2) = C(7,2) = 21 ways ((1,1), (1,2), ..., (6,6)).

#### Breakdown for Two Selections from {1,2,3,4,5,6} (e.g., Two Dice)
- **Permutations with Repetition** (ordered, repeats allowed): Each selection is distinct, order matters. Total: 6 × 6 = 36.
  - Examples: (1,1), (1,2), (2,1), (6,6). Includes all ordered pairs.
  - Use when: Selections are distinguishable (e.g., Die A and Die B), and order matters.
- **Permutations without Repetition** (ordered, no repeats): Ordered pairs with distinct numbers. Total: P(6,2) = 30.
  - Examples: (1,2), (2,1), but not (1,1). Excludes doubles.
  - Use when: Ordered, but no identical outcomes allowed.
- **Combinations without Repetition** (unordered, no repeats): Unordered pairs with distinct numbers. Total: C(6,2) = 15.
  - Examples: {1,2} (same as {2,1}), but not {1,1}.
  - Use when: Order doesn't matter, and no repeats (e.g., choosing 2 distinct numbers).
- **Combinations with Repetition** (unordered, repeats allowed): Unordered pairs with repeats. Total: C(6+2-1,2) = 21.
  - Examples: {1,1}, {1,2} (same as {2,1}), {6,6}.
  - Use when: Order doesn't matter, but repeats are allowed (e.g., two dice outcomes where (1,2) ≡ (2,1)).

### Applications
- Calculate probabilities when outcomes equally likely.
- Example: Deck of cards—$P(\text{ace}) = \frac{4}{52}$.

## 4. Probability Axioms and Rules

### Classical Probability
- **Idea**: If all outcomes equally likely, $P(E) = \frac{\text{favorable outcomes}}{\text{total outcomes}}$.
  - **Inputs needed**: number of favorable outcomes, total outcomes.
- **Example**: Fair die, $P(\text{rolling 4}) = \frac{1}{6}$.

### Axioms of Probability
1. **Non-negative**: $0 \leq P(E) \leq 1$ for any event E.
2. **Sure Event**: $P(S) = 1$ (sample space always happens).
3. **Additivity**: For mutually exclusive events, $P(E_1 \cup E_2 \cup \dots) = P(E_1) + P(E_2) + \dots$

### Rules
- **Complement**: $P(E') = 1 - P(E)$ (chance it doesn't happen).
  - **Inputs needed**: P(E).
- **Addition**: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$ (add, subtract overlap).
  - **Inputs needed**: P(A), P(B), P(A ∩ B).
- **Conditional**: $P(A|B) = \frac{P(A \cap B)}{P(B)}$ (chance A given B happened).
  - **Inputs needed**: P(A ∩ B), P(B).
- **Multiplication**: $P(A \cap B) = P(A) \times P(B|A) = P(B) \times P(A|B)$.
  - **Inputs needed**: P(A), P(B|A) or P(B), P(A|B).
- **Independence**: $P(A \cap B) = P(A) \times P(B)$ (one doesn't affect the other).
  - **Inputs needed**: P(A), P(B).
- **Bayes' Theorem**: Updates beliefs: $P(A|B) = \frac{P(B|A) \times P(A)}{P(B)}$.
- **Conditions for Using Bayes' Theorem**:
  - **Partition of Sample Space**: Events A1, A2, ... form a partition. Reason: Ensures denominators sum correctly.
  - **Conditional Probabilities Known**: P(B|Ai) and P(Ai) available. Reason: Needed to compute posterior.
  - **Prior Beliefs**: Initial P(Ai) based on prior knowledge. Reason: Incorporates existing information.
  - **Result**: Posterior P(Ai|B) = \frac{P(B|Ai) P(Ai)}{\sum P(B|Aj) P(Aj)}.

### Example Calculations
- **Tree Diagrams**: For sequences (e.g., two coin flips).
- **Venn Diagrams**: Visualize unions/intersections.

## Question Types and Formulas Summary Table

| **Question Type**              | **Description**                        | **Formula**                 | **When to Use**                                 |
| ------------------------------ | -------------------------------------- | --------------------------- | ----------------------------------------------- |
| **Classical Probability**      | Equally likely outcomes                | P(E) = favorable/total      | Fair dice, cards, coins                         |
| **Permutations (no repeat)**   | Ordered arrangements, distinct items   | P(n,r) = n!/(n-r)!          | Arranging people in line, passwords             |
| **Permutations (with repeat)** | Ordered arrangements, items can repeat | n^r                         | License plates, multiple trials                 |
| **Combinations (no repeat)**   | Unordered groups, distinct items       | C(n,r) = n!/[r!(n-r)!]      | Choosing teams, lottery numbers                 |
| **Combinations (with repeat)** | Unordered groups, items can repeat     | C(n+r-1,r)                  | Dice outcomes (order irrelevant), distributions |
| **Multinomial Arrangements**   | Arranging identical groups             | n!/(n₁!×n₂!×...×nₖ!)        | Trees of same type, letters in words            |
| **Conditional Probability**    | Probability given information          | P(A\|B) = P(A∩B)/P(B)       | Medical tests, card draws                       |
| **Addition Rule**              | Union of events                        | P(A∪B) = P(A)+P(B)-P(A∩B)   | At least one event occurs                       |
| **Multiplication Rule**        | Intersection of events                 | P(A∩B) = P(A)×P(B\|A)       | Both events occur                               |
| **Independence**               | Events don't affect each other         | P(A∩B) = P(A)×P(B)          | Separate coin flips, dice rolls                 |
| **Complement Rule**            | Event doesn't occur                    | P(A') = 1 - P(A)            | "At least one" vs "none"                        |
| **Bayes' Theorem**             | Update probabilities                   | P(A\|B) = P(B\|A)×P(A)/P(B) | Diagnostic tests, prior beliefs                 |

## Summary
This chapter lays the foundation for probability by defining experiments, outcomes, and events, and providing tools to calculate probabilities. Key is understanding how to model real-world scenarios into mathematical sets and apply counting and probability rules.