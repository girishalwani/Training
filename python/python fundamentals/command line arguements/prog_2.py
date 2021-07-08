"""
Write a program to accept a welcome message through
command line arguments and display the file name
along with the welcome message.
"""


import sys
msg=sys.argv[1]
print("hi ",msg," your file name is ",sys.argv[0])
