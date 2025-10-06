import requests

n = 134483489259357587193062297294916557281511310492658874099915118851106176841242629412489233879805646303697723631290376922707848149746292340948693757862129548348543497180869087021892384409416014298517539741882667796027036147608670091266898895218841621334695007993716583675755016319734116593324017785790343763209
e = 65537
c = 102687950593631611439795983752527792474757459249112359566891231885071300563957355572372854325640742460221240091756824050729982284987694623185002468120085229505133037450786304818981737812221292836925419605029408917407642417732585756645359207207411677906338212716279539545603373179299650287710970218685927463998

print("Answer")
print("=" * 50)

url =  f"http://factordb.com/api?query={n}" # construct the URL to query factordb.com
response = requests.get(url, timeout=30) # this means the request will time out if it takes longer than 30 seconds
data = response.json()
print(data)

if data['status'] == 'FF': # FF means fully factored
    factors = []
    for factor in data['factors']:
        factors.append(int(factor[0]))

    print(f"Found factors from factordb.com: {factors}")

    if len(factors) == 2:
        p, q = factors[0], factors[1]
        print(f"p = {p}")
        print(f"q = {q}")
        print(f"Verification: p * q = {p * q == n}")

        # Calculate private key
        phi_n = (p - 1) * (q - 1)
        d = pow(e, -1, phi_n)

        # Decrypt the ciphertext
        m = pow(c, d, n)

        # Convert to flag
        flag_bytes = m.to_bytes((m.bit_length() + 7) // 8, 'big')
        flag = flag_bytes.decode('utf-8')

        print(f"\n🎉 FLAG: {flag}")