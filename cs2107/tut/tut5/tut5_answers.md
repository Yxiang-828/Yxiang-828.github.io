# CS2107 Tutorial 5 Answers

## 1. (Hash Design)

Bob's hash function: $H(x) = \text{SHA3}(x) \oplus \text{SHA3}(\text{rev}(x))$, where $\text{rev}(x)$ reverses the bits of $x$.

To show it's not collision resistant, find two different inputs $x$ and $y$ such that $H(x) = H(y)$.

Consider $x = 10100000$ (8 bits) and $y = \text{rev}(x) = 00000101$.

Since $x \neq y$, and $H(y) = \text{SHA3}(y) \oplus \text{SHA3}(\text{rev}(y)) = \text{SHA3}(\text{rev}(x)) \oplus \text{SHA3}(x) = H(x)$, this is a collision.

## 2. (Birthday Attack - Hair Glands)

This is the birthday problem with $d = 100,000$ possible hair gland counts and $n = 1000$ students.

$$P(\text{at least one collision}) \approx 1 - e^{-\frac{n(n-1)}{2d}} = 1 - e^{-\frac{1000 \times 999}{2 \times 100000}} = 1 - e^{-4.995} \approx 1 - 0.006738 = 0.993262 \ (99.33\%)$$

## 3. (Birthday Attack - IV)

IV is 64 bits, so $d = 2^{64}$.

For $n = 2^{32}$ ciphertexts: $P(\text{collision}) \approx 1 - e^{-\frac{(2^{32})^2}{2 \times 2^{64}}} = 1 - e^{-\frac{2^{64}}{2 \times 2^{64}}} = 1 - e^{-0.5} \approx 0.3935$.

For $n = 2^{31}$: $P \approx 1 - e^{-\frac{(2^{31})^2}{2 \times 2^{64}}} = 1 - e^{-\frac{2^{62}}{2^{65}}} = 1 - e^{-2^{-3}} = 1 - e^{-0.125} \approx 0.1175$.

For $n = 2^{33}$: $P \approx 1 - e^{-\frac{2^{66}}{2^{65}}} = 1 - e^{-2} \approx 0.8647$.

For $n = 2^{34}$: $P \approx 1 - e^{-\frac{2^{68}}{2^{65}}} = 1 - e^{-8} \approx 0.9997$.

For $n = 2^{35}$: $P \approx 1 - e^{-\frac{2^{70}}{2^{65}}} = 1 - e^{-32} \approx 1$.

## 4. (Birthday Attack: Two-Pool Variant)

(a) Theorem as given.

(b) Attacker forges $m$ answers with random 16-bit IDs. V has sent 128 queries with distinct IDs ($k=128, n=16, 2^n = 65536$).

Probability of success (at least one match): $P > 1 - e^{-\frac{k m}{2^n}}$.

For high probability (>0.5), approximately when $\frac{k m}{2^n} \geq 1$, so $m \geq \frac{2^n}{k} = \frac{65536}{128} = 512$.

Minimum number: 512.

## 5. Single Sign-On (SSO)

(a) Expiry limits damage if token is stolen, as the attacker can only use it until expiry, not forever.

(b) i. Not secure. Attacker can forge token for any user by choosing $r$, computing $m = d || r || u$, $y = H(m)$, and sending $<m, y>$. Server accepts since $H(m) = y$. No secret; hash alone doesn't authenticate.

ii. Use MAC: $t = <m, \text{MAC}_k(m)>$, where $k$ is server's secret key.

iii. (Optional) If attacker forges valid token, they can forge MAC. But MAC is secure, so contradiction.

(c) i. Secure: $r$ is random 128-bit, stored in DB, hard to guess.

ii. MAC-based preferred: No need for DB storage (server recomputes MAC), better performance and usability (stateless).

## 6. (Illustration on Security Reduction Proof)

(Proof sketch) Suppose A finds $x$ such that $H(x)$ is substring of random $h$ fast. Use A to build algorithm B that inverts H: Given $y = H(z)$, choose random $h$ containing $y$ as substring, run A to get $x$ with $H(x)$ substring of $h$, check if $H(x) = y$. If yes, output $x$. Contradicts one-way property.</content>
<parameter name="filePath">c:\Users\xiang\Desktop\y2\cs2107\tut\tut5\tut5_answers.md