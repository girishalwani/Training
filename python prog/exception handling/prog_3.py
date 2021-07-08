"""
Write a program to accept the file name to be opened from the user,
if file exist print the contents of the file in title case or else
handle the exception and print an error message.
"""


filename = str(input("enter file name -> "))

try:
    f1=open(filename,'r')

except FileNotFoundError:
    print(" File cannot be found in directory, enter the correct file name ")
    
else:
    content = f1.read()
    print(content)
    f1.close()
