#!/usr/bin/env python3

known = '37d5aa09684445617b2ca508b0d8f11c3b23a3c3175b76c192fa996ab117a7933952118606676846cf12b61b6575216543f7be40ec55791fa17a83dc38e1778681f1f1f37759f8391cd7f207'
enc_known = '37486983858733e15484dfa7f84abae6f6b12cfaf723f29a2fa9bfa02d02597cc57627fe535381a75ba61854454067e017799d9739e650c6c805ba2a1'
# Convert to bytes
b1 = known.encode()
b2 = bytes.fromhex(enc_known)

# XOR
keystream = bytes(a ^ b for a, b in zip(b1, b2))

print('Keystream (hex):', keystream.hex())