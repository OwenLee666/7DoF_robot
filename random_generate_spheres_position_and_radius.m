%%
%   函数说明：随机生成球的位置与半径，考虑到会频繁调用与清楚处理，定义为全局变量
%   输入：    无
%   输出：    无，存储为全局变量
%   注意事项：
%   ToDo：    
%%

function random_generate_spheres_position_and_radius()

clear;clc;
%把球的原点坐标与半径搞成全局变量，因为感觉在后面的很多地方需要用到
global Sphr
Sphr = [];

%% 随机生成10个球的参数，最后一个球必须离某一个球小于200mm
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

%% 将球的参数冒泡排序，从小到大，方便后续的抓取
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
            
            