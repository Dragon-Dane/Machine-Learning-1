# -*- coding: utf-8 -*-
"""
Created on Sun Sep 27 20:12:51 2020

@author: ASUS
"""
import pandas as pd
reviews = pd.read_csv('winemag-data-130k-v2.csv')

print(reviews.points.describe()[5])

tr = reviews.description.map(lambda d: 'tropical' in d).sum()
fr = reviews.description.map(lambda f: 'fruity' in f).sum()
descriptor_counts = pd.Series([tr, fr], index = ['tropical', 'fruity'])

# import numpy as np
# rating = np.maximum(r1, r2)