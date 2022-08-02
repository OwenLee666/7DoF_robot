function Theta_matrix = create_theta_matrix(path)

% ���Ե�������
% path = [1,2,3; 2,3,4; 3,4,5; 4,5,6];

[row, clu] = size(path);
Theta_matrix =[];

% ѭ������7�Ц���ÿһ�ж�Ӧһ���ؽڱ���
for i = 1 : clu
    thetai_matrix = [0];    % ����ٶ�Ϊ��
    for j = 1 : row-2
        thetai_matrix = [thetai_matrix; path(j,i); path(j+1,i); 0; 0];
    end
    thetai_matrix = [thetai_matrix; path(row-1,i); path(row,i); 0];   % �յ��ٶ�Ϊ��
    Theta_matrix = [Theta_matrix,thetai_matrix];
end

end

