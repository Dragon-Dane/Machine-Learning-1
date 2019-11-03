# -*- coding: utf-8 -*-
"""
Created on Sun Oct 20 22:38:57 2019

@author: NAFIS
"""

import pandas as pd
import numpy as np
import csv as csv

from sklearn.model_selection import cross_val_score
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC, LinearSVC
from sklearn.ensemble import RandomForestClassifier

#Shuffle the datasets
from sklearn.utils import shuffle

#Learning curve
import matplotlib.pyplot as plt
from sklearn.model_selection import learning_curve
from sklearn.model_selection import ShuffleSplit

#import seaborn as sns
#Output plots in notebook
#%matplotlib inline 

addpoly = True
plot_lc = 0   # 1--display learning curve/ 0 -- don't display




#loading the data sets from the csv files
print('--------load train & test file------')
train_dataset = pd.read_csv('train.csv')
test_dataset = pd.read_csv('test.csv')

print('train dataset: %s, test dataset %s' %(str(train_dataset.shape), str(test_dataset.shape)) )
train_dataset.head()


print('Id is unique.') if train_dataset.PassengerId.nunique() == train_dataset.shape[0] else print('oops')
print('Train and test sets are distinct.') if len(np.intersect1d(train_dataset.PassengerId.values, test_dataset.PassengerId.values))== 0 else print('oops')
# print('We do not need to worry about missing values.') if train_dataset.count().min() == train_dataset.shape[0] and test_dataset.count().min() == test_dataset.shape[0] else print('oops we have nan')

datasetHasNan = False
if train_dataset.count().min() == train_dataset.shape[0] and test_dataset.count().min() == test_dataset.shape[0] :
    print('We do not need to worry about missing values.') 
else:
    datasetHasNan = True
    print('oops we have nan')
    
    
print('----train dataset column types information-------')
dtype_df = train_dataset.dtypes.reset_index()
dtype_df.columns = ["Count", "Column Type"]
dtype_df.groupby("Column Type").aggregate('count').reset_index()

print('----train dataset information-------')
dtype_df