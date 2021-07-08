"""
Declare a list with 10 integers and ask the user to enter an index.
Check whether the number in that index is positive or negative number.
If any invalid index is entered, handle the exception and print an
error message.
"""


numbers=[-5,5,-3,3,-1,1,-4,4,-2,2]

try:
    n=int(input("enter the index to get list item = "))
    num = numbers[n]
    print(num)
except  IndexError:
    print("Index Error!! List index out of range")

except ValueError:
    print("Value Error!! Integer not Entered. ")

else:
    
    if(num>0):
        print(num," is positive ")
    else:
        print(num,' is negative ')
        
