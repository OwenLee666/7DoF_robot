%%
%   ����˵�������˶�ѧ�����������ϵ����������ϵ�е�λ��
%   ���룺    �ޣ���ȫ�ֱ���Link��ȡ������Ϣ
%   �����    �ޣ��洢Ϊȫ�ֱ���Link
%   ע�����
%   ToDo��    
%%

function FK_calculate_joint_matrix_in_world()

global Link
create_matrixs_by_DH_table();

for i = 2:8
    
      Link(i).A=Link(i-1).A*Link(i).A;  %��ø�������ϵ��ȫ������ϵ���λ��
   
end

end