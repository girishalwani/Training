"""
Write a Python functionthat accepts a hyphen-separated
sequence of colorsas input and returnsthe colorsin a
hyphen-separated sequence after sorting them alphabetically
"""

def sorting(str):
    list=[]
    for i in str.split('-'):
        list.append(i)

    list.sort()
    print('-'.join(list))


string = input("enter the string -> ")
sorting(string)
