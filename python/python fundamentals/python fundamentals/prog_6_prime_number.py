"""
Write a program to check if a given number is prime or not.
"""

num=int(input('enter number - '))

if(num==2):
    print(num,'is a prime number')
    
elif(num>2):
    for i in range(2,num):
        if(num%i==0):
            print(num,' is not a prime number')
            break
    else:
        print(num,' is a prime number')
            
else:
    print(num,' is not a prime number')
