# CS2107 Assignment 1 - Med2 Solution

## Problem
Decrypt the monoalphabetic substitution cipher in `secret_message.txt`.

## Method Used to Solve It
The cipher is a monoalphabetic substitution cipher, where each letter is replaced by another letter consistently.

### Manual Method (Frequency Analysis)
1. **Frequency Analysis**: Count the frequency of each letter in the ciphertext and compare to English letter frequencies (E>T>A>O>I>N>S>H>R>D>L>U>C>F>M>W>Y>P>B>V>K>J>X>Q>Z).
2. **Pattern Matching**: Identify common words like "the", "and", "in", "of", "to" by looking for repeated letter patterns.
3. **Trial and Error**: Substitute likely mappings (e.g., most frequent letter in cipher to E), check for common words, iterate.
4. **Word Recognition**: Use context to guess words, refine mappings.

This is the classical method of attack for monoalphabetic ciphers.

### Tool Used (quipqiup.com)
quipqiup is an online cryptogram solver that automates the process:
- **Automated Frequency Analysis**: Analyzes letter frequencies and matches to English patterns.
- **Pattern Recognition**: Identifies digrams/trigrams (e.g., TH, HE, IN, ER, ON).
- **Optimization**: Uses hill-climbing or similar algorithm to find the best mapping that maximizes English-like text.
- **Multiple Solutions**: Outputs ranked possibilities based on likelihood score (negative log-likelihood, lower = better).

The tool provided 8 possible decryptions; the highest-ranked (most readable) was correct.

## Solution
The ciphertext is a monoalphabetic substitution cipher. Using frequency analysis and online tools like quipqiup.com, multiple possible decryptions are generated, ranked by likelihood score.

The most readable decryption (result 0, score -1.857) provides coherent English text that explains the cipher-breaking process itself, with the flag embedded near the end.

### Decrypted Text
NICE! HERE’S A REVISED VERSION TUNED TO ROUGHLY MATCH THE ENGLISH LETTER FREQUENCIES YOU GAVE (E>T>A>O>I>N>S>H...); THE FLAG STAYS THE SAME. THE SECRET MESSAGE IS HIDDEN IN A READABLE SCENE, ONE THAT SEEMS PLAIN YET DELIBERATE. TO SEE IT, TREAT THE NOTE AS A CASE STUDY IN SIMPLE CODE BREAKING. READ THE ENTIRE PIECE AND TEASE OUT THE REPEATED LETTERS AND THE REPEATED LITTLE WORDS: THE, AND, IN, OF, TO, WITH, IS, IT. THEN RELATE THESE ITEMS TO THE SHAPE OF THE SENTENCE, THE ROLE OF EACH CLAUSE, AND THE IDEA EACH LINE SETS OUT TO DELIVER. THE ESSENTIAL IDEA: ESTIMATE THE LETTERS BY THEIR RATE OF USE, TEST A FEW SAFE SWAPS, AND ITERATE. WHEN A LETTER SET APPEARS OFTEN TOGETHER, THE PAIR MAY BE TH, HE, IN, ER, OR ON; WHERE A SINGLE LETTER IS RARE, J, X, Q, OR Z MAY BE THE CAUSE. AFTER YOU SETTLE THE KEY, DECODE THE REST IN A STEADY WAY AND READ THE ANSWER. THE FINAL REVEAL WILL TELL YOU WHERE THE FLAG IS KEPT; STATE IT EXACTLY AND PROCEED. AS A GENTLE REMINDER, THE FLAG FOLLOWS THE USUAL SCHEME AND SITS NEAR THE END OF THIS GUIDE: CS2107{QO4SDY1Y_GRTCV3OE1D_QM56J}. LOOK CLOSELY AT COMMON POSITIONS: INITIAL, FINAL, AND WITHIN. COMMON DIGRAMS JOIN OR MIRROR: ON, NO, IN, AN, OR, TO. COUNT HOW OFTEN A SYMBOL OCCURS ON ITS OWN OR WITHIN A WORD. MAP POSITIONS TO LIKELY OPTIONS AND FOLLOW A CONSISTENT PLAN. ALIGN OPTIONS WITH KNOWN WORDS: ROOM, DOOR, FLOOR, WINDOW, CORRIDOR, RADIO STATION, SIGNAL ORIGIN, CONTROL ROOM. MONOALPHABETIC SUBSTITUTION FAVORS GOOD INTUITION: PICK A PLAIN OPTION AND CONFIRM ON LONG PORTIONS OF THE WRITING. VIVID BRONZE HAWKS FLY AROUND SMOKY QUARRIES BY DUSK; BRIGHT YOUNG PUPS BARK AND BOUND IN A WINDY YARD. A CURIOUS GROUP OF LINGUISTS UNBOX GLYPHS AND STUDY SOUND, SYMBOL, AND NUANCE. WARM BAY WINDOWS GLOW; ROUGH WOOD DOORS GROAN UNDER HEAVY WIND. HOLD THE PAD AND CHECK SHADOW, WIDTH, AND DEPTH; HIDDEN DOORS AND HANDHOLDS SHOW UP IN ODD CORNERS. WHICH HIGH RIDGE MIGHT GIVE FIRM HINTS? HARSH, BRIGHT HIGHLIGHTS RIM A NIGHT SKY; HIGH HILLS RISE, DIM MIST HANGING. VIVID, GRAVE VIBES GIVE FIRM GUIDANCE; BRAVE MINDS SHIFT HABITS WITH INSIGHT. USEFUL HINTS: HIGHLIGHT A SHIFT IN SIGN; VERIFY A GIVEN PAIRING VIA HUMAN INSIGHT. EACH HUMAN SHOULD MEASURE EACH CLUE AS MUCH AS NEEDED: CHECK SUCH CASES, CAUSE AND EFFECT, AND MAKE SURE YOUR HUNCHES MATCH. CAREFUL RESEARCH CAN REDUCE ERROR AND LEAD TO SECURE, HUMANE RESULTS. FACTUAL SUMMARIES HELP EACH READER SEE THE SCHEME CLEARLY. TWO BRAVE BOYS WENT TO A WINDY BAY TO WATCH BOATS AND WAVES FROM A WOODEN FOOTBRIDGE. BEFORE DAWN, TWO WATCHERS WROTE NOTES ABOUT A FAINT YELLOW LIGHT ABOVE A BAYWARD BLUFF. EVALUATE THE LETTER PATTERN: TEST, RETEST, AND SETTLE BETTER ESTIMATES; TREAT THE TEXT AS A STATEMENT, THEN RE-EVALUATE LATER. A WARM SHOP HELPER MOVES A HEAVY MOP, PUSHING FOAM OVER A YELLOW PORCH. SHY HALFBACK HUFFS AND HURRIES THROUGH A HAZY NIGHT. HUSH, SHY HYDRA; HUSH THY HARSH RHYTHM.

### Flag
CS2107{QO4SDY1Y_GRTCV3OE1D_QM56J}

### Notes
- Other decryptions were generated but were less coherent or had garbled words.
- The text is meta: it describes the process of breaking the cipher, hiding the flag within the "guide" as promised.