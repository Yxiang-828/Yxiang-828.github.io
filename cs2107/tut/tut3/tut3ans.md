1.
``` This is a paragraph from RFC4086 mentioned in Lecture 2 on passwordstrength.
Assume that user passwords change once a year and that it is desired that the
probability that an adversary could guess the password for a particular account be less
than one in a thousand....
To have a one-in-a-thousand chance of guessing the password in 500,000 tries implies
a universe of at least 500,000,000 passwords, or about 2^29. Thus, 29 bits of
randomness are needed. This can probably be achieved by using the US DoD-
recommended inputs for password generation, as it has 8 inputs that probably average
over 5 bits of randomness each (see section 7.1). Using a list of 1,000 words, the
password could be expressed as a three-word phrase (1,000,000,000 possibilities). By
using case-insensitive letters and digits, six characters would suffice
((26+10)^6 = 2,176,782,336 possibilities).
For a higher-security password,...To go to a one-in-10^9 chance, 49 bits of randomness
are needed, implying a five-word phrase or a ten-letter/digit password.’’

The above mentions three methods to generate passwords. Let’s consider
the second method (i.e. choosing 3 words from a dictionary of 1000 words).
Suppose we want to have 50 bits of randomness and using the same 1000-
word dictionary, how many words are required in a password?
****
```

To find the number of words required to achieve 50 bits of randomness, we can use the formula:

bits of randomness = log2(number of possible combinations)

For a password made up of n words chosen from a dictionary of 1000 words, the number of possible combinations is:

1000^n

So we need to solve the equation:

50 = log2(1000^n)

This simplifies to:

50 = n * log2(1000)

Now we can calculate log2(1000):

log2(1000) = log10(1000) / log10(2) = 3 / 0.301 = 9.96578 (approximately)

Now we can substitute this value back into the equation:

50 = n * 9.96578

Solving for n gives:

> n = 50 / 9.96578 = 5.017 (4sf)

Since we can't have a fraction of a word, we round up to the nearest whole number. Therefore, we need at least 6 words from the dictionary to achieve 50 bits of randomness.

Guideline on entropy required. RFC4086 doesn’t explicitly state
how much entropy is sufficient to prevent online dictionary attack. Im-
plicitly, it suggests 29 bits or 49 bits for “higher-security”. The RFC also
doesn’t state requirement of offline dictionary attack. For the purpose
of discussion and assessment in this course, let us fix the requirement as
follow:
(a) To prevent online dictionary attack, entropy is at least 50 bits.
> At least 6 words need to be chosen

(b) To prevent offline dictionary attack, entropy is at least 128 bits.
The above requirement is not commonly practiced in the industry. It is
for the purpose of this course
> 128=log2(1000^k) where k is the number of words chosen
>
> k=12.84(4sf)=13(round up to nearest integer)
>
> At least 13 words need to be chosen


2.
```
A company has installed a fingerprint door access system for their server
room, and gym. The two systems are the same, but the company can set
different thresholds to adjust the FNMR/FMR (lecture 2). Suppose the
threshold for the server room is set at 0.5, would a reasonable threshold
for the gym be larger, smaller, or equal to 0.5?
```
> FNMR means *false non-match rate*: no. of reals rejected / total real attempts(real rejected + real accepted) [ inconvenience ]
>
> FMR means *false match rate*: no. of fakes accepted / total faked attempts(fakes accepted + fakes not accepted) [security risk]

The smaller than 0.5 because gym usually require more convenience than security, less rejection of real users over rejecting fakes. Hence having a *lower threshold* is more suitable and reasonable.

3.
```
(Security Analysis: comparing two systems)
An IT team is planning to deploy 2FA for an online-banking service. They
are consider password + SMS, or password + hardware token. In both
options, the user first log-in using the password (without the second factor)
via a PC. After the user has logged in, the user’s account number would
be displayed on the PC, together with a few options2.
If the user wants to transfer money to another account, the second factor
is to be used.
(SMS)
S1. The user enters transaction (e.g. account number and amount) to
the PC, which in turns sends the information to the server.
S2. The server sends a OTP to the user via sms. The sms will be delivered
to the user’s phone by the telecommunications service provider (eg.
Singtel). The sms contains full detail of the transaction, e.g. “You
have requested to transfer $50,000 from account 1388293-43-23 to the
account 12398-234-A2, enter OTP: 132373”.
S3. The user enters the OTP to the PC. The PC sends the OTP to the
server.
S4. The server checks the OTP. If correct, the server sends a confirmation
to the PC. PC displayed the confirmation.
(Token)
T1. The PC displays the full detail of the transaction, follows by “To
confirm, press * in your OTP token and enter the displayed 6-digit
here ”.
T2. The user presses the token and enters the OTP to the PC. The PC
sends the OTP to the server.
T3. The server checks the OTP. If correct, the server sends a confirmation
to the PC. PC displayed the confirmation.
```

