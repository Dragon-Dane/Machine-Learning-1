# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 15:47:50 2018

@author: NAFIS
"""


f = open('iris.data1.txt','r')
f2 = open('iris.data2.txt','w')

for line in f.readlines():
    f2.write(line[:16])
    if line[16:] == 'Iris-setosa\n':
        f2.write('1')
    elif line[16:] == 'Iris-versicolor\n':
        f2.write('2')
    elif line[16:] == 'Iris-virginica\n': 
        f2.write('3')
    
    f2.write('\n')
    
f.close()
f2.close()