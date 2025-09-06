# CS2107 Tutorial 1 – Structured Answers & Study Notes

## 1. Key Concepts & Definitions

- **Confidentiality:** Only authorized parties can access information.
- **Integrity:** Information is not altered without detection.
- **Authentication:** Verifying the identity of users or systems.
- **Availability:** Information/resources are accessible when needed.

---

## 2. Tutorial Answers

### Q1: Security Requirements Compromised (Phishing Scenario)

- **Confidentiality:** Compromised (attacker accessed sensitive info)
- **Integrity:** Not compromised (no evidence of data alteration)
- **Authentication:** Compromised (attacker impersonated Alice)
- **Availability:** Compromised (server overloaded, denying service)

**Example:**
If an attacker gets your password, they can read your emails (confidentiality), send fake emails (integrity), pretend to be you (authentication), and even lock you out (availability).

---

### Q2: Brute-Force Key Search Calculations

#### (a) 64-bit key, 4GHz single-core, 512 cycles/test

| Parameter          | Value              |
| ------------------ | ------------------ |
| Total keys         | 2^64               |
| Cycles per test    | 512                |
| Processor speed    | 4GHz = 4 × 10^9 Hz |
| Time per test      | 512 / (4 × 10^9) s |
| Tests/sec          | 7.81 × 10^6        |
| Total time (sec)   | 2^64 / 7.81 × 10^6 |
| Total time (years) | ≈ 70,400           |

#### (b) 1024 servers, each quad-core 4GHz

| Parameter          | Value              |
| ------------------ | ------------------ |
| Total cores        | 1024 × 4 = 4096    |
| Total tests/sec    | 4096 × 7.81 × 10^6 |
| Total time (sec)   | 2^64 / 3.2 × 10^10 |
| Total time (years) | ≈ 18.3             |

#### (c) Bitcoin Network (hash rate = 1T = 2^40 tests/sec)

| Parameter          | Value               |
| ------------------ | ------------------- |
| Total tests/sec    | 2^40                |
| Total time (sec)   | 2^64 / 2^40 = 2^24  |
| Total time (years) | ≈ 0.53 (6.1 months) |

---

### Q3: 42-bit key, 4GHz single-core

| Parameter         | Value              |
| ----------------- | ------------------ |
| Total keys        | 2^42               |
| Tests/sec         | 7.81 × 10^6        |
| Total time (sec)  | 2^42 / 7.81 × 10^6 |
| Total time (days) | ≈ 6.54             |

---

## 3. Cipher Theory & Examples (from Lecture Notes)

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

## 4. Quick Reference Table

| Key Size | Tests/sec (4GHz) | Time to Crack (single-core) |
| -------- | ---------------- | --------------------------- |
| 42-bit   | 7.8M             | ~6.5 days                   |
| 56-bit   | 7.8M             | ~9.4 years                  |
| 64-bit   | 7.8M             | ~70,400 years               |

---

*For more details, see `cs2107/lect_notes/CS2107_Topic_1_Notes.md`.*
           = 2^24/2^25
           = approximately 0.5 years
```

3. Suppose it takes 512 clock cycles to test whether a 42-bit cryptographic
key is correct, when given a plaintext m and the corresponding ciphertext
c.
How long does it take to exhaustively check all the keys using a 4GHz
(single-core) processor?

```
Time taken to check all keys:
    Total time = 512/(4*10^9) * 2^42 / 2^25
               = approximately 0.0168 years
               = approximately 6.12 days
```

3. use a hashtable to do a direct look-up of the hash value
use diffie hellman method

4. Lecture 1 mentioned that Winzip encrypts the compressed file. Why it
is meaningless to carry out the two operations in the other way, that is,
encrypts the file, and then compresses the encrypted file?
(Hint: Consider the effectiveness of compression on “random” sequences, and a
requirement of encryption scheme.)

The answer is: Because compression algorithms rely on finding and exploiting patterns
 in data to reduce its size, and encrypted data is designed to be
 indistinguishable from random noise.
 Therefore, compressing encrypted data is unlikely to yield any
 significant size reduction, making the process inefficient and unnecessary.

5. Bob encrypted a music mp3 file using Winzip, which employs the 256-
bit key AES. He chose a 6-digit number as password. Winzip generated
the 256-bit AES key from the 6-digit password using a (deterministic)
function, say SHA1.
Alice obtained the ciphertext. Alice also knew that Bob used a 6-digit
password and knew how Winzip generated the AES key.
(a) Given a 256-bit string, can Alice determine whether this string was
indeed the correct AES key?
(b) How many guesses did Alice really need in order to get the mp3 file?

So alice knows that sha1 is used, that it is 6-digit and she also have the
ciphertext. She can try all possible 6-digit passwords, hash each one using
SHA12, and see if it matches her ciphertext. If she finds a match, she has the
correct AES key.

a. Can she determine it is the correct Aes key?
She can decrypt the ciphertext using this key and see if she obtains a valid mp3 file.
The chance of a random garbage looking like an mp3 file is super low so she can use that
as a good indicator.

b. 10^6 = 1,000,000 tries for the worst-case scenario as each combination of
6-digit number is mapped to a unique AES key.

6. Find out more about these terminologies and well-known persons in cryp-
tography
(a) NSA, NIST, cryptography backdoor, Decryption order ;
(b) Edward Snowden.

a.
NSA (National Security Agency) is a U.S. government agency responsible for signals intelligence and information assurance. The NSA is involved in various aspects of cryptography, including the development and analysis of encryption algorithms, as well as the implementation of secure communication systems for the U.S. government.
NIST (National Institute of Standards and Technology) is a U.S. government agency that develops and promotes measurement standards, including those for cryptography. NIST plays a key role in establishing cryptographic standards and guidelines for federal agencies and the private sector.
Cryptography backdoor refers to a method or mechanism that allows unauthorized access to encrypted data, typically implemented by the creator of the encryption system. This can pose significant security risks, as it may be exploited by malicious actors.
Decryption order refers to the sequence in which encrypted data is decrypted. In some cases, the order of decryption may be important for maintaining the integrity and confidentiality of the data.

b. Edward Snowden is a former National Security Agency (NSA) contractor who leaked classified information about the agency's surveillance programs in 2013. His disclosures revealed the extent of the NSA's data collection efforts, including the collection of phone metadata and internet communications of millions of people worldwide. Snowden's actions sparked a global debate about privacy, security, and government surveillance.
