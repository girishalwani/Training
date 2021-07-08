import pandas as pd
import graphviz 
from sklearn import tree
from id3 import Id3Estimator
from sklearn.preprocessing import LabelEncoder
import pydotplus

cols=[1,2,3,4,5]
PlayTennis =pd.read_csv("tennis.csv",usecols=cols)
Le = LabelEncoder()
PlayTennis['outlook'] = Le.fit_transform(PlayTennis['outlook'])
PlayTennis['temp'] = Le.fit_transform(PlayTennis['temp'])
PlayTennis['humidity'] = Le.fit_transform(PlayTennis['humidity'])
PlayTennis['wind'] = Le.fit_transform(PlayTennis['wind'])
PlayTennis['play'] = Le.fit_transform(PlayTennis['play'])

X=PlayTennis.drop(['play'],axis=1)
y=PlayTennis['play']
clf=tree.DecisionTreeClassifier(criterion = 'entropy')
clf=clf.fit(X,y)
dot_data = tree.export_graphviz(clf, out_file=None) 
graph = graphviz.Source(dot_data) 
graph

pydotplus.graph_from_dot_data(dot_data).write_pdf('tree.pdf')
clf =Id3Estimator()
estimator=clf.fit(X,y)
print(estimator)

