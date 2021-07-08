"""
Given two non-negative values, print true if they have the same last digit, such as with 27 and 57.
lastDigit(7, 17) → true                                                
lastDigit(6, 17) → false
lastDigit(3, 113) → true
"""


num1=int(input('Enter num1 - '))
num2=int(input('enter num2 - '))

if(num1>=0 and num2>=0):
    num1=num1%10
    num2=num2%10

    if(num1==num2):
        print('true')
    else:
        print('false')
        

    
