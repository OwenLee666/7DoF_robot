function [path, pathFound] = get_RRT_path_in_joint_space(source, goal, display)

global Link;
global Sphr;

stepsize=10; % size of each step of the RRT
disTh=5; % nodes closer than this threshold are taken as almost the same
maxFailedAttempts = 200;
maxIterations = 200;
randfactor = 0.1;    % ������ӣ�ֵԽ������������Ŀ�����Խ��

%%%%% parameters end here %%%%%

set_variable_in_DH_table(source);
FK_calculate_joint_matrix_in_world();

%����RRT�������洢�ڵ��븸�ڵ�������-1���ڱ�,��ֱ������ϵ�е�λ��
RRTree=double([source, -1, (Link(8).A(1:3, 4))']); % RRT rooted at the source, representation node and parent index
failedAttempts=0;
iterations = 0;
counter=0;
pathFound=false;

%% ��ѭ��
while iterations <= maxIterations && failedAttempts<=maxFailedAttempts  % loop to grow RRTs
    % ����������
    if rand < randfactor
        sample=[rand*3600, rand(1,6).* 360-180]; % random sample
    else
        sample=goal; % sample taken as goal to bias tree generation to goal
    end
    
    % �ҳ����е���������������ĵ㣬A������Сֵ����С���룩��ûɶ�ã���I���������RRT���е��������ǳ���Ҫ
    [A, I]=min( distanceCost(RRTree(:,1:7),sample) ,[],1); % find closest as per the function in the metric node to the sample
    closestNode = RRTree(I(1),1:7);
    % �������ڷ�ڵ��������������������һ����
    newPoint = double(closestNode + stepsize * ((sample - closestNode)/norm(sample - closestNode)));
    
    % ����µ��Ƿ񳬳��ؽ��˶���Χ
%     if ~(newPoint(1) > 0 && newPoint(1) < 3600), continue; end
%     if ~(newPoint(2) > -180 && newPoint(2) < 180), continue; end
%     if ~(newPoint(3) > -180 && newPoint(3) < 180), continue; end
%     if ~(newPoint(4) > -180 && newPoint(4) < 180), continue; end
%     if ~(newPoint(5) > -180 && newPoint(5) < 180), continue; end
%     if ~(newPoint(6) > -180 && newPoint(6) < 180), continue; end
%     if ~(newPoint(7) > -180 && newPoint(7) < 180), continue; end
    
    % ����µ��Ƿ�Ϸ�
    set_variable_in_DH_table(newPoint);
    FK_calculate_joint_matrix_in_world();
    if ~feasiblePoint() % if extension of closest node in tree to the new point is feasible
        failedAttempts=failedAttempts+1;
        continue;
    end

    % ����µ���Ŀ����㹻��������ѭ��
    if distanceCost(newPoint,goal)<disTh, pathFound=true;break; end % goal reached
    
    % ����µ������е�ľ����Ƿ��С
    [A, I2]=min( distanceCost(RRTree(:,1:7),newPoint) ,[],1); % check if new node is not already pre-existing in the tree
    if A < disTh, failedAttempts=failedAttempts+1;continue; end 
    
    % ���µ�����ĸ��ڵ�����,��ֱ������ϵ�е�λ�ô洢��RRT����
    RRTree=[RRTree; newPoint, I(1), (Link(8).A(1:3, 4))']; % add node
    failedAttempts=0;
    
    % �ڴ����������µ�����ĸ��ڵ�
    if display
        draw_line_by_two_point(RRTree(I(1), 9:11),Link(8).A(1:3, 4),'r',1); hold on;
%         counter=counter+1;
%         M(counter)=getframe; % ���ɾ���˿��Լ���ļӿ��ٶȣ����ǾͿ�����ͼ����
    end
    
    iterations = iterations + 1;
    fprintf('%d\n',iterations);
end
%%

set_variable_in_DH_table(goal);
FK_calculate_joint_matrix_in_world();

% �ڴ����������µ�ĸ��ڵ���Ŀ��㣬��Ϊ�µ���Ŀ���ܽ�����������ѭ�����ڴ����������µ�ĸ��ڵ���Ŀ���
if display && pathFound 
    draw_line_by_two_point(RRTree(I(1), 9:11),Link(8).A(1:3, 4),'r',1); hold on;
%     counter=counter+1;M(counter)=getframe;
end

% ���ݸ��ڵ���������ҵ�ͨ·
path=[goal,(Link(8).A(1:3, 4))'];
prev=I(1);
while prev>0
    path=[RRTree(prev,1:7),RRTree(prev,9:11);path];
    prev=RRTree(prev,8);
end

%����ͨ·
for cont = 1:size(path, 1)-1
draw_line_by_two_point(path(cont, 8:10), path(cont+1, 8:10),'r',1); hold on;
end

path(:,8:10) = [];

end