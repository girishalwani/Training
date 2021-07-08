"""
Throughcommand line arguments three strings separated by
space aregiven to you.
Eachstring is a series of numbersseparated by hyphen(-).

You like all the numbers in string 1 and dislike all the
numbers in string 2.
Third string contains thenumbers given to you.
Your initial happiness is 0.
When you encounter anumberwhich is present in string 1,
add 1 to yourhappiness, if it is present in string 2,
add -1 to your happiness.
Otherwise, your happiness does not change.
Output your final happiness at the end
"""

import sys

string1=sys.argv[1]
string2=sys.argv[2]
string3=sys.argv[3]

happiness=0

str1=string1.split("-")
str2=string2.split("-")
str3=string3.split("-")
n=len(str3)


for i in str3:
    if i in str1:
        happiness+=1
    elif i in str2:
        happiness-=1


print("happiness = ",happiness)
