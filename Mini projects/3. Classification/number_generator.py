# -*- coding: utf-8 -*-
"""
Created on Fri Dec 28 09:49:35 2018

@author: NAFIS
"""

f = open("data.txt",'w')

import random
import math

in_num = 100
in_range = 50
out_num = 200
out_range = 100

for i in range(in_num):
    x = random.uniform(-1,1)
    
    temp = (x)**(1/3) #this gives a complex value when x is negative
    
    #so, we find the modulas of it. But instead of taking the square root, 
    #we leave it as is. because our target is to find "(x/2)**(2/3)"
    temp = temp.real*temp.real + temp.imag*temp.imag
    
    a = ( temp - math.sqrt(1 - x * x) )
    b = ( temp + math.sqrt(1 - x * x) )

    y = random.uniform(a, b)
    f.write(str(in_range * x) + "    " + str(in_range * y) + "    " + "0\n")
    
    
for i in range(out_num):
    x = random.uniform(-1,1)
    
    temp = (x)**(1/3)
    temp = temp.real*temp.real + temp.imag*temp.imag
    
    a = ( temp - math.sqrt(1 - x * x) )
    b = ( temp + math.sqrt(1 - x * x) )

    y = random.uniform(a, b)
    if  (x * out_range > -1 * in_range and x * out_range < in_range) and \
        (y * out_range > a * in_range and y * out_range < b * in_range):
            
            i = i - 1
            continue
    
    f.write(str(out_range * x) + "    " + str(out_range * y) + "    " + "1\n")
    
f.close()

