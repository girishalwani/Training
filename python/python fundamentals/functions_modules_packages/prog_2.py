"""
Write a function to return the reverse of a string.
"""

def reverse(str):
    string="".join(reversed(str))
    return string

string_input = input("enter the string -> ")
print('reversed sting -> ',reverse(string_input))
