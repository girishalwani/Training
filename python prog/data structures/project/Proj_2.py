"""
Given the participants score sheet for your University Sports Day,
you are required to find the runner-up score.
You have scores.
Store them in a list and find the score of the runner-up
"""

n=int(input("enter the total number of scores - "))

score=set()
print("enter the scores - ")
for i in range(0,n):
    score.add(int(input()))


lis = list(score)
lis.sort()
print('runner up ->',lis[-2])
