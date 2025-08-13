# CS2107 Topic 1: Encryption for Confidentiality - Comprehensive Notes

## 1. Learning Objectives
- [ ] Understand fundamental cryptographic concepts (keys, ciphers, perfect secrecy)
- [ ] Master threat models and attack classifications (CPA (Chosen Plaintext Attack), CCA (Chosen Ciphertext Attack), etc.)
- [ ] Analyze classical cipher weaknesses and cryptanalysis techniques
- [ ] Evaluate modern cipher designs (AES (Advanced Encryption Standard)) and security properties
- [ ] Compare block cipher modes (ECB (Electronic Codebook), CBC (Cipher Block Chaining), CTR (Counter Mode), GCM (Galois/Counter Mode))
- [ ] Apply cryptographic best practices in secure system design

## 2. Key Terminology & Definitions

### Abbreviations Reference
> - **AES (Advanced Encryption Standard)**: Modern symmetric cipher
> - **CBC (Cipher Block Chaining)**: Block cipher mode with chained encryption
> - **CCA (Chosen Ciphertext Attack)**: Attacker can choose ciphertexts to decrypt
> - **CCM (Counter with CBC-MAC)**: Authenticated encryption mode
> - **CPA (Chosen Plaintext Attack)**: Attacker can choose plaintexts to encrypt
> - **CPU (Central Processing Unit)**: Main processor of a computer
> - **CTR (Counter Mode)**: Stream cipher-like block cipher mode
> - **DES (Data Encryption Standard)**: Legacy symmetric cipher, now broken
> - **DNS (Domain Name System)**: Internet service translating domain names to IP addresses
> - **ECB (Electronic Codebook)**: Insecure block cipher mode
> - **GCM (Galois/Counter Mode)**: Authenticated encryption mode
> - **HTTP (HyperText Transfer Protocol)**: Web communication protocol
> - **HTTPS (HyperText Transfer Protocol Secure)**: Secure web communication protocol
> - **IoT (Internet of Things)**: Network of interconnected devices
> - **IV (Initialization Vector)**: Random value for encryption initialization
> - **MAC (Message Authentication Code)**: Integrity protection mechanism
> - **OTP (One-Time Pad)**: Theoretical perfect encryption scheme
> - **PRNG (Pseudo-Random Number Generator)**: Deterministic random number generator
> - **RAM (Random Access Memory)**: Computer's working memory
> - **RSA (Rivest-Shamir-Adleman)**: Public key cryptosystem
> - **SPN (Substitution-Permutation Network)**: Cipher design structure
> - **TLS (Transport Layer Security)**: Secure communication protocol
> - **URL (Uniform Resource Locator)**: Web address format
> - **WEP (Wired Equivalent Privacy)**: Legacy wireless security protocol
> - **XOR (Exclusive OR)**: Binary operation, true when inputs differ

### Core Definitions

**Encryption**: Mathematical transformation that converts plaintext into ciphertext using a secret key, making data unreadable to unauthorized parties.

**Cipher**: Algorithm that performs encryption and decryption operations. Must be publicly known while security depends on secret key.

**Key**: Secret parameter that controls the encryption/decryption process. Security of entire system depends on key secrecy.

**Plaintext**: Original, readable message before encryption (denoted as m or M).

**Ciphertext**: Encrypted message after transformation (denoted as c or C).

**Keyspace**: Set of all possible keys for a given cipher. Larger keyspace generally means stronger security.

**Perfect Secrecy**: Theoretical security property where ciphertext reveals no information about plaintext, regardless of computational power available to attacker.

**Computational Security**: Practical security based on assumption that breaking the cipher requires computationally infeasible resources.

## 3. Core Concepts

### 3.1 Perfect Secrecy

