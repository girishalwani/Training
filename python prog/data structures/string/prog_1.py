"""
Write a program to count the number of upper and lower case letters in a String.
"""


str = "UpperCaseLowerCase"
uppercase=0;
lowercase=0;

for i in range(0,len(str)):
    if(str[i]>='A' and str[i]<='Z'):
        uppercase+=1
    else:
        lowercase+=1

print('upper case letters = ',uppercase)
print('lower case letters = ',lowercase)


