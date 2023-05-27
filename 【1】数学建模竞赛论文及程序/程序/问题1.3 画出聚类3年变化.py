import pandas as pd
import numpy as np

# 读取Excel文件
df = pd.read_excel("D:\\6.xlsx")

# 初始化一个新的DataFrame来保存结果
results = pd.DataFrame()

# 循环处理每个群体
for group in [1, 2, 3]:
    # 选择该群体的数据
    group_df = df[df['聚类种类'] == group]

    # 计算每个指标的均值
    for year in ['第一学年-', '第二学年-', '第三学年-']:
        for column in df.columns:
            if year in column:
                mean_value = group_df[column].mean()
                results.loc[group, f"{year}{column.replace(year, '')}"] = mean_value

# 将结果导出到新的Excel文件
results.to_excel("D:\\results.xlsx")
