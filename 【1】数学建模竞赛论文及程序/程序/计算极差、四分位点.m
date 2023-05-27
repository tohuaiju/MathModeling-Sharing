% ��������
% ���������Ѿ�����Ϊ 'myData' �Ķ�ά������
% myData = importdata('your_file_name');

% ��ʼ���������
maxValues = zeros(size(myData,1), 1);
rangeValues = zeros(size(myData,1), 1);
q1Values = zeros(size(myData,1), 1);
q3Values = zeros(size(myData,1), 1);

% ����myData�е�ÿһ��
for i = 1:size(myData,1)
    row = myData(i, :);
    
    % �������ֵ
    maxValues(i) = max(row);
    
    % �����ȥ0֮��ļ���
    rowWithoutZeros = row(row ~= 0);
    if isempty(rowWithoutZeros)
        rangeValues(i) = 0;
    else
        rangeValues(i) = range(rowWithoutZeros);
    end
    
    % �����ȥ0֮������ķ�λ������ķ�λ��
    if isempty(rowWithoutZeros)
        q1Values(i) = 0;
        q3Values(i) = 0;
    else
        q1Values(i) = quantile(rowWithoutZeros, 0.25);
        q3Values(i) = quantile(rowWithoutZeros, 0.75);
    end
end

% ������
disp('Max values:')
disp(maxValues)
disp('Range values:')
disp(rangeValues)
disp('Q1 values:')
disp(q1Values)
disp('Q3 values:')
disp(q3Values)
