%%
%   ����˵����������������ϵ���ֲ�����ϵ
%   ���룺    �ֲ�����̬������λ��
%   �����    ��
%   ע�����
%   ToDo��
%%

function draw_frame(oR, op)

axislen=150;
%% ����������˵�
px=[axislen,0,0]';
py=[0,axislen,0]';
pz=[0,0,axislen]';

px=oR*px+op;
py=oR*py+op;
pz=oR*pz+op;

%% ���ù̶��ο�������˵�
wx=[axislen,0,0]';
wy=[0,axislen,0]';
wz=[0,0,axislen]';
wo=[0,0,0]';

% %���ƹ̶��ο�����ϵ
draw_line_by_two_point(wo,wx,'r',3); hold on;
draw_line_by_two_point(wo,wy,'k',3); hold on;
draw_line_by_two_point(wo,wz,'g',3);hold on;
% plot3(wo(1),wo(2),wo(3),'rX');hold on;
% plot3(wo(1),wo(2),wo(3),'rO');hold on;

% %���ƾֲ�����ϵ
draw_line_by_two_point(op,px,'r',2); hold on;
draw_line_by_two_point(op,py,'k',2); hold on;
draw_line_by_two_point(op,pz,'g',2);hold on;

