# Easy3 Solution

1. Download bkcrack from https://github.com/kimci86/bkcrack/releases (get the win64 zip).
2. Extract bkcrack.exe to the folder with sus_package.zip.
3. List files in ZIP: bkcrack -L sus_package.zip
4. Find keys using known plaintext: bkcrack -C sus_package.zip -c "Assignment 1.pdf" -p "../../Assignment 1.pdf"
5. Decrypt flag: bkcrack -C sus_package.zip -k [keys from step 4] -c "flag.txt" -d flag.txt
6. Read flag.txt for the answer.

## How ZipCrypto Encryption Works and Why the Attack Succeeds

ZipCrypto encryption (used in ZIP files) is weak, which is why the known plaintext attack works. Here's how it functions and why it's vulnerable.

### How ZipCrypto Encryption Works
1. **Password to Keys**: The password is hashed to create 3 initial "keys" (32-bit numbers, like `7e827b05 98ea3b23 33a5bfc8`). These are the starting point for encryption.
2. **Keystream Generation**: For each byte of the file, a "keystream" byte is generated using a Linear Congruential Generator (LCG)—a math formula that produces a sequence of pseudo-random numbers. The LCG updates the keys for each byte.
   - Formula (simplified): `next_key = (current_key * 0x08088405 + 1) % 2^32`
   - This creates a stream of "random" bytes.
3. **Encryption**: Each plaintext byte is XORed with the keystream byte to get ciphertext.
   - `ciphertext_byte = plaintext_byte XOR keystream_byte`
   - Decryption reverses it: `plaintext_byte = ciphertext_byte XOR keystream_byte`
4. **Header**: The first 12 bytes of each file include a random header, encrypted the same way.

The LCG is deterministic—if you know the initial keys, you can regenerate the exact keystream.

### Why the Known Plaintext Attack Works
ZipCrypto's weakness is that the LCG is predictable and reversible with enough data.

1. **Get Keystream from Known Plaintext**:
   - You have known plaintext (e.g., the PDF).
   - XOR it with the ciphertext from the ZIP: `keystream = ciphertext XOR plaintext`
   - This gives you part of the keystream.

2. **Reverse the LCG**:
   - The LCG is linear, so with ~12 bytes of keystream, you can work backward to find the initial keys.
   - bkcrack brute-forces the LCG state (3 keys) by trying combinations until the generated keystream matches your known one.
   - It starts from the end (easier to reverse) and checks if it fits.

3. **Decrypt Everything**:
   - With the keys, regenerate the full keystream for any file in the ZIP.
   - XOR the ciphertext with the keystream to get plaintext.

### Why It's Broken
- **Short Keys**: Only 96 bits (3 x 32-bit), easy to brute-force with known data.
- **No Salt/IV**: Same password always gives same keys—no randomness per file.
- **LCG Flaws**: The generator is old (from 1990s) and cryptographically weak—predictable after a few bytes.
- **No Modern Crypto**: Unlike AES-256, ZipCrypto is legacy and should never be used.

In this case, the PDF gives enough known data (~80KB) to crack the keys instantly. If the file was compressed (deflate), it'd be harder because compression scrambles the data. That's why the flag mentions "deflate"! This attack is why ZipCrypto is obsolete—always use AES for ZIPs.