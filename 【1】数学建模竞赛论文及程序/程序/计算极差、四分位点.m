% 导入数据
% 假设数据已经在名为 'myData' 的二维矩阵中
% myData = importdata('your_file_name');

% 初始化结果矩阵
maxValues = zeros(size(myData,1), 1);
rangeValues = zeros(size(myData,1), 1);
q1Values = zeros(size(myData,1), 1);
q3Values = zeros(size(myData,1), 1);

% 对于myData中的每一行
for i = 1:size(myData,1)
    row = myData(i, :);
    
    % 计算最大值
    maxValues(i) = max(row);
    
    % 计算除去0之外的极差
    rowWithoutZeros = row(row ~= 0);
    if isempty(rowWithoutZeros)
        rangeValues(i) = 0;
    else
        rangeValues(i) = range(rowWithoutZeros);
    end
    
    % 计算除去0之外的上四分位点和下四分位点
    if isempty(rowWithoutZeros)
        q1Values(i) = 0;
        q3Values(i) = 0;
    else
        q1Values(i) = quantile(rowWithoutZeros, 0.25);
        q3Values(i) = quantile(rowWithoutZeros, 0.75);
    end
end

% 输出结果
disp('Max values:')
disp(maxValues)
disp('Range values:')
disp(rangeValues)
disp('Q1 values:')
disp(q1Values)
disp('Q3 values:')
disp(q3Values)
