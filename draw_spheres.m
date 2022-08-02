%%
%   函数说明：画出太空舱里的球
%   输入：    无 ，从全局变量获得球的位置与半径
%   输出：    无
%   注意事项：
%   ToDo：    
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
    