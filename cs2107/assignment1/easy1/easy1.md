# Easy 1: Huuuuuge RSA - Complete Step-by-Step Solution

## Challenge Analysis

**Given:**
- `n` = 1024-bit RSA modulus (product of two primes p and q)
- `e` = 65537 (standard RSA public exponent)
- `c` = encrypted flag using RSA encryption: c = m^e mod n

**Goal:** Decrypt the ciphertext to get the flag

## Step-by-Step Solution

### Step 1: Understand the RSA Decryption Process
To decrypt RSA, we need:
1. **Factor n** into primes p and q (n = p × q)
2. **Calculate φ(n)** = (p-1)(q-1)
3. **Find private key d** = e^(-1) mod φ(n)
4. **Decrypt message** m = c^d mod n
5. **Convert to flag** by decoding bytes

### Step 2: Recognize This is "Easy 1"
The challenge is called "Easy 1" - this means we shouldn't need complex factorization algorithms. The vulnerability is likely that **the factors are already known**.

### Step 3: Check factordb.com
For CTF challenges, always check if the RSA modulus has been factored before:
- Go to factordb.com
- Search for the modulus n
- If status = "FF" (Fully Factored), factors are available!

### Step 4: Retrieve the Known Factors
```python
import requests

url = f"http://factordb.com/api?query={n}"
response = requests.get(url)
data = response.json()

# Extract factors p and q
p = 10738351774266087351282102063418344749874815319835209296472309964567481804556694272269779874180563127835865325832141405899276565174505408178103709685731531
q = 12523662111874600161833138357230746871540990567053354502660401326710160541408793753329772363924830742900510940368962338277549788111438397117750739543628539
```

### Step 5: Calculate Private Key
```python
# Calculate Euler's totient function
phi_n = (p - 1) * (q - 1)

# Calculate private exponent (modular inverse)
d = pow(e, -1, phi_n)
```

### Step 6: Decrypt the Ciphertext
```python
# RSA decryption: m = c^d mod n
m = pow(c, d, n)
```

### Step 7: Convert to Flag
```python
# Convert integer to bytes
flag_bytes = m.to_bytes((m.bit_length() + 7) // 8, 'big')

# Decode to get flag string
flag = flag_bytes.decode('utf-8')
```

## Final Answer
**FLAG:** `CS2107{B1G_but_f4ct0rDB_c4n_h3lP_m3_S0lV3}`

## Key Lesson
The "easy" part wasn't implementing factorization - it was knowing to check existing databases! This teaches an important security principle: **always check if vulnerabilities are already known** before attempting complex solutions.

## Why This Works
- RSA security depends on the difficulty of factoring large numbers
- If factors are publicly known (like in factordb.com), RSA becomes trivial to break
- The challenge name hints at this: "BIG but factorDB can help me solve"

---

## Layman's Summary (Plaintext Steps)

1. You are given three numbers: n, e, and c. These are part of the RSA encryption system.
2. Normally, breaking RSA is hard because you need to split n into two secret numbers (its factors).
3. For this challenge, someone already found those secret numbers and put them online (on factordb.com).
4. You look up n on factordb.com and get the two secret numbers (called p and q).
5. With p and q, you can figure out the secret key needed to unlock the message.
6. Use the secret key to decrypt c and get the original message (the flag).
7. The flag is: CS2107{B1G_but_f4ct0rDB_c4n_h3lP_m3_S0lV3}

**In short:**
- You don't need to do any hard math.
- Just search n on factordb.com, get the factors, and use them to unlock the flag.
- The challenge is easy because the answer is already public!

---

## How I Solved It (Layman's Steps)

1. I was given three numbers: n, e, and c, which are part of the RSA encryption system.
2. Normally, to decrypt the message, I would need to factor n into two secret numbers (p and q), which is supposed to be very hard.
3. Instead of trying to factor n myself, I searched for n on factordb.com, a website that collects factorizations of big numbers.
4. Luckily, factordb.com already had the factors for n, so I just copied p and q from there.
5. With p and q, I calculated the secret key needed to decrypt c.
6. I used the secret key to unlock c and got the original message, which was the flag.
7. The flag I found was: CS2107{B1G_but_f4ct0rDB_c4n_h3lP_m3_S0lV3}

**In summary:**
- I didn't do any hard math or programming.
- I just looked up n on factordb.com, got the factors, and used them to decrypt the flag.
- The challenge was easy because the answer was already public!