# E.1 RSA Challenge

## Breaking it Down
This is an RSA encryption challenge. We're given the modulus `n`, public exponent `e`, and ciphertext `c`. The goal is to decrypt `c` to recover the original message (the flag) by finding the private key `d`.

RSA encryption works by: `c = m^e mod n`, where `m` is the plaintext message as an integer.
Decryption requires: `m = c^d mod n`, where `d` is the private exponent.

To find `d`, we need to factor `n` into its prime factors `p` and `q`, then compute Euler's totient `phi_n = (p-1) * (q-1)`, and finally `d = e^{-1} mod phi_n`.

Since `n` is a large number (1024 bits), manual factoring is impossible, so we use factordb.com to get the factors.

## My Thought Process
- RSA is asymmetric: public key (n, e) for encryption, private key (d) for decryption.
- Factoring `n` gives `p` and `q`.
- Use `phi_n` to compute `d` as the modular inverse of `e`.
- Decrypt `c` with `m = c^d mod n`.
- `m` is an integer representing the plaintext; convert to bytes (big-endian), then decode as UTF-8 string to get the flag.

## Step-by-Step Solution
1. **Factor n using factordb.com**:
   - Query: `http://factordb.com/api?query={n}`
   - Parse JSON response for factors if status is 'FF' (fully factored).
   - Extract `p` and `q` as integers.

2. **Compute Euler's totient**:
   - Formula: `phi_n = (p - 1) * (q - 1)`

3. **Compute private exponent d**:
   - Formula: `d = pow(e, -1, phi_n)` (modular inverse of e modulo phi_n)

4. **Decrypt ciphertext**:
   - Formula: `m = pow(c, d, n)` (modular exponentiation)

5. **Convert m to bytes**:
   - Byte length: `(m.bit_length() + 7) // 8` (round up bits to bytes)
   - `m_byte = m.to_bytes(byte_length, 'big')` (big-endian byte order)

6. **Decode to flag**:
   - `flag = m_byte.decode('utf-8')`

## Tools Used
- Python 3 with `requests` library for API calls
- factordb.com for factoring large numbers
- Modular arithmetic functions (`pow` for exponentiation and inverse)

## Flag
CS2107{B1G_but_f4ct0rDB_c4n_h3lP_m3_S0lV3}</content>
<parameter name="filePath">c:\Users\xiang\Desktop\y2\cs2107\assignment1\easy1\writeups.md