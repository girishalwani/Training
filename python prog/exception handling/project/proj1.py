"""
Exception Handling
project 1
"""

try:
    filename = str(input("Enter file name = "))
    f1=open(filename,'r')

    lines=[]
    for line in f1:
        line=line.rstrip()
        if line:
            lines.append(line)

    items={}
    products={}
    free={}
    discount={}

    for i in lines:
        (key,val)=i.split(" ")
        items[key]=val

    for k,v in items.items():
        if k=="Discount":
            discount[k]=int(v)

        elif v=="free":
            free[k]=v

        else:
            products[k]=int(v)

except TypeError:
    print("Type Error!! Enter correct file name ")

except ValueError:
    print("Value Error!! File name must be string ")

except EOFError:
    print("EOF Error!! enter a string ")

except FileNotFoundError:
    print("IO Error!! File not in directory ")

except NameError:
    print("Name Error!! Variables not defined correctly ")

except KeyboardInterrupt:
    print("keyboard interrupt!! ctrl+key entered ")
    
else:
    
    items_purchased = len(products)
    free_items = len(free)
    amount=sum(products.values())
    discount_given = sum(discount.values())
    total_amount = amount-discount_given

    print("No of items ourchased: ",items_purchased)
    print("No of free items: ",free_items)
    print("Amount to pay: ",amount)
    print("Discount given: ",discount_given)
    print("Final amount paid: ",total_amount)

    f1.close()
