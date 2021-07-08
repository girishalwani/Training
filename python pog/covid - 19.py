"""

"""

num = int(input("enter the number of cities = "))
li=[]
print("enter city and cases separated by space ")
for i in range(num):
    city,people = input().split()
    li.append((city,int(people)))
print("cities = ",li)

summ=0
for i in li:
    summ+=(i[1])
print("total number of cases = ",summ)

avg  = summ/len(li)
print("average cases = ",avg)

red_zone=[]

for i in li:
    if(i[1]>avg):
        red_zone.append(i)

print("red_zone = ",red_zone,"areas needed to be sealed")


    
