""

""


import re
f1= open("regex.txt","r")
string = f1.read()
regex = "cpp"

match = re.findall(regex,string,flags=re.IGNORECASE)

print(match)
f1.close()
