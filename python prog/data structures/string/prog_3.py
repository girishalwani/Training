"""
Given a string, return a new string made of n
copies of the first 2 chars of the original
string where n is the length of the string.
The string length will be >=2.
"""



str = "Wipro"

splice = str[0:2]
new=""

if(len(str)>=2):
    for i in range(0,len(str)):
        new+=splice

print('old string - ',str)
print('new string - ',new)
