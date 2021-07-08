#!/usr/bin/env python
# coding: utf-8

# In[9]:


import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori,association_rulesociation_rules


# In[10]:


dataset = [['Shoes', 'Socks', 'Tie', 'Belt'],
           ['Shoes', 'Socks', 'Tie', 'Belt', 'Shirt', 'Hat'],
           ['Shoes', 'Tie'],
           ['Shoes', 'Socks', 'Belt']
          ]
dataset


# In[11]:


te = TransactionEncoder()
te_ary = te.fit(dataset).transform(dataset)


# In[12]:


df = pd.DataFrame(te_ary, columns=te.columns_)


# In[13]:


df


# In[14]:


def encode(x):
    if x==False:
        return 0
    if x==True:
        return 1

basket_set = df.applymap(encode)


# In[15]:


basket_set


# In[39]:


frequent_items = apriori(basket_set,min_support=0.5,use_colnames=True)


# In[40]:


frequent_items


# In[44]:


rules = association_rules(frequent_items, metric="confidence", min_threshold=0.5)
rules


# In[53]:


rules[(rules['antecedents']=={'Socks'}) & (rules['consequents']=={'Tie'})]


# In[ ]:




