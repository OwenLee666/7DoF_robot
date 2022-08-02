function [path, pathFound] = get_RRT_path_in_joint_space(source, goal, display)

global Link;
global Sphr;

stepsize=10; % size of each step of the RRT
disTh=5; % nodes closer than this threshold are taken as almost the same
maxFailedAttempts = 200;
maxIterations = 200;
randfactor = 0.1;    % 随机因子，值越大样本点随机的可能性越大

%%%%% parameters end here %%%%%

set_variable_in_DH_table(source);
FK_calculate_joint_matrix_in_world();

%创建RRT树用来存储节点与父节点索引，-1是哨兵,在直角坐标系中的位置
RRTree=double([source, -1, (Link(8).A(1:3, 4))']); % RRT rooted at the source, representation node and parent index
failedAttempts=0;
iterations = 0;
counter=0;
pathFound=false;

%% 主循环
while iterations <= maxIterations && failedAttempts<=maxFailedAttempts  % loop to grow RRTs
    % 生成样本点
    if rand < randfactor
        sample=[rand*3600, rand(1,6).* 360-180]; % random sample
    else
        sample=goal; % sample taken as goal to bias tree generation to goal
    end
    
    % 找出所有点中与样本点最近的点，A是列最小值（最小距离）（没啥用），I是最近点在RRT树中的索引，非常重要
    [A, I]=min( distanceCost(RRTree(:,1:7),sample) ,[],1); % find closest as per the function in the metric node to the sample
    closestNode = RRTree(I(1),1:7);
    % 按步长在夫节点与样本点的连线上生成一个点
    newPoint = double(closestNode + stepsize * ((sample - closestNode)/norm(sample - closestNode)));
    
    % 检查新点是否超出关节运动范围
%     if ~(newPoint(1) > 0 && newPoint(1) < 3600), continue; end
%     if ~(newPoint(2) > -180 && newPoint(2) < 180), continue; end
%     if ~(newPoint(3) > -180 && newPoint(3) < 180), continue; end
%     if ~(newPoint(4) > -180 && newPoint(4) < 180), continue; end
%     if ~(newPoint(5) > -180 && newPoint(5) < 180), continue; end
%     if ~(newPoint(6) > -180 && newPoint(6) < 180), continue; end
%     if ~(newPoint(7) > -180 && newPoint(7) < 180), continue; end
    
    % 检查新点是否合法
    set_variable_in_DH_table(newPoint);
    FK_calculate_joint_matrix_in_world();
    if ~feasiblePoint() % if extension of closest node in tree to the new point is feasible
        failedAttempts=failedAttempts+1;
        continue;
    end

    % 如果新点与目标点足够近，跳出循环
    if distanceCost(newPoint,goal)<disTh, pathFound=true;break; end % goal reached
    
    % 检查新点与所有点的距离是否过小
    [A, I2]=min( distanceCost(RRTree(:,1:7),newPoint) ,[],1); % check if new node is not already pre-existing in the tree
    if A < disTh, failedAttempts=failedAttempts+1;continue; end 
    
    % 将新点和它的父节点索引,在直角坐标系中的位置存储到RRT树中
    RRTree=[RRTree; newPoint, I(1), (Link(8).A(1:3, 4))']; % add node
    failedAttempts=0;
    
    % 在窗口中连接新点和它的父节点
    if display
        draw_line_by_two_point(RRTree(I(1), 9:11),Link(8).A(1:3, 4),'r',1); hold on;
%         counter=counter+1;
%         M(counter)=getframe; % 这个删除了可以极大的加快速度，但是就看不到图像了
    end
    
    iterations = iterations + 1;
    fprintf('%d\n',iterations);
end
%%

set_variable_in_DH_table(goal);
FK_calculate_joint_matrix_in_world();

% 在窗口中连接新点的父节点与目标点，因为新点离目标点很近，所以跳出循环，在窗口中连接新点的父节点与目标点
if display && pathFound 
    draw_line_by_two_point(RRTree(I(1), 9:11),Link(8).A(1:3, 4),'r',1); hold on;
%     counter=counter+1;M(counter)=getframe;
end

% 根据父节点的索引，找到通路
path=[goal,(Link(8).A(1:3, 4))'];
prev=I(1);
while prev>0
    path=[RRTree(prev,1:7),RRTree(prev,9:11);path];
    prev=RRTree(prev,8);
end

%画出通路
for cont = 1:size(path, 1)-1
draw_line_by_two_point(path(cont, 8:10), path(cont+1, 8:10),'r',1); hold on;
end

path(:,8:10) = [];

end