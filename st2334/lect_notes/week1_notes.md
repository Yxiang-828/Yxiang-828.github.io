# ST2334 Week 1: Probability Basics & Counting Methods

## 1. Learning Objectives
- [ ] Master fundamental probability terminology and concepts
- [ ] Apply event operations (union, intersection, complement)
- [ ] Use counting principles for probability calculations
- [ ] Solve problems using permutations and combinations

## 2. Key Terminology & Definitions

### 2.1 Core Probability Definitions

> **Definition 1.1: Statistical Experiment**
> 
> A statistical experiment is any procedure that produces data or observations.

> **Definition 1.2: Sample Space (S)**
> 
> The sample space, denoted by S, is the set of all possible outcomes of a statistical experiment.
> 
> **Important**: The sample space depends on the problem of interest!

> **Definition 1.3: Sample Point**
> 
> A sample point is an outcome (element) in the sample space.

> **Definition 1.4: Event**
> 
> An event is a subset of the sample space.

### 2.2 Special Events

> **Definition 1.5: Sure Event**
> 
> The sample space S is itself an event and is called a sure event.

> **Definition 1.6: Null Event**
> 
> An event that contains no element is the empty set, denoted by ∅, and is called a null event.

### 2.3 Event Operations

> **Definition 1.7: Union (A ∪ B)**
> 
> The union of events A and B, denoted by A∪B, is the event containing all elements that belong to A or B or both.
> 
> **Mathematical Form**: A∪B = {x : x ∈ A or x ∈ B}

> **Definition 1.8: Intersection (A ∩ B)**
> 
> The intersection of events A and B, denoted by A ∩ B or simply AB, is the event containing elements that belong to both A and B.
> 
> **Mathematical Form**: A∩B = {x : x ∈ A and x ∈ B}

