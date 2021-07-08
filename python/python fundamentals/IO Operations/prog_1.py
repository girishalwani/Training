"""
Write a program to read the entire content from a txt file
and display it to the user.
"""


f1=open('test.txt','r')
content = f1.read()
print("--file contents--\n\n",content)
f1.close()
