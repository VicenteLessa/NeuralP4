import pickle
import autogluon as ag
import json
import pandas as pd
from autogluon.tabular import TabularPredictor

predictor = TabularPredictor.load("nprintml/run-aardvark-1718828826-80702/model/",verbosity = 3)

#print(help(predictor))

### list all the features
# features = predictor.feature_metadata_in.get_features()
# print(features)

### calculate feature importance, returns sorted list by importance
print("FEATURE IMPORTANCE")
features_sorted = predictor.feature_importance(feature_stage = 'transformed', num_shuffle_sets=10)
features_sorted.to_csv("feature-importance.csv")
print(features_sorted.head(32))



