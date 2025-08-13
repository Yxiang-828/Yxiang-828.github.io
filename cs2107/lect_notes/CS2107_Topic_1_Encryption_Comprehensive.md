# CS2107 Topic 1: Encryption for Confidentiality

## 1. Learning Objectives
- [ ] Understand fundamental concepts of symmetric-key encryption
- [ ] Analyze threat models and attack classifications in cryptography
- [ ] Evaluate classical ciphers and their vulnerabilities
- [ ] Apply modern cipher designs and secure implementation practices
- [ ] Distinguish between different modes of operation and their security properties
- [ ] Identify common implementation pitfalls and countermeasures
- [ ] Assess real-world cryptographic attacks and defenses

## 2. Key Terminology & Definitions

### 2.1 Core Encryption Definitions

> **Definition 1.1: Symmetric-Key Encryption Scheme**
> 
> A symmetric-key encryption scheme consists of three components:
> - **Encryption Algorithm**: E_k(x) → c (transforms plaintext x to ciphertext c using key k)
> - **Decryption Algorithm**: D_k(c) → x (recovers plaintext x from ciphertext c using key k)
> - **Key Space**: Set of all possible keys k
> 
> **Correctness Property**: ∀x, k: D_k(E_k(x)) = x

> **Definition 1.1a: Plaintext**
> 
> The original, readable message or data that is input to an encryption algorithm.

> **Definition 1.1b: Ciphertext**
> 
> The encrypted output produced by applying the encryption algorithm to the plaintext. Ciphertext appears random and unreadable without the decryption key.

> **Definition 1.2: Cryptographic Security**
> 
> A cryptographic scheme provides security if an computationally bounded eavesdropper cannot derive useful information about the key k or plaintext x from the ciphertext c.

> **Definition 1.3: Perfect Secrecy**
> 
> An encryption scheme has perfect secrecy if the ciphertext reveals no information about the plaintext, regardless of the computational power of the adversary.
> 
> **Mathematical Form**: P(M = m | C = c) = P(M = m) for all m, c

> **Definition 1.4: Initialization Vector (IV)**
> 
> A random or pseudorandom value used to ensure that encryption is probabilistic, preventing identical plaintexts from producing identical ciphertexts.

> **Definition 1.5: Oracle**
> 
> A theoretical or practical mechanism that allows an attacker to obtain information:
> - **Encryption Oracle**: Provides ciphertext for chosen plaintext
> - **Decryption Oracle**: Provides plaintext for chosen ciphertext

### 2.2 Attack Classifications

> **Definition 1.6: Chosen Plaintext Attack (CPA)**
> 
> An attack where the adversary can choose plaintexts and obtain their corresponding ciphertexts through access to an encryption oracle.

> **Definition 1.7: Chosen Ciphertext Attack (CCA)**
> 
> An attack where the adversary can choose ciphertexts and obtain their corresponding plaintexts through access to a decryption oracle.

> **Definition 1.8: Semantic Security**
> 
> An encryption scheme is semantically secure if no computationally bounded adversary can distinguish between encryptions of two chosen plaintexts.

### 2.3 Block Cipher Concepts

> **Definition 1.9: Block Cipher**
> 
> A symmetric-key cipher that operates on fixed-size blocks of data (typically 128 bits for AES).
> 
> **Properties**: Deterministic, reversible permutation on the block space

> **Definition 1.10: Mode of Operation**
> 
> A method for applying a block cipher to encrypt data larger than the block size, defining how multiple blocks are processed.

> **Definition 1.11: Authenticated Encryption (AE)**
> 
> An encryption scheme that simultaneously provides confidentiality and authenticity/integrity of data.

## 3. Core Theorems & Security Properties

### 3.1 Security Models

> **Theorem 1.1: Perfect Secrecy Characterization (Shannon)**
> 
> An encryption scheme has perfect secrecy if and only if:
> 1. The key space is at least as large as the message space
> 2. Every key is used with equal probability
> 3. For every plaintext-ciphertext pair, there exists exactly one key that encrypts the plaintext to that ciphertext
> 
> **Implication**: One-Time Pad achieves perfect secrecy

> **Theorem 1.2: Key Space Lower Bound**
> 
> For perfect secrecy, the number of keys must be at least as large as the number of possible plaintexts.
> 
> **Proof Sketch**: Information-theoretic argument based on entropy

### 3.2 Attack Complexity Results

> **Proposition 1.1: Exhaustive Search Complexity**
> 
> For a cipher with k-bit keys, exhaustive search requires on average 2^(k-1) operations and at most 2^k operations.

> **Proposition 1.2: Frequency Analysis Vulnerability**
> 
> Simple substitution ciphers can be broken in polynomial time using frequency analysis when the plaintext follows known statistical patterns.

