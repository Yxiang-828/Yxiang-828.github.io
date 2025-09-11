from cryptography.hazmat.primitives.ciphers.aead import ChaCha20Poly1305
import os

class ChaCha20Challenge:
    def __init__(self):
        self.key = ChaCha20Poly1305.generate_key()
        self.nonce = os.urandom(12)
        
        self.flag = "CS2107{dummy_flag}"

    def encrypt(self, plaintext):
        cipher = ChaCha20Poly1305(self.key)
        return cipher.encrypt(self.nonce, plaintext, b"")

    def run(self):
        print("""
        ================================================================
                ChaCha20-Poly1305 Secure Tea Spilling Service
        ================================================================
        We use state-of-the-art ChaCha20-Poly1305 encryption!

        Menu:
        1. Encrypt Tea
        2. Get Encrypted Flag  
        3. About Our Security
        4. Exit
        """)
        
        while True:
            try:
                print(">> ", end="", flush=True)
                choice = input().strip()
                
                if choice == "1":
                    print("Enter your Tea: ", end="", flush=True)
                    message = input().strip()
                    
                    if len(message) > 200:
                        print("Tea too long! Keep it under 200 characters.")
                        continue
                    
                    try:
                        ciphertext = self.encrypt(message.encode())
                        print(f"Encrypted Tea (hex): {ciphertext.hex()}")
                        print(f"Length: {len(ciphertext)} bytes")
                        print()
                    except Exception as e:
                        print(f"Encryption failed: {e}")
                
                elif choice == "2":
                    try:
                        encrypted_flag = self.encrypt(self.flag.encode())
                        print(f"Encrypted Flag (hex): {encrypted_flag.hex()}")
                        print(f"Length: {len(encrypted_flag)} bytes")
                        print("Hint: The flag follows the standard CS2107{...} format")
                        print()
                    except Exception as e:
                        print(f"Flag encryption failed: {e}")
                
                elif choice == "3":
                    print("""
                    Our Security Features:
                    ✓ Military-grade ChaCha20-Poly1305 encryption
                    ✓ Authenticated encryption (prevents tampering)  
                    ✓ Fast and secure for all your Tea spilling needs
                    ✓ Same high-speed encryption parameters for optimal performance

                    Our encryption is so fast because we've optimized the initialization process!
                    """)
                
                elif choice == "4":
                    print("Thanks for using our secure service!")
                    break
                    
                else:
                    print("Invalid choice. Please try again.")
                    
            except (EOFError, KeyboardInterrupt):
                break
            except Exception as e:
                print(f"Error: {e}")
                break

def main():
    challenge = ChaCha20Challenge()
    challenge.run()

if __name__ == "__main__":
    main()