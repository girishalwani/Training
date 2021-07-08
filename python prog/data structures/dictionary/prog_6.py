"""
Write a program to sum all the values in a dictionary,
considering the values will be of int type.
"""


dict={1: 10, 2: 20, 3: 30, 4: 40, 5: 50, 6: 60}
sum=0;

for k in dict:
    sum=sum+dict[k]

print('sum of values =',sum)
