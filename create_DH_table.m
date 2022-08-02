%%
%   函数说明：调用此函数将建立DH参数表，DH参数表将会被频繁调用，所以定义为全局变量
%   输入：    无 
%   输出：    无，但是Link被声明为全局变量，可以在函数外被调用。
%   注意事项：由于World To Base占用了Link（1），所以Link（i）实际上代表的是i-1号关节
%   ToDo：
%%

function create_DH_table()

global Link;
UZ = [0 0 1]';

Link    = struct('name', 'Body' , 'th', 0,   'dz', 0,      'dx', 0,    'alf', 90,    'az', UZ);         
Link(1) = struct('name', 'Base',  'th', 0,   'dz', -1000,  'dx', 0,    'alf', -90,   'az', UZ);        %World To 0(Base),这个是固定不动的
Link(2) = struct('name', 'J1',    'th', 0,   'dz', 0,      'dx', 0,    'alf', 90,    'az', UZ);        %0 To 1
Link(3) = struct('name', 'J2',    'th', 0,   'dz', 580,    'dx', 0,    'alf', -90,   'az', UZ);        %1 To 2
Link(4) = struct('name', 'J3',    'th', 0,   'dz', 0,      'dx', 540,  'alf', 0,     'az', UZ);        %2 To 3
Link(5) = struct('name', 'J4',    'th', 0,   'dz', 0,      'dx', 140,  'alf', -90,   'az', UZ);        %3 To 4   
Link(6) = struct('name', 'J5',    'th', 0,   'dz', 604,    'dx', 0,    'alf', 90,    'az', UZ);        %4 To 5
Link(7) = struct('name', 'J6',    'th', 0,   'dz', 0,      'dx', 0,    'alf', -90,   'az', UZ);        %5 To 6
Link(8) = struct('name', 'J7',    'th', 0,   'dz', 300,    'dx', 0,    'alf', 0,     'az', UZ);        %6 To 7（Hand）

end

