%%
%   ����˵�������ô˺���������DH������DH�������ᱻƵ�����ã����Զ���Ϊȫ�ֱ���
%   ���룺    �� 
%   �����    �ޣ�����Link������Ϊȫ�ֱ����������ں����ⱻ���á�
%   ע���������World To Baseռ����Link��1��������Link��i��ʵ���ϴ������i-1�Źؽ�
%   ToDo��
%%

function create_DH_table()

global Link;
UZ = [0 0 1]';

Link    = struct('name', 'Body' , 'th', 0,   'dz', 0,      'dx', 0,    'alf', 90,    'az', UZ);         
Link(1) = struct('name', 'Base',  'th', 0,   'dz', -1000,  'dx', 0,    'alf', -90,   'az', UZ);        %World To 0(Base),����ǹ̶�������
Link(2) = struct('name', 'J1',    'th', 0,   'dz', 0,      'dx', 0,    'alf', 90,    'az', UZ);        %0 To 1
Link(3) = struct('name', 'J2',    'th', 0,   'dz', 580,    'dx', 0,    'alf', -90,   'az', UZ);        %1 To 2
Link(4) = struct('name', 'J3',    'th', 0,   'dz', 0,      'dx', 540,  'alf', 0,     'az', UZ);        %2 To 3
Link(5) = struct('name', 'J4',    'th', 0,   'dz', 0,      'dx', 140,  'alf', -90,   'az', UZ);        %3 To 4   
Link(6) = struct('name', 'J5',    'th', 0,   'dz', 604,    'dx', 0,    'alf', 90,    'az', UZ);        %4 To 5
Link(7) = struct('name', 'J6',    'th', 0,   'dz', 0,      'dx', 0,    'alf', -90,   'az', UZ);        %5 To 6
Link(8) = struct('name', 'J7',    'th', 0,   'dz', 300,    'dx', 0,    'alf', 0,     'az', UZ);        %6 To 7��Hand��

end

