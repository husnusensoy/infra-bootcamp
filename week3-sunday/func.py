def some_math_calculation(p, w):
    return p ** w + 1, p * w + 1, p + w + 1


def void_func(p, w):
    print(some_math_calculation(p, w))


rc = void_func(2, 3)

print(rc)

print(some_math_calculation(2, 4))

print(type(some_math_calculation(2, 4)))

tup = some_math_calculation(2, 4)

print(tup[0])

a, b, c = some_math_calculation(2, 4)

a, b = b, a

print(a)

print('---')
_, _, c = some_math_calculation(2, 4)

print(c)

print((1,))
