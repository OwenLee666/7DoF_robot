%%
%   函数说明：根据DH表建立坐标系相对于上一级坐标系的齐次变化矩阵
%   输入：    无，从全局变量Link获得DH参数
%   输出：    无, 计算结果输出到全局变量Link
%   注意事项：把这些矩阵理解为关节“之间的关系”最好，而不是代表某一关节，不然容易搞不清楚下标与关节。
%   ToDo：    n，o，a，R的信息已经存储在A中了，是否有必要再次存储？
%%

function create_matrixs_by_DH_table() 

global Link

for i = 1:8
    C=cosd(Link(i).th);  %获得关节的参数
    S=sind(Link(i).th);
    Ca=cosd(Link(i).alf);
    Sa=sind(Link(i).alf);
    dx=Link(i).dx;    %distance between zi and zi-1
    dz=Link(i).dz;    %distance between xi and xi-1

    n=[C,S,0,0]';   %构造齐次变换矩阵
    o=[-1*S*Ca,C*Ca,Sa,0]';
    a=[S*Sa, -1*C*Sa,Ca,0]';
    p=[dx*C,dx*S,dz,1]';
    
    Link(i).A=[n, o, a, p];    %存储位姿
end

end

%这个函数走完就将对应坐标系相对于上一级坐标系的位姿（齐次变换矩阵）存储进了全局变量里

