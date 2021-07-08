"""
Write a program to append the items of list1 to list2 in the front.
"""

list1=[1,2,3,4,5]
list2=['one','two','three','four','five']
list3=[6,7,8,9]
list1.extend(list2)
print('using extend - ',list1)
list1.append(list3)
print('using append - ',list1)