> **Theorem 3.1 (Shannon's Perfect Secrecy)**
> 
> An encryption scheme has perfect secrecy if and only if:
> - P(M = m | C = c) = P(M = m) for all messages m and ciphertexts c
> - The ciphertext provides zero information about the plaintext
> 
> **Conditions for Perfect Secrecy:**
> 1. |K| ≥ |M| (keyspace at least as large as message space)
> 2. Each key used exactly once
> 3. Keys chosen uniformly at random
> 
> **Significance**: Provides theoretical upper bound for encryption security

### 3.2 One-Time Pad (OTP (One-Time Pad))

> **Theorem 3.2 (OTP (One-Time Pad) Perfect Secrecy)**
> 
> The OTP (One-Time Pad) achieves perfect secrecy when:
> - Key length equals message length
> - Key is truly random
> - Key is never reused
> - Key is kept perfectly secret
> 
> **Operation**: c = m ⊕ k (bitwise XOR (Exclusive OR))
> **Decryption**: m = c ⊕ k

**Practical Limitations of OTP (One-Time Pad)**:
1. **Key Distribution Problem**: Securely sharing keys as long as messages
2. **Key Storage**: Massive storage requirements for long communications
3. **Key Synchronization**: Ensuring sender and receiver use same key portions
4. **One-Time Use**: Each key bit can only be used once

### 3.3 Threat Models and Attack Classifications

#### 3.3.1 Attack Hierarchy (Weakest to Strongest)

1. **Ciphertext-Only Attack**
   - Attacker has only ciphertext
   - Must deduce plaintext or key from ciphertext alone
   - Weakest attack model

2. **Known-Plaintext Attack**
   - Attacker has plaintext-ciphertext pairs
   - Attempts to deduce key or decrypt other ciphertexts

3. **Chosen Plaintext Attack (CPA (Chosen Plaintext Attack))**
   - Attacker can choose plaintexts and obtain corresponding ciphertexts
   - Has access to encryption oracle
   - Common in practice (public key systems, adaptive attackers)

4. **Chosen Ciphertext Attack (CCA (Chosen Ciphertext Attack))**
   - Attacker can choose ciphertexts and obtain corresponding plaintexts
   - Has access to decryption oracle
   - Strongest practical attack model

> **Security Principle**: If a cipher is secure against stronger attacks, it's automatically secure against weaker attacks.

**Practical implication**: Design systems secure against the weakest meaningful attack (distinguishability). If system prevents distinguishability attacks, it prevents all stronger attacks too.

**Practical implication**: Design systems secure against the weakest meaningful attack (distinguishability). If system prevents distinguishability attacks, it prevents all stronger attacks too.

#### 3.3.2 Security Goals

**Indistinguishability**: Given two messages chosen by attacker, they cannot distinguish which one was encrypted, even with access to encryption oracle.

**Semantic Security**: Computationally infeasible to extract any information about plaintext from ciphertext, beyond what can be inferred from length.

**Non-malleability**: Attacker cannot modify ciphertext to produce related plaintext without detection.

### 3.4 Encryption Oracle Scenarios

**Practical Scenarios for Encryption Oracle (CPA (Chosen Plaintext Attack))**

1. **Challenge-Response Authentication**
   - Server encrypts random challenges
   - Attacker observes encrypted challenges and responses

2. **Automatic Encryption Services**
   - Email encryption systems
   - File encryption utilities
   - Database encryption features

3. **Public Key Cryptography**
   - Public keys allow anyone to encrypt
   - Attacker can encrypt chosen messages

4. **Adaptive Attacks**
   - Network protocols where attacker influences encrypted data
   - Web applications with user-controlled input

## 4. Worked Examples

### Example 4.1: Perfect Secrecy Analysis

**Problem**: Prove that Caesar cipher does not achieve perfect secrecy.

**Solution**:

**Step 1**: Define Caesar cipher parameters
- Message space M = {A, B, C, ..., Z}
- Key space K = {0, 1, 2, ..., 25}
- Encryption: E(k, m) = (m + k) mod 26

**Step 2**: Check perfect secrecy condition
For perfect secrecy: P(M = m | C = c) = P(M = m)

**Step 3**: Find counterexample
- Let plaintext distribution: P(M = A) = 0.5, P(M = B) = 0.5
- Observe ciphertext C = A
- If M = A and C = A, then key k = 0
- If M = B and C = A, then key k = 25

**Step 4**: Calculate conditional probabilities
- P(M = A | C = A) = P(C = A | M = A) × P(M = A) / P(C = A)
- Since keys are uniform: P(C = A | M = A) = 1/26
- P(C = A) = P(M = A) × 1/26 + P(M = B) × 1/26 = 1/26
- Therefore: P(M = A | C = A) = (1/26 × 0.5) / (1/26) = 0.5

**Key Insights**:
- Caesar cipher satisfies perfect secrecy condition by coincidence here
- However, with non-uniform message distributions, perfect secrecy breaks
- Limited keyspace (26 keys) cannot provide perfect secrecy for larger message spaces

### Example 4.2: OTP (One-Time Pad) Key Reuse Attack

**Problem**: Demonstrate why OTP (One-Time Pad) key reuse is catastrophic.

**Solution**:

**Given Information**:
- Two messages: m₁ = "ATTACK", m₂ = "DEFEND"
- Same key k used for both (violation of OTP (One-Time Pad) rules)
- Ciphertexts: c₁ = m₁ ⊕ k, c₂ = m₂ ⊕ k

**Step 1**: Compute ciphertext XOR (Exclusive OR)
c₁ ⊕ c₂ = (m₁ ⊕ k) ⊕ (m₂ ⊕ k) = m₁ ⊕ m₂

**Step 2**: Key cancellation
- XOR (Exclusive OR) is self-inverse: k ⊕ k = 0
- Result contains no key information: c₁ ⊕ c₂ = m₁ ⊕ m₂

**Step 3**: Cryptanalysis
- Convert to binary and XOR (Exclusive OR):
  - ATTACK = 000001 010100 010100 000001 000011 001011
  - DEFEND = 000100 000101 000110 000101 001110 000100
  - XOR (Exclusive OR) result reveals character patterns

**Step 4**: Language analysis
- Use frequency analysis on m₁ ⊕ m₂
- Apply dictionary attacks
- Exploit known language patterns

**Key Insights**:
- Key reuse completely breaks OTP (One-Time Pad) security
- Multiple ciphertexts with same key create solvable system
- Demonstrates critical importance of key management

### Example 4.3: Block Cipher Mode Analysis

**Problem**: Compare ECB (Electronic Codebook) and CBC (Cipher Block Chaining) modes for encrypting identical blocks.

**Solution**:

**Given**:
- Message: "TRANSFER $1000 TO ACCOUNT A, TRANSFER $1000 TO ACCOUNT B"
- Block size: 64 bits
- Identical blocks: "TRANSFER $1000 TO ACCOUNT "

**ECB (Electronic Codebook) Mode Analysis**:

**Step 1**: Block division
- Block 1: "TRANSFER $1000 TO ACCOUNT "
- Block 2: "A, TRANSFER $1000 TO ACCOUNT "
- Block 3: "B" + padding

**Step 2**: ECB (Electronic Codebook) encryption
- C₁ = E(k, "TRANSFER $1000 TO ACCOUNT ")
- C₂ = E(k, "A, TRANSFER $1000 TO ACCOUNT ")  
- C₃ = E(k, "B" + padding)

**Step 3**: Pattern observation
- Blocks 1 and portion of block 2 are identical
- ECB (Electronic Codebook) produces identical ciphertext for identical plaintext
- Attacker can detect repeated patterns

**CBC (Cipher Block Chaining) Mode Analysis**:

**Step 1**: CBC (Cipher Block Chaining) encryption process
- C₁ = E(k, P₁ ⊕ IV (Initialization Vector))
- C₂ = E(k, P₂ ⊕ C₁)
- C₃ = E(k, P₃ ⊕ C₂)

**Step 2**: Chaining effect
- Even identical plaintext blocks produce different ciphertexts
- Each block depends on all previous blocks
- Random IV (Initialization Vector) ensures different results each encryption

**Key Insights**:
- ECB (Electronic Codebook) reveals patterns in plaintext structure
- CBC (Cipher Block Chaining) provides semantic security through chaining
- Proper mode selection critical for security

## 5. Applications & Connections

### 5.1 Classical Cipher Analysis

#### 5.1.1 Caesar Cipher Cryptanalysis

**Modern Relevance**: Understanding basic substitution attacks

**Weaknesses**:
1. **Small Keyspace**: Only 25 meaningful keys
2. **Frequency Analysis**: Letter frequency patterns preserved
3. **Known Plaintext**: Single plaintext-ciphertext pair reveals key

**Attack Methods**:
- **Brute Force**: Try all 25 possible keys
- **Frequency Analysis**: Match ciphertext frequencies to language patterns
- **Pattern Recognition**: Common words like "THE", "AND"

#### 5.1.2 Vigenère Cipher

**Historical Significance**: "Unbreakable" for 300 years until Kasiski analysis

**Security Analysis**:
- **Key Length**: Security increases with key length
- **Repeating Key**: Creates periodic patterns exploitable by frequency analysis
- **Perfect Secrecy**: Approaches perfect secrecy as key length approaches message length

**Modern Lesson**: Demonstrates importance of key management and randomness

### 5.2 Modern Symmetric Cryptography

#### 5.2.1 AES (Advanced Encryption Standard) Design Principles

**SPN (Substitution-Permutation Network) Structure**:
1. **Substitution**: Non-linear transformation (S-boxes)
2. **Permutation**: Linear transformation (diffusion)
3. **Key Addition**: XOR (Exclusive OR) with round key

**Security Properties**:
- **Confusion**: Each ciphertext bit depends on multiple key bits
- **Diffusion**: Single plaintext bit change affects multiple ciphertext bits
- **Avalanche Effect**: Small input changes cause large output changes

**Practical Implementation**:
- **Block Size**: 128 bits
- **Key Sizes**: 128, 192, 256 bits
- **Rounds**: 10, 12, 14 (depending on key size)

#### 5.2.2 Block Cipher Modes of Operation

**Electronic Codebook (ECB (Electronic Codebook))**:
- **Operation**: Each block encrypted independently
- **Security**: Reveals patterns, not semantically secure
- **Use Case**: Random data, single block encryption

**Cipher Block Chaining (CBC (Cipher Block Chaining))**:
- **Operation**: Each block XOR (Exclusive OR)ed with previous ciphertext
- **Security**: Semantically secure with random IV (Initialization Vector)
- **Use Case**: File encryption, secure communication

**Counter Mode (CTR (Counter Mode))**:
- **Operation**: Encrypt counter values, XOR (Exclusive OR) with plaintext
- **Security**: Semantically secure, parallelizable
- **Use Case**: High-speed encryption, random access

**Galois/Counter Mode (GCM (Galois/Counter Mode))**:
- **Operation**: CTR (Counter Mode) + authentication
- **Security**: Provides confidentiality and integrity
- **Use Case**: TLS (Transport Layer Security), secure protocols

### 5.3 Real-World Applications

#### 5.3.1 TLS (Transport Layer Security)/HTTPS (HyperText Transfer Protocol Secure) Communications

**Encryption Usage**:
- **Symmetric Encryption**: Bulk data encryption (AES (Advanced Encryption Standard)-GCM (Galois/Counter Mode))
- **Key Exchange**: Asymmetric cryptography for key establishment
- **Authentication**: Digital signatures and certificates

**Security Requirements**:
- **Forward Secrecy**: Past communications remain secure if keys compromised
- **Authentication**: Verify server identity
- **Integrity**: Detect message tampering

#### 5.3.2 Database Encryption

**Application Scenarios**:
- **Transparent Data Encryption**: Automatic encryption/decryption
- **Column-Level Encryption**: Selective encryption of sensitive fields
- **Backup Encryption**: Protect data at rest

**Implementation Considerations**:
- **Performance**: Encryption overhead on database operations
- **Key Management**: Secure key storage and rotation
- **Compliance**: Regulatory requirements (GDPR, HIPAA)

#### 5.3.3 IoT (Internet of Things) Device Security

**Constraints**:
- **Limited CPU (Central Processing Unit)**: Lightweight encryption required
- **Battery Life**: Energy-efficient algorithms
- **Memory**: Small RAM (Random Access Memory)/storage capacity

**Solutions**:
- **Stream Ciphers**: Lower computational overhead
- **Hardware Acceleration**: Dedicated crypto chips
- **Optimized Implementations**: Assembly-level optimizations

## 6. Common Pitfalls

### 6.1 Key Management Errors

**Pitfall 1: Weak Key Generation**
- **Problem**: Using predictable seeds or poor PRNG (Pseudo-Random Number Generator)
- **Example**: Using current time as seed for key generation
- **Solution**: Use cryptographically secure random number generators

**Pitfall 2: Key Reuse**
- **Problem**: Using same key for multiple purposes or sessions
- **Example**: Same AES (Advanced Encryption Standard) key for encryption and MAC (Message Authentication Code)
- **Solution**: Derive separate keys for different purposes

**Pitfall 3: Hardcoded Keys**
- **Problem**: Embedding keys directly in source code
- **Example**: const char* key = "mysecretkey123";
- **Solution**: Use secure key storage, environment variables, or key management systems

### 6.2 Mode of Operation Mistakes

**Pitfall 4: ECB (Electronic Codebook) Mode Usage**
- **Problem**: Using ECB (Electronic Codebook) for multi-block data
- **Consequence**: Reveals patterns in plaintext
- **Solution**: Use CBC (Cipher Block Chaining), CTR (Counter Mode), or GCM (Galois/Counter Mode)

**Pitfall 5: IV (Initialization Vector) Reuse**
- **Problem**: Reusing IV (Initialization Vector) with same key in CBC (Cipher Block Chaining) or CTR (Counter Mode)
- **Consequence**: Breaks semantic security
- **Solution**: Generate random IV (Initialization Vector) for each encryption

**Pitfall 6: Predictable IV (Initialization Vector)**
- **Problem**: Using sequential or predictable IV (Initialization Vector) values
- **Example**: IV (Initialization Vector) = counter, IV (Initialization Vector) = timestamp
- **Solution**: Use cryptographically random IV (Initialization Vector)

### 6.3 Implementation Vulnerabilities

**Pitfall 7: Side-Channel Attacks**
- **Problem**: Implementation leaks information through timing, power, or electromagnetic emissions
- **Example**: Variable-time implementations revealing key bits
- **Solution**: Constant-time implementations, masking techniques

**Pitfall 8: Padding Oracle Attacks**
- **Problem**: Error messages reveal padding validity
- **Example**: Different error messages for padding vs. MAC (Message Authentication Code) failures
- **Solution**: Uniform error handling, authenticated encryption

**Pitfall 9: Key Exposure in Memory**
- **Problem**: Keys remain in memory after use
- **Consequence**: Memory dumps or swapping expose keys
- **Solution**: Secure memory allocation, explicit key zeroing

## 7. Practice Problems

### Problem 7.1: Perfect Secrecy Analysis
**Question**: For a cipher with 4-bit blocks and 4-bit keys, what is the minimum number of keys required for perfect secrecy? Justify your answer.

**Approach**:
1. Calculate message space size: |M| = 2⁴ = 16
2. Apply Shannon's theorem: |K| ≥ |M|
3. Minimum keys needed: 16
4. Explain why fewer keys cannot achieve perfect secrecy

### Problem 7.2: OTP (One-Time Pad) Security
**Question**: Two messages m₁ and m₂ are encrypted with the same OTP (One-Time Pad) key, producing c₁ and c₂. If an attacker knows m₁, how can they recover m₂?

**Approach**:
1. Express relationship: c₁ = m₁ ⊕ k, c₂ = m₂ ⊕ k
2. Derive key: k = c₁ ⊕ m₁
3. Recover message: m₂ = c₂ ⊕ k = c₂ ⊕ c₁ ⊕ m₁

### Problem 7.3: Block Cipher Mode Security
**Question**: Explain why CTR (Counter Mode) requires a unique nonce for each encryption, even with different keys.

**Approach**:
1. Analyze CTR (Counter Mode) operation: C[i] = P[i] ⊕ E(K, nonce || counter)
2. Consider keystream reuse when nonce repeats
3. Demonstrate two-time pad attack scenario
4. Explain nonce requirements for security

### Problem 7.4: Cryptanalysis Exercise
**Question**: Given Caesar cipher ciphertext "WKLV LV D VHFUHW", determine the plaintext assuming English language.

**Approach**:
1. Apply frequency analysis
2. Try systematic key values
3. Check for valid English words
4. Verify complete decryption

### Problem 7.5: Security Model Comparison
**Question**: Compare the security guarantees provided by CPA (Chosen Plaintext Attack) security vs. CCA (Chosen Ciphertext Attack) security. Give practical scenarios where each is relevant.

**Approach**:
1. Define security models formally
2. Explain attack capabilities in each model
3. Provide real-world examples
4. Discuss when each security level is required

## 8. Quick Reference Summary

### 8.1 Security Definitions
| **Concept** | **Definition** | **Requirements** |
|-------------|----------------|------------------|
| Perfect Secrecy | P(M=m\|C=c) = P(M=m) | \|K\| ≥ \|M\|, one-time use |
| Semantic Security | No polynomial-time algorithm can extract plaintext info | Computationally bounded adversary |
| CPA (Chosen Plaintext Attack) Security | Indistinguishable under chosen plaintext attack | Access to encryption oracle |
| CCA (Chosen Ciphertext Attack) Security | Indistinguishable under chosen ciphertext attack | Access to decryption oracle |

### 8.2 Cipher Comparison
| **Cipher** | **Key Size** | **Block Size** | **Security** | **Use Case** |
|------------|--------------|----------------|--------------|--------------|
| Caesar | 5 bits | 1 character | Broken | Historical study |
| Vigenère | Variable | 1 character | Broken | Classical crypto |
| DES (Data Encryption Standard) | 56 bits | 64 bits | Broken | Legacy systems |
| AES (Advanced Encryption Standard)-128 | 128 bits | 128 bits | Secure | Modern applications |
| AES (Advanced Encryption Standard)-256 | 256 bits | 128 bits | Secure | High security |

### 8.3 Block Cipher Modes
| **Mode** | **IV (Initialization Vector) Required** | **Parallelizable** | **Random Access** | **Security** |
|----------|---------|----------------|------------------|--------------|
| ECB (Electronic Codebook) | No | Yes | Yes | Insecure |
| CBC (Cipher Block Chaining) | Yes | Decrypt only | No | CPA (Chosen Plaintext Attack) secure |
| CTR (Counter Mode) | Yes (nonce) | Yes | Yes | CPA (Chosen Plaintext Attack) secure |
| GCM (Galois/Counter Mode) | Yes | Yes | Yes | CCA (Chosen Ciphertext Attack) secure |

### 8.4 Key Management Principles
1. **Generation**: Use cryptographically secure random sources
2. **Distribution**: Secure channels for key exchange
3. **Storage**: Protected memory, hardware security modules
4. **Usage**: Single purpose, proper mode selection
5. **Rotation**: Regular key updates
6. **Destruction**: Secure deletion from all locations

### 8.5 Common Vulnerabilities
- **Key Reuse**: Breaks OTP (One-Time Pad), reveals patterns in stream ciphers
- **Weak Keys**: Predictable generation, insufficient entropy
- **Mode Misuse**: ECB (Electronic Codebook) patterns, IV (Initialization Vector) reuse
- **Side Channels**: Timing attacks, power analysis
- **Implementation Flaws**: Buffer overflows, memory leaks

## 9. Review Questions

### 9.1 Conceptual Understanding

1. **Perfect Secrecy**: Explain why perfect secrecy requires keyspace at least as large as message space. What happens if |K| < |M|?

2. **Security Models**: Why is CCA (Chosen Ciphertext Attack) security stronger than CPA (Chosen Plaintext Attack) security? Provide concrete examples where the distinction matters.

3. **OTP (One-Time Pad) Limitations**: Despite providing perfect secrecy, why is OTP (One-Time Pad) impractical for most real-world applications?

### 9.2 Technical Analysis

4. **Block Cipher Modes**: Compare CBC (Cipher Block Chaining) and CTR (Counter Mode) in terms of:
   - Error propagation
   - Parallelization capabilities
   - Random access support
   - IV (Initialization Vector) requirements

5. **AES (Advanced Encryption Standard) Design**: Explain how the SPN (Substitution-Permutation Network) structure in AES (Advanced Encryption Standard) achieves confusion and diffusion.

6. **Cryptanalysis**: Describe three different approaches to breaking a substitution cipher. Which is most effective and why?

### 9.3 Practical Applications

7. **TLS (Transport Layer Security) Implementation**: In TLS (Transport Layer Security) 1.3, why is GCM (Galois/Counter Mode) preferred over CBC (Cipher Block Chaining) mode for bulk encryption?

8. **Database Security**: When implementing database encryption, what factors determine whether to use transparent encryption vs. application-level encryption?

9. **IoT (Internet of Things) Constraints**: How do computational and energy constraints in IoT (Internet of Things) devices influence cipher selection and implementation?

### 9.4 Security Evaluation

10. **Threat Modeling**: For a secure messaging application, identify the relevant threat models and explain which security properties are most critical.

**Real-world examples**: TLS (Transport Layer Security) implementations, web applications

**Case Study 9.1: WEP (Wired Equivalent Privacy) Vulnerabilities**
- **Problem**: IV (Initialization Vector) reuse in 802.11 WEP (Wired Equivalent Privacy)
- **Attack**: Fluhrer-Mantin-Shamir attack exploiting RC4 weaknesses
- **Lesson**: Proper IV (Initialization Vector) management critical for stream ciphers

**Case Study 9.2: ECB (Electronic Codebook) Penguin**
- **Problem**: ECB (Electronic Codebook) mode reveals image patterns
- **Demonstration**: Encrypted bitmap shows original structure
- **Lesson**: Mode selection affects practical security

**Case Study 9.3: TLS (Transport Layer Security) 1.3**
- **Improvement**: Mandatory forward secrecy, authenticated encryption
- **Design**: Simplified cipher suites, improved key derivation
- **Impact**: Better security with reduced complexity

---

*Note: This comprehensive guide covers fundamental encryption concepts for CS2107. For advanced topics like public key cryptography and cryptographic protocols, refer to subsequent course materials.*