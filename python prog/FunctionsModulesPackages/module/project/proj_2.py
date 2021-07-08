"""
palindrome module
"""

def ispalindrome(name):
    str="".join(reversed(name))

    if(name==str):
        print('Yes it is a palindrome')
    print('No it is not a palindrome')


def count_the_vowels(name):
    vowels="AaEeIiOoUu"
    vow=0
    for each in name:
        if each in vowels:
            vow+=1

    print('No of vowels : ',vow)


def frequency_of_letters(name):
    dict={}
    for i in name:
        keys = dict.keys()

        if i in keys:
            dict[n]+=1
        else:
            dict[i]=1

    print('frequency of letters : ',dict)
