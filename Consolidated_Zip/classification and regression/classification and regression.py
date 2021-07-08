#!/usr/bin/env python
# coding: utf-8

# In[10]:


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# In[11]:


medals=pd.read_csv('medals.csv')
medals.head()


# In[12]:


diab = pd.read_csv("diabetes.csv")
diab.head()


# In[20]:


plt.figure(figsize=(19,19))
sns.heatmap(diab[0:50],annot=True)


# In[23]:


from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression


# In[26]:


diab.head()


# In[31]:


X = diab.iloc[:,0:8]
y=diab['Outcome']


# In[32]:


X.head()


# In[33]:


y.head()


# In[37]:


X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.33)


# In[38]:


clf = LogisticRegression()


# In[39]:


clf.fit(X_train,y_train)


# In[40]:


y_pred = clf.predict(X_test)


# In[41]:


y_pred


# In[42]:


from sklearn.metrics import confusion_matrix


# In[43]:


cm = confusion_matrix(y_test,y_pred)
cm


# In[ ]:




