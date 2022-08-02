%%
%   函数说明：绘制世界坐标系与手部坐标系
%   输入：    手部的姿态矩阵与位置
%   输出：    无
%   注意事项：
%   ToDo：
%%

function draw_frame(oR, op)

axislen=150;
%% 设置坐标轴端点
px=[axislen,0,0]';
py=[0,axislen,0]';
pz=[0,0,axislen]';

px=oR*px+op;
py=oR*py+op;
pz=oR*pz+op;

%% 设置固定参考坐标轴端点
wx=[axislen,0,0]';
wy=[0,axislen,0]';
wz=[0,0,axislen]';
wo=[0,0,0]';

% %绘制固定参考坐标系
draw_line_by_two_point(wo,wx,'r',3); hold on;
draw_line_by_two_point(wo,wy,'k',3); hold on;
draw_line_by_two_point(wo,wz,'g',3);hold on;
% plot3(wo(1),wo(2),wo(3),'rX');hold on;
% plot3(wo(1),wo(2),wo(3),'rO');hold on;

% %绘制局部坐标系
draw_line_by_two_point(op,px,'r',2); hold on;
draw_line_by_two_point(op,py,'k',2); hold on;
draw_line_by_two_point(op,pz,'g',2);hold on;

