clc;
clear;
cla;

global Sphr;
global Link;

create_DH_table();
random_generate_spheres_position_and_radius();

Variable_start_f = [0, 0, 40, 70, 0, -20, 0] ;


%%  机械臂初始状态
draw_all(Variable_start_f,0);
view(134,12);
pause;

count = 0;

while size(Sphr, 2) ~= 0
    
    draw_all(Variable_start_f,0);
    sphr = (Sphr(1:3, 1))';    %取第一个球
    
    IK_Variable_start = Variable_start_f;   % 数值法求逆解的起点，有可能从原始起点找到的逆解在RRT中无解，所以单独设个变量，不行就给它加点随机
    Variable_target_f = IK_num_solu(IK_Variable_start, sphr);      %传入目标点和当前位置求数值解，并将更新后的末端位置返回保存起来，作为下一次的输入
    
    % 判断逆解是否是可行点
    set_variable_in_DH_table(Variable_target_f);
    FK_calculate_joint_matrix_in_world();
    if ~(feasiblePoint() || count >= 5) 
        count = count+1;
        IK_Variable_start(1) = IK_Variable_start(1) + (rand*2-1)*500; 
        fprintf('逆解不可行，重来！')
        continue; 
    end
    
    [path_f, pathFound] = get_RRT_path_in_joint_space(Variable_start_f, Variable_target_f, 0);
    
    if pathFound
        % 把球放框里
        Variable_start_b = Variable_target_f;
        Variable_target_b = [Variable_target_f(1), 0, 40, 70, 0, -20, 0];
        [path_b, pathFound] = get_RRT_path_in_joint_space(Variable_start_b, Variable_target_b, 0);
            if pathFound
                path_f = trajectory_plan(path_f);
                path_b = trajectory_plan(path_b);
                
                for cont = 1:size(path_f, 1)
                    draw_all(path_f(cont, :), 1);
                end
                
                for cont = 1:size(path_b, 1)      
                    set_variable_in_DH_table(path_b(cont, :));
                    FK_calculate_joint_matrix_in_world();   
                    Sphr(1:3,1) = Link(8).A(1:3, 4);

                    draw_all(path_b(cont, :), 1);
                end
                Sphr(:,1) = [];     %删除第一个球，第二个球成为第一个
                Variable_start_f = Variable_target_b;    %将更新后的末端位置作为下一次的输入
                count = 0;   %逆解计算器归零
            else
                fprintf('这个球暂时捡不到，先捡下一个球，最后捡这个球');
                sphr = Sphr(:, 1);
                Sphr(:,1) = [];
                Sphr = [Sphr,sphr];
                count = 0;   %逆解计算器归零
            end      
    else
        fprintf('这个球暂时捡不到，先捡下一个球，最后捡这个球');
        sphr = Sphr(:, 1);
        Sphr(:,1) = [];
        Sphr = [Sphr,sphr];
        count = 0;   %逆解计算器归零
    end
end

draw_all(path_b(size(path_b, 1), :), 0);