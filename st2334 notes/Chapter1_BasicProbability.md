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

## Summary
This chapter lays the foundation for probability by defining experiments, outcomes, and events, and providing tools to calculate probabilities. Key is understanding how to model real-world scenarios into mathematical sets and apply counting and probability rules.