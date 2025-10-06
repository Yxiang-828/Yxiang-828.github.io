# E.2: Office Document Password Cracking

## Breaking it Down
This is a password cracking challenge for a Microsoft Office 2013 document (encrypted_flag.docx). The document is encrypted with AES-256 using PBKDF2-SHA1 with 100,000 iterations. To access the contents, which contain the flag, I needed to crack the password.

The process involves extracting the encryption hash from the document, cleaning it for proper encoding, then using a password cracker like Hashcat with GPU acceleration to dictionary attack the password.

## My Thought Process
- Office documents store encryption metadata that can be extracted using tools like office2john.py.
- The hash needs to be cleaned to remove the filename prefix and ensure ASCII encoding, as it may be in UTF-16.
- Use Hashcat with mode 9600 for Office 2013, dictionary attack with rockyou.txt.
- For GPU acceleration on AMD cards, install AMD HIP SDK and set backend to HIP.
- Initial issues: No OpenCL/HIP platforms detected due to missing HIP SDK; hash encoding problems causing signature unmatched errors.
- Fallback: Used WSL with PoCL for CPU cracking, but slow; eventually installed HIP SDK for fast GPU cracking.

## Step-by-Step Solution
1. **Extract hash**:
   - Run `python office2john.py encrypted_flag.docx > hash.txt`
   - Output: `encrypted_flag.docx:$office$*2013*100000*256*16*5d81505aba6694cacf9b8aaa49106cd7*eee24babcc141c8f3501f68408b9df93*e08dc732ca8a9862b4fd374118b651a4ba34cb6bdd32f340082f51c97d6451e9`

2. **Clean hash**:
   - Remove filename prefix: `Get-Content hash.txt | ForEach-Object { $_.Split(':')[1] } | Set-Content -Encoding ASCII hash_clean.txt`
   - Convert from UTF-16 to ASCII: `tr -d '\0' < hash_clean.txt > hash_clean_ascii.txt`

3. **Crack password**:
   - Install AMD HIP SDK 6.4.2 for GPU support.
   - Set backend: `$env:HASHCAT_BACKEND = "HIP"`
   - Run `hashcat -m 9600 -a 0 hash_clean_ascii.txt rockyou.txt`
   - Password found: `cs2107711923`

4. **Access document**:
   - Open encrypted_flag.docx with password `cs2107711923`.
   - Extract flag from contents.

## Tools Used
- office2john.py (from John the Ripper)
- Hashcat v7.1.2
- AMD HIP SDK 6.4.2
- rockyou.txt wordlist
- WSL with PoCL (fallback for CPU)

## Flag
CS2107{greycat>hashcat_provemewrong}