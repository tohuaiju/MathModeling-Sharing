

% ��ȡ��������
consumptionData = data(:, 1:879); % ��ȡ��1�е���879�е�����

% ����ÿλѧ��ÿ�����͵ı�׼��
dailyStd = zeros(size(consumptionData, 1), 293); % �洢ÿλѧ��ÿ�����͵ı�׼��
for i = 1:size(consumptionData, 1)
    studentData = reshape(consumptionData(i, :), 3, 293); % ��ÿλѧ��������������������Ϊ3��293��
    dailyStd(i, :) = std(studentData); % ����ÿ�����͵ı�׼��
end

% ����ÿλѧ��ÿ���׼���ƽ��ֵ
studentAvgStd = mean(dailyStd, 2); % �صڶ�ά����ƽ��ֵ���õ�ÿλѧ��ÿ���׼���ƽ��ֵ

% ��ʾ���
disp(dailyStd); % ��ʾÿλѧ��ÿ�����͵ı�׼�����
disp(studentAvgStd); % ��ʾÿλѧ��ÿ���׼���ƽ��ֵ



k=7.86*10^-4
b=-0.063
co60=k.*co60ljz-b

cs137=k.*cs137ljz-b


