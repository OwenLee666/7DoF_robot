%%
%   ����˵��������������λ����뾶�����ǵ���Ƶ�������������������Ϊȫ�ֱ���
%   ���룺    ��
%   �����    �ޣ��洢Ϊȫ�ֱ���
%   ע�����
%   ToDo��    
%%

function random_generate_spheres_position_and_radius()

clear;clc;
%�����ԭ��������뾶���ȫ�ֱ�������Ϊ�о��ں���ĺܶ�ط���Ҫ�õ�
global Sphr
Sphr = [];

%% �������10����Ĳ��������һ���������ĳһ����С��200mm
r = randi(950);
theta = rand * pi * 2;
x = r * cos(theta);
y = randi(3900) + 50;
z = r * sin(theta);
radius = rand*25 + 25;

Sphr = [x; y; z; radius];
while size(Sphr, 2) < 10
    
    r = randi(950);
    theta = rand * pi * 2;
    x = r * cos(theta);
    y = randi(2800) + 1000;
    z = r * sin(theta);
    radius = rand*25 + 25;
%     radius = 100;
    
    if size(Sphr, 2) < 9
        pnt = [x, y, z, radius]';
        Sphr = [Sphr, pnt];
    else
        for i = 1:size(Sphr, 2)
            dis = ((x-Sphr(1, i))^2 + (y-Sphr(2, i))^2 + (z-Sphr(3, i))^2)^(1/2);
            if 50 <= dis && dis <= 500
                pnt = [x, y, z, radius]';
                Sphr = [Sphr, pnt];
                break;
            end
        end
    end
end

%% ����Ĳ���ð�����򣬴�С���󣬷��������ץȡ
for i = 9:-1:2
    for j =1:i
        if Sphr(4,j) >  Sphr(4,j+1)
            temp = Sphr(4,j);
            Sphr(4,j) = Sphr(4,j+1);
            Sphr(4,j+1) = temp;
        end
    end
end

end
            
            