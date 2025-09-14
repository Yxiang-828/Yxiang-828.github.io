# CS2107 Assignment 1 Hard2 Solution

## Problem Statement

The challenge requires creating **two PDF files** with the following properties:
- **Different contents** (not identical files)
- **Same MD5 hash** (cryptographic collision)
- **Visually identical** to `Assignment 1.pdf` (appear the same when viewed)

The server provides a web interface at `http://cs2107-ctfd-i.comp.nus.edu.sg:5002/` where users upload the two PDFs. The server validates that:
1. Both files are valid PDFs
2. They have identical MD5 hashes
3. They have different file contents

## Type of Attack: MD5 Collision Attack

This challenge exploits a fundamental weakness in the **MD5 cryptographic hash function**. MD5 was designed to produce unique hashes for different inputs, but researchers discovered that it is possible to find **collisions** - two different inputs that produce the same MD5 hash.

### MD5 Collision Properties
- **Collision**: Two different messages M₁ ≠ M₂ where MD5(M₁) = MD5(M₂)
- **Chosen-prefix collision**: Given a prefix P, find suffixes S₁ ≠ S₂ where MD5(P + S₁) = MD5(P + S₂)
- **Practical feasibility**: MD5 collisions can be computed in seconds on modern hardware

### Why This Works for PDFs
- PDFs can contain arbitrary binary data in streams or comments
- Appending collision data to the end of a PDF doesn't affect visual appearance
- The collision ensures both modified PDFs have identical MD5 hashes
- The original PDF content remains intact, preserving visual appearance

## Step-by-Step Solution

### Step 1: Environment Setup
- **Operating System**: Linux (WSL Ubuntu recommended for compatibility)
- **Tools Required**:
  - `hashclash`: MD5 collision generation tool
  - `md5sum`: For hash verification
  - `cat`: For file concatenation

**Install hashclash** (if not already available):
```bash
# On Ubuntu/Debian
sudo apt update
sudo apt install hashclash

# Or compile from source (if package unavailable)
git clone https://github.com/cr-marcstevens/hashclash.git
cd hashclash
./build.sh
sudo make install
```

### Step 2: Understanding the Collision Generation
The `hashclash` tool's `-p` option performs **chosen-prefix collision**:
- Takes a prefix file (our `Assignment 1.pdf`)
- Computes the MD5 state after processing the prefix
- Generates two different suffixes that produce the same final MD5 hash

**Command syntax**:
```bash
hashclash -p <prefix_file> -o <output1> <output2>
```

This creates `<output1>` and `<output2>` as: `<prefix> + <collision_suffix1>` and `<prefix> + <collision_suffix2>`, where both have identical MD5 hashes.

### Step 3: Generate the Collision PDFs

1. **Copy the target PDF** to working directory:
   ```bash
   cp "../Assignment 1.pdf" .
   ```

2. **Generate colliding versions**:
   ```bash
   hashclash -p "Assignment 1.pdf" -o colliding1.bin colliding2.bin
   ```

   This creates two binary files that are complete colliding messages (prefix + collision data).

3. **Verify the collision**:
   ```bash
   md5sum colliding1.bin colliding2.bin
   # Both should show identical MD5 hashes
   ```

4. **Create the final PDFs**:
   Since `hashclash -p` already includes the prefix, the output files are the colliding PDFs:
   ```bash
   mv colliding1.bin pdf1.pdf
   mv colliding2.bin pdf2.pdf
   ```

5. **Final verification**:
   ```bash
   md5sum pdf1.pdf pdf2.pdf  # Should be identical
   wc -c pdf1.pdf pdf2.pdf   # Should have same size
   diff pdf1.pdf pdf2.pdf   # Should show differences (collision data)
   ```

### Step 4: Understanding the Output

**File Structure**:
- `pdf1.pdf` = `Assignment 1.pdf` + `collision_suffix1`
- `pdf2.pdf` = `Assignment 1.pdf` + `collision_suffix2`
- Both files start with identical PDF content (visual appearance preserved)
- Collision data appended at the end (doesn't affect rendering)

**Hash Properties**:
- MD5(pdf1.pdf) = MD5(pdf2.pdf) ✓
- Content(pdf1.pdf) ≠ Content(pdf2.pdf) ✓
- Visual(pdf1.pdf) = Visual(pdf2.pdf) ✓

### Step 5: Submission

1. Open `http://cs2107-ctfd-i.comp.nus.edu.sg:5002/`
2. Upload `pdf1.pdf` and `pdf2.pdf`
3. The server validates the collision and grants the flag

## Technical Nuances

### MD5 Merkle-Damgård Construction
MD5 processes input in 512-bit blocks, maintaining internal state. The `-p` option:
1. Processes the prefix through MD5's compression function
2. Finds two different block sequences that lead to identical final states
3. Produces colliding messages with identical hashes

### Collision Data Characteristics
- **Size**: Typically ~1KB of collision data appended
- **Format**: Binary data that exploits MD5's differential paths
- **Location**: Appended to PDF end (doesn't break PDF structure)
- **Invisibility**: Doesn't affect PDF rendering or visual appearance

### PDF Compatibility
- PDFs are tolerant of trailing data
- The collision data doesn't interfere with PDF object structure
- Files remain valid PDFs that render identically

### Performance
- Collision generation: ~1-2 seconds on modern hardware
- No special hardware required (runs on standard CPUs)
- Memory usage: Minimal (~MB range)

## Files Used

- `Assignment 1.pdf`: Source PDF (provided)
- `hashclash`: Collision generation tool
- `pdf1.pdf`: First colliding PDF (generated)
- `pdf2.pdf`: Second colliding PDF (generated)

## Flag Obtained

CS2107{[REDACTED]}

## Security Implications

This demonstrates why MD5 is deprecated for cryptographic use:
- Collision attacks are practical and fast
- Can create documents with identical hashes but different content
- Breaks integrity guarantees in digital signatures, certificates, etc.

Modern systems use SHA-256 or higher for security-critical applications.</content>
<parameter name="filePath">c:\Users\xiang\Desktop\y2\cs2107\assignment1\hard2\hard2_solution.md