> **Definition 1.9: Complement (A')**
> 
> The complement of event A, denoted by A', is the event containing all elements in S that do not belong to A.

### 2.4 Event Relationships

> **Definition 1.10: Mutually Exclusive Events**
> 
> Events A and B are mutually exclusive if A ∩ B = ∅

> **Definition 1.11: Contained Events**
> 
> Event A is contained in event B (A ⊆ B) if every element of A is also in B.

## 3. Core Theorems & Properties

### 3.1 Probability Axioms

> **Axiom 1**: P(A) ≥ 0 for any event A
> 
> **Axiom 2**: P(S) = 1
> 
> **Axiom 3**: For mutually exclusive events A₁, A₂, ..., Aₙ:
> P(A₁ ∪ A₂ ∪ ... ∪ Aₙ) = P(A₁) + P(A₂) + ... + P(Aₙ)

### 3.2 Fundamental Properties

> **Property 1**: P(A') = 1 - P(A)

> **Property 2**: P(∅) = 0

> **Property 3: Addition Rule**
> P(A ∪ B) = P(A) + P(B) - P(A ∩ B)

### 3.3 De Morgan's Laws

> **Theorem 1.1: De Morgan's Laws**
> 
> For any events A and B:
> 1. (A ∪ B)' = A' ∩ B'
> 2. (A ∩ B)' = A' ∪ B'
> 
> **Extension**: For n events A₁, A₂, ..., Aₙ:
> 1. (A₁ ∪ A₂ ∪ ... ∪ Aₙ)' = A₁' ∩ A₂' ∩ ... ∩ Aₙ'
> 2. (A₁ ∩ A₂ ∩ ... ∩ Aₙ)' = A₁' ∪ A₂' ∪ ... ∪ Aₙ'

## 4. Counting Principles

### 4.1 Multiplication Principle

> **Theorem 1.2: Multiplication Principle**
> 
> If r different experiments are performed sequentially where:
> - Experiment 1 has n₁ possible outcomes
> - Experiment 2 has n₂ possible outcomes for each outcome of experiment 1
> - ...
> - Experiment r has nᵣ possible outcomes
> 
> Then there are n₁ × n₂ × ... × nᵣ possible outcomes for all r experiments.

### 4.2 Addition Principle

> **Theorem 1.3: Addition Principle**
> 
> If an experiment can be performed by k different procedures where:
> - Procedure 1 can be carried out in n₁ ways
> - Procedure 2 can be carried out in n₂ ways
> - ...
> - Procedure k can be carried out in nₖ ways
> 
> And the ways under different procedures do not overlap, then the total number of ways is:
> n₁ + n₂ + ... + nₖ

### 4.3 Permutations

> **Definition 1.12: Permutation**
> 
> A permutation is a selection and arrangement of r objects out of n objects where order matters.
> 
> **Formula**: P(n,r) = n!/(n-r)! = n(n-1)(n-2)...(n-(r-1))
> 
> **Special Case**: When r = n, P(n,n) = n!

### 4.4 Combinations

> **Definition 1.13: Combination**
> 
> A combination is a selection of r objects out of n objects where order does not matter.
> 
> **Formula**: C(n,r) = n!/(r!(n-r)!)
> 
> **Relationship**: C(n,r) = P(n,r)/r!

## 5. Worked Examples

### Example 1: Sample Space Definition
**Problem**: Consider rolling a die. Define the sample space for different problems of interest.

**Solution**:
(i) Problem: "Number showing on top face"
- Sample space: S = {1, 2, 3, 4, 5, 6}
- Sample points: 1, 2, 3, 4, 5, or 6
- Example events: 
  - Odd number: {1, 3, 5}
  - Number > 4: {5, 6}

(ii) Problem: "Whether number is even or odd"
- Sample space: S = {even, odd}
- Sample points: "even" or "odd"
- Example event: Odd number occurs = {odd}

### Example 2: Event Operations
**Problem**: Given S = {1,2,3,4,5,6}, A = {1,2,3}, B = {1,3,5}, C = {2,4,6}

**Solution**:
- A' = {4,5,6}, B' = {2,4,6}, C' = {1,3,5}
- A ∪ B = {1,2,3,5}
- A ∩ B = {1,3}

**Verification of De Morgan's Law**:
- (A ∪ B)' = {1,2,3,5}' = {4,6}
- A' ∩ B' = {4,5,6} ∩ {2,4,6} = {4,6} ✓

### Example 3: Counting Applications
**Problem**: How many 4-letter code words can be formed using different letters?

**Solution**:
- n = 26 alphabets, r = 4 positions
- Since all letters must be different, use permutations
- P(26,4) = 26 × 25 × 24 × 23 = 358,800

### Example 4: Committee Selection
**Problem**: From 4 women and 3 men, form committees of size 3 with 2 women and 1 man.

**Solution**:
- Ways to select 2 women from 4: C(4,2) = 6
- Ways to select 1 man from 3: C(3,1) = 3
- Total committees: C(4,2) × C(3,1) = 6 × 3 = 18

## 6. Problem-Solving Strategies

### For Probability Problems
1. **Identify the sample space** based on problem context
2. **Define events clearly** using set notation
3. **Apply appropriate probability rules** (addition, complement)
4. **Check for mutual exclusivity** before adding probabilities

### For Counting Problems
1. **Determine if order matters** (permutation vs combination)
2. **Check for restrictions** (with/without replacement)
3. **Use multiplication principle** for sequential choices
4. **Use addition principle** for alternative methods

## 7. Common Pitfalls & Mistakes

### Mistake 1: Confusing Sample Space Definition
- **Error**: Using same sample space for different problems
- **Correction**: Sample space depends on the problem of interest

### Mistake 2: Misapplying Addition Rule
- **Error**: P(A ∪ B) = P(A) + P(B) always
- **Correction**: P(A ∪ B) = P(A) + P(B) - P(A ∩ B)

### Mistake 3: Permutation vs Combination
- **Error**: Using permutation when order doesn't matter
- **Correction**: Ask "Does order matter?" to choose correctly

## 8. Quick Reference Summary

### Essential Formulas
| Concept | Formula | When to Use |
|---------|---------|-------------|
| Addition Rule | P(A ∪ B) = P(A) + P(B) - P(A ∩ B) | Any two events |
| Complement | P(A') = 1 - P(A) | Finding "not A" |
| Permutation | P(n,r) = n!/(n-r)! | Order matters |
| Combination | C(n,r) = n!/(r!(n-r)!) | Order doesn't matter |

### Event Operations
- **Union (∪)**: "or" - at least one occurs
- **Intersection (∩)**: "and" - both occur
- **Complement (')**: "not" - event doesn't occur

## 9. Review Questions
- [ ] Can I define sample space for any given experiment?
- [ ] Can I apply De Morgan's laws correctly?
- [ ] Can I distinguish when to use permutations vs combinations?
- [ ] Can I solve probability problems using addition and complement rules?
- [ ] Can I verify answers using different approaches?
