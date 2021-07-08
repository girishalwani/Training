"""
Write a program to count the frequency of a user entered word in a txt file.
"""

filename=input("enter file name -> ")
word = input("enter the word to find its frequency in text file -> ")

f1=open(filename,'r')

string = f1.read()
freq = string.count(word)
print("frequency of ",word," in",filename," = ",freq)

f1.close()
