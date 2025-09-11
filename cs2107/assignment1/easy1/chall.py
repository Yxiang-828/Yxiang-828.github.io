from Crypto.Util.number import getPrime, bytes_to_long

p = getPrime(512)
q = getPrime(512)
n = p*q
e = 65537

flag = b"CS2107{dummy_flag}"
m = bytes_to_long(flag)
c = pow(m, e, n)

print("Challenge Parameters:")
print(f"n = {n}")
print(f"e = {e}")
print(f"c = {c}")