%%
%   ����˵��������̫�ղ������
%   ���룺    �� ����ȫ�ֱ���������λ����뾶
%   �����    ��
%   ע�����
%   ToDo��    
%%

function draw_spheres()

global Sphr

for i = 1 : size(Sphr, 2)
    px = Sphr(1, i);
    py = Sphr(2, i);
    pz = Sphr(3, i);
    radius = Sphr(4, i);
    [X, Y, Z] = sphere;
    X = X*radius + px;
    Y = Y*radius + py;
    Z = Z*radius + pz;
    if i == 1
        surf(X, Y, Z);
    else
    surf(X, Y, Z, 'LineStyle','none');
    end
end
    
end
    