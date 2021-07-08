"""
Write a program to iterate over a dictionary using for loop and
print the keys alone, values alone and both keys and values.
"""


dict= {1: 10, 2: 20, 3: 30, 4: 40, 5: 50, 6: 60}

print('keys')
for k in dict:
    print(k,end=' ')

print('\nvalues')

for k in dict:
    print(dict[k],end=' ')

print('\nboth keys and values')
for k in dict:
      print(k,':',dict[k],end=' ,')
