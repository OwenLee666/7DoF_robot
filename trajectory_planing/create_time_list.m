function [t_list, t_sum] = create_time_list(N, t_min)

% 测试
% clc;clear;
% N = 95;
% t_min = 0.0391;

num = N-1;

n_acc1 = floor(num * 0.2);    % 加减速段数量
n_acc2 = floor(num * 0.1);    % 加减速段数量
n_keep = floor(num * 0.4);    % 匀速段数量

% 保证时间段有N-1段
while num ~= 2*n_acc1 + 2*n_acc2 + n_keep
    n_keep = n_keep + 1;
end

% 构造时间数组，表示每一小段的耗时
t_list = [ones(1,n_acc1)*3*t_min, ones(1,n_acc2)*2*t_min, ones(1,n_keep)*t_min, ones(1,n_acc2)*2*t_min, ones(1,n_acc1)*4*t_min];

% 计算总耗时
t_sum = n_acc1*2*3*t_min + n_acc2*2*2*t_min + n_keep*t_min;
end