> **Proposition 1.3: Block Independence Property**
> 
> In ECB mode, identical plaintext blocks always produce identical ciphertext blocks, revealing plaintext patterns.

### 3.3 Security Proofs Framework

> **Theorem 1.3: CPA Security Reduction**
> 
> If a block cipher is a pseudorandom permutation, then CBC mode with random IV is CPA-secure.

> **Theorem 1.4: Authenticated Encryption Security**
> 
> GCM mode provides both CPA security and ciphertext integrity under the assumption that the underlying block cipher is secure.

## 4. Classical Ciphers Analysis

### 4.1 Substitution Cipher

> **Cipher 1.1: Monoalphabetic Substitution**
> 
> **Key**: Permutation π of the alphabet Σ
> **Encryption**: E_π(m) = π(m₁)π(m₂)...π(mₙ)
> **Decryption**: D_π(c) = π⁻¹(c₁)π⁻¹(c₂)...π⁻¹(cₙ)
> 
> **Key Space Size**: |Σ|! ≈ 26! ≈ 2^94 for English alphabet
> **Security**: Vulnerable to frequency analysis

### 4.2 Transposition Cipher

> **Cipher 1.2: Permutation Cipher**
> 
> **Key**: Permutation p = (p₁, p₂, ..., pₜ) for block size t
> **Encryption**: Rearrange characters according to permutation
> **Security**: Preserves character frequencies, vulnerable to known plaintext

### 4.3 One-Time Pad

> **Cipher 1.3: Vernam Cipher (One-Time Pad)**
> 
> **Key**: Random string K of same length as plaintext
> **Encryption**: C = P ⊕ K (bitwise XOR)
> **Decryption**: P = C ⊕ K
> 
> **Security**: Perfect secrecy (Shannon proved)
> **Limitation**: Key must be truly random, same length as message, and used only once

## 5. Modern Cryptographic Systems

### 5.1 Advanced Encryption Standard (AES)

> **Cipher 5.1: AES Specification**
> 
> **Block Size**: 128 bits
> **Key Sizes**: 128, 192, 256 bits
> **Structure**: Substitution-Permutation Network (SPN)
> **Rounds**: 10/12/14 rounds (depending on key size)
> **Status**: NIST FIPS 197 standard, NSA Suite B approved

### 5.2 Block Cipher Modes

> **Mode 5.1: Electronic Codebook (ECB)**
> 
> **Operation**: Cᵢ = E_k(Pᵢ) for each block i
> **Properties**: 
> - Deterministic
> - Parallel encryption/decryption
> - Preserves patterns
> **Security Verdict**: ❌ DO NOT USE

> **Mode 5.2: Cipher Block Chaining (CBC)**
> 
> **Operation**: 
> - C₀ = IV (random)
> - Cᵢ = E_k(Pᵢ ⊕ Cᵢ₋₁) for i ≥ 1
> **Properties**:
> - Requires random IV
> - Sequential encryption, parallel decryption
> - CPA-secure with random IV
> **Security Verdict**: ⚠️ USE WITH CAUTION

> **Mode 5.3: Counter (CTR) Mode**
> 
> **Operation**: Cᵢ = Pᵢ ⊕ E_k(IV + i)
> **Properties**:
> - Stream cipher behavior
> - Parallel encryption/decryption
> - Requires unique IV per key
> - No integrity protection
> **Security Verdict**: ⚠️ USE WITH CAUTION

> **Mode 5.4: Galois/Counter Mode (GCM)**
> 
> **Operation**: Combines CTR mode with GMAC authentication
> **Properties**:
> - Authenticated encryption
> - Parallel processing
> - Provides confidentiality AND integrity
> **Security Verdict**: ✅ RECOMMENDED

## 6. Cryptographic Attacks

### 6.1 Meet-in-the-Middle Attack

> **Attack 6.1: Meet-in-the-Middle**
> 
> **Target**: Multiple encryption schemes (e.g., Double DES)
> **Method**: 
> 1. Encrypt plaintext with all possible k₁: E_k₁(P)
> 2. Decrypt ciphertext with all possible k₂: D_k₂(C)
> 3. Find collision: E_k₁(P) = D_k₂(C)
> **Complexity**: O(2^(k/2)) instead of O(2^k) for k-bit keys
> **Countermeasure**: Use sufficient key length, proper key scheduling

### 6.2 Padding Oracle Attack

> **Attack 6.2: Padding Oracle Attack**
> 
> **Prerequisites**: 
> - CBC mode with PKCS#7 padding
> - Oracle reveals padding validity
> **Method**: Manipulate ciphertext blocks to learn padding information
> **Impact**: Complete plaintext recovery without key knowledge
> **Countermeasure**: Constant-time implementation, authenticated encryption

### 6.3 Frequency Analysis

