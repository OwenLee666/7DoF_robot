function Path_t = trajectory_plan(path)

N = size(path,1);    %RRT的路径有多少个点
t_min = calculate_min_time(path);
[t_list, t_sum] = create_time_list_by_2poly(N, t_min);
T = create_time_matrix(N, t_list);
Theta_matrix = create_theta_matrix(path);

A = T \ Theta_matrix;

fprintf('\n\n%f\n\n', t_sum);
switch ceil(t_sum)
    case 1
        step_time = 0.05;  % 多长时间打一个点
    case 2
        step_time = 0.1;    
    case 3
        step_time = 0.15;
    otherwise
        step_time = 0.2;
end
        
Path_t = [];
Speed_t = [];
Acc_t = [];
for t = 0:step_time:t_sum
    [index, t_inPoly] = in_which_poly(t,t_list);
    path_t = [];
    speed_t = [];
    acc_t = [];
    for i = 1:7
        thetai = A(index, i) + A(index+1, i)*t_inPoly + A(index+2, i)*t_inPoly^2 +A(index+3, i)*t_inPoly^3;
        speedi = A(index+1, i) + A(index+2, i)*t_inPoly +A(index+3, i)*t_inPoly^2;
        acci   = A(index+2, i) +A(index+3, i)*t_inPoly;
        
        path_t =[path_t, thetai];
        speed_t = [speed_t, speedi];
        acc_t = [acc_t, acci];
    end
    Path_t = [Path_t; path_t];
    Speed_t = [Speed_t; speed_t];
    Acc_t = [Acc_t; acc_t];
end

Path_t = [Path_t; path(N, :)];
end

