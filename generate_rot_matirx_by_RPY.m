%%
%   ����˵����ͨ��RPY��������̬����
%   ���룺    �����ǣ�ƫ���ǣ�������
%   �����    ��̬����
%   ע�����
%   ToDo��    
%%
function rot = generate_rot_matirx_by_RPY(roll,pitch,yaw)

Cphi = cosd(roll);  Sphi = sind(roll);
Cthe = cosd(pitch); Sthe = sind(pitch);
Cpsi = cosd(yaw);   Spsi = sind(yaw);

rot = [Cpsi*Cthe  -Spsi*Cphi+Cpsi*Sthe*Sphi  Spsi*Sphi+Cpsi*Sthe*Cphi;
       Spsi*Cthe  Cpsi*Cphi+Spsi*Sthe*Sphi   -Cpsi*Sphi+Spsi*Sthe*Cphi;
       -Sthe      Cthe*Sphi                  Cthe*Cphi                 ];
   
end