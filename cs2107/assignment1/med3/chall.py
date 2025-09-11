# Flag is in the format CS2107{...}
# @@ Note to next programmer
# Please append to following to the README task list:
# 4. Update code on EC2
# 5. Generate secret.keys and leave on remote instance for future use

# 3 things to import
from Crypto.Cipher import AES
from random import randbytes
from Crypto.Util.Padding import pad

# Randomly generated key!
cipher = AES.new(randbytes(16),AES.MODE_ECB)
secret = "[REDACTED]"
code = open("chall.py","rb").read()

with open("output","wb") as f:
    for i in code:
        f.write(cipher.encrypt(pad(bytes([i]),16)))