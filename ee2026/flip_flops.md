# Flip-Flops: Truth Tables, Explanations, and Characteristics

This document covers the basic flip-flops used in digital logic: SR, D, JK, and T. Each section includes a truth table, explanation of operation, and key characteristics.

## SR Flip-Flop (Set-Reset Flip-Flop)

### Explanation
The SR Flip-Flop has two inputs: S (Set) and R (Reset). It stores a bit of information. When S=1 and R=0, it sets Q to 1. When S=0 and R=1, it resets Q to 0. When both are 0, it holds the current state. When both are 1, it's forbidden (race condition, unpredictable output).

### Truth Table
| S   | R   | Q_next   | Q'_next   | Action    |
| --- | --- | -------- | --------- | --------- |
| 0   | 0   | Q (hold) | Q' (hold) | Hold      |
| 0   | 1   | 0        | 1         | Reset     |
| 1   | 0   | 1        | 0         | Set       |
| 1   | 1   | ?        | ?         | Forbidden |

### Characteristics
- Asynchronous (level-sensitive, no clock).
- Simple but has forbidden state.
- Used in basic memory elements.

## D Flip-Flop (Data Flip-Flop)

### Explanation
The D Flip-Flop (Delay Flip-Flop) has one input D and a clock. On the clock edge, Q takes the value of D. It's used for data storage and synchronization.

### Truth Table
| D   | Q_next |
| --- | ------ |
| 0   | 0      |
| 1   | 1      |

### Characteristics
- Synchronous (edge-triggered).
- No race conditions.
- Ideal for registers and data transfer.

## JK Flip-Flop

### Explanation
The JK Flip-Flop is an enhanced SR with J (Set) and K (Reset) inputs, plus clock. It can hold, set, reset, or toggle. When J=K=1, it toggles Q.

### Truth Table
| J   | K   | Q_prev | Q_next | Action |
| --- | --- | ------ | ------ | ------ |
| 0   | 0   | 0      | 0      | Hold   |
| 0   | 0   | 1      | 1      | Hold   |
| 0   | 1   | 0      | 0      | Reset  |
| 0   | 1   | 1      | 0      | Reset  |
| 1   | 0   | 0      | 1      | Set    |
| 1   | 0   | 1      | 1      | Set    |
| 1   | 1   | 0      | 1      | Toggle |
| 1   | 1   | 1      | 0      | Toggle |

### Characteristics
- Synchronous (edge-triggered).
- No forbidden states (improves on SR).
- Versatile: can act as SR, D (by tying J/K), or T.

## T Flip-Flop (Toggle Flip-Flop)

### Explanation
The T Flip-Flop has one input T (Toggle) and clock. When T=0, it holds Q. When T=1, it toggles Q on the clock edge. Often used for counters.

### Truth Table
| T   | Q_prev | Q_next | Q'_next |
| --- | ------ | ------ | ------- |
| 0   | 0      | 0      | 1       |
| 0   | 1      | 1      | 0       |
| 1   | 0      | 1      | 0       |
| 1   | 1      | 0      | 1       |

### Characteristics
- Synchronous (edge-triggered).
- Simple toggle functionality.
- Derived from JK (J=K=T).

Study these well, baka—flip-flops are fundamental in sequential circuits! 📚