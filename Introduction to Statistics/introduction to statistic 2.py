#!/usr/bin/env python
# coding: utf-8

# In[2]:


get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib.pyplot as plt
import numpy as np


# In[3]:


incomes = np.random.normal(100.0,50.0,10000)
incomes


# In[5]:


plt.hist(incomes,50)
plt.show()


# In[7]:


incomes.std()


# In[8]:


incomes.var()


# In[ ]:




