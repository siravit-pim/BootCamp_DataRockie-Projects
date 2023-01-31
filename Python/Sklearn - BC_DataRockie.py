# -*- coding: utf-8 -*-

# -- Sheet --

# ## Sklearn
# - for make model


import pandas as pd
# read data
df = pd.read_csv("sample-store.csv")
df = df.dropna()
df

# prepare data
x = df[['Sales','Quantity','Discount']]
y = df['Profit']

#split data
from sklearn.model_selection import train_test_split

x_train, x_test, y_train, y_test = train_test_split (
    x, y, test_size = 0.2, random_state = 77
)

# ## Linear Regression


## Linear Regression
from sklearn.linear_model import LinearRegression
# train model
ln_model = LinearRegression()
ln_model.fit(x_train, y_train)
# test model
ln_model.predict(x_test)
# model evaluation
ln_model.score(x_test, y_test)

## RandomForestRegression
from sklearn.ensemble import RandomForestRegressor
rdforest_model = RandomForestRegressor()
rdforest_model.fit(x_train, y_train)
rdforest_model.predict(x_test)
rdforest_model.score(x_test, y_test)

