function T = create_time_matrix(N, t_list)

% 输入参数测试函数
% N = 11;
% t_list = [2  2  1  1  1  1  1  1  2  2];

n = N - 1;    % N个点，有N-1段
order = 4 * n;    % 矩阵的阶数

% 构造矩阵的前四列
t1 = t_list(1);
T1 =  [0      1      0      0;
       1      0      0      0;
       1      t1     t1^2   t1^3;
       0      1      2*t1   3*t1^2;
       0      0      2      6*t1];
T1_zero = zeros(order-5, 4);
T1 = [T1; T1_zero];

T = [T1];

% 构造矩阵中间的部分
for i = 2 : n-1
    ti = t_list(i);
    Ti_zero_top = zeros(3+4*(i-2), 4);
    Ti_zero_under = zeros(order - 9 - 4*(i - 2), 4);
    Ti = [0     -1      0      0;
          0      0     -1      0
          1      0      0      0;
          1      ti     ti^2   ti^3;
          0      1      2*ti   3*ti^2;
          0      0      2      6*ti];
    Ti = [Ti_zero_top; Ti; Ti_zero_under];
    T = [T, Ti];
end

% 构造矩阵的后四列
tn = t_list(n);
Tn =  [0     -1      0      0;
       0      0     -1      0
       1      0      0      0;
       1      tn     tn^2   tn^3;
       0      1      2*tn   3*tn^2;];
Tn_zero = zeros(order-5, 4);
Tn = [Tn_zero; Tn];
T = [T, Tn];

end

