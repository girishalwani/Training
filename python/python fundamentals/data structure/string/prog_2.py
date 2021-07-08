"""
Write a program that will check whether a given String is Palindrome or not.
"""

def palindrome(str):
    rev="".join(reversed(str))

    if(str==rev):
        return True
    return False

str1="malayalam"
ans1=palindrome(str1)

if(ans1 == True):
    print(str1,' is palindrome string')
else:
    print(str1,' is not palindrome string')


str2 = "hello world"
ans2=palindrome(str2)

if(ans2 == True):
    print(str2,' is palindrome string')
else:
    print(str2,' is not palindrome string')
