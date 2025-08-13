# ST2334 Week 1: Probability Foundations, Counting Methods & Conditional Probability

## 1. Learning Objectives
- [ ] Master fundamental probability terminology and concepts
- [ ] Apply event operations (union, intersection, complement)
- [ ] Use counting principles for probability calculations
- [ ] Solve problems using permutations and combinations
- [ ] Apply conditional probability and independence concepts
- [ ] Use Law of Total Probability and Bayes' Theorem
- [ ] Distinguish between equally likely outcomes and general cases

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

### 2.5 Probability Concepts

> **Definition 1.12: Probability Function**
> 
> Probability, denoted by P(·), is a function on the collection of events that assigns a number to each event, representing the likelihood of occurrence.

> **Definition 1.13: Relative Frequency**
> 
> If an experiment E is repeated n times and event A occurs nₐ times, then fₐ = nₐ/n is called the relative frequency of event A.
> 
> **Important**: As n → ∞, fₐ → P(A)

> **Definition 1.14: Conditional Probability**
> 
> For events A and B with P(A) > 0, the conditional probability of B given A is:
> P(B|A) = P(A ∩ B)/P(A)

> **Definition 1.15: Independence**
> 
> Events A and B are independent if P(A ∩ B) = P(A)P(B), denoted A ⊥ B.
> 
> **Equivalent Condition**: A ⊥ B if and only if P(B|A) = P(B) (when P(A) > 0)

> **Definition 1.16: Partition**
> 
> Events A₁, A₂, ..., Aₙ form a partition of S if they are mutually exclusive and ∪ᵢ₌₁ⁿ Aᵢ = S.

## 3. Core Theorems & Properties

### 3.1 Probability Axioms

> **Axiom 1**: P(A) ≥ 0 for any event A
> 
> **Axiom 2**: P(S) = 1
> 
> **Axiom 3**: For mutually exclusive events A₁, A₂, ..., Aₙ:
> P(A₁ ∪ A₂ ∪ ... ∪ Aₙ) = P(A₁) + P(A₂) + ... + P(Aₙ)

### 3.2 Fundamental Properties

> **Proposition 1**: P(∅) = 0
> 
> **Proof**: Since ∅ ∩ ∅ = ∅ and ∅ = ∅ ∪ ∅, by Axiom 3:
> P(∅) = P(∅ ∪ ∅) = P(∅) + P(∅) = 2P(∅)
> Therefore P(∅) = 0. ∎

