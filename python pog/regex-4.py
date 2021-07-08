"""

"""

import re

f1=open("regex.txt","r+")


regex='^\d{1,3}[.]\d{1,3}[.]\d{1,3}[.]\d{1,3}$'


for i in f1:
    line=i.lstrip()
    
    if not line:
        continue
    else:
        if(re.search(regex,line)):
            print("{} -> {}".format("valid",line),sep='',end='\n')
        else:
            #print("{} - {}".format(line,"invalid"),sep="-")
            print("invalid ->",line)

f1.close()
