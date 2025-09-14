Matric number: A0299826E

## EE2026 Lab 3 Graded Assignment Breakdown

Based on your matric number **A0299826E**, here's the detailed breakdown of what to expect and how to implement each graded subtask in Verilog.

### Key Values from Your Matric Number
- **Matric**: A0299826E
- **1st rightmost numerical value**: 6 (used for Subtask A)
- **2nd rightmost numerical value**: 2 (used for Subtask B)
- All switches (SW0-SW15) start OFF, seven-segment displays OFF.

### Overall Expectations
- **One working bitstream**: Everything must be in a single top-level module that generates a valid bitstream for the Basys 3 board.
- **Timing**: Use the 100 MHz clock (from Basys3_Master.xdc). Generate slower clocks via counters (e.g., increment a reg at posedge CLK, toggle when it reaches a threshold).
- **LEDs**: LD0-LD15 (16 total).
- **Switches**: SW0-SW2 for blinking control.
- **Pushbuttons**: BTN0-BTN3 (and possibly BTNU/BTND/BTNL/BTNR, but focus on BTN0-3).
- **Seven-segment**: 4 displays (AN0-AN3, CA-CG, DP). Use common anode (low = on). You'll likely use the rightmost display (AN3).
- **Constraints**: Update Basys3_Master.xdc to map CLK to W5, LEDs to their pins, switches, buttons, and seven-segment.
- **Simulation first**: Test in Vivado before bitstream. Use counters to generate slow signals.
- **Error tolerances**: As specified (±0.10s for TIME_COUNT, ±10% for frequencies).

### Subtask A: LED Lighting and Blinking
**What to expect**:
- LEDs LD0 to LD8 (MAX_LED = LD8 for your 1st digit 6) light up **one by one** every **1.11 seconds** (TIME_COUNT).
- LD9-LD15 stay OFF.
- Once all LD0-LD8 are ON (after ~9.99 seconds total), the system is ready for switch inputs.
- Switches control blinking of specific LEDs:
  - SW0 ON: LD0 blinks at 1 Hz (ON 0.5s, OFF 0.5s).
  - SW1 ON: LD1 blinks at 10 Hz.
  - SW2 ON: LD2 blinks at 100 Hz.
- Other LEDs (LD3-LD8, LD9-LD15) stay ON.
- Switches are only checked after MAX_LED is ON (grader won't toggle them during lighting).

**How to implement in Verilog**:
1. **Generate 1.11s intervals**: Use a counter to count 100M * 1.11 ≈ 111M cycles (need ~27-bit counter). Toggle a signal every 1.11s to increment `led_count`.
2. **LED control**:
   - `reg [3:0] led_count = 0;`
   - At each 1.11s tick, if `led_count < 9`, `led_count <= led_count + 1;`
   - Assign LEDs: `LED[i] = (i <= led_count && i <= 8) ? 1 : 0;` (LD0-LD8 ON based on count, others OFF).
3. **Blinking clocks**:
   - 1 Hz: Counter for 50M cycles (50M on, 50M off).
   - 10 Hz: Counter for 5M cycles.
   - 100 Hz: Counter for 500K cycles.
   - Use `always @(posedge CLK)` to increment counters and toggle slow clocks.
4. **Switch logic** (only after `led_count == 8`):
   - `if (SW0) LED[0] = slow_1hz; else LED[0] = 1;`
   - Similarly for LD1 (SW1) and LD2 (SW2).
   - Ensure no conflicts (e.g., don't drive LED[0] from multiple places).

**Verilog structure**:
- Top module: Inputs: CLK, SW0-SW2; Outputs: LED[15:0].
- Internal regs: led_count, counters for slow clocks.
- Use `always @(posedge CLK)` for all logic.

### Subtask B: Seven-Segment Steps and Pushbutton Sequence
**What to expect**:
- Seven-segment displays nothing until MAX_LED (LD8) is ON.
- Then, displays show step patterns on specific digits as the user presses buttons in sequence simultaneously when ld8 is ON.
- Button sequence (based on 2nd digit 2, but extended to 5 steps): Center  → Right → Down  → Left  → Right .
- Each correct press advances the step and updates the display.
- Wrong press does not change the step (remains at current).
- After 5 correct presses, LD15 turns ON (unlocked), display shows final pattern.
- Pushbuttons not pressed after unlock.

**Step Details**:
- Step 1: Segments g, e, d lit on 4th digit (AN[3]) light up simultaneously when ld8 is ON.
- Step 2: Segments g, e lit on 3rd digit (AN[2]).
- Step 3: Segments g, e, d, c, b lit on 2nd digit (AN[1]).
- Step 4: Segments e, f lit on 1st digit (AN[0]).
- Step 5: Segments e, g lit on 3rd digit (AN[2]), LD15 ON (unlocked).

wrong presses do not affect the current step until a correct press.

#notes:- --- todo ---

1st rightmost numerical value: 6
2nd rightmost numerical value: 2

LD8 1.11seconds (Error of ±0.10s allowed)

So, LD0 to LD8 light up one by one every 1.11 seconds. LD9 to LD15 remain off.

When LD0 to LD8 are all ON, user can turn ON certain switches to make LD0, LD1, LD2 blink at different speeds:
- SW0 ON: LD0 blinks at 1 Hz (0.5s ON   0.5s OFF)
- SW1 ON: LD1 blinks at 10 Hz (0.05s ON  0.05s OFF)
- SW2 ON: LD2 blinks at 100 Hz (0.005s ON 0.005s OFF)

So for subtask A:
1. oscillate between ld0-8 everty 1.11s
2. wait until all on
3. when all on, switches are programmed to blink ld0-2 at different speeds
4. other leds stay on
