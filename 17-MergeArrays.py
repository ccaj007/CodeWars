# https://www.codewars.com/kata/58b665c891e710a3ec00003f/python

a = [1, 3, 40, 40, 50, 60, 60, 60]
b = [2, 40, 40, 50, 50, 65]
#
# a_dict = {}
# b_dict = {}
#
# for i in a:
#     a_dict[i]=a.count(i)
#
# for i in b:
#     b_dict[i]=b.count(i)
#
# print(a_dict)
# print(b_dict)
#
# new = []
# for i in a_dict:
#     if i not in b_dict:
#         new.append(i)
#
# for i in b_dict:
#     if i not in a_dict:
#         new.append(i)
#
#
#
#
# shared_items = {k: a_dict[k] for k in a_dict if k in b_dict and a_dict[k] == b_dict[k]}
# print(list(shared_items.keys()))
# new.append(list(shared_items.keys()))
#
# print(new)

def merge_arrays(a, b):
    out = []
    for n in a+b:
        if n in a and n in b:
            if a.count(n) == b.count(n):
                out.append(n)
        else:
            out.append(n)
    return sorted(set(out))

print(merge_arrays(a, b))

