# ST2334 Week 1 Notes: Probability Basics

## 1. Basic Concepts

### Sample Space & Events
- **Sample Space (S)**: All possible outcomes of an experiment
- **Event**: Subset of sample space
- **Sample Point**: Individual outcome

**Example**: Rolling a die
- S = {1,2,3,4,5,6}
- Event A = "odd number" = {1,3,5}

## 2. Event Operations

### Union (A ∪ B)
Elements in A or B (or both)

### Intersection (A ∩ B) 
Elements in both A and B

### Complement (A')
Elements not in A

### Key Laws
- **De Morgan's Laws**:
  - (A ∪ B)' = A' ∩ B'
  - (A ∩ B)' = A' ∪ B'

## 3. Counting Methods

### Permutations (Order Matters)
- Selecting r objects from n objects
- Formula: P(n,r) = n!/(n-r)!

**Example**: 4-letter codes with different letters
- P(26,4) = 26 × 25 × 24 × 23 = 358,800

### Combinations (Order Doesn't Matter)
- Selecting r objects from n objects
- Formula: C(n,r) = n!/(r!(n-r)!)

**Example**: Committee of 3 (2 women, 1 man) from 4 women and 3 men
- C(4,2) × C(3,1) = 6 × 3 = 18

## 4. Probability

### Three Axioms
1. P(A) ≥ 0 for any event A
2. P(S) = 1
3. P(A ∪ B) = P(A) + P(B) if A and B are mutually exclusive

### Key Properties
- P(A') = 1 - P(A)
- P(∅) = 0
- **Addition Rule**: P(A ∪ B) = P(A) + P(B) - P(A ∩ B)

### For Equally Likely Outcomes
P(A) = Number of favorable outcomes / Total number of outcomes

## 5. Practice Problem Solutions

### Problem 1: 3-digit numbers ≥ 301
Using digits {0,1,2,3,4,5,6}, each at most once:
- Case 1: Hundreds = 3: 6 × 5 = 30 ways
- Case 2: Hundreds = 4,5,6: 3 × 6 × 5 = 90 ways
- **Total**: 120

### Problem 2: Boys vs Girls selection
7 boys, 8 girls, select 3. P(boys > girls):
- 3 boys: C(7,3) = 35
- 2 boys, 1 girl: C(7,2) × C(8,1) = 168
- **Answer**: (35 + 168)/C(15,3) = 203/455

### Problem 3: Car dealer probability
P(neither used nor Japanese) = 0.55, P(used) = 0.25, P(Japanese) = 0.30
- P(used ∪ Japanese) = 1 - 0.55 = 0.45
- P(used ∩ Japanese) = 0.25 + 0.30 - 0.45 = **0.10**

## Key Tips for Exams
1. **Define events clearly** before solving
2. **Use combinations** for unordered selection
3. **Apply inclusion-exclusion** for union probabilities
4. **Break complex problems into cases**
5. **Check if events are mutually exclusive** before adding probabilities
