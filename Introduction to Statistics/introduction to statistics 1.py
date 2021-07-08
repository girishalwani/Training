#!/usr/bin/env python
# coding: utf-8

# In[8]:


import numpy as np
get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib.pyplot as plt


# In[13]:


incomes = np.random.normal(40000,15000,10000)
incomes.size


# In[10]:


np.mean(incomes)


# In[11]:


plt.hist(incomes,50)


# In[14]:


incomes =np.append(incomes,[1000000000])
incomes.size


# In[15]:


np.median(incomes)


# In[17]:


np.mean(incomes)


# In[18]:


from scipy import stats


# In[20]:


ages=np.random.randint(18,high=90,size=500)
ages.size


# In[21]:


stats.mode(ages)


# In[23]:





# In[ ]:




