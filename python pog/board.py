"""
https://tests.mettl.com/authenticateKey/1qbu9rg2kg
https://tests.mettl.com/authenticateKey/1q51p9ce80



https://tests.mettl.com/authenticateKey/1qbu9rg2kg
https://tests.mettl.com/authenticateKey/1q51p9ce80


"""

def board_A_I():
    number = range(65,75)
    ch=[chr(i) for i in number]
    print(('| {} | {} | {} |\n'*3).format(*ch))

def board_1_9():
    number = range(1,10)
    print(('| {} | {} | {} |\n'*3).format(*number))
    

board_1_9()
board_A_I()
