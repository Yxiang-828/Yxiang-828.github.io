# Mermaid Test

## Test 1: Simple Decision Tree
```mermaid
graph TD
    Events[Two Events A and B] --> Decision{Are A and B Independent?}
    Decision -->|YES| IndepFormula[P(A∩B) = P(A)P(B)]
    Decision -->|NO| DepFormula[P(A∩B) = P(A)P(B|A)]
```

## Test 2: Subgraph Test
```mermaid
graph LR
    subgraph "Independent Events"
        EventA[Event A] 
        EventB[Event B]
        EventA -.->|No influence| EventB
    end
```

## Test 3: Flowchart Test
```mermaid
flowchart TD
    RV[Random Variables X and Y] --> Q1{Both discrete?}
    Q1 -->|YES| Disc[Joint distribution is DISCRETE]
    Q1 -->|NO| Q2{Both continuous?}
    Q2 -->|YES| Cont[Joint distribution is CONTINUOUS]
    
    style Disc fill:#90EE90
    style Cont fill:#FFB6C1
```
