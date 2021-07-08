"""
Write a program to accept 10 numbers through
command line arguments and calculate the sum
of prime numbers among them.
"""


import sys

n = len(sys.argv)

print("total number of arguements = ",n)
print("arguements passed = ",end=" ")
for i in range(1,n):
    print(sys.argv[i],end=" ")

sum=0
prime=[]
for i in range(1,n):
    num = sys.argv[i]

    if int(num)>1:
        for i in range(2,int(num)):
            if(int(num)%i)==0:
                break

        else:
            prime.append(int(num))
            sum+=int(num)

print("\nprime numbers = ",prime)
print("sum of primes = ",sum)
