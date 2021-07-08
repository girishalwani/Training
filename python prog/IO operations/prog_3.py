"""
Write a program to accept input from user and append it to a txt file
"""

msg = input(" enter the content to write to the file -> \n")
f1 = open('test.txt','a')
f1.write(msg)
f1.close()
