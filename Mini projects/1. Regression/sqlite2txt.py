# -*- coding: utf-8 -*-
"""
Created on Thu Nov  1 00:05:55 2018

@author: NAFIS
"""

import sqlite3
import matplotlib.pyplot as plt

conn = sqlite3.connect('ageofcrime.sqlite')
c = conn.cursor()



c.execute('SELECT * FROM Age_of_Criminals')
data = c.fetchall()

c.close
conn.close()


first = []
for d in data:
    first.append(d[0])
    
second = []
for d in data:
    second.append(d[1])
'''
plt.plot(first,second,'ro')
plt.ylabel("Number of Criminals")
plt.xlabel("Age of Criminals")

'''
f = open('ageofcrime.txt','w+')

for d in data:
    f.write(str(d[0])+'    '+str(d[1])+'\n')
    
f.close()