(a) Consider this attack scenario.
•The user is using a PC in a Internet cafe. The PC is already
compromised and is controlled by the attacker. Hence, the at-
tacker can modify the user’s input, and can modify information
displayed for the user. In other words, the user is interacting
with the bank through a malicious middle man.
With respect to this scenario, which option is more secure?

<small>[1]: We assume the connection from the PC to server is through HTTPS. We would study
HTTPS later. Under HTTPS, even if the the attacker is an entity in-between the PC and the
server, e.g. an insider in the Internet Service Provider, what the attacker can get is ciphertext
encrypted/protected by HTTPS. However, if the attacker is a malware in the PC, the attacker
might able to get everything.
</small>

>It is safer to use SMS as the user can verify the transaction detals sent to their phone which is not compromised. This implies that the user can detect if the attacker has modified the transaction details on the PC.

(b) Consider this scenario.
•Alice is a billionaire. She attended a conference in a nice pacific
island. During the conference, she concluded some business deal
and carry out the online transaction. There are many partici-
pants in the conference including her competitors who want to
spy on Alice’s business plan. She used her own laptop and we
can assume that it was free from malware. We assume that SMS
can be spoofed and sniffed by anyone in the conference.
Now, with respect to this scenario, which option is more secure?

> Obviously enough since the SMS can be spoofed and sniffed, carrying out transactions and business deals via the sms OTP method will result in her details being revealed to the attackers.
>
> The better option is to use token and handle everything on her laptop which is completely malware-free.


(c) Let’s suppose that the IT team has decided to use sms. The IT team
has choose one among two sms formats. Let us compare these two
formats:
M1 “Enter OTP: 132373”.
M2 “You have requested to transfer $50,000 from account 1388293-
43-23 to the account 12398-234-A2, enter OTP: 132373”.
•Give a attack scenario that M2 can prevent but not M1.
> Against phising scams, SMS without details of transactions will lead to the account user not being able to verify who they are transferring to, giving advantage to the attackers if M1 is used.
> M2 is specific on the from and to which account the transfer is made to hence, M2 can prevent such instances.

•M1 and M2 have their own limitation. How to get a tradeoff
between the two choices?

> Remove sensitive information such as the account numbers and only keep the transaction amount and recipient name if possible. This way, the user can still verify the transaction without exposing sensitive details that could be exploited by attackers.


4.
```
(Confidentiality does not implies Authenticity). The plaintext
“U00013 gives U12345 $1000 dollars”
was encoded as ASCII and encrypted using AES CTR mode. Let c be the
ciphertext (including IV). Mallory sniffed c. Mallory knew the plaintext
was of the form
“Ux gives Uy $1000 dollars”,
and the user name x, y were each 5 characters long. However, Mallory
didn’t know the actual value of the string x and y. Can Mallory generate
a c′that would be decrypted to
“Ux gives Uy $9999 dollars”?
```

<small>
Remark: the term “malleability” refer a property of an encryption scheme
whereby it is possible to transform (without knowledge of the secret key)
a ciphertext to another ciphertext of a related plaintext. Stream cipher is
malleable.
</small>

so how to do it? Mallory can exploit the malleability of the encryption scheme by modifying the ciphertext c in a specific way. Since the encryption is done using AES CTR mode, which is a stream cipher, Mallory can manipulate the ciphertext without needing to know the secret key.

To change the amount from $1000 to $9999, Mallory needs to identify the part of the ciphertext that corresponds to the dollar amount. This can be done by analyzing the structure of the plaintext and the corresponding ciphertext.

1. Mallory knows the plaintext format: “Ux gives Uy $1000 dollars”.
2. She can find the position of the dollar amount in the plaintext.
3. By XORing the ciphertext corresponding to $1000 with the difference between $9999 and $1000, she can create a new ciphertext c′ that will decrypt to “Ux gives Uy $9999 dollars”.

