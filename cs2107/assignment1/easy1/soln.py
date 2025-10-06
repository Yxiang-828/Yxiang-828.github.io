# Easy 1 RSA Solution - factordb.com approach
import requests

# Challenge parameters from out.md
n = 134483489259357587193062297294916557281511310492658874099915118851106176841242629412489233879805646303697723631290376922707848149746292340948693757862129548348543497180869087021892384409416014298517539741882667796027036147608670091266898895218841621334695007993716583675755016319734116593324017785790343763209
e = 65537
c = 102687950593631611439795983752527792474757459249112359566891231885071300563957355572372854325640742460221240091756824050729982284987694623185002468120085229505133037450786304818981737812221292836925419605029408917407642417732585756645359207207411677906338212716279539545603373179299650287710970218685927463998

print("Easy 1: Using factordb.com for known factors")
print("=" * 50)

# Try factordb.com - the "easy" solution
url = f"http://factordb.com/api?query={n}"
response = requests.get(url, timeout=30)
data = response.json()

if data['status'] == 'FF':  # Fully factored, CF means composite factors
    factors = []
    for factor in data['factors']:
        factors.append(int(factor[0]))
    print (f"Factor: {factors}")

    p,q = factors[0], factors[1]
    phi_n = (p-1) * (q-1)
    d = pow(e, -1, phi_n)

    m= pow(c,d,n)

    print(f"m: {m}")

    m_byte = m.to_bytes((m.bit_length() + 7) // 8 , 'big')
    print(m_byte)
    flag = m_byte.decode('utf-8')
    print(f"Flag: {flag}")
