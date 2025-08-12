# CS2107 Topic 1: Encryption for Confidentiality

## 1. Encryption Fundamentals

### 1.1 Basic Definitions

**Symmetric-Key Encryption Scheme** consists of:
- **Encryption Algorithm**: E_k(x) = c
- **Decryption Algorithm**: D_k(c) = x
- **Key**: k (shared secret)

**Correctness**: D_k(E_k(x)) = x for any plaintext x and key k

**Security**: From ciphertext, eavesdropper cannot derive useful information about key k or plaintext x

### 1.2 Application Scenario
Alice encrypts file F with password → sends ciphertext C to Bob → Bob decrypts with same password
- Password sent via **secure channel**
- Ciphertext sent via **public channel** (may be eavesdropped)

## 2. Threat Models & Attack Classifications

### 2.1 Attacker's Goals (Strength: Weakest → Strongest)
1. **Distinguishability**: Can distinguish between ciphertexts of two given plaintexts
2. **Partial Break**: Extract some plaintext information or decrypt specific ciphertext
3. **Total Break**: Recover the secret key

### 2.2 Attacker's Capabilities (Information Access)
1. **Ciphertext Only**: Only has access to ciphertext
2. **Known Plaintext**: Has plaintext-ciphertext pairs (attacker can't choose)
3. **Chosen Plaintext Attack (CPA)**: Access to encryption oracle
4. **Chosen Ciphertext Attack (CCA2)**: Access to decryption oracle

### 2.3 Oracle Concepts
- **Encryption Oracle**: Input plaintext → Output ciphertext (practical via smart cards, servers)
- **Decryption Oracle**: Input ciphertext → Output plaintext (practical via padding oracle attacks)

## 3. Classical Ciphers

### 3.1 Substitution Cipher
**Key**: Substitution table S (1-1 mapping from alphabet to alphabet)
- **Key Space**: 27! ≈ 2^94 (computationally infeasible for exhaustive search)
- **Encryption**: Replace each character using table S
- **Decryption**: Use inverse table S^-1

**Vulnerabilities**:
- **Known Plaintext Attack**: Derive substitution table from plaintext-ciphertext pairs
- **Frequency Analysis**: Map frequent ciphertext characters to frequent English letters

### 3.2 Permutation Cipher (Transposition)
**Key**: Permutation p = (p₁, p₂, ..., pₜ) for block size t
- **Encryption**: Rearrange characters in each block according to permutation
- **Decryption**: Apply inverse permutation

**Vulnerabilities**:
- **Known Plaintext Attack**: Easily determine block size and permutation
- **Ciphertext Only**: Vulnerable if plaintext is English text

### 3.3 One-Time Pad
**Encryption**: C = P ⊕ K (XOR with key same length as plaintext)
**Decryption**: P = C ⊕ K

**Properties**:
- **Perfect Secrecy**: Information-theoretically secure (unbreakable even with unlimited computing power)
- **Key Requirement**: Key must be same length as plaintext and used only once
- **Impractical**: Requires extremely long keys (1GB plaintext needs 1GB key)

## 4. Modern Ciphers

### 4.1 Design Principles
- Use rounds of substitution (S-boxes) and permutation
- Secure against known attacks (frequency analysis, known plaintext)
- Key length sufficient to prevent exhaustive search

### 4.2 Historical Examples
- **DES (1977)**: 56-bit key, broken by exhaustive search
- **RC4, A5/1, ZipCrypto**: All broken
- **AES (2001)**: Current standard, no known attacks

### 4.3 AES (Advanced Encryption Standard)
- **Block Size**: 128 bits
- **Key Sizes**: 128, 192, or 256 bits
- **Status**: NSA Suite B Cryptography
- **Security**: No known attacks on the cipher itself

## 5. Block Ciphers & Modes of Operation

### 5.1 Block Cipher Concept
- Fixed input/output size (AES: 128 bits)
- For large plaintexts: divide into blocks + apply mode of operation

### 5.2 Electronic Code Book (ECB) Mode
```
Plaintext:  X₁  X₂  X₃  X₄
           ↓   ↓   ↓   ↓
Encrypt:   E_k E_k E_k E_k
           ↓   ↓   ↓   ↓
Ciphertext: Y₁  Y₂  Y₃  Y₄
```
**Problem**: Identical plaintext blocks → identical ciphertext blocks (leaks patterns)
**Verdict**: **DO NOT USE**

### 5.3 Cipher Block Chaining (CBC) Mode
```
IV ⊕ X₁ → E_k → C₁
C₁ ⊕ X₂ → E_k → C₂
C₂ ⊕ X₃ → E_k → C₃
```
**Properties**:
- Uses Initialization Vector (IV) - must be different for each encryption
- Secure against CPA
- Vulnerable to padding oracle attacks
- **Verdict**: **USE WITH CAUTION**

### 5.4 Counter (CTR) Mode
```
IV+1 → E_k → R₁ ⊕ X₁ → C₁
IV+2 → E_k → R₂ ⊕ X₂ → C₂
IV+3 → E_k → R₃ ⊕ X₃ → C₃
```
**Properties**:
- Stream cipher mode
- Secure against CPA
- No integrity protection (malleable)
- Same IV leaks information
- **Verdict**: **USE WITH CAUTION**

### 5.5 Galois/Counter Mode (GCM)
**Properties**:
- Authenticated Encryption (AE)
- Provides both confidentiality AND integrity
- Secure against decryption oracle attacks
- **Verdict**: **USE THIS**

## 6. Key Security Concepts

### 6.1 Key Strength
Security quantified by equivalent exhaustive search effort
- **Example**: 2048-bit RSA ≈ 128-bit symmetric key strength
- **Current Recommendations**: Minimum 128-bit equivalent

### 6.2 Initialization Vector (IV) Requirements
- **Must be different** for each encryption
- **CBC**: IV should be unpredictable (random)
- **CTR**: IV must never repeat with same key
- **Purpose**: Makes encryption probabilistic

### 6.3 Common Implementation Pitfalls
1. **Wrong crypto choice**: Using broken schemes (ZipCrypto, RC4)
2. **Wrong mode**: Using ECB instead of secure modes
3. **IV misuse**: Reusing IVs or predictable IVs
4. **Side-channel attacks**: Information leakage through implementation
5. **Missing integrity**: Encryption without authentication

## 7. Attack Examples

### 7.1 Meet-in-the-Middle Attack
Attacks encryption schemes with multiple rounds by attacking from both ends

### 7.2 Padding Oracle Attack
- Exploit systems that reveal padding validity
- Attacker learns whether decrypted ciphertext has correct padding
- Can decrypt entire ciphertext without knowing the key

## 8. Practical Recommendations

### ✅ DO USE:
- **AES-GCM**: For new applications requiring both confidentiality and integrity
- **AES-CBC + HMAC**: For legacy systems needing integrity
- **Proper key derivation**: Convert passwords to encryption keys securely

### ⚠️ USE WITH CAUTION:
- **AES-CBC**: Vulnerable to padding oracle, ensure proper IV handling
- **AES-CTR**: No integrity, ensure unique IVs

### ❌ DO NOT USE:
- **AES-ECB**: Leaks patterns
- **Classical ciphers**: Substitution, permutation (broken)
- **Broken schemes**: RC4, DES, ZipCrypto

## 9. Key Takeaways

1. **Encryption ≠ Security**: Must consider threat model and implementation
2. **Multiple attack vectors**: Cryptanalysis, implementation flaws, side-channels
3. **Integrity matters**: Many systems implicitly require integrity protection
4. **IV/Nonce handling**: Critical for security, often implemented incorrectly
5. **Use standards**: Prefer well-analyzed, standardized algorithms and modes
