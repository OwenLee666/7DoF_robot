function [t_list, t_sum] = create_time_list(N, t_min)

% ����
% clc;clear;
% N = 95;
% t_min = 0.0391;

num = N-1;

n_acc1 = floor(num * 0.2);    % �Ӽ��ٶ�����
n_acc2 = floor(num * 0.1);    % �Ӽ��ٶ�����
n_keep = floor(num * 0.4);    % ���ٶ�����

% ��֤ʱ�����N-1��
while num ~= 2*n_acc1 + 2*n_acc2 + n_keep
    n_keep = n_keep + 1;
end

% ����ʱ�����飬��ʾÿһС�εĺ�ʱ
t_list = [ones(1,n_acc1)*3*t_min, ones(1,n_acc2)*2*t_min, ones(1,n_keep)*t_min, ones(1,n_acc2)*2*t_min, ones(1,n_acc1)*4*t_min];

% �����ܺ�ʱ
t_sum = n_acc1*2*3*t_min + n_acc2*2*2*t_min + n_keep*t_min;
end

