with open("flag.png.enc", "rb") as f:
    enc = f.read()

header = (0x89504E470D0A1A0A).to_bytes(8, 'big')

enc_header: bytes = enc[:8]

key_bytes = bytearray(8)
for i in range(8):  # For each position i from 0 to 7,
    key_byte = enc_header[i] ^ header[i]
    key_bytes[i] = key_byte

print(f"key_bytes: {key_bytes.decode('utf-8')}")

dec = bytearray()
for i in range(len(enc)):
    dec.append(enc[i] ^ key_bytes[i % len(key_bytes)]) # enc: 0-63; key: 0-7 => i % 8
#0-7 8-15 16-23 24-31 32-39 40-47 48-55 56-63

with open("flag.png", "wb") as g:
    g.write(dec)
