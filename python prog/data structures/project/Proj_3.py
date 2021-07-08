"""
You have a record of n students. Each record contains the
student's name, and their percent marks in Math, Physics and Chemistry.
The marks can be floating values. You are required to save the
record in a dictionary data type. Student’s name is the key.
Marks stored in a list is the value. The userenters a student's name.
Output the average percentage marks obtained by that student.
"""


n = int(input("enter the number of students - "))

dict ={}

print("enter student name and marks")
for i in range(n):
    name,math,phy,chem = input().split(" ")

    d1={name:[int(math),int(phy),int(chem)]}
    dict.update(d1)

sum=0

nameFound = input("enter a name -> ")

for i in dict.keys():
    if(i==nameFound):
        t=dict[i]
        for i in t:
            sum+=int(i)

        print("Average Percentage marks : ",int(sum/3))
    
