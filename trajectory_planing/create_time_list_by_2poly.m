function [t_list, t_sum] = create_time_list_by_2poly(N, t_min)

% ²âÊÔ
% clc;clear;
% N = 95;
% t_min = 0.0391;

N = N-1;   % Ê±¼ä¶Î
amp = 2;

A = [1   N/2   (N^2)/4;
     0   1      N;
     1   N/2   (N^2)/3];
Y = [t_min; 0; amp*t_min];
parameter = inv(A)*Y;

t = 1:N;
t_list = parameter(1) + parameter(2)*power(t,1) + parameter(3)*power(t,2);

t_sum = sum(t_list);

end

