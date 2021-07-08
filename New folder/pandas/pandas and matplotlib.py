#!/usr/bin/env python
# coding: utf-8

# In[63]:


import matplotlib.pyplot as plt
import pandas as pd


# In[64]:


cars = pd.read_csv("auto-mpg.csv")
cars


# In[65]:


print(cars)


# In[66]:


cars.head()


# In[67]:


cars.tail()


# In[68]:


cars.describe()


# In[69]:


cars.info()


# In[70]:


mpg = cars['mpg']
mpg


# In[71]:


mpg.max()


# In[72]:


cars[cars['mpg']==mpg.max()]


# In[73]:


print("the most fuel efficient car has mpg of... ",mpg.max())


# In[74]:


sorted_mpg=mpg.sort_values(ascending=True,ignore_index=True)


# In[75]:


sorted_mpg.head()


# In[76]:


sorted_mpg[1]


# In[78]:


plt.hist(mpg,bins=40)
plt.show()


# In[86]:


plt.figure(figsize=(15,15))
plt.scatter(cars['horsepower'],cars['mpg'])
plt.show()


# In[ ]:




