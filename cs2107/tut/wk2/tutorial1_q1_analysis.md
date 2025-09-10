# Question 4: Why Compressing After Encryption is Meaningless (Winzip)

## Key Points
- **Compression** works by finding and removing patterns, redundancies, or repeated sequences in data. The more predictable or structured the data, the better it can be compressed.
- **Encryption** (when done well) transforms data into ciphertext that appears completely random, with no discernible patterns or structure.

## Explanation
If you encrypt a file first, the output (ciphertext) is designed to look like random noise. Since compression algorithms rely on patterns to reduce file size, they are ineffective on random data—there are no patterns to exploit, so the compression rate is essentially zero.

In contrast, compressing before encryption is effective: the original file likely contains patterns and redundancies that can be removed, making the file smaller. Then, encrypting the compressed file produces a random-looking ciphertext, but now the ciphertext is as small as possible.

**Summary:**
- Compressing after encryption is meaningless because a well-encrypted file is already maximally random and cannot be compressed further. Always compress before encrypting to achieve both security and space savings.
---

# CS2107 Tutorial 1 - Question 1 Security Analysis

## Question 1 Scenario
Alice was the Web administrator of the company VIC1. A malicious attacker sent an email to Alice. The email instructed Alice to click on a link so as to login to the human resource (HR) system to view a report. In the email, information on the "sender" indicated it was from the HR manager in VIC. Alice wrongly believed that the email was indeed sent by the manager and followed the instructions. In doing so, she revealed her password to the attacker. Using Alice's password, the attacker logged-in to the web-server, and invoked many processes. As a result, the server was overloaded.

---

## Security Requirements Compromised

1. **Confidentiality** ❌ COMPROMISED
   - Alice's password (confidential information) was disclosed to an unauthorized party (the attacker).
2. **Authentication** ❌ COMPROMISED
   - The attacker successfully impersonated the HR manager, bypassing proper authentication mechanisms.
3. **Integrity** ❌ COMPROMISED
   - The attacker, using Alice's credentials, executed unauthorized processes on the system.
4. **Availability** ❌ COMPROMISED
   - The server became overloaded, potentially making services unavailable to legitimate users.
5. **Authorization** ❌ COMPROMISED
   - The attacker gained unauthorized access to the web-server using stolen credentials.

---

## Attack Method
This is a **phishing attack** combined with **credential theft**, leading to **unauthorized system access** and a potential **denial of service** condition.

---

## Summary
All major security requirements were compromised:
- Confidentiality (password disclosure)
- Authentication (sender impersonation)
- Integrity (unauthorized process execution)
- Availability (server overload)
- Authorization (unauthorized system access)

---

# Question 2: Known-Plaintext Attack Analysis

## Scenario Recap
Suppose it takes 512 clock cycles to test whether a 64-bit cryptographic key is correct, when given a 64-bit plaintext and the corresponding ciphertext (known plaintext attack).

### (a) How long does it take to exhaustively check all the keys using a 4 GHz (single-core) processor?
### (b) How long does it take on a cluster of 1024 servers, each with a quad-core 4GHz processor?
### (c) Bitcoin Network hash rate is the number of Tera cryptographic hashes carried out by all the bitcoin “miners” in the world in one second (so, hash rate of 1 means 1T operations per second). Find out current hash rate. Suppose one cryptographic hash is equivalent to one test of the key, how long would the Bitcoin Network take to check all the 64-bit keys?

---

## Attack Type: Known-Plaintext Attack
The adversary has access to both the plaintext and its corresponding ciphertext. The attacker tries all possible keys (brute-force) to find the one that correctly encrypts the plaintext to the ciphertext.

---

## Brute-Force Attack Process
1. **Initialization:** Attacker has both the plaintext and its corresponding ciphertext. Sets an initial key guess (starting from 0).
2. **State Machine:** For each key, encrypt the plaintext and compare to the ciphertext. If it matches, the key is found; otherwise, increment and repeat.
3. **Each key test takes 512 clock cycles.**
4. **Repeat until all keys are tested or the correct key is found.**

---

## Calculations (Convert to Years, 2^25 ≈ 1 year)

### (a) Single 4 GHz Processor
- Number of keys: 2^64
- Cycles per key: 512
- Total cycles: 2^64 × 512 = 2^73
- Processor speed: 4 GHz = 2^32 cycles/sec
- Total time: 2^73 / 2^32 = 2^41 seconds
- Convert to years: 2^41 / 2^25 = 2^16 years = 65,536 years

### (b) 4096-core Cluster
- Parallel speedup: 4096 cores = 2^12
- Time per core: 2^41 / 2^12 = 2^29 seconds
- Convert to years: 2^29 / 2^25 = 2^4 years = 16 years

### (c) Bitcoin Network (Hash Rate)
- Hash rate = H × 2^40 hashes/sec
- Total time: 2^64 / (H × 2^40) = 2^24 / H seconds
- Convert to years: (2^24 / H) / 2^25 = (1/2H) years
- For H = 1: 0.5 years; H = 100: ~1.8 days

**Summary Table:**

| Scenario           | Time (years)      |
| ------------------ | ----------------- |
| Single 4 GHz core  | 65,536            |
| 4096-core cluster  | 16                |
| Bitcoin (1 TH/s)   | 0.5               |
| Bitcoin (100 TH/s) | ~0.005 (1.8 days) |

**Note:** These are idealized calculations; real-world performance may be lower due to overheads.

---

## Bitcoin Mining and Hash Rate Context

- **Bitcoin mining**: Miners solve cryptographic puzzles to add blocks to the blockchain and secure the network.
- **Hash rate**: Number of hash calculations per second (e.g., TH/s = 10^12 H/s).
- **Why use hash rate?**: It gives a real-world estimate of global computational power for cryptographic operations.
- **Relevance**: Shows that even with massive power, strong cryptography remains secure if the key size is large enough.

---

# Why Attackers Target Session Keys Instead of Long-Term Keys

Attackers often try to compromise session keys rather than long-term (master) keys because session keys are typically much easier to brute-force or obtain.

- **Session keys** are temporary keys used for a single session or transaction. They are often shorter (e.g., 42 bits) for performance reasons.
- **Long-term keys** (master keys) are used to derive session keys and are usually much longer (e.g., 128 bits) for strong security.

### Brute-Force Effort Comparison
- **Session key (e.g., 42 bits):**
  - Number of possible keys: 2^42
  - Brute-force effort: Feasible with modern hardware (e.g., clusters or botnets)
- **Long-term key (e.g., 128 bits):**
  - Number of possible keys: 2^128
  - Brute-force effort: Completely infeasible (would take longer than the age of the universe)

### Why Attackers Prefer Session Keys
- **Lower computational effort:** Breaking a 2^42 key is vastly easier than 2^128.
- **Immediate payoff:** Compromising a session key allows attackers to decrypt current communications or impersonate a user for that session.
- **Limited exposure:** Even if a session key is compromised, only that session is affected, but attackers can repeat the attack for new sessions.

**Summary:**
Attackers target session keys because the brute-force search space (2^42) is much smaller and more practical to attack than the enormous space for long-term keys (2^128).

---

# Question 3: Walkie-Talkie Session Key Attack & Table Size

## Scenario Recap
In the rSWT walkie-talkie system, each message is encrypted with a 42-bit session key (ek), derived from a 128-bit long-term key (k) and a random 128-bit value (v). The message is prefixed with 64 zeros before encryption. The attacker can eavesdrop and obtain (v∥c), and knows that the decrypted message should start with 64 zeros.

## Can the Attacker Carry Out Exhaustive Search?
Yes. Since the attacker knows that the first 64 bits of the decrypted message must be all zeros, they can try all possible 42-bit session keys (ek), decrypt c with each candidate key, and check if the result starts with 64 zeros. If it does, the attacker has likely found the correct session key and can recover the plaintext.

However, 42 bits is still a large space (2^42 ≈ 4.4 trillion keys), so brute-forcing on a typical laptop is slow. rSWT claims this is sufficient for real-time security, as by the time the message is cracked, it is no longer useful.

## (a) Fast Attack Using Huge Storage (100TB)
If the attacker has a device with huge storage (e.g., 100TB), they can use a **precomputed table** (time-memory tradeoff):

- Precompute and store the decryption of all possible 42-bit keys for a fixed prefix (e.g., the 64 zeros).
# CS2107 Tutorial 1 Notes

---

## Question 1: Security Analysis

### Scenario
Alice was the Web administrator of the company VIC1. A malicious attacker sent an email to Alice. The email instructed Alice to click on a link so as to login to the human resource (HR) system to view a report. In the email, information on the "sender" indicated it was from the HR manager in VIC. Alice wrongly believed that the email was indeed sent by the manager and followed the instructions. In doing so, she revealed her password to the attacker. Using Alice's password, the attacker logged-in to the web-server, and invoked many processes. As a result, the server was overloaded.

### Security Requirements Compromised
1. **Confidentiality** ❌ COMPROMISED
   - Alice's password (confidential information) was disclosed to an unauthorized party (the attacker).
2. **Authentication** ❌ COMPROMISED
   - The attacker successfully impersonated the HR manager, bypassing proper authentication mechanisms.
3. **Integrity** ❌ COMPROMISED
   - The attacker, using Alice's credentials, executed unauthorized processes on the system.
4. **Availability** ❌ COMPROMISED
   - The server became overloaded, potentially making services unavailable to legitimate users.
5. **Authorization** ❌ COMPROMISED
   - The attacker gained unauthorized access to the web-server using stolen credentials.

### Attack Method
This is a **phishing attack** combined with **credential theft**, leading to **unauthorized system access** and a potential **denial of service** condition.

### Summary
All major security requirements were compromised:
- Confidentiality (password disclosure)
- Authentication (sender impersonation)
- Integrity (unauthorized process execution)
- Availability (server overload)
- Authorization (unauthorized system access)

---

## Question 2: Known-Plaintext Attack Analysis

### Scenario Recap
Suppose it takes 512 clock cycles to test whether a 64-bit cryptographic key is correct, when given a 64-bit plaintext and the corresponding ciphertext (known plaintext attack).

#### (a) How long does it take to exhaustively check all the keys using a 4 GHz (single-core) processor?
#### (b) How long does it take on a cluster of 1024 servers, each with a quad-core 4GHz processor?
#### (c) Bitcoin Network hash rate is the number of Tera cryptographic hashes carried out by all the bitcoin “miners” in the world in one second (so, hash rate of 1 means 1T operations per second). Find out current hash rate. Suppose one cryptographic hash is equivalent to one test of the key, how long would the Bitcoin Network take to check all the 64-bit keys?

### Attack Type
The adversary has access to both the plaintext and its corresponding ciphertext. The attacker tries all possible keys (brute-force) to find the one that correctly encrypts the plaintext to the ciphertext.

### Brute-Force Attack Process
1. **Initialization:** Attacker has both the plaintext and its corresponding ciphertext. Sets an initial key guess (starting from 0).
2. **State Machine:** For each key, encrypt the plaintext and compare to the ciphertext. If it matches, the key is found; otherwise, increment and repeat.
3. **Each key test takes 512 clock cycles.**
4. **Repeat until all keys are tested or the correct key is found.**

### Calculations (Convert to Years, 2^25 ≈ 1 year)

**(a) Single 4 GHz Processor**
- Number of keys: 2^64
- Cycles per key: 512
- Total cycles: 2^64 × 512 = 2^73
- Processor speed: 4 GHz = 2^32 cycles/sec
- Total time: 2^73 / 2^32 = 2^41 seconds
- Convert to years: 2^41 / 2^25 = 2^16 years = 65,536 years

**(b) 4096-core Cluster**
- Parallel speedup: 4096 cores = 2^12
- Time per core: 2^41 / 2^12 = 2^29 seconds
- Convert to years: 2^29 / 2^25 = 2^4 years = 16 years

**(c) Bitcoin Network (Hash Rate)**
- Hash rate = H × 2^40 hashes/sec
- Total time: 2^64 / (H × 2^40) = 2^24 / H seconds
- Convert to years: (2^24 / H) / 2^25 = (1/2H) years
- For H = 1: 0.5 years; H = 100: ~1.8 days

**Summary Table:**

| Scenario           | Time (years)      |
| ------------------ | ----------------- |
| Single 4 GHz core  | 65,536            |
| 4096-core cluster  | 16                |
| Bitcoin (1 TH/s)   | 0.5               |
| Bitcoin (100 TH/s) | ~0.005 (1.8 days) |

**Note:** These are idealized calculations; real-world performance may be lower due to overheads.

### Bitcoin Mining and Hash Rate Context
- **Bitcoin mining**: Miners solve cryptographic puzzles to add blocks to the blockchain and secure the network.
- **Hash rate**: Number of hash calculations per second (e.g., TH/s = 10^12 H/s).
- **Why use hash rate?**: It gives a real-world estimate of global computational power for cryptographic operations.
- **Relevance**: Shows that even with massive power, strong cryptography remains secure if the key size is large enough.

---

## Question 3: Walkie-Talkie Session Key Attack & Table Size

### Scenario Recap
In the rSWT walkie-talkie system, each message is encrypted with a 42-bit session key (ek), derived from a 128-bit long-term key (k) and a random 128-bit value (v). The message is prefixed with 64 zeros before encryption. The attacker can eavesdrop and obtain (v∥c), and knows that the decrypted message should start with 64 zeros.

