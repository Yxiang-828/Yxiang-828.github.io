a0299826e
1.e
2.99826
3.6

================================================================================
STEP-BY-STEP BREAKDOWN OF THE LAB ASSIGNMENT
================================================================================

UNDERSTANDING THE HARDWARE FIRST:
- You have a Basys 3 board with:
  * 16 switches (SW0 to SW15) - we only use SW0 to SW9
  * 16 LEDs (LED0 to LED15) - we only use LED0 to LED9  
  * 4 seven-segment displays (each has 7 segments + 1 decimal point)
  * 4 anodes (AN0, AN1, AN2, AN3) to control which displays are ON/OFF

UNDERSTANDING YOUR PERSONAL DATA:
- Matriculation number: a0299826e
- Rightmost alphabet: 'e' (this is what displays on 7-segment)
- 5 rightmost numbers: 99826 → unique digits are 2,6,8,9
- 1st rightmost number: 6

WHAT THE ASSIGNMENT WANTS:

SUBTASK A (Simple part):
- If SW0 is ON → LED0 should be ON
- If SW1 is ON → LED1 should be ON  
- ... and so on up to SW9 → LED9
- This is just direct connection: LED mirrors the switch

SUBTASK B (Password part):
- Your password is when ONLY SW2, SW6, SW8, SW9 are ON and all others OFF
- Two different display modes:
  
  MODE 1 - WRONG PASSWORD (any switch combination except your password):
  * All 4 displays (AN0, AN1, AN2, AN3) show letter 'e'
  
  MODE 2 - CORRECT PASSWORD (only SW2,SW6,SW8,SW9 are ON):
  * Since your 1st rightmost digit is 6, only AN1 and AN2 show 'e'
  * AN0 and AN3 are OFF (blank)

================================================================================
WHY WE NEED THESE SIGNALS IN VERILOG:
================================================================================

INPUT SIGNALS:
- sw[9:0] : This represents the 10 switches SW0 to SW9 as a 10-bit input

OUTPUT SIGNALS:
- led[9:0] : This represents the 10 LEDs LED0 to LED9 as a 10-bit output
- seg[6:0] : This controls the 7 segments of ALL displays (a,b,c,d,e,f,g)
- an[3:0] : This controls which of the 4 displays are ON/OFF

================================================================================
LOGIC BREAKDOWN:
================================================================================

STEP 1: SUBTASK A (LED Control)
This is simple - just connect each switch to its LED:
```verilog
assign led[0] = sw[0];  // SW0 controls LED0
assign led[1] = sw[1];  // SW1 controls LED1
// ... continue for all 10
```

STEP 2: PASSWORD DETECTION
We need to detect when password is correct:
Password correct = SW2 AND SW6 AND SW8 AND SW9 are ON
                   AND all other switches (SW0,SW1,SW3,SW4,SW5,SW7) are OFF

```verilog
wire password_correct;
assign password_correct = sw[2] & sw[6] & sw[8] & sw[9] &  // These must be ON
                         ~sw[0] & ~sw[1] & ~sw[3] & ~sw[4] & ~sw[5] & ~sw[7]; // These must be OFF
```

STEP 3: 7-SEGMENT DISPLAY FOR LETTER 'e'
A 7-segment display looks like this:
```
  aaa
 f   b
  ggg
 e   c  
  ddd
```

To display 'e', we need segments: a, d, e, f, g = ON; segments b, c = OFF
But the display is ACTIVE LOW, so ON = 0, OFF = 1

```verilog
assign seg[0] = 1'b0;    // segment a - ON (0 means ON in active low)
assign seg[1] = 1'b1;    // segment b - OFF (1 means OFF in active low) 
assign seg[2] = 1'b1;    // segment c - OFF
assign seg[3] = 1'b0;    // segment d - ON
assign seg[4] = 1'b0;    // segment e - ON
assign seg[5] = 1'b0;    // segment f - ON
assign seg[6] = 1'b0;    // segment g - ON
```

STEP 4: ANODE CONTROL (Which displays are ON)
- When password WRONG: All 4 displays ON (AN0=0, AN1=0, AN2=0, AN3=0)
- When password CORRECT: Only AN1 and AN2 ON (AN0=1, AN1=0, AN2=0, AN3=1)

