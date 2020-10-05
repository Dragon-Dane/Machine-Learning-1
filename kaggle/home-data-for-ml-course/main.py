import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error

train_path = 'train.csv'
test_path = 'test.csv'

train_data = pd.read_csv(train_path)
test_data = pd.read_csv(test_path)


features = ['MSSubClass','LotArea', 'OverallQual', 'OverallCond', 'YearBuilt',
            'YearRemodAdd', 'LowQualFinSF', 'GrLivArea','1stFlrSF', '2ndFlrSF',
            'GrLivArea','FullBath','HalfBath','BedroomAbvGr','KitchenAbvGr',
            'TotRmsAbvGrd', 'Fireplaces', 'WoodDeckSF','OpenPorchSF',
            'EnclosedPorch', '3SsnPorch','ScreenPorch','PoolArea','MiscVal',
            'MoSold','YrSold']

X = train_data[features]
y = train_data['SalePrice']

# train_X, val_X, train_y, val_y = train_test_split(X, y)

# best_nodes = -1
# error = 2000000
# for nodes in range(100, 1001, 100):
#     home_model = RandomForestRegressor(max_leaf_nodes = nodes, random_state = 1)
#     home_model.fit(train_X, train_y)
#     val_predic = home_model.predict(val_X)
#     val_error = mean_absolute_error(val_predic, val_y)
#     if(error > val_error):
#         error = val_error
#         best_nodes = nodes
#     print(nodes, val_error)

# best_nodes = 400
home_model = RandomForestRegressor(n_estimators=100, criterion='mae', random_state = 1)
home_model.fit(X, y)
train_predic = home_model.predict(X)
print(mean_absolute_error(train_predic, y))

test_X = test_data[features]
test_predic = home_model.predict(test_X)

output = pd.DataFrame({'Id': test_data.Id, 'SalePrice': test_predic})
output.to_csv('submission.csv', index=False)
