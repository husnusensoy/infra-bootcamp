l = []

l.append(1)
l.append("husnu")
l.append(1.)
l.append(True)

print(l)

for e in l:
    print(e)
    print(type(e))

print(f"First element is {l[0]}")
print(f"First element is {l[-1]}")
print(f"First element is {l[0:2]}")


