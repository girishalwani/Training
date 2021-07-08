"""

"""

import re

f1=open("regex.txt","r")
num = f1.read()
regex='(\d+){10}'

number = re.findall('\d+',num)

for i in number:
    if(re.search(regex,i)):
        print(i,"valid")
    else:
        print(i,"invalid")

f1.close()