This demonstrates the malleability of the encryption scheme, as Mallory can generate a valid ciphertext for a related plaintext without knowing the secret key.

Here is the step-by-step process:
1. Identify the position of the dollar amount in the plaintext.
2. Determine the corresponding ciphertext block for the dollar amount.
3. Calculate the difference between the new amount ($9999) and the old amount ($1000).
4. XOR the ciphertext block with the calculated difference to obtain the modified ciphertext block.
5. Replace the original ciphertext block with the modified block to create the new ciphertext c′.
6. The new ciphertext c′ will decrypt to the desired plaintext “Ux gives Uy $9999 dollars”.

why does XORing work? These are the ASCII VALUES of the characters:
```
1000 = 0x31 0x30 0x30 0x30
9999 = 0x39 0x39 0x39 0x39
```
> so to get 9999 from 1000, you need to XOR 1000 with 9999 because a xor b = c implies a xor c = b
>
> 0x31 xor 0x39 = 49 xor 57 = 0b00110001 xor 0b00111001 = 0b00001000 = 0x08
>
> 0x30 xor 0x39 = 48 xor 57 = 0b00110000 xor 0b00111001 = 0b00001001 = 0x09

> Mallory needs to XOR the ciphertext block corresponding to $1000 with 0x08 0x09 0x09 0x09 which is 0b' 1000 1001 1001 1001 to obtain the modified ciphertext block that will decrypt to $9999.
>

5.
```
(Open-ended question. No “standard” answer) We often receive SMS or
email with OTP for password reset, or confirmation of transaction. For
security, is it advisable to securely delete them after usage? Under what
situation could an attacker gains something useful if those are not deleted.
```
<small>
It is extremely easy for anyone to spoof an SMS. To sniff, although possible, requires other
capability, for e.g. to have access to the base station.4Note that a deleted email is still temporarily stored in the “recycle bin”
</small>

> While OTP's are typically valid for a short period of time and usually only valid for a single use, social engineering attacks can still exploit them if they are not securely deleted after use. For example, if an attacker gains limited access to user's otp messages they can potentially deduce which service the otp is for and which bank the user is using.


6.
```
(“see-with-you-own-eyes” a public key)
Visit https://www.nus.edu.sg. Find the padlock in the address bar and
click to find details about the item “certificate” (different browsers have
different interface). The certificate should contain some public key info.
NUS’s public key is RSA-based. What is NUS’s public key? Recap that
RSA encryption and decryption are done by exponentiation with modulo
n. What is the n? What is the exponent? (Answer: the exponent is
216 + 1=65537). What is the advantage of having small exponent? Not
all public key is RSA-based. Try to find a website that use DSA-based,
which should be appeared as “Elliptic Curve”. We will study certificate
and revisit this question
```
>

> NUS's public key is RSA-based with n being a large number (the modulus) and the exponent being 65537. The advantage of having a small exponent like 65537 is that it allows for faster encryption and signature verification processes, as exponentiation with a smaller exponent requires fewer computational resources.

> An example of a website that uses DSA-based (Elliptic Curve) is https://www.cloudflare.com. Elliptic Curve Cryptography (ECC) offers similar levels of security to RSA but with much smaller key sizes, leading to faster computations and reduced storage requirements.

> What is RSA though? RSA is an asymmetric cryptographic algorithm that relies on the mathematical properties of large prime numbers. It involves a pair of keys: a public key for encryption and a private key for decryption. The security of RSA is based on the difficulty of factoring the product of two large prime numbers.

7.
```
Find out more about these:
Single Sign-On (SSO), retinal vs iris scan.
```
> Single Sign-On (SSO) is an authentication process that allows a user to access multiple applications or services with a single set of login credentials. This simplifies the user experience by reducing the number of times a user has to log in and manage different passwords for different services. SSO is commonly used in enterprise environments to streamline access to various internal systems and applications.

> Retinal scans and iris scans are both biometric authentication methods that use unique patterns in the eye to verify a person's identity. Retinal scans analyze the unique pattern of blood vessels in the retina, while iris scans focus on the unique patterns in the colored part of the eye. Both methods offer high levels of accuracy and security, but they also raise privacy concerns and require specialized hardware for implementation.