### Can the Attacker Carry Out Exhaustive Search?
Yes. Since the attacker knows that the first 64 bits of the decrypted message must be all zeros, they can try all possible 42-bit session keys (ek), decrypt c with each candidate key, and check if the result starts with 64 zeros. If it does, the attacker has likely found the correct session key and can recover the plaintext.

However, 42 bits is still a large space (2^42 ≈ 4.4 trillion keys), so brute-forcing on a typical laptop is slow. rSWT claims this is sufficient for real-time security, as by the time the message is cracked, it is no longer useful.

**(a) Fast Attack Using Huge Storage (100TB)**
If the attacker has a device with huge storage (e.g., 100TB), they can use a **precomputed table** (time-memory tradeoff):
- Precompute and store the decryption of all possible 42-bit keys for a fixed prefix (e.g., the 64 zeros).
- For each possible ek, store the mapping from ciphertext prefix to key.
- When a new (v∥c) is observed, the attacker can quickly look up the table to find the likely session key, reducing the time needed to crack the message to near-instantaneous (at the cost of large storage).

**(b) Lower Storage (1TB) (Optional)**
With less storage, the attacker can use more advanced time-memory tradeoff techniques (like rainbow tables or distinguished points) to reduce the storage requirement, but the lookup and computation time will increase.

### Table Size Calculation for Precomputed Attack
To store the decrypted 64-bit prefix for every possible 42-bit session key:
- Number of possible session keys: 2^42
- For each key, store 64 bits (8 bytes)
- Total storage required = 2^42 × 64 bits = 2^42 × 8 bytes = 2^45 bytes = 32 TB

**Calculation:**
```
2^42 keys × (64 bits / 8) = 2^42 × 8 bytes = 2^45 bytes = 32 TB
```
So, a full precomputed table mapping every 42-bit key to its 64-bit decrypted prefix would require about 32 terabytes of storage. This is within the range of a "huge storage" device (e.g., 100TB), but not feasible for small devices. This calculation shows why the attack is practical only with significant storage resources.

---

## Question 4: Why Compressing After Encryption is Meaningless (Winzip)

### Key Points
- **Compression** works by finding and removing patterns, redundancies, or repeated sequences in data. The more predictable or structured the data, the better it can be compressed.
- **Encryption** (when done well) transforms data into ciphertext that appears completely random, with no discernible patterns or structure.

### Explanation
If you encrypt a file first, the output (ciphertext) is designed to look like random noise. Since compression algorithms rely on patterns to reduce file size, they are ineffective on random data—there are no patterns to exploit, so the compression rate is essentially zero.

In contrast, compressing before encryption is effective: the original file likely contains patterns and redundancies that can be removed, making the file smaller. Then, encrypting the compressed file produces a random-looking ciphertext, but now the ciphertext is as small as possible.

**Summary:**
- Compressing after encryption is meaningless because a well-encrypted file is already maximally random and cannot be compressed further. Always compress before encrypting to achieve both security and space savings.

**What is Bitcoin Mining?**
- Bitcoin mining is the process by which new blocks are added to the Bitcoin blockchain. Miners use computers to solve complex mathematical puzzles (cryptographic hash functions) to validate transactions and secure the network.
- The first miner to solve the puzzle gets to add the next block and is rewarded with Bitcoin.

**What is Hash Rate?**
- The hash rate is a measure of how many hash calculations (attempts to solve the puzzle) are performed per second across the entire Bitcoin network.
- It is usually measured in hashes per second (H/s), with common units like Tera hashes per second (TH/s, or 10^12 H/s).

**Why Use Bitcoin's Hash Rate to Estimate Global Computational Power?**
- The Bitcoin network is one of the largest distributed computing systems in the world, with millions of specialized mining devices (ASICs) working in parallel.
- By looking at the total hash rate, we get a real-world estimate of how much computational power is available globally for a specific type of cryptographic operation (hashing).
- This makes it a useful benchmark for estimating how quickly a brute-force attack could be performed if all of Bitcoin's mining power were redirected to attack a cryptographic system.

**Relevance to Q2 Calculations:**
- In Q2, we use the Bitcoin network's hash rate to estimate how long it would take to brute-force a 64-bit key, assuming all miners worked together on the attack.
- This provides a practical, up-to-date reference for the scale of global computational resources, showing that even with massive power, strong cryptography remains secure if the key size is large enough.

**Summary:**
- Bitcoin mining and hash rate give us a concrete way to understand and compare the real-world difficulty of brute-forcing cryptographic keys, making the calculations in Q2 more relatable and meaningful.
