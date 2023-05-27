% 假设 data 是一个 5415x1098 的数组，保存了所有的数据
studentCount = 5415; % 学生数量
dayCount = 366; % 天数数量

% 初始化一个空的逻辑向量来保存需要删除的列的索引
deleteColumns = false(1, dayCount * 3);

% 遍历每一天
for i = 1:3:(dayCount * 3)
    % 计算每一天三餐消费总额为0的学生数量
    zeroCounter = sum(sum(data(:, i:i+2), 2) == 0);
    
    % 如果三餐消费总额为0的学生数量超过总学生数量的90%，标记这一天的数据列需要被删除
    if zeroCounter / studentCount > 0.9
        deleteColumns(i:i+2) = true;
    end
end

% 删除需要被删除的列
data(:, deleteColumns) = [];

% 计算并显示已删除的列
deletedColumns = find(deleteColumns);
disp('Deleted columns: ');
disp(deletedColumns);