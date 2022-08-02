%%
%   函数说明：修改DH表中的关节变量值
%   输入：    七个关节变量组成的矩阵，行列均可
%   输出：    无，写入到全局变量Link
%   注意事项：
%   ToDo：
%%

function set_variable_in_DH_table(Variable)

global Link

Link(2).dz = Variable(1) + 200; %给关节变量赋值
Link(3).th = Variable(2) + 90;
Link(4).th = Variable(3) - 90;
Link(5).th = Variable(4);
Link(6).th = Variable(5);
Link(7).th = Variable(6);
Link(8).th = Variable(7);
 
end