# CS2107 Tutorial 4 Answers

## 1. (Pitfalls: Cryptographic Hash for PRNG)

Bob's implementation: s = 160 zeros (fixed), x1 = H(s), x2 = H(x1), v = first 128 bits of x1, k = first 128 bits of x2.

Since s is fixed, x1, x2, v, k are all fixed constants, not random.

Ciphertext-only attack: Attacker knows the algorithm and public IV v. Since v is fixed, and k is fixed, attacker can decrypt any ciphertext using the known k.

Bob's argument is wrong because hash outputs are deterministic; a fixed seed produces fixed outputs, not random.

## 2. (Insecure PRNG with rand())

Bob uses s = rand() (16 or 32 bits), seeded by time(NULL).

Attack 1 (knowing time): If attacker knows the approximate time, brute-force possible time values (e.g., within a few seconds), compute s = rand(time), then regenerate x1, x2, extract k, decrypt.

Attack 2 (without time): Since rand() has small state (16/32 bits), brute-force all possible s (2^16 or 2^32 possibilities), compute k for each, try decrypting the ciphertext until valid plaintext.

Feasible since 2^32 operations are assumed possible.

## 3. (Secure RNG Comparison and Attack)

(a) Java.security.SecureRandom or /dev/urandom provide cryptographically secure, unpredictable random numbers, unlike the predictable rand() in question 2.

(b) Bob's updated scheme: Generate seed s from secure RNG, then k, v = H(s).

Vulnerability: Ciphertext-only attack to find k.

Since IV is derived from k (e.g., IV = f(k)) and IV is public, attacker can brute-force possible k such that f(k) = public IV. For each candidate k, attempt to decrypt the ciphertext; if it yields valid plaintext, k is found.

## 4. (Online vs Offline Attack)

(a) 10 alphanumeric characters: 62^10 ≈ 8.4 × 10^17 possibilities. At 10,000 verifications/sec with 1-sec delay and 1 attempt/user, online attack takes ≈ 2.7 × 10^11 years. Sufficient against online attacks per RFC4086.

(b) Offline attack: Attacker eavesdrops c, u, h.

Guess password p, compute k = SHA3(p), decrypt c with k to get r, compute h' = mac(k, r), check if h' = h.

If match, p is correct. Offline dictionary attack, feasible if p weak.

10 characters insufficient against offline attacks.

Fixed r = 0: c = ENC(k, 0) fixed. Attacker precomputes for guessed p: decrypt c to get r (0), compute h, compare to captured h.

Home wifi: Recommend at least 20 random characters due to offline attacks.

## 5. (Design of MAC)

The construction mac(k, m) = Enc_k(H(m)) is not secure because it allows forgery.

Suppose attacker obtains mac(k, m) = Enc_k(H(m)) for known m.

Since H(m) known, compute stream = mac(k, m) ⊕ H(m).

For any m', forge mac'(k, m') = H(m') ⊕ stream.

Violates unforgeability.