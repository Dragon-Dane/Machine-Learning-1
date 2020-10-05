import pandas as pd
from sklearn.metrics import mean_absolute_error
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor

melbourne_file_path = 'melb_data.csv'

melbourne_data = pd.read_csv(melbourne_file_path)
#print(melbourne_data.columns)
#print(melbourne_data.describe())


melbourne_data = melbourne_data.dropna(axis=0)

y = melbourne_data.Price

melbourne_features = ['Rooms', 'Bathroom', 'Landsize', 'Lattitude', 'Longtitude']

X = melbourne_data[melbourne_features]
#print(X.describe())
#print(X.head())

# melbourne_model = DecisionTreeRegressor(random_state=1)
# melbourne_model.fit(X, y)

# # print("Making predictions for the following 5 houses:")
# # print(X.head())
# # print("The predictions are")
# # print(melbourne_model.predict(X.head()))

# predicted_home_prices = melbourne_model.predict(X)
# print('Mean abosolute error: {}'.format(mean_absolute_error(y, predicted_home_prices)))


train_X, val_X, train_y, val_y = train_test_split(X, y, random_state = 0)
melbourne_model = DecisionTreeRegressor()
melbourne_model.fit(train_X, train_y)


val_predictions = melbourne_model.predict(val_X)
print('Decision Tree: {}'.format(mean_absolute_error(val_y, val_predictions)))



forest_model = RandomForestRegressor(random_state=1)
forest_model.fit(train_X, train_y)
melb_preds = forest_model.predict(val_X)
print('Random Forest: {}'.format(mean_absolute_error(val_y, melb_preds)))