> **Proposition 2**: P(A') = 1 - P(A)
> 
> **Proof**: Since S = A ∪ A' and A ∩ A' = ∅, by Axioms 2 and 3:
> 1 = P(S) = P(A ∪ A') = P(A) + P(A')
> Therefore P(A') = 1 - P(A). ∎

> **Proposition 3**: For any two events A and B:
> P(A) = P(A ∩ B) + P(A ∩ B')
> 
> **Proof**: Since A = (A ∩ B) ∪ (A ∩ B') and (A ∩ B) ∩ (A ∩ B') = ∅,
> by Axiom 3: P(A) = P(A ∩ B) + P(A ∩ B'). ∎

> **Proposition 4: Addition Rule**
> 
> For any two events A and B:
> P(A ∪ B) = P(A) + P(B) - P(A ∩ B)
> 
> **Proof**: Since A ∪ B = B ∪ (A ∩ B') and B ∩ (A ∩ B') = ∅,
> P(A ∪ B) = P(B) + P(A ∩ B') = P(B) + P(A) - P(A ∩ B). ∎

> **Proposition 5**: If A ⊆ B, then P(A) ≤ P(B)
> 
> **Proof**: Since A ⊆ B, we have B = A ∪ (B ∩ A') and A ∩ (B ∩ A') = ∅.
> By Axiom 3: P(B) = P(A) + P(B ∩ A') ≥ P(A). ∎

> **Proposition 6**: For mutually exclusive events A₁, A₂, ..., Aₙ:
> P(A₁ ∪ A₂ ∪ ... ∪ Aₙ) = P(A₁) + P(A₂) + ... + P(Aₙ)
> 
> **Proof**: By induction using Axiom 3. ∎

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

### 3.4 Conditional Probability Rules

> **Theorem 1.2: Multiplication Rule**
> 
> For any events A and B:
> - P(A ∩ B) = P(A)P(B|A) if P(A) ≠ 0
> - P(A ∩ B) = P(B)P(A|B) if P(B) ≠ 0

> **Theorem 1.3: Inverse Probability Formula**
> 
> For events A and B with P(B) > 0:
> P(A|B) = P(A)P(B|A)/P(B)

### 3.5 Independence Properties

> **Theorem 1.4: Independence Equivalences**
> 
> For events A and B, the following are equivalent:
> 1. A and B are independent
> 2. P(A ∩ B) = P(A)P(B)
> 3. P(B|A) = P(B) (when P(A) > 0)
> 4. P(A|B) = P(A) (when P(B) > 0)

### 3.6 Law of Total Probability

> **Theorem 1.5: Law of Total Probability**
> 
> If A₁, A₂, ..., Aₙ form a partition of S, then for any event B:
> P(B) = Σᵢ₌₁ⁿ P(B ∩ Aᵢ) = Σᵢ₌₁ⁿ P(Aᵢ)P(B|Aᵢ)
> 
> **Special Case**: For any events A and B:
> P(B) = P(A)P(B|A) + P(A')P(B|A')

### 3.7 Bayes' Theorem

> **Theorem 1.6: Bayes' Theorem**
> 
> Let A₁, A₂, ..., Aₙ be a partition of S. For any event B and k = 1,2,...,n:
> P(Aₖ|B) = P(Aₖ)P(B|Aₖ) / Σᵢ₌₁ⁿ P(Aᵢ)P(B|Aᵢ)
> 
> **Special Case**: For events A and B:
> P(A|B) = P(A)P(B|A) / [P(A)P(B|A) + P(A')P(B|A')]

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
> 
> **Important Property**: C(n,r) = C(n,n-r)

### 4.5 Equally Likely Outcomes

> **Principle 1.7: Equally Likely Outcomes**
> 
> For a sample space S = {a₁, a₂, ..., aₖ} where all outcomes are equally likely:
> P(aᵢ) = 1/k for all i
> 
> For any event A ⊆ S:
> P(A) = |A|/|S| = (number of favorable outcomes)/(total number of outcomes)

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

### Example 5: Fair Coin Probability
**Problem**: A coin is tossed. Find P(H) if:
(i) The coin is fair
(ii) A head is twice as likely as a tail

**Solution**:
Sample space: S = {H, T}

(i) Fair coin: P(H) = P(T)
Using P(S) = 1: P(H) + P(T) = 1
Therefore: 2P(H) = 1, so P(H) = 1/2

(ii) Biased coin: P(H) = 2P(T)
Using P(S) = 1: P(H) + P(T) = 1
Substituting: 2P(T) + P(T) = 1
Therefore: P(T) = 1/3 and P(H) = 2/3

### Example 6: Credit Card Acceptance
**Problem**: A store accepts American Express or VISA. 24% carry AmEx, 61% carry VISA, 11% carry both. What's the probability a customer carries an accepted card?

**Solution**:
Let A = {AmEx}, V = {VISA}
Given: P(A) = 0.24, P(V) = 0.61, P(A ∩ V) = 0.11

Using addition rule:
P(A ∪ V) = P(A) + P(V) - P(A ∩ V)
P(A ∪ V) = 0.24 + 0.61 - 0.11 = 0.74

### Example 7: Bolts and Nuts
**Problem**: Box contains 50 bolts, 150 nuts. Half of each are rusted. If one item is chosen randomly, find P(rusted or bolt).

**Solution**:
Total items: 200
- Rusted items: 25 bolts + 75 nuts = 100
- Bolts: 50
- Rusted bolts: 25

Let A = {rusted}, B = {bolt}
P(A) = 100/200 = 1/2
P(B) = 50/200 = 1/4
P(A ∩ B) = 25/200 = 1/8

P(A ∪ B) = P(A) + P(B) - P(A ∩ B) = 1/2 + 1/4 - 1/8 = 5/8

### Example 8: Conditional Probability - Dice
**Problem**: Roll a fair die twice.
(i) P(sum is even)
(ii) P(sum is even | first roll is 5)

**Solution**:
(i) Sample space: 36 equally likely outcomes
Even sums occur when both dice have same parity
P(sum even) = 18/36 = 1/2

(ii) Given first roll is 5, sample space reduces to:
{(5,1), (5,2), (5,3), (5,4), (5,5), (5,6)}
Even sums: (5,1), (5,3), (5,5) → 3 outcomes
P(sum even | first = 5) = 3/6 = 1/2

### Example 9: Card Drawing Without Replacement
**Problem**: Draw 2 cards from deck without replacement. Find P(both aces).

**Solution**:
Using multiplication rule:
P(both aces) = P(1st ace) × P(2nd ace | 1st ace)
P(both aces) = (4/52) × (3/51) = 12/2652 = 1/221

### Example 10: Independence - Rolling Dice
**Problem**: Roll 2 fair dice. Check independence for:
(i) A₆ = {sum is 6}, B = {first die is 4}
(ii) A₇ = {sum is 7}, B = {first die is 4}

**Solution**:
(i) P(A₆) = 5/36, P(B) = 1/6, P(A₆ ∩ B) = 1/36
Check: P(A₆)P(B) = (5/36)(1/6) = 5/216 ≠ 1/36
Therefore A₆ and B are dependent.

(ii) P(A₇) = 6/36 = 1/6, P(B) = 1/6, P(A₇ ∩ B) = 1/36
Check: P(A₇)P(B) = (1/6)(1/6) = 1/36 = P(A₇ ∩ B)
Therefore A₇ and B are independent.

### Example 11: Law of Total Probability - Fish Frying
**Problem**: Chef burns fish with P = 0.1, assistant burns with P = 0.23. Chef cooks 80% of time. Find P(fish is burnt).

**Solution**:
Let B = {burnt}, C = {chef cooks}
Given: P(B|C) = 0.1, P(B|C') = 0.23, P(C) = 0.8

Using Law of Total Probability:
P(B) = P(C)P(B|C) + P(C')P(B|C')
P(B) = (0.8)(0.1) + (0.2)(0.23) = 0.08 + 0.046 = 0.126

### Example 12: Bayes' Theorem - House Collapse
**Problem**: P(faulty design) = 0.01. If faulty, P(collapse) = 0.75. If not faulty, P(collapse) = 0.0001. Given collapse occurred, find P(faulty design).

**Solution**:
Let F = {faulty}, C = {collapse}
Given: P(F) = 0.01, P(C|F) = 0.75, P(C|F') = 0.0001

First find P(C) using Law of Total Probability:
P(C) = P(F)P(C|F) + P(F')P(C|F')
P(C) = (0.01)(0.75) + (0.99)(0.0001) = 0.0075 + 0.000099 = 0.007599

Using Bayes' Theorem:
P(F|C) = P(F)P(C|F)/P(C) = (0.01)(0.75)/0.007599 = 0.9870

**Key Insight**: Despite low prior probability (1%), the high likelihood ratio makes faulty design very probable given collapse.

## 6. Problem-Solving Strategies

### For Probability Problems
1. **Identify the sample space** based on problem context
2. **Define events clearly** using set notation
3. **Apply appropriate probability rules** (addition, complement)
4. **Check for mutual exclusivity** before adding probabilities
5. **Use conditional probability** when partial information is given
6. **Apply Law of Total Probability** for complex scenarios
7. **Use Bayes' Theorem** for inverse probability problems

### For Counting Problems
1. **Determine if order matters** (permutation vs combination)
2. **Check for restrictions** (with/without replacement)
3. **Use multiplication principle** for sequential choices
4. **Use addition principle** for alternative methods
5. **Break complex problems** into simpler sub-problems

### For Conditional Probability Problems
1. **Identify given information** (the condition)
2. **Reduce sample space** to the conditioned event
3. **Apply definition** P(B|A) = P(A ∩ B)/P(A)
4. **Check for independence** if P(B|A) = P(B)

### For Applied Problems
1. **Define events clearly** in context
2. **Identify given probabilities** and what to find
3. **Choose appropriate theorem** (LOTP, Bayes', etc.)
4. **Verify reasonableness** of final answer

## 7. Common Pitfalls & Mistakes

### Mistake 1: Confusing Sample Space Definition
- **Error**: Using same sample space for different problems
- **Correction**: Sample space depends on the problem of interest
- **Example**: Rolling a die - S = {1,2,3,4,5,6} for "number shown" vs S = {even, odd} for "parity"

### Mistake 2: Misapplying Addition Rule
- **Error**: P(A ∪ B) = P(A) + P(B) always
- **Correction**: P(A ∪ B) = P(A) + P(B) - P(A ∩ B)
- **When Equal**: Only when A and B are mutually exclusive

### Mistake 3: Permutation vs Combination
- **Error**: Using permutation when order doesn't matter
- **Correction**: Ask "Does order matter?" to choose correctly
- **Memory Aid**: Permutation = Position matters

### Mistake 4: Conditional Probability Direction
- **Error**: Confusing P(A|B) with P(B|A)
- **Correction**: P(A|B) ≠ P(B|A) in general
- **Example**: P(fever|flu) ≠ P(flu|fever)

### Mistake 5: Independence vs Mutual Exclusivity
- **Error**: Thinking independent events are mutually exclusive
- **Correction**: Independent events can occur together
- **Key**: If A ⊥ B and P(A) > 0, P(B) > 0, then A ∩ B ≠ ∅

### Mistake 6: Misusing Bayes' Theorem
- **Error**: Ignoring base rates (prior probabilities)
- **Correction**: Always consider P(A) in P(A|B) calculations
- **Example**: Rare disease testing - even accurate tests can mislead

### Mistake 7: Counting Without Considering Constraints
- **Error**: Forgetting restrictions in counting problems
- **Correction**: Carefully read problem constraints
- **Example**: "Different letters" means no repetition allowed

## 8. Quick Reference Summary

### Essential Formulas
| Concept | Formula | When to Use |
|---------|---------|-------------|
| Addition Rule | P(A ∪ B) = P(A) + P(B) - P(A ∩ B) | Any two events |
| Complement | P(A') = 1 - P(A) | Finding "not A" |
| Conditional | P(B\|A) = P(A ∩ B)/P(A) | Given information |
| Multiplication | P(A ∩ B) = P(A)P(B\|A) | Sequential events |
| Independence | P(A ∩ B) = P(A)P(B) | Independent events |
| Permutation | P(n,r) = n!/(n-r)! | Order matters |
| Combination | C(n,r) = n!/(r!(n-r)!) | Order doesn't matter |
| LOTP | P(B) = ΣP(Aᵢ)P(B\|Aᵢ) | Partition of sample space |
| Bayes | P(A\|B) = P(A)P(B\|A)/P(B) | Inverse probability |

### Event Operations
- **Union (∪)**: "or" - at least one occurs
- **Intersection (∩)**: "and" - both occur
- **Complement (')**: "not" - event doesn't occur

### Key Relationships
- **Mutually Exclusive**: A ∩ B = ∅ ⟹ P(A ∪ B) = P(A) + P(B)
- **Independent**: A ⊥ B ⟹ P(B|A) = P(B)
- **Contained**: A ⊆ B ⟹ P(A) ≤ P(B)

### Decision Trees
1. **Counting**: Order matters? → Permutation : Combination
2. **Probability**: Given info? → Conditional : Unconditional
3. **Multiple Events**: Independent? → Multiply : Use LOTP/Bayes

## 9. Review Questions
- [ ] Can I define sample space for any given experiment?
- [ ] Can I apply De Morgan's laws correctly?
- [ ] Can I distinguish when to use permutations vs combinations?
- [ ] Can I solve probability problems using addition and complement rules?
- [ ] Can I calculate conditional probabilities using the definition?
- [ ] Can I determine if two events are independent?
- [ ] Can I apply the Law of Total Probability for complex scenarios?
- [ ] Can I use Bayes' Theorem for inverse probability problems?
- [ ] Can I identify when events are mutually exclusive vs independent?
- [ ] Can I verify answers using different approaches?
- [ ] Can I solve real-world problems by properly defining events?
- [ ] Can I explain the difference between P(A|B) and P(B|A)?

## 10. Practice Problems

### Basic Level
1. **Sample Space**: List sample space for rolling two dice and recording sum.
2. **Event Operations**: If A = {2,4,6}, B = {1,3,5}, find A', A∪B, A∩B.
3. **Basic Probability**: Fair die rolled, find P(even), P(>4), P(even or >4).
4. **Counting**: How many 3-digit numbers can be formed using digits 1-9 without repetition?

### Intermediate Level
5. **Conditional Probability**: Card drawn from deck. Find P(King|red card).
6. **Independence**: Two coins tossed. Are "first coin heads" and "second coin heads" independent?
7. **Combinations**: Select 5 students from 12 for committee. How many ways if exactly 2 must be female (6 female students total)?

### Advanced Level
8. **Law of Total Probability**: Disease affects 1% of population. Test is 95% accurate for positive cases, 90% accurate for negative cases. Find P(positive test).
9. **Bayes' Theorem**: Given positive test result from problem 8, find P(actually has disease).
10. **Complex Counting**: How many arrangements of letters in "STATISTICS" are there?

### Solutions Available in Tutorial Sessions
