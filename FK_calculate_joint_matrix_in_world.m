%%
%   函数说明：正运动学计算各级坐标系在世界坐标系中的位姿
%   输入：    无，从全局变量Link获取计算信息
%   输出：    无，存储为全局变量Link
%   注意事项：
%   ToDo：    
%%

function FK_calculate_joint_matrix_in_world()

global Link
create_matrixs_by_DH_table();

for i = 2:8
    
      Link(i).A=Link(i-1).A*Link(i).A;  %获得各级坐标系在全局坐标系里的位姿
   
end

end