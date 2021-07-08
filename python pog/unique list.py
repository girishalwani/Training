"""

"""

def mergeList():
    num = int(input("enter the number of lists = "))
    lis=[]
    for i in range(num):
        lis.append(list(map(int,input().split())))

    lis3=[]
    for i in range(len(lis)):
        lis3+=set(lis[i])

    print("unique elements =",sorted(list(set(lis3))))
        



mergeList()
