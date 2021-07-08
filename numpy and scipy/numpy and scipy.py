#1

#pip install tensorflow
#pip install scikit-learn
#pip install keras

#2

import numpy as np
import scipy as sc


print(np.__version__);
print(sc.__version__);


#3-- 1-D array to 2-D array

arr = np.array([0,1,2,3,4,5,6,7,8,9])
print("1-D array = ",arr);

arr2d = arr.reshape(2,-1);
print("2-D array = \n",arr2d);


#4--

arr1 = np.array([0,1,2,3,4,5,6,7,8,9])
print(arr1);
print(len(arr1))

v1=arr1
v1[v1%2==1]=-1
print(v1)
