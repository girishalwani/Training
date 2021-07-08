"""
Write a program to find the longest word from the txt file
contents, assuming that the file will have only one longest word in it.
"""


f1=open('test.txt','r')
string = f1.read()
length=0
longestWord=''
for word in string.split():
    if(len(word) > length):
        length = len(word)
        longestWord=word

print("longest word -> ",longestWord)
print("length = ",length)

f1.close()
