"""
Write a function that takes a number as a parameter
and checks whether the number is prime or not.
"""



def prime(num):
    if(num==2):
        print(num," Prime Number ")

    elif(num>2):
        for i in range(2,num):
            if(num%i==0):
                print(num," is Not a prime number ")
                break
        else:
            print(num,' is Prime Number ')
    else:
        print(num,' is not a prime number ')


num =int(input("enter a number -> "))
prime(num)

        
