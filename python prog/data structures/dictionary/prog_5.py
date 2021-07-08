"""
Write a program to prepare a dictionary where the
keys are numbers between 1 and 15 (both included) and
the values are square of the keys.
"""


dict={}

for k in range(1,16,1):
    dict[k]=k**2

print(dict)
