print(f"{'A'*60}")
wow=b'A'*60
# Sample inputs
encrypted_flag_hex = "154dc3cbced1670f3f71f492fca5147098ee4ea7ddbe83ab392f85ab5098cdbbd2155cad16db00c25526688e013496a4a084567f58b900a117be47386e9175e6ae5a0cbe4436da562b873768"
encrypted_known_hex = "175fb0bbbfa75d3a4d51eaa489970a42899e638af99b9d89100fa78270ebbca5fd64738f64c533b061141a9071068881d5ab700d6bc8349377de2704651d835a360214cf33cfba59393bb01c"

# Convert hex to raw bytes
encrypted_flag = bytes.fromhex(encrypted_flag_hex)  # 76 bytes
encrypted_known = bytes.fromhex(encrypted_known_hex)  # 76 bytes
print(len(encrypted_flag), len(encrypted_known))  # should be 76, 76

# XOR first 60 bytes
keystream = bytes([f ^ k for f, k in zip(wow, encrypted_known[:-16])])

print(f"xor: {keystream}")
print(f"len: {len(keystream)}")  # should be 60

plaintext = bytes([f ^ k for f, k in zip(encrypted_flag[:-16], keystream)])
plaintext = plaintext.decode('ascii', errors="ignore")
print(f"plaintext: {plaintext}")