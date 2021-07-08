#!/usr/bin/env python
# coding: utf-8

# In[2]:


from sklearn.datasets import load_iris
import pandas as pd
import matplotlib.pyplot as plt


# In[12]:


X,y =load_iris(return_X_y=True,as_frame=True)
X


# In[13]:


y


# In[35]:


from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix,accuracy_score

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.33)


# In[36]:


clf= GaussianNB()


# In[37]:


clf.fit(X_train,y_train)


# In[38]:


print("training score of data  = ",clf.score(X_train,y_train))


# In[39]:


y_pred = clf.predict(X_test)


# In[40]:


y_pred


# In[41]:


print("predicted test score = ",clf.score(X_test,y_test))


# In[42]:


cm = confusion_matrix(y_test,y_pred)


# In[43]:


cm


# In[45]:


accuracy = accuracy_score(y_test,y_pred)
accuracy


# In[ ]:




