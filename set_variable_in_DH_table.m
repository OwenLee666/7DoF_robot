%%
%   ����˵�����޸�DH���еĹؽڱ���ֵ
%   ���룺    �߸��ؽڱ�����ɵľ������о���
%   �����    �ޣ�д�뵽ȫ�ֱ���Link
%   ע�����
%   ToDo��
%%

function set_variable_in_DH_table(Variable)

global Link

Link(2).dz = Variable(1) + 200; %���ؽڱ�����ֵ
Link(3).th = Variable(2) + 90;
Link(4).th = Variable(3) - 90;
Link(5).th = Variable(4);
Link(6).th = Variable(5);
Link(7).th = Variable(6);
Link(8).th = Variable(7);
 
end