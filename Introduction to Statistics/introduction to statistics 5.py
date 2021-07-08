#!/usr/bin/env python
# coding: utf-8

# In[1]:


import matplotlib.pyplot as plt
import numpy as np
from scipy import stats


# In[3]:


sample = np.random.normal(loc=50,scale=5,size=1000)
sample


# In[4]:


sample_mean = np.mean(sample)
sample_mean


# In[5]:


sample_std =np.std(sample)
sample_std


# In[6]:


dist = stats.norm(sample_mean,sample_std)
dist


# In[8]:


values = [value for value in range(30,70)]
values


# In[9]:


prob = [dist.pdf(value) for value in values]
prob


# In[10]:


plt.hist(sample,bins=10,density=True)
plt.plot(values,prob)
plt.show()


# In[ ]:




