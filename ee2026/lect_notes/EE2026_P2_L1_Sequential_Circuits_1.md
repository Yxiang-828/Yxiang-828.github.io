# EE2026 Part II Lecture 1: Sequential Circuits 1 - Flip-Flops

**Date:** September 14, 2025
**Lecturer:** Chua Dingjuan (elechuad@nus.edu.sg)
**Source:** Lecture recording transcript and slides (EE2026_P2_L1_Sequential Circuits 1_AY2526S1.pdf)
**Topics Covered:** Introduction to sequential logic, SR/JK/D flip-flops, timing parameters, Verilog modeling, blocking/non-blocking assignments.

---

## 1. Introduction to Sequential Logic

### Combinational vs Sequential Circuits
- **Combinational Logic:**
  - Outputs depend **only on current inputs**.
  - No memory; stateless.
- **Sequential Logic:**
  - Outputs depend on **current inputs + previous inputs** (memory required).
  - Requires **states** to separate past, present, future.
  - Two types:
    - **Synchronous:** Clocked (responds at discrete time instants governed by a clock).
    - **Asynchronous:** Unclocked (responds whenever inputs change).

### Example: Light Switch Circuit
- Design a circuit where pushing a button toggles a light (on ↔ off).
- **Missing Elements:**
  1. **Memory:** To remember the previous state of the light.
  2. **Event Response:** Respond to input events (button press), not just values.
- Solution: Use **flip-flops** (memory elements).

---

## 2. SR Flip-Flop (Set-Reset Flip-Flop)

### Basics
- Simplest memory element with **two stable states** (stores 1 bit).
- Also called a **latch**.
- Inputs: S (Set), R (Reset).
- Outputs: Q, ~Q (complement).
- Implemented with NOR or NAND gates.

### Truth Table (Characteristic Table)
| S   | R   | Q+ (Next State) | Description                |
| --- | --- | --------------- | -------------------------- |
| 0   | 0   | Q (Hold)        | No change                  |
| 0   | 1   | 0 (Clear)       | Reset to 0                 |
| 1   | 0   | 1 (Set)         | Set to 1                   |
| 1   | 1   | Invalid         | Forbidden (race condition) |

- **Invalid State (1,1):** Causes oscillation; avoid in design (sacrifices 25% of possible functions).
- **Rest State:** (0,0) – holds current value.

### Implementation
- **NOR Gates:**
  ```
  S ──┐
      │ NOR ── Q
  R ──┤
      │ NOR ── ~Q
  ```
- Propagation delays: Switching is not instantaneous.

### Applications
- **Switch Debouncing:**
  - Mechanical switches bounce (multiple on/off transitions) before settling.
  - SR FF filters bounces: Treats initial press as "set" event, ignores subsequent bounces.
  - Circuit: Connect switch to S/R with pull-down resistors; FF output is debounced signal.

---

## 3. JK Flip-Flop

### Improvements Over SR
- **Two Key Changes:**
  1. **Clock Input:** Makes it synchronous (responds only at clock edges).
  2. **No Invalid State:** (1,1) becomes "Toggle" (Q+ = ~Q), eliminating forbidden state.

### Symbol and Inputs
- Inputs: J (Set-like), K (Reset-like), CLK (Clock).
- Outputs: Q, ~Q.
- Clock Triangle: Indicates it's a flip-flop; responds at active edges (rising/falling).

### Characteristic Table
| J   | K   | Q+  | Description |
| --- | --- | --- | ----------- |
| 0   | 0   | Q   | Hold        |
| 0   | 1   | 0   | Clear       |
| 1   | 0   | 1   | Set         |
| 1   | 1   | ~Q  | Toggle      |

- **Condensed Table:** Same as above.
- **Full Table:** Includes current Q as input for completeness (though Q is an output, it's used to compute next state).

### Synchronous Behavior
- **Clock Control:** Only reads J/K and changes Q at active clock edges (e.g., rising edge: 0→1).
- **Timing Diagram Example:**
  - CLK: Rising edges at t1, t2, t3.
  - J/K values read just before each edge.
  - Q updates after edge (with propagation delay).
  - Example: J=0, K=1 at edge → Q=0; J=1, K=1 at edge → Q toggles.
- **Benefits:** Clear timing; computations happen between edges.

### Timing Parameters
- **Setup Time (t_setup):** Minimum time before active edge that inputs (J/K) must be stable.
- **Hold Time (t_hold):** Minimum time after active edge that inputs must remain stable.
- **Propagation Delay (t_pHL/t_pLH):** Time for output to change (High→Low or Low→High).
- Violation → Unpredictable behavior (metastability).
- Example: TI SN74LS107 (1983 datasheet) has t_setup ~20ns, t_hold ~5ns, t_p ~40ns.

#### Clock Constraints in Synchronous Design
- **Objective:** Fastest clock possible for higher throughput (more operations/second).
- **Constraint:** Clock cannot be too fast, or signals won't settle before next edge → timing violations (wrong values captured).
- **Enforcement:** Total path time ≤ clock period:
  $$ t_{pd} + t_{logic} + t_{setup} \le T_{clk} $$
  Where \( T_{clk} \) is clock period. Satisfying this ensures safety; remaining time is "slack" for optimization.
- **Intuition:** Clock = "beat"; FFs = "musicians". Each needs time to finish before next beat. Goal: Fast beats without missing cues.

### Commercial JK FFs
- **74'107:** Asynchronous clear (CLR active low).
- **74'109:** Synchronous set/reset.
- Truth tables include don't-care (X) for clock in some rows.

---

## 4. Other Flip-Flops

### D Flip-Flop (Data Flip-Flop)
- Simplest synchronous FF.
- Inputs: D (Data), CLK.
- Q+ = D (copies input to output at clock edge).
- Symbol: Triangle for clock.
- Used for delay/shift registers.

### T Flip-Flop (Toggle Flip-Flop)
- Inputs: T, CLK.
- Q+ = ~Q if T=1; Q if T=0.
- Often built from JK (J=K=T).

### Comparison
- SR: Asynchronous, invalid state.
- JK: Synchronous, no invalid state.
- D/T: Simpler, derived from JK.

---

## 5. Verilog Modeling

### Basics Recap
- **Modules:** `module name (inputs, outputs); ... endmodule`
- **Wires/Regs:** `wire` for nets; `reg` for always blocks.
- **Assignments:**
  - **Continuous:** `assign out = expr;` (combinational).
  - **Procedural:** In `always` blocks.

### D Flip-Flop in Verilog
```verilog
module dff (input d, clk, output reg q);
always @ (posedge clk) begin
    q <= d;  // Non-blocking for sequential
end
endmodule
```
- **Sensitivity List:** `@ (posedge clk)` captures rising edges.
- **Reg Type:** Anything assigned in `always` must be `reg`.
- **Edge Rules:** If one signal uses `posedge/negedge`, all must.

### Blocking vs Non-Blocking Assignments
- **Blocking (=):** Sequential, immediate (e.g., `x = y; z = x;` → z gets new x).
- **Non-Blocking (<=):** Sequential evaluation, deferred update (e.g., `x <= y; z <= x;` → both update with old values).
- **Guidelines:**
  - Use non-blocking for sequential logic (flip-flops).
  - Use blocking for combinational in `always`.
  - Don't mix in same `always`.
  - Don't assign same variable from multiple `always`.

### Example: Two D FFs
- **Circuit:** Q1 ← D1; Q2 ← Q1 (delay chain).
- **Blocking (Wrong):**
  ```verilog
  always @ (posedge clk) begin
      q1 = d1;  // Immediate
      q2 = q1;  // Uses new q1 → both update immediately
  end
  ```
  - Result: Q1 and Q2 update simultaneously (no delay).
- **Non-Blocking (Correct):**
  ```verilog
  always @ (posedge clk) begin
      q1 <= d1;  // Deferred
      q2 <= q1;  // Uses old q1 → delay
  end
  ```
  - Result: Q1 updates first, Q2 uses old Q1 (proper delay).

### Multiple Always Blocks
- **Allowed:** But avoid assigning same variable from multiple blocks (causes conflicts).
- **Example (Bad):** Two `always` assigning to `q` → synthesis error.

### Guide: Sequential Flip-Flop Coding Style in Verilog

#### Basic Principles
- **Use `always @(posedge clk)` or `always @(negedge clk)`** for edge-triggered flip-flops.
- **Sequential logic** should **only assign outputs inside the always block** using **non-blocking assignments (`<=`)**.
- **Inputs should be stable before the clock edge** (setup time).
- **Include asynchronous reset or set** if needed.

#### Template for a D Flip-Flop
```verilog
module D_FF(
    input wire clk,      // clock
    input wire rst_n,    // active-low asynchronous reset
    input wire D,        // data input
    output reg Q         // output
);

// Sequential logic
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        Q <= 1'b0;      // reset output
    else
        Q <= D;         // capture data on rising edge
end

endmodule
```
**Style Notes:**
- Use `reg` for output if assigned inside `always`.
- Use **non-blocking (`<=`)** for sequential updates.
- Include comments for clarity.

#### Template for a T Flip-Flop
```verilog
module T_FF(
    input wire clk,
    input wire rst_n,
    input wire T,
    output reg Q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;  // toggle output
    else
        Q <= Q;   // hold output
end

endmodule
```
**Notes:**
- T = 1 → toggle output
- T = 0 → hold output
- `Q <= ~Q;` handles toggling sequentially

#### Template for a JK Flip-Flop
```verilog
module JK_FF(
    input wire clk,
    input wire rst_n,
    input wire J,
    input wire K,
    output reg Q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        Q <= 1'b0;
    else begin
        case ({J,K})
            2'b00: Q <= Q;      // hold
            2'b01: Q <= 1'b0;   // reset
            2'b10: Q <= 1'b1;   // set
            2'b11: Q <= ~Q;     // toggle
        endcase
    end
end

endmodule
```
**Notes:**
- Using `case` makes the characteristic table explicit.
- Easy to read and maintain.

#### General Coding Style Tips
1. **Always use edge-triggered blocks** for flip-flops (`posedge` or `negedge`).
2. **Use non-blocking assignments (`<=`)** for sequential logic.
3. **Include reset logic** for predictable startup behavior.
4. **Comment every block**: explain the purpose of each assignment.
5. **Keep combinational logic out** of the same always block unless intentionally combining sequential + combinational.
6. **Name signals clearly** (`clk`, `rst_n`, `D`, `T`, `J`, `K`, `Q`).

**Benefits:** Correct sequential behavior, readable code, proper timing simulation.

---

## 6. FPGA-Specific Notes
- **Artix-7 FFs:** Only 4 types (all D-based):
  - FDRE: Clock enable + sync reset.
  - FDSE: Clock enable + sync set.
  - FDCE: Clock enable + async clear.
  - FDPE: Clock enable + async preset.
- **Vivado Synthesis:** Simple D FF synthesizes to FDRE.
- **Timing:** Propagation ~40ns on old chips; modern FPGAs faster (limited by setup/hold).

---

## 7. Summary: Logic and Key Concepts
Sequential circuits extend combinational logic by introducing **memory** (via flip-flops) and **state**, enabling systems to remember past inputs and respond to events (e.g., clock edges) rather than just values. The core logic revolves around **state transitions** governed by inputs and clocks:

- **Memory Principle:** Flip-flops store 1 bit, with outputs depending on current state + inputs. SR FF introduces basic memory but has flaws (invalid state, asynchronous). JK improves this with clock synchronization and toggle mode, eliminating invalid states and enabling predictable, edge-triggered behavior.

- **Clock Synchronization:** Synchronous circuits (JK/D/T) use clocks to control when inputs are sampled and outputs change, preventing race conditions. Asynchronous elements (e.g., SR) respond immediately but are prone to glitches. Timing parameters (setup, hold, propagation) ensure reliable operation—violations lead to metastability.

- **Flip-Flop Evolution:** SR (async, 2 states + invalid) → JK (sync, 4 valid states via toggle) → D (simplest sync, direct data copy) → T (toggle variant). All derive from JK; commercial FFs add resets/enables.

- **Verilog Logic:** Sequential modeling uses `always @ (posedge clk)` with non-blocking (`<=`) for deferred updates, mimicking hardware delays. Blocking (`=`) is for immediate/combinational logic. Multiple FFs require careful assignment to simulate delays (e.g., non-blocking for chains).

- **Applications and Design:** FFs enable debouncing, delays, counters, and FSMs. In FPGAs, all boil down to D FF primitives with enables/resets. Timing limits speed (e.g., 100MHz FPGA vs. 40ns old FF).

- **Overall Logic Flow:** Start with combinational (stateless) → Add memory (FFs) → Synchronize with clocks → Model in Verilog with proper assignments → Synthesize to FPGA primitives. This foundation supports complex digital systems by ensuring predictable, timed state changes.

**Quiz/Exercise:** Practice timing diagrams and Verilog for D/JK FFs. Use Canvas quizzes for reinforcement.

For more details, refer to the original slides (EE2026_P2_L1_Sequential Circuits 1_AY2526S1.pdf).