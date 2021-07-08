"""
Write a function to print the even numbers from a given list.
List is passed to the function as an argument.
"""

def printEven(lis):
    even =[]
    for i in lis:
        if(int(i)%2==0):
            even.append(int(i))
        else:
            continue

    return even

number = input("enter list elements separated by space -> ")
lis=number.split()

print(printEven(lis))
