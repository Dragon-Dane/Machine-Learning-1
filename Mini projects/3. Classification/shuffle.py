# -*- coding: utf-8 -*-
"""
Created on Mon Dec 31 11:13:20 2018

@author: NAFIS
"""
from sklearn.utils import shuffle
import numpy as np

f = open('data.txt','r')

a = []

for i in f.readlines():
    a.append(i.split())
    
a = np.array(a)
a = shuffle(a)

f.close()



f = open('data2.txt','w')
for i in a:
    f.write(str(i[0]) + '    ' + str(i[1]) + '    ' + str(i[2]) + '\n')
    
f.close()