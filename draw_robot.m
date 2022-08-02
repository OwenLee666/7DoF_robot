%%
%   ����˵����������е��
%   ���룺    ȫ�ֱ�����ȡ�����˹���
%   �����    ��
%   ע�����
%   ToDo��    
%%

function draw_robot()

global Link

%% ����е��
radius    = 30;
len       = 100;
joint_col = 0;

draw_line_by_two_point([0, 0, -1000],[0, 4000, -1000],'b',2); hold on;
for i=3:8
      draw_line_by_two_point(Link(i-1).A(1:3, 4),Link(i).A(1:3, 4),'b',2); hold on;
      draw_cylinder_as_joint(Link(i-1).A(1:3, 4), Link(i-1).A(1:3, 3), radius, len, joint_col); hold on;
end

%% ���ֲ�����ϵ
% draw_frame(Link(8).A(1:3, 1:3),Link(8).A(1:3,4)); 

end


