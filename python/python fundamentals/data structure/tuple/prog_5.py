"""
Write a program to replace last value of tuples in a list to 100
"""

list=[(10, 20, 40), (40, 50, 60), (70, 80, 90)]

print([t[:-1] + (100,) for t in list])

