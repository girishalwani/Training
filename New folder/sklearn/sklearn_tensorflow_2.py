#!/usr/bin/env python
# coding: utf-8

# In[24]:


from sklearn.datasets import make_classification
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve
from sklearn.metrics import roc_auc_score
import  matplotlib.pyplot as plt

# generate 2 class dataset
X, y = make_classification(n_samples=1000, n_classes=2, random_state=1)

# split into train/test sets
trainX, testX, trainy, testy = train_test_split(X, y, test_size=0.5, random_state=2)


# In[25]:


X


# In[26]:


y


# In[27]:


clf = LogisticRegression()


# In[28]:


clf.fit(trainX,trainy)


# In[29]:


y_pred = clf.predict(testX)
y_pred


# In[30]:


fpr,tpr,thresh = roc_curve(testy,y_pred)


# In[31]:


plt.figure(figsize=(7,7))
plt.plot(fpr,tpr)


# In[32]:


auc = roc_auc_score(testy,y_pred)
auc


# In[ ]:




