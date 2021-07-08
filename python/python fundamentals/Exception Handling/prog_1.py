"""
Write a program to accept two numbers from the user and perform division.
If any exception occurs, print an error message or else print the result
"""



try:
    a = int(input("enter number 1 -> "))
    b = int(input("enter number 2 -> "))

    div = a//b

    print("result = ",div)

except:
    print("Result = Error Occured. Check the inputs!!")
    
