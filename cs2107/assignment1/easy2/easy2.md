# Office Document Password Cracking with Hashcat

This guide covers the complete workflow for cracking password-protected Office documents using John the Ripper for hash extraction and Hashcat for GPU-accelerated cracking.

## Prerequisites

- John the Ripper installed with office2john.py
- Hashcat installed with GPU support
- Wordlist file (e.g., rockyou.txt)
- Target encrypted Office document

## Step 1: Extract the Office Hash

Use John the Ripper's office2john.py to extract the hash from the encrypted document:

```
python office2john.py encrypted_file.docx > hash.txt
```

**Important Notes:**
- Use `python` or `py` depending on your system setup
- Redirect output to a file using `>`
- DO NOT open or save the file in Notepad as it may add BOM headers that break Hashcat
- The extracted hash will be in John's $office$ format

## Step 2: Clean the Hash File

Remove any BOM (Byte Order Mark) or invisible characters that could cause parsing errors:

```
Get-Content hash.txt | Set-Content -Encoding ASCII hash_clean.txt
```

**Why This Step is Critical:**
- PowerShell redirection can add UTF-16 BOM headers
- Hashcat requires pure ASCII format
- BOM headers cause "No password hashes loaded" errors
- This ensures the file contains only the hash data

## Step 3: Verify Hash Format

Check that the hash file is properly formatted:

```
type hash_clean.txt
```

**What to Look For:**
- File should contain exactly one line
- Line must start with `$office$*<YEAR>*`
- No extra spaces, tabs, or hidden characters
- Complete hash string without truncation

**Hash Mode Reference:**
- Office 2007: `-m 9400`
- Office 2010: `-m 9500` 
- Office 2013: `-m 9600`
- Office 2016: `-m 9700`

## Step 4: Run Hashcat Attack

Navigate to the Hashcat directory and run the attack:

```
cd hashcat_folder
.\hashcat.exe -m 9600 -a 0 hash_clean.txt rockyou.txt
```

**Performance Optimization:**
```
.\hashcat.exe -m 9600 -a 0 -w 3 -O hash_clean.txt rockyou.txt
```

**Parameter Explanation:**
- `-m 9600`: Hash mode for Office 2013
- `-a 0`: Dictionary attack mode
- `-w 3`: High workload profile for maximum performance
- `-O`: Enable optimized kernels (faster but limited password length)

**Critical Requirements:**
- Must run Hashcat from its own installation directory
- Required to avoid "OpenCL directory not found" errors
- Hashcat needs access to its kernel and module files

## Step 5: Monitor Attack Progress

During the attack, use these controls:

- Press `s` - Show current status and speed
- Press `p` - Pause the attack
- Press `r` - Resume the attack  
- Press `q` - Quit (can resume later)

**Status Information:**
- Speed: Passwords tested per second
- Progress: Percentage complete
- Time: Estimated time remaining
- Temperature: GPU temperature monitoring

## Step 6: Retrieve Cracked Password

After successful cracking, retrieve the password:

```
.\hashcat.exe --show hash_clean.txt
```

This displays the original hash followed by the cracked password.

## Step 7: Resume Interrupted Sessions

If the attack was interrupted, resume using:

```
.\hashcat.exe -m 9600 -a 0 --restore
```

Hashcat automatically saves session state and can continue where it left off.

## Troubleshooting Common Issues

**"No password hashes loaded" Error:**
- Hash file has BOM or encoding issues
- Use ASCII encoding: `Get-Content hash.txt | Set-Content -Encoding ASCII hash_clean.txt`
- Verify file contains only the hash line

**"Token length exception" Error:**
- Wrong hash mode specified
- Hash format corrupted during extraction
- Verify Office version matches hash mode

**"OpenCL directory not found" Error:**
- Not running from Hashcat installation directory
- Change to Hashcat folder before running commands
- Ensure all Hashcat files are in same directory

**"Separator unmatched" Error:**
- Trying to use raw Office file instead of extracted hash
- Must use office2john.py to extract hash first
- Cannot feed .docx file directly to Hashcat

## Key Lessons Learned

1. **File Encoding Matters**: Always use ASCII encoding when transferring hashes between tools
2. **One Hash Per Line**: Hash files must contain exactly one hash with no extra formatting
3. **Directory Context**: Run Hashcat from its installation directory to avoid path issues
4. **Mode Matching**: Hash mode must correspond to the correct Office version
5. **Tool Separation**: Use John for extraction, Hashcat for cracking - they use different formats
6. **BOM Prevention**: Avoid Notepad and use PowerShell commands for safe file handling

## Advanced Tips

**Faster Extraction Pipeline:**
```
python office2john.py document.docx | Set-Content -Encoding ASCII hash.txt
```

**Multiple Wordlists:**
```
.\hashcat.exe -m 9600 -a 0 hash.txt wordlist1.txt wordlist2.txt
```

**Rule-Based Attacks:**
```
.\hashcat.exe -m 9600 -a 0 hash.txt rockyou.txt -r rules/best64.rule
```

**Mask Attacks for Known Patterns:**
```
.\hashcat.exe -m 9600 -a 3 hash.txt ?d?d?d?d?d?d
```

This workflow provides a reliable method for cracking Office document passwords using GPU acceleration while avoiding common pitfalls that cause tool failures.