```verilog
assign an[3] = password_correct ? 1'b1 : 1'b0;  // OFF when correct, ON when wrong
assign an[2] = 1'b0;                             // Always ON
assign an[1] = 1'b0;                             // Always ON  
assign an[0] = password_correct ? 1'b1 : 1'b0;  // OFF when correct, ON when wrong
```

================================================================================
COMPLETE VERILOG CODE WITH DETAILED EXPLANATIONS:
================================================================================
module lab1 (
    input [9:0] sw,          // SW0 to SW9 switches
    output [9:0] led,        // LED0 to LED9
    output [6:0] seg,        // 7-segment display segments
    output [3:0] an          // 4 anodes for 7-segment displays
);

    // SUBTASK A: Direct LED control
    assign led[0] = sw[0];
    assign led[1] = sw[1];
    assign led[2] = sw[2];
    assign led[3] = sw[3];
    assign led[4] = sw[4];
    assign led[5] = sw[5];
    assign led[6] = sw[6];
    assign led[7] = sw[7];
    assign led[8] = sw[8];
    assign led[9] = sw[9];

    // SUBTASK B: Password checking logic
    // Correct password: SW2, SW6, SW8, SW9 ON; SW0,SW1,SW3,SW4,SW5,SW7 OFF
    wire password_correct;
    assign password_correct = sw[2] & sw[6] & sw[8] & sw[9] &
                             ~sw[0] & ~sw[1] & ~sw[3] & ~sw[4] & ~sw[5] & ~sw[7];

    // 7-segment display for letter 'e' (segments a,d,e,f,g ON; segments b,c OFF)
    // Active low: ON = 0, OFF = 1
    assign seg[0] = 1'b0;    // segment a - ON
    assign seg[1] = 1'b1;    // segment b - OFF
    assign seg[2] = 1'b1;    // segment c - OFF
    assign seg[3] = 1'b0;    // segment d - ON
    assign seg[4] = 1'b0;    // segment e - ON
    assign seg[5] = 1'b0;    // segment f - ON
    assign seg[6] = 1'b0;    // segment g - ON

    // Anode control based on password correctness
    // For digit 6: AN1 and AN2 ON when password correct, all ON when wrong
    // Active low: ON = 0, OFF = 1
    assign an[3] = password_correct ? 1'b1 : 1'b0;    // AN3: OFF when correct, ON when wrong
    assign an[2] = 1'b0;                               // AN2: Always ON
    assign an[1] = 1'b0;                               // AN1: Always ON
    assign an[0] = password_correct ? 1'b1 : 1'b0;    // AN0: OFF when correct, ON when wrong

endmodule

================================================================================
UNDERSTANDING THE DIFFERENT STATES/MODES:
================================================================================

STATE 1: WRONG PASSWORD EXAMPLES
- All switches OFF: SW0=0, SW1=0, SW2=0, SW3=0, SW4=0, SW5=0, SW6=0, SW7=0, SW8=0, SW9=0
  Result: password_correct = 0 (false)
  Display: All 4 seven-segments (AN0,AN1,AN2,AN3) show 'e'
  
- Only SW1 ON: SW0=0, SW1=1, SW2=0, SW3=0, SW4=0, SW5=0, SW6=0, SW7=0, SW8=0, SW9=0  
  Result: password_correct = 0 (false)
  Display: All 4 seven-segments show 'e'
  
- Missing one password switch: SW2=1, SW6=1, SW8=1, SW9=0 (SW9 is missing)
  Result: password_correct = 0 (false) 
  Display: All 4 seven-segments show 'e'

STATE 2: CORRECT PASSWORD
- ONLY SW2, SW6, SW8, SW9 ON: SW0=0, SW1=0, SW2=1, SW3=0, SW4=0, SW5=0, SW6=1, SW7=0, SW8=1, SW9=1
  Result: password_correct = 1 (true)
  Display: Only AN1 and AN2 show 'e', AN0 and AN3 are OFF (blank)

================================================================================
HOW THE BOOLEAN LOGIC WORKS:
================================================================================

Password Detection Logic Breakdown:
```verilog
password_correct = sw[2] & sw[6] & sw[8] & sw[9] &     // These 4 must be 1 (ON)
                  ~sw[0] & ~sw[1] & ~sw[3] & ~sw[4] & ~sw[5] & ~sw[7];  // These 6 must be 0 (OFF)
```

