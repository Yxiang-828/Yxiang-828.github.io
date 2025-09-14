# Med1 Solution: Rolling XOR Decryption

## Steps to Decrypt
1. Identify the file type: `flag.png.enc` is an encrypted PNG.
2. Get the known PNG signature: `89 50 4E 47 0D 0A 1A 0A` (from PNG spec/Wikipedia).
3. Read the first 8 bytes of `flag.png.enc`: `EC 3C 2B 37 65 6B 74 7E`.
4. XOR the encrypted bytes with the known signature to get the key:
   - `EC ^ 89 = 65` (e)
   - `3C ^ 50 = 6C` (l)
   - `2B ^ 4E = 65` (e)
   - `37 ^ 47 = 70` (p)
   - `65 ^ 0D = 68` (h)
   - `6B ^ 0A = 61` (a)
   - `74 ^ 1A = 6E` (n)
   - `7E ^ 0A = 74` (t)
   - Key: `elephant`
5. Decrypt by XORing the entire file with the repeating key "elephant".
6. Save as `flag.png` and open to see the flag.

## How PNG Signature is Known
- **What it is**: A file signature (magic number) is a sequence of bytes at the start of a file that identifies its format. For PNG, it's always `89 50 4E 47 0D 0A 1A 0A` (hex).
- **Why known**: It's standardized in the PNG specification (RFC 2083) and listed on Wikipedia's "List of file signatures" page. Every PNG file starts with this exact 8-byte header.
- **Where I got it**: From the Wikipedia link in the hint, or PNG docs. It's public knowledge.

## How the Decryption Works (Rolling XOR Analysis)
The encryption uses rolling XOR: `data[i] ^= KEY[i % len(KEY)]`, where KEY is "elephant" (8 bytes).

### XOR Basics
- XOR is reversible: `A ^ B = C` → `C ^ B = A`.
- Encryption: `plaintext ^ key = ciphertext`
- Decryption: `ciphertext ^ key = plaintext`

### Why File Signatures Help
- The PNG signature is fixed and known.
- In the encrypted file, the first 8 bytes are `signature ^ key[0:8]`.
- So, `encrypted[0:8] ^ known_signature = key[0:8]`.
- Since the key repeats, we get the full key "elephant".

### Full Process
1. **Key Recovery**: XOR encrypted header with known header to get key bytes.
2. **Decryption**: For each byte in the file, `byte ^= key[i % 8]`.
3. **Validation**: After decryption, the file should have the correct PNG signature, confirming success.

### Why This Attack Works
- **Weakness**: XOR with repeating key is vulnerable if you know any part of the plaintext (here, the header).
- **No Salt/IV**: Same key for every byte, no randomness.
- **Known Plaintext**: File signatures provide free known data.
- **Rolling Nature**: The key cycles, so header reveals the key directly.

This is a common crypto weakness—always use proper encryption like AES. The "Rolling Thunder" title hints at the rolling XOR. Open `flag.png` for the flag!

## How It Is Encrypted
The file is encrypted using rolling XOR with a repeating key. Each byte of the original PNG is XORed with the key byte at that position modulo the key length. The key is "elephant", 8 bytes long, so it repeats every 8 bytes.

## Type of Attack
Known plaintext attack. I used the known PNG file signature (the first 8 bytes of any PNG) as the plaintext to recover the key by XORing it with the encrypted signature.

## Method I Used to Solve It
1. I looked up the PNG signature on Wikipedia: `89 50 4E 47 0D 0A 1A 0A`.
2. I used PowerShell to read the first 8 bytes of `flag.png.enc` with this command: `Get-Content -Encoding Byte -TotalCount 8 flag.png.enc | ForEach-Object { "{0:X2}" -f $_ }`. It gave me `EC 3C 2B 37 65 6B 74 7E`.
3. I XORed each encrypted byte with the corresponding PNG byte using VS Code by modifying the Python script to calculate it.
   - EC ^ 89 = 65 (e)
   - 3C ^ 50 = 6C (l)
   - 2B ^ 4E = 65 (e)
   - 37 ^ 47 = 70 (p)
   - 65 ^ 0D = 68 (h)
   - 6B ^ 0A = 61 (a)
   - 74 ^ 1A = 6E (n)
   - 7E ^ 0A = 74 (t)
   - So the key is "elephant".
4. I wrote a Python script to XOR the entire `flag.png.enc` with the repeating key "elephant" and save as `flag.png`.