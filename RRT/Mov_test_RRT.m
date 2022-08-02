clc;
clear;
cla;

global Sphr;
global Link;

create_DH_table();
random_generate_spheres_position_and_radius();

Variable_start = [0, 0, 50, 70, 0, -20, 0] ;


%%  机械臂初始状态
draw_all(Variable_start,0);
view(134,12);
pause;
 
while size(Sphr, 2) ~= 0

    sphr = (Sphr(1:3, 1))';    %取第一个球

%     if sphr(2) - Variable_start(1) > 800             %把机械臂先移动到目标点附近
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
%     draw_all(Variable_start,0);    % 最后一帧被刷掉了，重新画一次

    Variable_target = IK_num_solu(Variable_start, sphr);      %传入目标点和当前位置求数值解，并将更新后的末端位置返回保存起来，作为下一次的输入
    [path, pathFound] = get_RRT_path_in_joint_space(Variable_start, Variable_target, 0);
    path(:,8:10) = [];
    if pathFound
        for cont = 1:size(path, 1)
            draw_all(path(cont, 1:7), 1);
        end

        % 把球放框里
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
        Sphr(:,1) = [];     %删除第一个球，第二个球成为第一个
        Variable_start = Variable_target;    %将更新后的末端位置作为下一次的输入
    end
end
