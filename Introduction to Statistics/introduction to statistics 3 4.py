#!/usr/bin/env python
# coding: utf-8

# In[1]:


def bayes_th(pa,pb_given_a,pb_given_not_a):
    not_a=1-pa
    pb=pb_given_a * pa+pb_given_not_a*not_a
    pa_given_b=(pb_given_a*pa)/pb
    return pa_given_b


# In[2]:


pa = 0.0002
pb_given_a=0.85
pb_given_not_a=0.05

result = bayes_th(pa,pb_given_a,pb_given_not_a)


# In[9]:


print('P(A|B) = ',(result*100))


# In[ ]:





# In[12]:


from matplotlib import pyplot
from numpy.random import normal


# In[13]:


sample=normal(size=1000)


# In[14]:


sample


# In[15]:


pyplot.hist(sample,bins=10)
pyplot.show()


# In[ ]:




