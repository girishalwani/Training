"""
Given a string, if the first or last character is 'x',
return the string without those 'x' character,
else return the string unchanged.
If the input is "xHix", then output is "Hi".
"""


str = "xHix"

if (str[0]=='x' and str[-1]=='x'):
    print('excluding x from string -',str[1:len(str)-1])
else:
    print('no ''x'' at first and last - ',str)
