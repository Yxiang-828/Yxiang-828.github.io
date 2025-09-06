# CS2107 Tutorial 1 – Answers & Study Notes

## 1. Key Concepts & Definitions

- **Confidentiality:** Ensuring only authorized parties can access information.
- **Integrity:** Ensuring information is not altered without detection.
- **Authentication:** Verifying the identity of users or systems.
- **Availability:** Ensuring information and resources are accessible when needed.
- **Brute-force attack:** Trying all possible keys until the correct one is found.
- **Known-Plaintext Attack (KPA):** Attacker knows some plaintext-ciphertext pairs.
- **Keyspace:** The total number of possible keys for a cipher.
- **Precomputed Table (Rainbow Table):** A table storing precomputed outputs for rapid lookup, trading storage for speed.

---

## 2. Answers to Tutorial Questions

### Q1: Security Requirements Compromised (Phishing Scenario)
- **Confidentiality:** Compromised (attacker accessed sensitive info)
- **Integrity:** Compromised (attacker could alter data/processes)
- **Authentication:** Compromised (attacker impersonated Alice)
- **Availability:** Compromised (server overloaded, denying service)

**Example:**
- If an attacker gets your password, they can read your emails (confidentiality), send fake emails (integrity), pretend to be you (authentication), and even lock you out (availability).

---

### Q2: Brute-Force Key Search Calculations

#### (a) 64-bit key, 4GHz single-core, 512 cycles/test
- **Total keys:** 2^64
- **Cycles per test:** 512
- **Processor speed:** 4GHz = 4 × 10^9 cycles/sec
- **Tests/sec:** 4 × 10^9 / 512 ≈ 7.81 × 10^6
- **Total time (sec):** 2^64 / 7.81 × 10^6 ≈ 2.36 × 10^12 sec
- **Total time (years):** 2.36 × 10^12 / 2^25 ≈ 70,400 years

#### (b) 1024 servers, each quad-core 4GHz
- **Total cores:** 1024 × 4 = 4096
- **Total tests/sec:** 4096 × 7.81 × 10^6 ≈ 3.2 × 10^10
- **Total time (sec):** 2^64 / 3.2 × 10^10 ≈ 5.77 × 10^8 sec ≈ 18.3 years

#### (c) Bitcoin Network (hash rate = 1T = 2^40 tests/sec)
- **Total tests/sec:** 2^40
- **Total time (sec):** 2^64 / 2^40 = 2^24 = 16,777,216 sec ≈ 0.53 years ≈ 6.1 months

---

### Q3: 42-bit key, 4GHz single-core
- **Total keys:** 2^42 = 4,398,046,511,104
- **Tests/sec:** 7.81 × 10^6
- **Total time (sec):** 2^42 / 7.81 × 10^6 ≈ 564,876 sec ≈ 6.54 days

---

### Q4: rSWT Walkie-Talkie Security
- **Session key (42 bits) can be brute-forced in days by a laptop.**
- **To crack in 0.1 sec with 100TB storage:**
  - Use a precomputed table (rainbow table): store all possible session keys and corresponding ciphertexts. On receiving (v, c), look up the session key in the table.
- **With 1TB storage:**
  - Use a more efficient table (e.g., Hellman tables) or partial precomputation, requiring more computation per lookup.

**Theory Example:**
- **Rainbow Table:** Precompute hashes for all possible keys, store them, and use them to reverse hashes quickly.

---

### Q5: Winzip Encryption & Compression
- **Why not compress after encrypting?**
  - Encrypted data appears random, so compression is ineffective. Compression works by finding patterns, which encryption destroys.

**Example:**
- Try compressing a file of random bytes—resulting file is not smaller.

---

### Q6: Winzip 6-digit Password Attack
- **(a) Can Alice verify a 256-bit string is the correct AES key?**
  - Yes, by attempting decryption and checking if the output is a valid mp3 file.
- **(b) How many guesses needed?**
  - 6-digit password: 000000 to 999999 = 1,000,000 possibilities.

**Example:**
- For a 4-digit PIN, only 10,000 tries are needed.

---

### Q7: Terminology
- **NSA:** National Security Agency (US, cryptography and surveillance)
- **NIST:** National Institute of Standards and Technology (sets crypto standards)
- **Cryptography backdoor:** Secret method to bypass encryption
- **Decryption order:** Legal order to decrypt data
- **Edward Snowden:** Whistleblower who revealed NSA surveillance programs

---

## 3. Linux Set-Up (Practical Notes)
- Use VirtualBox or VMWare to set up a Linux VM on Windows/Mac.
- Ubuntu is recommended for beginners; Kali Linux for advanced security tools.
- Use "NAT" or "bridge adapter" for networking.
- Learn basic Linux commands (see: https://ubuntu.com/tutorials/command-line-for-beginners#1-overview and https://linuxcommand.org/tlcl.php)

**Example:**
- To list files: `ls`
- To update packages: `sudo apt update`

---

## 4. Cipher Theory & Examples (from Lecture Notes)

### Substitution Cipher
- Each letter is replaced by another according to a fixed table.
- **Vulnerable to frequency analysis and known-plaintext attacks.**
- **Example:** If 'E' is most common in English, and 'Q' is most common in ciphertext, guess Q→E.

### Permutation (Transposition) Cipher
- Rearranges order of characters in blocks.
- **Vulnerable to anagram analysis and known-plaintext attacks.**
- **Example:** Block "EHLLO" is an anagram of "HELLO".

### One-Time Pad (OTP)
- XORs plaintext with a truly random key of equal length.
- **Perfect secrecy if key is never reused.**
- **Key reuse breaks security.**
- **Example:** If same key is used for two messages, attacker can XOR ciphertexts to get relationship between plaintexts.

### Block Cipher (AES)
- Encrypts fixed-size blocks (e.g., 128 bits) using a secret key.
- **Security depends on mode:**
  - ECB: Insecure, reveals patterns.
  - CBC/CTR/GCM: Secure if IV/nonce is never reused.
- **Example:** ECB-encrypted image reveals original image structure.

### IV/Nonce Management
- Never reuse IV/nonce with the same key in stream/block cipher modes.
- **Example:** WEP Wi-Fi protocol was broken due to IV reuse.

---

## 5. Quick Reference Table

| Key Size | Tests/sec (4GHz) | Time to Crack (single-core) |
| -------- | ---------------- | --------------------------- |
| 42-bit   | 7.8M             | ~6.5 days                   |
| 56-bit   | 7.8M             | ~9.4 years                  |
| 64-bit   | 7.8M             | ~70,400 years               |

---

*For more details, see `cs2107/lect_notes/CS2107_Topic_1_Notes.md`.*
