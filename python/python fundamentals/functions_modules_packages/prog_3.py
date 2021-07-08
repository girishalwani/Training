"""
Write a function to calculate and return the factorial
of a number (a non-negative integer).
"""

import math

def fact(num):
    return math.factorial(num)

num = int(input("enter a number -> "))
print('factorial of ',num, 'is ->',fact(num))
