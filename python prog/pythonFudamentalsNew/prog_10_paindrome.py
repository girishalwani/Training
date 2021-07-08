"""
Write a program to find if the given number is palindrome or not
"""

num = int(input('enter the number - '))
number = num
rev=0;

while(num>0):
    rem = num%10
    rev = (rev*10)+rem
    num=num//10

if(number==rev):
    print(number,' is a palindrome.')
else:
    print(number,' is not a palindrome.')
