"""

"""


import random
import math

def cow_bull(num):
    k =math.floor(random.random()*10000)
    print("secret number = ",k)
    
    rand=[int(i) for i in str(k)]

    print("guess a ",str(num),"-digit number = ")

    guess =int(input())
    guess_list=[int(i) for i in str(guess)]

    cow =0
    bull=0

    for i in range(0,num):
        if(guess_list[i]==rand[i]):
            cow+=1
        elif (guess_list[i] in rand):
            bull+=1

    print(cow," cows ",bull," bulls ")

cow_bull(4)
