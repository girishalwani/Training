"""
Write a program to accept a number from the user and check whether
it’s prime or not. If user enters anything other than number,
handle the exception and print an error message.
"""

try:
    num=int(input("enter an integer -> "))
    if(num>1):
        if(num==2):
            print(num," is a prime number ")

        else:
            for i in range(2,num):
                if(num%i)==0:
                    print(num," is not a prime number ")
                    break

            else:
                print(num," is a prime number ")
    else:
        print(num," is not a prime number ")

except ValueError:
    print(" ValueError occured. check your input ")
