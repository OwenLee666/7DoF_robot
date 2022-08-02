function [index, t_inPoly] = in_which_poly(t,t_list)

% ²âÊÔ
% clear;clc;
% t = 17.5;
% t_list = [2 2 1 1 1 1 1 1 2 2 ];

if t > sum(t_list),error('error: t > sum(t_list)'); end

num = size(t_list,2);
t_sum = 0;

index = 1;
t_inPoly = t;

for i = 1 : num
    t_sum = t_sum + t_list(i);
    if t > t_sum
        t_inPoly = t - t_sum;
        index = index + 4;
    else
        break;
    end
end

% ²âÊÔÊä³ö
% fprintf('index=%d,  t_inPoly=%f', index, t_inPoly);

end