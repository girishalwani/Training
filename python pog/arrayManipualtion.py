"""
"""


def listManip():
    print("enter lit elements separated by space bar")
    lis=list(map(int,input().split()))

    lis=[lis[i]+i for i in range(len(lis))]
    print(lis)

listManip()
