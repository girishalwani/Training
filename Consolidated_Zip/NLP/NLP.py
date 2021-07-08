#!/usr/bin/env python
# coding: utf-8

# In[10]:


from nltk.tokenize import sent_tokenize,word_tokenize


# In[11]:


sentence = sent_tokenize("Hello NLP Learner. This is a NLP Python Script.")


# In[12]:


print(sentence)


# In[13]:


words = word_tokenize("We are learning Artificia Intelligence")


# In[14]:


print(words)


# In[ ]:





# In[16]:


from nltk.stem import PorterStemmer


# In[17]:


ps =PorterStemmer()


# In[18]:


list_words=["python","pythoner","pythoning","pythoned","pythonly","wolves", "leaves","horses","dogs","fairly"]


# In[20]:


for lis in list_words:
    print(ps.stem(lis))


# In[ ]:





# In[21]:


from nltk.stem import SnowballStemmer


# In[23]:


ss = SnowballStemmer("english")


# In[25]:


lis_words=["python","pythoner","pythoning","pythoned","pythonly","wolves", "leaves","horses","dogs","fairly"]


# In[26]:


for lis in lis_words:
    print(ss.stem(lis))


# In[ ]:





# In[27]:


from nltk import stem


# In[28]:


wn_lemat = stem.WordNetLemmatizer()


# In[30]:


print(wn_lemat.lemmatize("dogs"))
print(wn_lemat.lemmatize("leaves"))
print(wn_lemat.lemmatize("wolves"))
print(wn_lemat.lemmatize("babies"))
print(wn_lemat.lemmatize("geese"))


# In[ ]:





# In[31]:


from nltk.tokenize import word_tokenize
from nltk.tag import pos_tag


# In[33]:


words = word_tokenize("We are learning Artificia Intelligence")


# In[34]:


print(words)


# In[35]:


pos_words = pos_tag(words)


# In[36]:


print(pos_words)


# In[ ]:





# In[ ]:





# In[37]:


from nltk.chunk import ne_chunk
from nltk.tokenize import word_tokenize
from nltk.tag import pos_tag


# In[41]:


chunk = ne_chunk(pos_tag(word_tokenize("My name is Girish. I am an engineer and learning NLP")))


# In[42]:


print(chunk)


# In[43]:


chunk.draw()


# In[ ]:





# In[ ]:





# In[59]:


senti_dict={}

for each_line in open('mysenti.txt'):
    word,score = each_line.split('\t')
    senti_dict[word] = int(score)
    


# In[60]:


words = 'This is not a good training and i appreciate it. But lab machines are worst'.lower().split()
print(words)
print(sum( senti_dict.get(word, 0) for word in words ))


# In[ ]:




