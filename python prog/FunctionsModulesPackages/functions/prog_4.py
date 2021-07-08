"""
 Write a function that accepts a string and prints the number of
 upper case letters and lower case letters in it.
"""

def UcaseLcase(str):
    Ucount=0
    Lcount=0
    for i in range(0,len(str)):
        if(str[i]>='A' and str[i]<='Z'):
            Ucount+=1
        else:
            Lcount+=1

    print('upper count -> ',Ucount)
    print('lower count -> ',Lcount)


string =input("enter the string -> ")
UcaseLcase(string)
        
