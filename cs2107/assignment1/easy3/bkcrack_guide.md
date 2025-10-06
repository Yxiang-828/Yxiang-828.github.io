# bkcrack Usage Guide: All Commands and Combinations

This is a complete guide to using `bkcrack` for ZipCrypto attacks. Based on `bkcrack -h`, it covers every possible command combination grouped by scenario. Use it as a reference—bkcrack has no official guide, so this fills the gap.

## Specific for E.3: ZipCrypto Plaintext Attack on sus_package.zip

**Files**:
- ZIP file: `sus_package.zip` (in current directory)
- Known plaintext: `../Assignment 1.pdf` (in parent directory)
- Encrypted file in ZIP: `"Assignment 1.pdf"`
- Target file in ZIP: `"flag.txt"`
- Keys found: `7e827b05 98ea3b23 33a5bfc8`

**Steps**:
1. List contents: `.\bkcrack-1.7.0-win64\bkcrack.exe -L sus_package.zip`
2. Get keys: `.\bkcrack-1.7.0-win64\bkcrack.exe -C sus_package.zip -c "Assignment 1.pdf" -p "../Assignment 1.pdf"`
3. Decrypt flag: `.\bkcrack-1.7.0-win64\bkcrack.exe -C sus_package.zip -k 7e827b05 98ea3b23 33a5bfc8 -c "flag.txt" -d flag.txt`

## General Tips
- **Paths**: Use absolute paths if relative fails (e.g., `C:\path\to\file.zip`). Quotes for spaces. <encrypted_zip> = path to ZIP file. <plain_file_path_on_disk> = path to plaintext file. <output_file> = output filename on disk. <output_zip> = output ZIP filename.
- **File Names in ZIP**: <cipher_file_name_in_zip> = quoted name of file inside ZIP (e.g., "file.txt").
- **Threads**: Add `-j 4` to any command for speed on multi-core CPUs.
- **Exhaustive**: Add `-e` to find all solutions (slow).
- **Errors**: "Arguments error" means missing required options. Check this guide.
- **No GUI**: All command-line. Run `./bkcrack.exe` in the bkcrack folder.

## Scenario 1: List Files in a ZIP Archive
**When**: See inside without password.
- **Required**: `-L <archive_path>`
- **Example**: `bkcrack -L sus_package.zip`
- **Output**: File list with sizes, encryption, CRC.
- **Errors**: "Cannot open" → Wrong path.

## Scenario 2: Find Encryption Keys (Known Plaintext Attack)
**When**: Crack by comparing encrypted to known unencrypted data.
- **Required**: `-C <encrypted_zip> -c <cipher_file_name_in_zip> -p <plain_file_path_on_disk>`
- **Optional**: `-P <plain_zip>`, `-t <size>`, `-o <offset>`, `-x <offset> <hex>`, `--ignore-check-byte`, `--continue-attack <checkpoint>`, `-j <count>`
- **Example**: `bkcrack -C sus_package.zip -c "Assignment 1.pdf" -p "../Assignment 1.pdf"`
- **Output**: Keys like `7e827b05 98ea3b23 33a5bfc8`.
- **Errors**: "No solution" → Plaintext mismatch.

## Scenario 3: Decrypt a Single File
**When**: Extract one file after finding keys.
- **Required**: `-C <encrypted_zip> -k <X> <Y> <Z> -c <cipher_file_name_in_zip> -d <output_file>`
- **Optional**: `--keep-header`, `-j <count>`
- **Example**: `bkcrack -C sus_package.zip -k 7e827b05 98ea3b23 33a5bfc8 -c "flag.txt" -d flag.txt`
- **Output**: Decrypted file.
- **Errors**: "Invalid keys" → Wrong keys.

## Scenario 4: Decrypt Entire ZIP
**When**: Create password-free ZIP copy.
- **Required**: `-C <encrypted_zip_path> -k <X> <Y> <Z> -D <output_zip_filename>`
- **Optional**: `-j <count>`
- **Example**: `bkcrack -C sus_package.zip -k 7e827b05 98ea3b23 33a5bfc8 -D decrypted.zip`
- **Output**: New decrypted ZIP.
- **Errors**: Same as Scenario 3.

## Scenario 5: Change Password
**When**: Set new password on ZIP.
- **Required**: `-C <encrypted_zip_path> -k <X> <Y> <Z> -U <output_zip_filename> <new_password>`
- **Optional**: `-j <count>`
- **Example**: `bkcrack -C sus_package.zip -k 7e827b05 98ea3b23 33a5bfc8 -U new.zip "pass"`
- **Output**: ZIP with new password.
- **Errors**: "Invalid password" → Bad length.

## Scenario 6: Change Keys
**When**: Modify internal keys.
- **Required**: `-C <encrypted_zip> -k <old_X> <old_Y> <old_Z> --change-keys <output_zip> <new_X> <new_Y> <new_Z>`
- **Optional**: `-j <count>`
- **Example**: `bkcrack -C sus_package.zip -k 123 456 789 --change-keys new.zip aaa bbb ccc`
- **Output**: ZIP with new keys.
- **Errors**: Same as Scenario 5.

## Scenario 7: Bruteforce Password
**When**: Recover password from keys.
- **Required**: `-k <X> <Y> <Z> -b <charset> -l <length>`
- **Optional**: `-r <length> <charset>`, `--continue-recovery <checkpoint>`, `-j <count>`, `-e`
- **Example**: `bkcrack -k 12345678 9abcdef0 11111111 -b ?l?d -l 4..8`
- **Output**: Password if found.
- **Errors**: "No password" → Wrong charset/length.

## Scenario 8: Derive Keys from Password
**When**: Test password to get keys.
- **Required**: `--password <password>`
- **Optional**: Combine with `-C` for testing.
- **Example**: `bkcrack --password "mypass" -C sus_package.zip`
- **Output**: Keys for password.
- **Errors**: None.

For easy3: Use Scenarios 1, 2, 3. Start with `bkcrack -L sus_package.zip`.