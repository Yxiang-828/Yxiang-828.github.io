# ST2334 Week 1 Mermaid Syntax Test

## Testing Fixed Diagrams

### Basic Decision Tree
```mermaid
graph TD
    Events[Two Events A and B] --> Decision{Are A and B Independent?}
    Decision -->|YES| IndepFormula["P(A∩B) = P(A)P(B)"]
    Decision -->|NO| DepFormula["P(A∩B) = P(A)P(B given A) = P(B)P(A given B)"]
    Decision -->|DON'T KNOW| GeneralRule["Use General Addition Rule or Given Information"]
```

### Independence vs Dependence
```mermaid
graph LR
    subgraph "Independent Events"
        EventA1[Event A] 
        EventB1[Event B]
        EventA1 -.->|No influence| EventB1
        EventA1 -.->|"P(B given A) = P(B)"| EventB1
    end
    
    subgraph "Dependent Events"
        EventA2[Event A]
        EventB2[Event B]
        EventA2 -->|Influences| EventB2
        EventA2 -->|"P(B given A) ≠ P(B)"| EventB2
    end
```

### Problem Recognition
```mermaid
graph TD
    Problem[Problem Statement] --> Keywords{Contains keywords?}
    
    Keywords -->|"without replacement"| Dependent["DEPENDENT - Use P(A)P(B given A)"]
    Keywords -->|"with replacement"| Independent1["INDEPENDENT - Use P(A)P(B)"]
    Keywords -->|"separate/different"| Independent2["INDEPENDENT - Use P(A)P(B)"]
    Keywords -->|"given that/conditional"| Conditional["CONDITIONAL - Use P(B given A)"]
    Keywords -->|"at least one"| Union["UNION - Use P(A∪B)"]
    Keywords -->|"both occur"| Intersection["INTERSECTION - Use P(A∩B)"]
    Keywords -->|"mutually exclusive"| MutuallyExclusive["P(A∩B) = 0"]
    Keywords -->|"independent"| Independent3["INDEPENDENT - Use P(A)P(B)"]
    
    style Dependent fill:#FFB6C1
    style Independent1 fill:#90EE90
    style Independent2 fill:#90EE90
    style Independent3 fill:#90EE90
    style Conditional fill:#FFFFE0
    style Union fill:#E6E6FA
    style Intersection fill:#F0E68C
    style MutuallyExclusive fill:#FFA07A
```

All diagrams should now render without syntax errors!
