# Easy3 Write-Up

## Analysis of the Question
The challenge involves cracking an encrypted ZIP file called `sus_package.zip` containing two files: `Assignment 1.pdf` and `flag.txt`. Both are encrypted using ZipCrypto. The goal is to extract the flag from `flag.txt`. I analyzed it as a known-plaintext attack on ZipCrypto, since I have the unencrypted version of `Assignment 1.pdf` in the parent directory.

## Why This Plaintext
I used `Assignment 1.pdf` as the known plaintext because it's the same file available unencrypted in the parent directory (`../Assignment 1.pdf`). This provides about 80KB of known data, which is sufficient for the attack.

## Why That Cipher
ZipCrypto is a legacy encryption method used in ZIP files. It's weak and vulnerable to cryptanalysis because it uses a simple stream cipher based on a linear congruential generator (LCG), rather than modern encryption standards like AES.

## Why XOR etc.
ZipCrypto works as a stream cipher: it generates a keystream of pseudo-random bytes using an LCG, then XORs each plaintext byte with the corresponding keystream byte to produce ciphertext. XOR is used because it's reversible—if you XOR again with the same keystream, you get back the plaintext. The LCG updates the internal state (three 32-bit keys) for each byte, making the keystream deterministic once the initial keys are known.

## How bkcrack Did It
bkcrack performs a known-plaintext attack on ZipCrypto. It uses the known plaintext to deduce part of the keystream, then brute-forces the LCG's initial state (the three keys) by working backwards from the known data. Once the keys are found, it can regenerate the keystream for any file in the ZIP and decrypt them by XORing the ciphertext with the keystream.

## Inputs and Outputs

```
Input: bkcrack -L sus_package.zip
Output:
bkcrack 1.7.0 - 2024-05-26
Archive: sus_package.zip
Index Encryption Compression CRC32    Uncompressed  Packed size Name
----- ---------- ----------- -------- ------------ ------------ ----------------
    0 ZipCrypto  Store       e823ad14        82144        82156 Assignment 1.pdf
    1 ZipCrypto  Store       7dabb3fe           52           64 flag.txt

Input: bkcrack -C sus_package.zip -c "Assignment 1.pdf" -p "../Assignment 1.pdf"
Output:
bkcrack 1.7.0 - 2024-05-26
[01:02:13] Z reduction using 82137 bytes of known plaintext
18.6 % (15292 / 82137)
[01:02:14] Attack on 123 Z values at index 67342
Keys: 7e827b05 98ea3b23 33a5bfc8
100.0 % (123 / 123)
Found a solution. Stopping.
[01:02:14] Keys
7e827b05 98ea3b23 33a5bfc8

Input: bkcrack -C sus_package.zip -k 7e827b05 98ea3b23 33a5bfc8 -c "flag.txt" -d flag.txt
Output:
bkcrack 1.7.0 - 2024-05-26
[01:02:21] Writing deciphered data flag.txt
Wrote deciphered data (not compressed).

Input: Get-Content flag.txt
Output: CS2107{but_what_if_zipcrypto_deflate_is_used_hmm...}
```