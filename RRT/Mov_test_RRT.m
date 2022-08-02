clc;
clear;
cla;

global Sphr;
global Link;

create_DH_table();
random_generate_spheres_position_and_radius();

Variable_start = [0, 0, 50, 70, 0, -20, 0] ;


%%  ��е�۳�ʼ״̬
draw_all(Variable_start,0);
view(134,12);
pause;
 
while size(Sphr, 2) ~= 0

    sphr = (Sphr(1:3, 1))';    %ȡ��һ����

%     if sphr(2) - Variable_start(1) > 800             %�ѻ�е�����ƶ���Ŀ��㸽��
%         for j = Variable_start(1):50:(sphr(2)-600)
%             Variable_start(1) = j;
%             draw_all(Variable_start,j);123321
%         end
%     elseif Variable_start(1) - sphr(2)  > 800
%         for j = Variable_start(1):-50:(sphr(2)+600)
%             Variable_start(1) = j;
%              draw_all(Variable_start,1);
%         end
%     end
%     draw_all(Variable_start,0);    % ���һ֡��ˢ���ˣ����»�һ��

    Variable_target = IK_num_solu(Variable_start, sphr);      %����Ŀ���͵�ǰλ������ֵ�⣬�������º��ĩ��λ�÷��ر�����������Ϊ��һ�ε�����
    [path, pathFound] = get_RRT_path_in_joint_space(Variable_start, Variable_target, 0);
    path(:,8:10) = [];
    if pathFound
        for cont = 1:size(path, 1)
            draw_all(path(cont, 1:7), 1);
        end

        % ����ſ���
        Variable_start = Variable_target;
        Variable_target = [Variable_target(1), 0, 50, 70, 0, -20, 0];
        [path, pathFound] = get_RRT_path_in_joint_space(Variable_start, Variable_target, 0);
        path(:,8:10) = [];
        for cont = 1:size(path, 1)      
            set_variable_in_DH_table(path(cont, 1:7));
            FK_calculate_joint_matrix_in_world();   
            Sphr(1:3,1) = Link(8).A(1:3, 4);

            draw_all(path(cont, 1:7), 1);
        end
        Sphr(:,1) = [];     %ɾ����һ���򣬵ڶ������Ϊ��һ��
        Variable_start = Variable_target;    %�����º��ĩ��λ����Ϊ��һ�ε�����
    end
end
