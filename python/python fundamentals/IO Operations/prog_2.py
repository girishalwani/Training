"""
Write a program to read first n lines from a txt file. Get n as user input.
"""


n = int(input("enter the number of lines to be read -> "))

f1=open('test.txt','r')
for i in range(1,n+1):
    line = f1.readline()
    print(line)
f1.close()
