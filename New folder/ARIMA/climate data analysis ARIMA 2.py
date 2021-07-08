#!/usr/bin/env python
# coding: utf-8

# In[10]:


from pandas import read_csv
import numpy as np
from pandas import DataFrame
from statsmodels.tsa.arima_model import ARIMA
from sklearn.metrics import mean_squared_error
from matplotlib import pyplot


# In[11]:


cols=[1,2,15]
df = read_csv("climate_data.csv",usecols=cols)
df=df.fillna(0)
data=df[df.Parameter=='Actual']
series=data['ANNUAL']
model = ARIMA(series, order=(5,1,0))
model_fit = model.fit(disp=0)
print(model_fit.summary())
# plot residual errors
residuals = DataFrame(model_fit.resid)
residuals.plot()
pyplot.show()
residuals.plot(kind='kde')
pyplot.show()
print(residuals.describe())


# In[13]:


X=series.values
size = int(len(X) * 0.95)
train, test = X[0:50], X[50:len(X)]
history = [x for x in train]
predictions = list()
for t in range(len(test)):
    model = ARIMA(history, order=(5,1,0))
    model_fit = model.fit(disp=0)
    output = model_fit.forecast()
    yhat = output[0]
    predictions.append(yhat)
    obs = test[t]
    history.append(obs)
    print('predicted=%f, expected=%f' % (yhat, obs))
error = mean_squared_error(test, predictions)
print('Test MSE: %.3f' % error)
# plot
pyplot.plot(test)
pyplot.plot(predictions, color='red')
pyplot.show()


# In[9]:


len(X)


# In[ ]:




