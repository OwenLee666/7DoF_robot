clc;
clear;
cla;

create_DH_table();
random_generate_spheres_position_and_radius();

global Sphr;
Variable = [0, 0, 0, 0, 0, 0, 0]' ;

%%  ��е�۳�ʼ״̬
draw_all(Variable,0);
view(134,12);
pause;

for i =1:10

    sphr = Sphr(1:3, 1);    %ȡ��һ����

    if sphr(2) - Variable(1) > 1000             %�ѻ�е�����ƶ���Ŀ��㸽��
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

    Variable_solu = IK_num_solu_only_position(sphr, Variable);      %����Ŀ���͵�ǰλ������ֵ�⣬�������º��ĩ��λ�÷��ر�����������Ϊ��һ�ε�����
    Sphr(:,1) = [];     %ɾ����һ���򣬵ڶ������Ϊ��һ��
    Variable = Variable_solu;    %����Ŀ���͵�ǰλ������ֵ�⣬�������º��ĩ��λ�÷��ر�����������Ϊ��һ�ε�����
end