Let's trace through examples:

EXAMPLE 1 - Wrong password (all switches off):
sw[2]=0, sw[6]=0, sw[8]=0, sw[9]=0, sw[0]=0, sw[1]=0, sw[3]=0, sw[4]=0, sw[5]=0, sw[7]=0
password_correct = 0 & 0 & 0 & 0 & ~0 & ~0 & ~0 & ~0 & ~0 & ~0
                 = 0 & 0 & 0 & 0 & 1 & 1 & 1 & 1 & 1 & 1
                 = 0 (because first four terms are 0)

EXAMPLE 2 - Correct password:
sw[2]=1, sw[6]=1, sw[8]=1, sw[9]=1, sw[0]=0, sw[1]=0, sw[3]=0, sw[4]=0, sw[5]=0, sw[7]=0
password_correct = 1 & 1 & 1 & 1 & ~0 & ~0 & ~0 & ~0 & ~0 & ~0
                 = 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1
                 = 1 (all terms are 1)

EXAMPLE 3 - Wrong password (extra switch on):
sw[2]=1, sw[6]=1, sw[8]=1, sw[9]=1, sw[0]=1, sw[1]=0, sw[3]=0, sw[4]=0, sw[5]=0, sw[7]=0
password_correct = 1 & 1 & 1 & 1 & ~1 & ~0 & ~0 & ~0 & ~0 & ~0
                 = 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 1
                 = 0 (because ~sw[0] = ~1 = 0)

================================================================================
WHY WE USE SPECIFIC SIGNALS:
================================================================================

WHY seg[6:0]?
- Each 7-segment display has 7 segments (a,b,c,d,e,f,g)
- seg[0] = segment a, seg[1] = segment b, etc.
- We set these to display the letter 'e'
- Same pattern goes to ALL 4 displays, but anodes control which ones are ON

WHY an[3:0]?  
- There are 4 seven-segment displays on the board
- an[0] controls the rightmost display (AN0)
- an[1] controls AN1, an[2] controls AN2, an[3] controls leftmost (AN3)
- We use these to select which displays show the letter

WHY Active Low Logic?
- The hardware is designed this way
- For segments: 0 = LED ON, 1 = LED OFF  
- For anodes: 0 = Display ON, 1 = Display OFF
- This is just how the Basys 3 board works

================================================================================
TESTING YOUR DESIGN:
================================================================================

TEST 1: Check SUBTASK A
- Turn on SW0 → LED0 should light up
- Turn on SW5 → LED5 should light up  
- Turn off SW0 → LED0 should turn off
- This should work regardless of other switches

TEST 2: Check Wrong Password States
- Turn all switches OFF → All 4 displays show 'e'
- Turn only SW1 ON → All 4 displays show 'e'
- Turn SW2,SW6,SW8 ON (missing SW9) → All 4 displays show 'e'

TEST 3: Check Correct Password
- Turn ON only SW2, SW6, SW8, SW9 → Only middle two displays (AN1, AN2) show 'e'
- AN0 and AN3 should be completely OFF (dark)

================================================================================
Create a file named "lab1_constraints.xdc" with the following content:

