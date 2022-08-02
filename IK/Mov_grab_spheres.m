clc;
clear;
cla;

create_DH_table();
random_generate_spheres_position_and_radius();

global Sphr;
Variable = [0, 0, 0, 0, 0, 0, 0]' ;

%%  机械臂初始状态
draw_all(Variable,0);
view(134,12);
pause;

for i =1:10

    sphr = Sphr(1:3, 1);    %取第一个球

    if sphr(2) - Variable(1) > 1000             %把机械臂先移动到目标点附近
        for j = Variable(1):30:(sphr(2)-800)
            Variable(1) = j;
            draw_all(Variable,1);
        end
    elseif Variable(1) - sphr(2)  > 1000
        for j = Variable(1):-30:(sphr(2)+800)
            Variable(1) = j;
             draw_all(Variable,1);
        end
    end

    Variable_solu = IK_num_solu_only_position(sphr, Variable);      %传入目标点和当前位置求数值解，并将更新后的末端位置返回保存起来，作为下一次的输入
    Sphr(:,1) = [];     %删除第一个球，第二个球成为第一个
    Variable = Variable_solu;    %传入目标点和当前位置求数值解，并将更新后的末端位置返回保存起来，作为下一次的输入
end
