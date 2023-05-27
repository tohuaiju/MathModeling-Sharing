

% 提取消费数据
consumptionData = data(:, 1:879); % 提取第1列到第879列的数据

% 计算每位学生每天三餐的标准差
dailyStd = zeros(size(consumptionData, 1), 293); % 存储每位学生每天三餐的标准差
for i = 1:size(consumptionData, 1)
    studentData = reshape(consumptionData(i, :), 3, 293); % 将每位学生的消费数据重新排列为3行293列
    dailyStd(i, :) = std(studentData); % 计算每天三餐的标准差
end

% 计算每位学生每天标准差的平均值
studentAvgStd = mean(dailyStd, 2); % 沿第二维计算平均值，得到每位学生每天标准差的平均值

% 显示结果
disp(dailyStd); % 显示每位学生每天三餐的标准差矩阵
disp(studentAvgStd); % 显示每位学生每天标准差的平均值



k=7.86*10^-4
b=-0.063
co60=k.*co60ljz-b

cs137=k.*cs137ljz-b