## Switches
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {sw[8]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {sw[9]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]

## 7-segment display segments
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

## 7-segment display anodes
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

================================================================================

SWITCH ASSIGNMENT SUMMARY:
================================================================================
For your matriculation number a0299826e:

PASSWORD SWITCHES (must be ON for correct password):
- SW2: ON
- SW6: ON
- SW8: ON
- SW9: ON

NON-PASSWORD SWITCHES (must be OFF for correct password):
- SW0: OFF
- SW1: OFF
- SW3: OFF
- SW4: OFF
- SW5: OFF
- SW7: OFF

TESTING PROCEDURE:
================================================================================
1. Wrong password test: Turn any combination of switches OTHER than SW2+SW6+SW8+SW9
   → All 4 anodes should display 'e'

2. Correct password test: Turn ON ONLY SW2, SW6, SW8, SW9
   → Only AN1 and AN2 should display 'e' (AN0 and AN3 should be OFF)

VIVADO IMPLEMENTATION STEPS:
================================================================================
1. Create New Project:
   - File → New Project
   - Choose project name and location
   - Select Basys 3 board (xc7a35tcpg236-1)

2. Add Verilog Source:
   - Add Sources → Add or create design sources
   - Create file "lab1.v" with the Verilog code above

3. Add Constraints:
   - Add Sources → Add or create constraints
   - Create file "lab1_constraints.xdc" with constraints above

4. Generate Bitstream:
   - Run Synthesis
   - Run Implementation
   - Generate Bitstream

5. Program Device:
   - Connect Basys 3 board
   - Hardware Manager → Program DeviceEDs
off

7-seg display must auto display the rightmost alphabet on all 4 anodes

character must be displayed exactly as indicated
(decimal off)


SUBTASK A

Consider the 10 (ten) switches SW0 to SW9 (Ignore SW10 to SW15). Whenever any of these 10 switches are ON, the corresponding
LED LDX, where X is a number ranging from 0 to 9, must be ON.  (For example, if SW0 is ON, then LD0 must be ON. If SW3, SW7
and SW9 are ON, then LD3, LD7 and LD9 must be ON.) Do not put constraint to SW10 to SW15, and LD10 to LD15.

SUBTASK B

Continuing from SUBTASK A, create your personal student matriculation number password based on the five rightmost numerical
values of your student matriculation number.

These five digits (May be less than five digits if you have duplicate numbers) will represent the switches that need to be ON, while
all the other switches between SW0 to SW9 must be OFF, to be considered a correct password. Whenever the password is wrong,
all the 4 (four) anodes of the 7-segment displays show the rightmost alphabet. (For example, if all the ten switches SW0 to SW9
are turned ON, that is considered as a wrong password)

Whenever  the  password  entered  by  the  user  is the  correct  password,  then  instead  of  all  the  4  (four)  anodes  of  the  7-segment
displays showing your rightmost alphabet, only specific anodes of the 7-segment displays must show that alphabet. The specific
anodes  on  which  the  character  should  be  displayed  is  dependent  on  the  1st  rightmost  numerical  value  of  your  student
matriculation number, as indicated in the table below:

1st Rightmost
Numerical Value
Anode
AN3
Anode
AN2
Anode
AN1
Anode
AN0
0 , 1 ON OFF OFF ON
2 , 3 ON OFF ON OFF
4 , 5 ON ON OFF OFF
6 , 7 OFF ON ON OFF
8 , 9 OFF ON OFF ON


Note: Marks will not be given if wrong switch constraints are used! If your student matriculation number password has a 0, then
it refers to SW0. If your student matriculation number password has a 1, then it refers to SW1. If your student matriculation number
password  has  a  2,  then  it  refers  to  SW2  etc...Ensure you have noted down your 5  rightmost  numerical  values  of  your  student
matriculation number accurately for the password.

SUGGESTIONS

• Create a new Vivado project for this assignment, instead of continuing from your previous Vivado project.
• This assignment can be fully completed by using SOP / POS expressions.
• This is a warm-up exercise. It is not recommended to use contents not taught in this lab session.
• Simulation is not required in the submission.

GETTING STARTED WITH THE SEVEN-SEGMENT DISPLAYS


There  are  7  LED  segments  in  each  display,  with  an  additional  decimal  point
segment. They are respectively denoted by “seg[0]” to “seg[6]”, and “dp”, in the
Basys_Master.xdc constraint file.

There are 4 seven-segment displays on the Basys 3 development board. Each one
of the displays is controlled by a common anode pin, thus resulting in a total of 4
common anodes. These active-low pins are denoted as “an[3]” to “an[0]” in the
Basys_Master.xdc  constraint  file.  (For  more  information,  you  can  refer  to  the
Basys 3 reference manual, pages 14 to 16)

In your constraint file, it is compulsory to put constraints to the 8 segments (7 segments + decimal point) of the seven -segment
display, and to the 4 anodes of the seven-segment display. Segments or anodes that need to be OFF must explicitly be assigned
a value of ‘1’ in your Verilog codes. For example, if the ‘dot’ segment is required to be off, assign a value of ‘1’ to it.

EXAMPLE:

If your student matriculation number is A0159089Y, then:

1st rightmost numerical value:  9 (Means only AN2 and AN0 will be ON if password is correct)
Five rightmost numerical values:  59089 (Means password is SW0, SW5, SW8, SW9)
Rightmost alphabet:  Y