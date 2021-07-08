import pandas as pd
import numpy as np
from sklearn.metrics import r2_score
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

cols=[0,1,14]
df=pd.read_csv("district wise rainfall.csv",usecols=cols)
sort=df.sort_values('ANNUAL')
top10=sort.tail(10)
print("Top 10 Districts where we get more rainfall:")
print(top10.iloc[::-1])
bottom10=sort.head(10)
print("")
print("Top 10 Districts where we get less rainfall:")
print(bottom10)
outliers=[]
def outlier(data):
    threshold=2
    mean_1 = np.mean(data)
    std_1 =np.std(data)
    for y in data:
        z_score= (y - mean_1)/std_1 
        if np.abs(z_score) > threshold:
            outliers.append(y)
    return outliers
usecol=[0,13]
dataset=pd.read_csv("rain.csv",usecols=usecol).tail(70)
out=dataset['ANN']
ax1=dataset.plot.scatter(x='YEAR',y='ANN',c='DarkBlue')
outlierpoints=outlier(out)
print("Outliers in rainfall data are:")
print(outlierpoints)

label=LabelEncoder()
ps=pd.read_csv("rain.csv").tail(70)
z=ps.drop(['YEAR','Jan-Feb','Mar-May','Oct-Dec'],axis=1)
X,y=z.iloc[:,13:],z.iloc[:,12:-1]
X=label.fit_transform(X)
y=label.fit_transform(y)#encode target values
X_train, X_test, y_train, y_test =train_test_split(X,y, test_size=0.25) 
model =RandomForestClassifier()
y_test=np.reshape(y_test,(18,1))
X_test=np.reshape(X_test,(18,1))
X_train=np.reshape(X_train,(52,1))
y_train=np.reshape(y_train,(52,1))
model.fit(X_train,y_train)
prediction = model.predict(X_test)
print(y_test)
print("Next: ")
print(prediction)
print('R2 Score:')
score =r2_score(y_test,prediction)
print(score)
prediction =label.inverse_transform(prediction)
print('Rainfall for next 3 years based on the last 70 years of data')
print(prediction[0:3])
print('Rainfall for next 10 years based on the last 70 years of data')
print(prediction[0:10])






