"""

"""

def countchr(string):

    vovcount= 0
    concount=0
    numcount=0
    splcount=0
    
    for i in string:
        if((i>="A" and i<="Z") or (i>="a" and i<="z")):
            ch = i.lower()
            if(ch in ["a","e","i","o","u"]):
                vovcount+=1
            else:
                concount+=1
        elif(i>='0' and i<='9'):
            numcount+=1
        else:
            splcount+=1
    print("vowels = ",vovcount)
    print("consonents =",concount)
    print("numbers =",numcount)
    print("special char = ",splcount)

string = input("enter the string")
countchr(string)
