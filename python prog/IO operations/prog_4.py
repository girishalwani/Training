
"""
Write a program to read contents from a txt file
line by line and store each line into a list.
"""


f1=open('test.txt','r')
list_of_lines = f1.readlines()
print(list_of_lines)

f1.close()
