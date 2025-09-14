KEY = <REDACTED>


def encrypt_flag():
    with open("flag.png", "rb") as f:
        data = bytearray(f.read())
    
    # ROLLING xor encrypt the flag with my SUPER SECRET KEY!!
    # they will never be able to find out what it is muahahaha
    for i in range(len(data)):
        data[i] ^= KEY[i % len(KEY)]
    
    with open("flag.png.enc", "wb") as g:
        g.write(data)


if __name__ == "__main__":
    encrypt_flag()
