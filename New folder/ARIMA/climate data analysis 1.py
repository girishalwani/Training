#!/usr/bin/env python
# coding: utf-8

# In[57]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[58]:


climate = pd.read_csv("climate_data.csv")
climate.head(10)


# In[59]:


yr = climate[climate['YEAR']=='1901-2015']


# In[60]:


climate['Parameter'].unique()


# In[63]:


data = climate[climate['Parameter']=='Actual']
data


# ### kerala

# In[64]:


ker = data[data.SUBDIVISION=='KERALA']
ker


# In[65]:


ker.describe()


# In[72]:


plt.figure(figsize=(18,28))
plt.xticks(rotation=90)
sns.barplot(x='YEAR',y="ANNUAL",data=ker)
plt.title("Annual Rainfall in Kerala")
plt.show()


# ## maharashtra

# In[91]:


mah = data[data.SUBDIVISION=='MADHYA MAHARASHTRA']
mah


# In[101]:


plt.figure(figsize=(18,28))
plt.xticks(rotation=90)
sns.barplot(x='YEAR',y="ANNUAL",data=mah)
plt.title("Annual Rainfall in Maharashtra")
plt.show()


# In[99]:


mah.plot(x='YEAR',y='ANNUAL',kind="line")


# ## punjab

# In[103]:


pun = data[data.SUBDIVISION=='PUNJAB']
pun


# In[104]:


plt.figure(figsize=(18,28))
plt.xticks(rotation=90)
sns.barplot(x='YEAR',y="ANNUAL",data=pun)
plt.title("Annual Rainfall in Punjab")
plt.show()


# In[107]:


pun.plot(x='YEAR',y='ANNUAL',kind="line",figsize=(15,15),title="rainfall in punjab")


# In[ ]:




