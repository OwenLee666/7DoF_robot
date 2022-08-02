%%
%   函数说明：画出用圆柱体表示的关节
%   输入：    起点， 方向， 半径， 长度， 颜色
%   输出：    无
%   注意事项：
%   ToDo：    这是老师给的代码，比较复杂，用draw_cylinder_as_capsule的代码重写
%%

function draw_cylinder_as_joint(pos, az, radius,len, col) % 完全没看懂这个函数，先不管了，直接用
% draw closed cylinder
%
%******** rotation matrix
az0 = [0;0;1];
ax  = cross(az0,az);
ax_n = norm(ax);
if ax_n < eps   %eps是一个大于零但是接近零的数，意思是上面两个叉乘的向量快重合了
	rot = eye(3);
else
    ax = ax/ax_n;
    ay = cross(az,ax);
    ay = ay/norm(ay);
    rot = [ax ay az];
end

%********** make cylinder
% col = [0 0.5 0];  % cylinder color

a = 20;    % number of side faces
theta = (0:a)/a * 2*pi;

x = [radius; radius]* cos(theta);
y = [radius; radius] * sin(theta);
z = [len/2; -len/2] * ones(1,a+1);
cc = col*ones(size(x));

for n=1:size(x,1)
   xyz = [x(n,:);y(n,:);z(n,:)];
   xyz2 = rot * xyz;
   x2(n,:) = xyz2(1,:);
   y2(n,:) = xyz2(2,:);
   z2(n,:) = xyz2(3,:);
end

%************* draw
% side faces
surf(x2+pos(1),y2+pos(2),z2+pos(3),cc);

for n=1:2
	patch(x2(n,:)+pos(1),y2(n,:)+pos(2),z2(n,:)+pos(3),cc(n,:));
    
end	