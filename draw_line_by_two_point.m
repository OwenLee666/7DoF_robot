%%
%   函数说明：用直线连接两个点，将在连接关节点，画坐标系中用到
%   输入：    point1, point2, 颜色， 线粗
%   输出：    无
%   注意事项：
%   ToDo：
%%

function draw_line_by_two_point(p1,p2,option,pt)

h = plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],option);
set(h,'LineWidth',pt)

end