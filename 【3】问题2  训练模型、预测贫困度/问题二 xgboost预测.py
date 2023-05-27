import pandas as pd
import xgboost as xgb
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report, confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns

# 加载数据
data_train = pd.read_excel("D:\\【5】数据分析\\【5】接单\\2023-5-23 数学建模 4000\\【3】问题2  训练模型、预测贫困度\\附件8 已知贫困标签.xlsx")
data_predict = pd.read_excel("D:\\【5】数据分析\\【5】接单\\2023-5-23 数学建模 4000\\【3】问题2  训练模型、预测贫困度\\附件9 问题2待补全标签数据 - 副本.xlsx")

# 分割特征和标签
X_train = data_train.iloc[:, 2:]
y_train = data_train.iloc[:, 1]
X_test = data_predict.iloc[:, 2:]

# 定义模型
model = xgb.XGBClassifier()

# 定义参数网格
param_grid = {
    'max_depth': [2, 4, 6],
    'n_estimators': [50, 100, 200],
    'learning_rate': [0.01, 0.1, 0.2],
}

# 创建网格搜索对象
grid_search = GridSearchCV(model, param_grid, cv=5, scoring='accuracy')

# 训练模型
grid_search.fit(X_train, y_train)

# 输出最优参数
print("Best parameters: ", grid_search.best_params_)
print("Best score: ", grid_search.best_score_)

# 使用最优模型预测
y_pred = grid_search.predict(X_test)

# 保存预测结果到原数据中
data_predict.iloc[:, 1] = y_pred
data_predict.to_excel("D:\\【5】数据分析\\【5】接单\\2023-5-23 数学建模 4000\\【3】问题2  训练模型、预测贫困度\\附件9 问题2待补全标签数据 - 副本.xlsx", index=False)

# 输出模型报告
print("Classification report:\n", classification_report(y_train, grid_search.predict(X_train)))

# 输出特征重要性
feature_importances = grid_search.best_estimator_.feature_importances_
sns.barplot(x=feature_importances, y=X_train.columns)
plt.xlabel('Feature Importance Score')
plt.ylabel('Features')
plt.title("Visualizing Important Features")
plt.show()
