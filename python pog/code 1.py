
inp = input("enter marks separated by comma => ")
mark = list(map(int,inp.split(",")))

#mark=[80,80,90,90]

summ =sum(mark)
avg = int(summ/len(mark))

for i in mark:
    if(i<50):
        print("Sorry, you need to work harder!!")
        break
    else:
        if(summ<220):
            print("Sorry, you need to work harder!!")
            break
        else:            
            if(avg>=80):
                print("Grade A")
                break
            elif(avg>=60 and avg<80):
                print("Grade B")
                break
            elif(avg>=55 and avg<60):
                print("Grade C")
                break
            else:
                print("Sorry, you need to work harder!!")
                break
            
