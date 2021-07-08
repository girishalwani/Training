import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix,classification_report,accuracy_score
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2
sns.set()
df=pd.read_csv("diabetes.csv")
plt.figure(figsize=(20,20))
p=sns.heatmap(df.corr(), annot=True,cmap ='RdYlGn')
X = df.drop('Outcome', axis=1)
y = df[['Outcome']]
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.20,random_state=0)
rf_clf=RandomForestClassifier(n_estimators=10).fit(X_train,y_train)
y_pred=rf_clf.predict(X_test)
#apply SelectKBest class to extract best feature
bestfeatures = SelectKBest(score_func=chi2, k=8)
fit = bestfeatures.fit(X,y)
dfscores = pd.DataFrame(fit.scores_)
dfcolumns = pd.DataFrame(X.columns)

#concat two dataframes for better visualization 
featureScores = pd.concat([dfcolumns,dfscores],axis=1)
featureScores.columns = ['Attribute','Score']  #naming the dataframe columns
print('Top attribute which best describes the diabetes')
print(featureScores.nlargest(1,'Score'))  #print best feature
print(confusion_matrix(y_test,y_pred))
print(accuracy_score(y_test,y_pred))
print(classification_report(y_test,y_pred))

 