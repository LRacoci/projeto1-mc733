import fileinput

v = []

for l in fileinput.input():
 v.append(l.split())

print("Cache miss:")
print(v[11][0])
print("Tempo da primeira execução:")
print(v[17][0], "s")
print("Tempo da segunda execução:")
print(v[36][0], "s")
print("Média da memória virtual:")
print(v[38][0], "kB")
