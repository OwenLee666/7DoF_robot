%%
%   函数说明：通过RPY角生成姿态矩阵
%   输入：    翻滚角，偏航角，俯仰角
%   输出：    姿态矩阵
%   注意事项：
%   ToDo：    
%%
function rot = generate_rot_matirx_by_RPY(roll,pitch,yaw)

Cphi = cosd(roll);  Sphi = sind(roll);
Cthe = cosd(pitch); Sthe = sind(pitch);
Cpsi = cosd(yaw);   Spsi = sind(yaw);

rot = [Cpsi*Cthe  -Spsi*Cphi+Cpsi*Sthe*Sphi  Spsi*Sphi+Cpsi*Sthe*Cphi;
       Spsi*Cthe  Cpsi*Cphi+Spsi*Sthe*Sphi   -Cpsi*Sphi+Spsi*Sthe*Cphi;
       -Sthe      Cthe*Sphi                  Cthe*Cphi                 ];
   
end