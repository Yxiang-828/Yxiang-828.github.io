KEY = "elephant"


def encrypt_flag():
    with open(r"C:\Users\xiang\y2\cs2107\assignment1\med1\flag.png.enc", "rb") as f:
        data = bytearray(f.read())

    # ROLLING xor encrypt the flag with my SUPER SECRET KEY!!
    # they will never be able to find out what it is muahahaha
    for i in range(len(data)):
        data[i] ^= ord(KEY[i % len(KEY)])

    with open(r"C:\Users\xiang\y2\cs2107\assignment1\med1\flag.png", "wb") as g:
        g.write(data)


if __name__ == "__main__":
    encrypt_flag()
