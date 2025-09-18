# NAND and NOR Gates: Genius Idea Notes

## Genius Idea: Invert Inputs for NOR/NAND Replacement
To replace AND/OR with NOR/NAND:
- Invert all inputs (NOT them).
- Use the universal gate (NOR for AND, NAND for OR).

### Examples
- AND(A, B) with NOR: NOR(NOT A, NOT B) = NOR(NOR(A,A), NOR(B,B))
- OR(A, B) with NAND: NAND(NOT A, NOT B) = NAND(NAND(A,A), NAND(B,B))

## De Morgan's Laws
- (A · B)' = A' + B'
- (A + B)' = A' · B'

## Universal Gates
NAND and NOR can implement anything. Interchangeable.

## Practice
1. F = A · B → NOR(NOT A, NOT B)
2. F = A + B → NAND(NOT A, NOT B)
3. For complex: Invert inputs, apply gate.

## Tips
- NOT from NAND: NAND(A, A)
- NOT from NOR: NOR(A, A)
- Draw with 2-input gates.