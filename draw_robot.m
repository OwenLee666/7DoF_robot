%%
%   函数说明：画出机械臂
%   输入：    全局变量获取机器人构型
%   输出：    无
%   注意事项：
%   ToDo：    
%%

function draw_robot()

global Link

%% 画机械臂
radius    = 30;
len       = 100;
joint_col = 0;

draw_line_by_two_point([0, 0, -1000],[0, 4000, -1000],'b',2); hold on;
for i=3:8
      draw_line_by_two_point(Link(i-1).A(1:3, 4),Link(i).A(1:3, 4),'b',2); hold on;
      draw_cylinder_as_joint(Link(i-1).A(1:3, 4), Link(i-1).A(1:3, 3), radius, len, joint_col); hold on;
end

%% 画手部坐标系
% draw_frame(Link(8).A(1:3, 1:3),Link(8).A(1:3,4)); 

end


