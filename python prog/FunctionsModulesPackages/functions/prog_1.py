"""
Write a function to return the sum of all numbers in a list.
"""

def sumAll(list):
    sum=0
    for i in list:
        sum+=int(i)
    return sum


number = input("enter list elements separated by space -> ")
lis=number.split()
lis2=[]
for i in lis:
    lis2.append(int(i))
    
print('list items -> ',lis2)
print('sum of all elements -> ',sumAll(lis))
