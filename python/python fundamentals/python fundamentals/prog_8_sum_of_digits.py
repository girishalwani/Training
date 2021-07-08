"""
Write a program to print the sum of all the digits of a given number.
Example:
I/P:1234
O/P:10
"""


num=int(input('enter the number - '))
sum=0;

while(num>0):
    r=num%10
    sum=sum+r
    num=num//10

print(sum)
