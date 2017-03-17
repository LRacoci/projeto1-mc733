import fileinput

v = []
s = 0
c = 0

for l in fileinput.input():
	v.append(l.split())
	s += int(v[c][3])
	c += 1

print(s/(float(v[c-1][0]) - float(v[0][0])))
