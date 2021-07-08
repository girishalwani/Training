"""


"""

import re

regex='^[a-zA-Z0-9_.-]+[@]+[a-zA-Z0-9]+([.]+[a-zA-Z]+){1,3}$'

email=input("enter email id  :")
if(re.search(regex,email)):
    print("valid ->",email)
else:
    print("invalid ->",email)
