# -*- coding: utf-8 -*-
"""
Created on Fri Nov 23 12:40:53 2018

@author: NAFIS
"""

f = open("data2.txt",'w')

import random

for x in range(50):
  i = random.randint(1,101)
  j = random.randint(i,101)
  f.write(str(i) + "    " + str(j) + "    " + "0\n")

for x in range(50):
    i = random.randint(1,101)
    j = random.randint(1,i)
    f.write(str(i) + "    " + str(j) + "    " + "1\n")


f.close()