%%
%   ����˵������ֱ�����������㣬�������ӹؽڵ㣬������ϵ���õ�
%   ���룺    point1, point2, ��ɫ�� �ߴ�
%   �����    ��
%   ע�����
%   ToDo��
%%

function draw_line_by_two_point(p1,p2,option,pt)

h = plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],option);
set(h,'LineWidth',pt)

end