> **Attack 6.3: Statistical Cryptanalysis**
> 
> **Target**: Substitution ciphers
> **Method**: Exploit language statistics (letter frequencies, digrams, trigrams)
> **Complexity**: Polynomial time
> **Countermeasure**: Use modern ciphers with proper diffusion

## 7. Worked Examples

### Example 1: One-Time Pad Security
**Problem**: Prove that reusing a one-time pad key compromises security.

**Solution**:
Let P₁, P₂ be two plaintexts encrypted with same key K:
- C₁ = P₁ ⊕ K
- C₂ = P₂ ⊕ K

Computing C₁ ⊕ C₂:
C₁ ⊕ C₂ = (P₁ ⊕ K) ⊕ (P₂ ⊕ K) = P₁ ⊕ P₂

**Result**: The key K cancels out, revealing the XOR of plaintexts. If one plaintext is known or guessed, the other can be recovered.

### Example 2: ECB Mode Pattern Leakage
**Problem**: Show how ECB mode reveals patterns in encrypted images.

**Solution**:
Consider a bitmap image with repeated pixel blocks:
- Original: [Block_A, Block_A, Block_B, Block_A]
- ECB encrypted: [E_k(Block_A), E_k(Block_A), E_k(Block_B), E_k(Block_A)]

**Analysis**: Identical plaintext blocks produce identical ciphertext blocks, preserving the image structure even after encryption.

### Example 3: CBC IV Requirements
**Problem**: Demonstrate why CBC requires unpredictable IVs.

**Solution**:
If IV is predictable (e.g., counter), attacker can:
1. Choose plaintext P
2. Predict next IV
3. Query encryption oracle: C = E_k(P ⊕ IV)
4. For new encryption with known IV': compare patterns

**Attack**: Predictable IV allows distinguishing between plaintexts, breaking CPA security.

### Example 4: CTR Mode Nonce Reuse
**Problem**: Analyze the security impact of reusing nonces in CTR mode.

**Solution**:
With same key k and nonce IV:
- C₁ = P₁ ⊕ E_k(IV + 1)
- C₂ = P₂ ⊕ E_k(IV + 1)

Computing C₁ ⊕ C₂ = P₁ ⊕ P₂

**Impact**: Same as one-time pad reuse - reveals plaintext relationships.

### Example 5: Padding Oracle Attack Simulation
**Problem**: Outline padding oracle attack against CBC with PKCS#7.

