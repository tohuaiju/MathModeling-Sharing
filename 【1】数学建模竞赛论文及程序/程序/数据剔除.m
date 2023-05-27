% ���� data ��һ�� 5415x1098 �����飬���������е�����
studentCount = 5415; % ѧ������
dayCount = 366; % ��������

% ��ʼ��һ���յ��߼�������������Ҫɾ�����е�����
deleteColumns = false(1, dayCount * 3);

% ����ÿһ��
for i = 1:3:(dayCount * 3)
    % ����ÿһ�����������ܶ�Ϊ0��ѧ������
    zeroCounter = sum(sum(data(:, i:i+2), 2) == 0);
    
    % ������������ܶ�Ϊ0��ѧ������������ѧ��������90%�������һ�����������Ҫ��ɾ��
    if zeroCounter / studentCount > 0.9
        deleteColumns(i:i+2) = true;
    end
end

% ɾ����Ҫ��ɾ������
data(:, deleteColumns) = [];

% ���㲢��ʾ��ɾ������
deletedColumns = find(deleteColumns);
disp('Deleted columns: ');
disp(deletedColumns);