function Theta_matrix = create_theta_matrix(path)

% 测试单个函数
% path = [1,2,3; 2,3,4; 3,4,5; 4,5,6];

[row, clu] = size(path);
Theta_matrix =[];

% 循环构造7列θ阵，每一列对应一个关节变量
for i = 1 : clu
    thetai_matrix = [0];    % 起点速度为零
    for j = 1 : row-2
        thetai_matrix = [thetai_matrix; path(j,i); path(j+1,i); 0; 0];
    end
    thetai_matrix = [thetai_matrix; path(row-1,i); path(row,i); 0];   % 终点速度为零
    Theta_matrix = [Theta_matrix,thetai_matrix];
end

end