**Solution**:
1. **Setup**: Ciphertext C = [C₀, C₁] where C₀ is IV
2. **Goal**: Recover plaintext P₁ 
3. **Method**: 
   - Modify C₀ systematically
   - Query oracle with [C₀', C₁]
   - When padding is valid, infer information about P₁
4. **Recovery**: Byte-by-byte plaintext recovery

### Example 6: Key Strength Comparison
**Problem**: Compare security levels of different key sizes.

**Solution**:
| Algorithm | Key Size | Security Level | Equivalent Symmetric |
|-----------|----------|----------------|---------------------|
| DES | 56 bits | 2^56 operations | 56 bits |
| 3DES | 112 bits | 2^112 operations | 112 bits |
| AES-128 | 128 bits | 2^128 operations | 128 bits |
| RSA-2048 | 2048 bits | ~2^112 operations | ~112 bits |

**Analysis**: RSA requires much larger keys for equivalent security due to known factoring algorithms.

## 8. Implementation Security

### 8.1 Common Pitfalls

> **Pitfall 8.1: Weak Random Number Generation**
> 
> **Problem**: Using predictable sources for keys/IVs
> **Impact**: Cryptographic keys become guessable
> **Solution**: Use cryptographically secure random number generators

> **Pitfall 8.2: Side-Channel Information Leakage**
> 
> **Problem**: Timing, power, or electromagnetic leakage
> **Examples**: 
> - Timing attacks on RSA implementations
> - Power analysis on smart cards
> **Solution**: Constant-time implementations, physical countermeasures

> **Pitfall 8.3: Improper Key Management**
> 
> **Problem**: Keys stored in plaintext, transmitted insecurely
> **Impact**: Complete system compromise
> **Solution**: Secure key derivation, hardware security modules

### 8.2 Best Practices

> **Practice 8.1: Use Authenticated Encryption**
> 
> **Recommendation**: Prefer AES-GCM over CBC mode
> **Reason**: Provides both confidentiality and integrity

> **Practice 8.2: Proper IV/Nonce Handling**
> 
> **CBC**: Use random, unpredictable IVs
> **CTR/GCM**: Use unique nonces, never repeat with same key

> **Practice 8.3: Key Derivation**
> 
> **Problem**: Direct password use as encryption key
> **Solution**: Use PBKDF2, scrypt, or Argon2 for key derivation

## 9. Applications & Real-World Examples

### 9.1 Historical Cryptographic Failures

> **Case Study 9.1: WEP Protocol**
> 
> **Weakness**: RC4 key reuse, weak IV generation
> **Attack**: IV collision leads to key recovery
> **Lesson**: Proper nonce management is critical

> **Case Study 9.2: ZIP Encryption**
> 
> **Weakness**: Custom stream cipher with known plaintext attacks
> **Impact**: Complete archive decryption possible
> **Lesson**: Use standard, well-analyzed algorithms

### 9.2 Modern Success Stories

> **Case Study 9.3: TLS 1.3**
> 
> **Design**: Authenticated encryption mandatory
> **Algorithms**: AES-GCM, ChaCha20-Poly1305
> **Success**: No known practical attacks on protocol

## 10. Problem-Solving Strategies

### For Cryptographic Analysis
1. **Identify the threat model**: What can the attacker do?
2. **Determine security goals**: Confidentiality, integrity, authenticity?
3. **Analyze the construction**: How do components interact?
4. **Look for known weaknesses**: Pattern preservation, oracle access?
5. **Consider implementation factors**: Side channels, randomness quality?

### For System Design
1. **Use established standards**: AES, approved modes
2. **Implement defense in depth**: Multiple security layers
3. **Consider the entire system**: Not just the crypto
4. **Plan for key management**: Generation, distribution, rotation
5. **Test against known attacks**: Practical validation

## 11. Common Mistakes & Misconceptions

### Mistake 1: "Encryption Equals Security"
- **Error**: Believing encryption alone provides complete security
- **Reality**: Must consider integrity, key management, implementation
- **Solution**: Use authenticated encryption, secure protocols

### Mistake 2: "Obscurity Provides Security"
- **Error**: Relying on secret algorithms instead of secret keys
- **Reality**: Security should depend only on key secrecy (Kerckhoffs' principle)
- **Solution**: Use public, well-analyzed algorithms

### Mistake 3: "Rolling Your Own Crypto"
- **Error**: Implementing custom cryptographic algorithms
- **Reality**: Extremely difficult to create secure crypto
- **Solution**: Use established libraries and standards

### Mistake 4: "Longer Keys Are Always Better"
- **Error**: Using excessively long keys without considering other factors
- **Reality**: Implementation complexity may introduce vulnerabilities
- **Solution**: Use recommended key sizes, focus on proper implementation

## 12. Quick Reference Summary

### Security Recommendations
| Use Case | Algorithm | Mode | Key Size | Notes |
|----------|-----------|------|----------|-------|
| New Applications | AES | GCM | 128+ bits | Authenticated encryption |
| Legacy Systems | AES | CBC + HMAC | 128+ bits | Separate auth required |
| High Performance | ChaCha20 | Poly1305 | 256 bits | Software-optimized |

### Attack Complexity Reference
| Attack Type | Complexity | Countermeasure |
|-------------|------------|----------------|
| Brute Force | O(2^k) | Sufficient key length |
| Meet-in-Middle | O(2^(k/2)) | Avoid double encryption |
| Frequency Analysis | O(n log n) | Use modern ciphers |
| Padding Oracle | Polynomial | Authenticated encryption |

### Mode Comparison
| Mode | Confidentiality | Integrity | Parallelizable | IV Requirements |
|------|----------------|-----------|----------------|-----------------|
| ECB | ❌ Weak | ❌ None | ✅ Yes | None |
| CBC | ✅ Good | ⚠️ Limited | ⚠️ Decrypt only | Random |
| CTR | ✅ Good | ❌ None | ✅ Yes | Unique |
| GCM | ✅ Good | ✅ Strong | ✅ Yes | Unique |

## 13. Review Questions
- [ ] Can I explain the difference between semantic security and perfect secrecy?
- [ ] Can I identify vulnerabilities in classical cipher designs?
- [ ] Can I compare the security properties of different block cipher modes?
- [ ] Can I analyze the impact of IV/nonce reuse in different modes?
- [ ] Can I explain why authenticated encryption is preferred?
- [ ] Can I identify common implementation pitfalls and their countermeasures?
- [ ] Can I assess the practical security of cryptographic systems?
- [ ] Can I distinguish between different attack models (CPA, CCA, etc.)?
- [ ] Can I explain the principles behind modern cipher design?
- [ ] Can I evaluate the appropriateness of cryptographic choices for different applications?

## 14. Further Reading & Advanced Topics
- **Provable Security**: Formal security proofs and reductions
- **Post-Quantum Cryptography**: Quantum-resistant algorithms
- **Side-Channel Analysis**: Physical attack methodologies
- **Cryptographic Protocols**: Key exchange, digital signatures
- **Implementation Security**: Secure coding practices
