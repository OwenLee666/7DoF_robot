%%
%   函数说明：画出所有物体（太空舱，球，机械臂）
%   输入：    机械臂关节变量
%   输出：    无
%   注意事项：
%   ToDo：    
%%

function draw_all(Variable,fcla)

set_variable_in_DH_table(Variable);
FK_calculate_joint_matrix_in_world();

draw_cylinder_as_capsule();
draw_spheres();
draw_robot();
draw_box();
plot3(0,0,0,'ro');  %画出原点

%% 画图设置
grid on;
% view(134,12);
axis([-1500,1500,-500,5000,-1500,1500]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
% pic=getframe;
if(fcla)
    cla;
end

end


