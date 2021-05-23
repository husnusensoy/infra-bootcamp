list_of_values = {"one": 1, "two": 2, "three": 3}

print(list_of_values['one'])

# print(list_of_values['one1'])
print(list_of_values.get("one1", "Some favorite default value"))
"""
This is also a comment. But usually used for longer documentation typing...
"""

print(list_of_values.keys())
print(list_of_values.values())

print(list_of_values.items())
print([(k, 2 * v) for k, v in list_of_values.items()])
print(list((k, 2 * v) for k, v in list_of_values.items()))

two_times = dict((k, 2 * v) for k, v in list_of_values.items())
two_times = dict((kv[0], 2 * kv[1]) for kv in list_of_values.items())
print(two_times)

# Reversing key and value (k->v) to (v->k)
reverse_dict = dict((v, k) for k, v in list_of_values.items())
print(reverse_dict)

s1 = {"Jack", "Avarel"}
s2 = {"Joe", "William"}

daltons = s1 | s2

print(daltons)

####

l1 = [i for i in range(100)]
print(l1)

from math import sqrt, ceil


def is_prime(a):
    if a < 2:
        return False
    elif a == 2:
        return True

    for d in range(2, ceil(sqrt(a)) + 1):
        if a % d == 0:
            return False

    return True


even_numbers = {i for i in range(100) if i % 2 == 0}
prime_numbers = {i for i in range(100) if is_prime(i)}

print(even_numbers)
print(prime_numbers)

print(even_numbers & prime_numbers)
print(even_numbers | prime_numbers)
print(even_numbers - prime_numbers)
print(prime_numbers - even_numbers)

print(2 in prime_numbers)

# even_numbers =
s2 = {"Joe", "William"}

daltons = s1 | s2
