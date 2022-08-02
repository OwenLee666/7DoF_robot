%%
%   函数说明：画出太空舱
%   输入：    无 
%   输出：    无
%   注意事项：
%   ToDo：    代码比较乱，有时间的时候整理一下
%%

function draw_cylinder_as_capsule()

[x,y,z]=cylinder(1000,20);%生成标准的100个面的圆柱数据，半径为r，高为1，底面圆心0，0；

z1=[z(1,:);z(2,:)+4000-1];%圆柱高增高，变为高h

%为变成实心封顶添加数据

z2=[z(1,:);z1;z1(2,:)];

x2=[zeros(1,20+1);x;zeros(1,20+1)];

y2=[zeros(1,20+1);y;zeros(1,20+1)];

z3=[z1(1,:);z1(1,:)];

x3=[x(1,:);x(1,:)];

y3=[y(1,:);y(1,:)];

z4=[z1(2,:);z1(2,:)];

surf(x2,z2,y2,'LineStyle','none');

map=jet(16);

cl=4;%可设置16种颜色(1-16)

map1=map(cl,:);

colormap(map1);

hold on;

surf(x3,z3,y3);

surf(x3,z4,y3);

alpha(.1)%调节透明度(0-1)

axis equal;

end