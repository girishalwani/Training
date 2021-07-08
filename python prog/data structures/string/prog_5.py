"""
Given a string and an integer n, return a string made of n
repetitions of the last n characters of the string.
You may assume that n is between 0 and the length of the string inclusive
"""


str="Wipro"
n=3

str1 = str[len(str)-n:len(str)]


newStr=""
for i in range(0,n):
    newStr+=str1

print('original string -',str)
print('new string - ',newStr)
