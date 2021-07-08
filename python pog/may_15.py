
input1=[10,20,30,40,60,100,30,90,20]
input2=[90,20,30,80,50,10,40,60,20]
input3=[100,30,20,40,50,90,20,10,60]
input4=90
target_pos = input1.index(input4)
pos_input2 = input2.index(input4)
pos_input3 = input3.index(input4)

"""
for i,n in enumerate(input1):
    if n==input4:
        target_pos = i


for i,n in enumerate(input2):
    if n==input4:
        pos_input2 = i
        
for i,n in enumerate(input3):
    if n==input4:
        pos_input3 = i
        
"""

lin_moves2 = target_pos-pos_input2
lin_moves3 = target_pos - pos_input3

totol_moves = lin_moves2 + lin_moves3

print(totol_moves)




