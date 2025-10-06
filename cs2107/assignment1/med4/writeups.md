# CS2107 Assignment 1 - Med4 Writeup: ChaCha20-Poly1305 Nonce Reuse Attack

## Problem Overview
"M.4 Spill Some Tea" involves interacting with a server that encrypts messages using ChaCha20-Poly1305 AEAD (Authenticated Encryption with Associated Data) cipher. The server reuses the same nonce for all encryptions, which is a critical security flaw. The goal is to recover the encrypted flag by exploiting this reuse to decrypt it without the key.

The server provides two main options:
1. Encrypt user-provided "tea" (plaintext).
2. Retrieve the encrypted flag.

Given only the encrypted outputs, we must decrypt the flag using a known-plaintext attack.

## ChaCha20-Poly1305 Primer
ChaCha20-Poly1305 is a modern AEAD cipher combining:
- **ChaCha20**: A stream cipher for confidentiality.
- **Poly1305**: A MAC (Message Authentication Code) for integrity.

### ChaCha20 Stream Cipher
ChaCha20 generates a pseudorandom keystream from:
- **Key**: 32 bytes (256 bits).
- **Nonce**: 12 bytes (96 bits) – must be unique per encryption with the same key.
- **Counter**: 4 bytes, starts at 0 and increments for each 64-byte block.

The keystream is XORed with plaintext to produce ciphertext:
```
ciphertext = plaintext ⊕ keystream
plaintext = ciphertext ⊕ keystream
```

ChaCha20 uses the Salsa20 quarter-round function in a 20-round variant. It expands the key and nonce into a 4x4 matrix of 32-bit words, then performs rounds of quarter-round operations (addition, XOR, rotation).

**Why Nonce Reuse is Fatal**: If the nonce is reused with the same key, the keystream is identical. This allows:
- Known-plaintext attacks: If you know any plaintext-ciphertext pair, you can recover the keystream.
- Full decryption of other messages encrypted with the same nonce.

### Poly1305 MAC
Poly1305 computes a 16-byte tag over the ciphertext (and optional associated data) using:
- A one-time key derived from the ChaCha20 keystream.
- Modular arithmetic with a prime (2^130 - 5).

The tag ensures authenticity: any tampering invalidates it. However, since we're exploiting confidentiality (not integrity), we ignore the tag in the attack.

### AEAD Encryption Format
Encrypted message = ciphertext || tag (16 bytes).
- Ciphertext length = plaintext length.
- Total length = plaintext + 16.

## Vulnerability Analysis
The server reuses the nonce, so all encryptions use the same keystream. This violates RFC 8439 (ChaCha20-Poly1305 spec), which requires unique nonces.

### Attack Vector
1. **Obtain Encrypted Flag**: Server provides `encrypted_flag = ciphertext_flag || tag_flag`.
2. **Send Known Plaintext**: Encrypt a known string (e.g., 60 'A's) to get `encrypted_known = ciphertext_known || tag_known`.
3. **Recover Keystream**: Since keystream is reused:
   ```
   keystream = known_plaintext ⊕ ciphertext_known
   ```
   (Trim tag from encrypted_known first.)
4. **Decrypt Flag**:
   ```
   plaintext_flag = ciphertext_flag ⊕ keystream
   ```
   (Trim tag from encrypted_flag first.)

### Why This Works Mathematically
- ChaCha20 keystream K is fixed due to nonce reuse.
- For known plaintext P_known:
  ```
  C_known = P_known ⊕ K
  K = P_known ⊕ C_known
  ```
- For flag plaintext P_flag:
  ```
  C_flag = P_flag ⊕ K
  P_flag = C_flag ⊕ K = C_flag ⊕ (P_known ⊕ C_known)
  ```
- Since ⊕ is associative and self-inverse, this recovers P_flag.

### Inner Workings: Keystream Generation
ChaCha20 initializes a 16-word (64-byte) state:
```
state = [constants] + [key_words] + [counter] + [nonce_words]
```
- Constants: "expand 32-byte k" in little-endian.
- Key: Split into 8 words.
- Counter: Starts at 0.
- Nonce: 3 words.

For each block:
- Perform 20 rounds (10 double-rounds) of quarter-rounds on the state.
- Add original state to the mixed state.
- Serialize to 64 bytes of keystream.
- Increment counter for next block.

The keystream is XORed byte-by-byte with plaintext. Since nonce is reused, the state initialization is identical, producing the same keystream sequence.

### Poly1305 Tag Computation
- ChaCha20 generates a one-time key for Poly1305 from the first 32 bytes of keystream.
- Poly1305 processes the ciphertext in 16-byte chunks, accumulating with modular multiplication.
- Final tag = accumulator + padding.

In the attack, we discard the tag, focusing only on the ChaCha20 part.

## Exploit Implementation
Using Python's `socket` for server interaction:

```python
import socket

def recv_until(sock, text):
    data = b""
    while text.encode() not in data:
        data += sock.recv(1024)
    return data.decode()

def send(sock, text):
    sock.send(text.encode() + b"\n")

# Connect
sock = socket.socket()
sock.connect(("cs2107-ctfd-i.comp.nus.edu.sg", 5003))

# Skip menu
recv_until(sock, ">> ")

# Get encrypted flag
send(sock, "2")
data = recv_until(sock, ">> ")
encrypted_flag_hex = ...  # Parse from data
length = ...  # Parse length

# Send known plaintext
flag_len = length - 16
known = b"A" * flag_len
send(sock, "1")
recv_until(sock, "Enter your Tea: ")
send(sock, known.decode())
data = recv_until(sock, ">> ")
encrypted_known_hex = ...  # Parse

# Compute
encrypted_flag = bytes.fromhex(encrypted_flag_hex)
encrypted_known = bytes.fromhex(encrypted_known_hex)
keystream = bytes(a ^ b for a, b in zip(known, encrypted_known[:-16]))
flag_bytes = bytes(a ^ b for a, b in zip(encrypted_flag[:-16], keystream))
flag = flag_bytes.decode()

print(flag)
sock.close()
```

## Flag
CS2107{t3a_w4s_sP1lled_chacha20_n0nc3_r3us3_1s_d4ng3r0us!!!}

## Lessons Learned
- Nonce reuse breaks ChaCha20 confidentiality, enabling stream cipher attacks.
- AEAD ciphers require unique nonces; reuse allows keystream recovery.
- ChaCha20's security relies on the Salsa20 core's diffusion and confusion properties, but nonce ensures uniqueness.
- In practice, use libraries like `cryptography` with proper nonce management.</content>
<parameter name="filePath">c:\Users\xiang\Desktop\y2\cs2107\assignment1\med4\writeups.md