"""
Your friend has sent you a text file containing n lines.
He sent a secret message with it, which tells you the
place and time where you have to go and meet him.
He challenges you to find it out without seeing the content of the file.
He has given hints to find it.
Let’s surprise him by breaking the challenge with our python code
"""


filename=input("enter file name = ")

f1=open(filename,'r')
words=[]
string = f1.read()
lines=string.split("\n")
no_of_lines=0
freq = 0
place = ''

for line in lines:
    if line:
        no_of_lines+=1

if(no_of_lines >=1 and no_of_lines<=24):
    if(no_of_lines<12):
        print("Meeting time:",no_of_lines,"AM")
    else:
        print("Meeting time:",no_of_lines-12,"PM")



for s in string.split(" "):
    words.append(s)
    
for word in words:
    current_freq = words.count(word)
    if(current_freq>freq):
        freq=current_freq
        place=word


print("Meeting Place:",place,"Street")

f1.close()
