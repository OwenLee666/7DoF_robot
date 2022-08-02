%%
%   函数说明：用数值法求逆解
%   输入：    起点的关节变量， 目标点在直角坐标系的坐标（不需要姿态）
%   输出：    求出的目标点的关节变量
%   注意事项：对于捡球而言，姿态并不重要，所以把它省略，有两个好处：1.计算量变小。2.强行给个姿态会让机器人的姿态很难看，而不给数值解法可以自己找一个最舒适的姿态
%   ToDo：   
%%

function q = IK_num_solu(q_start, pref)

global Link
lamda = 1;%范围（0,1） 0.5

q = q_start';
ilimit=2000;

tic

for count=1:ilimit
    
    set_variable_in_DH_table(q);
    FK_calculate_joint_matrix_in_world(); 
 
    if count >= ilimit
        fprintf('iteration number %d final err %f \n',count,err);
        break
    end
    
    p=Link(8).A(1:3,4);
    perr = pref'-p;%计算位置误差perr
    err = norm(perr);

    if err <= 1
       fprintf(' iteration number: %d, final err: %f, duration:%f \n', count, err, toc);
       fprintf('d1:%f，  th2:%f，  th3:%f，  th4:%f，  th5:%f，  th6:%f，  th7:%f \n',q(:));
       break
    end

    J = Creat_Jacobian_only_position();
    deta_q = lamda*pinv(J)*perr;
    q = q + deta_q;

end

q = q';     % 为防止混乱，接口处统一传输行向量
q = adjust_variable(q);
fprintf('d1:%f，  th2:%f，  th3:%f，  th4:%f，  th5:%f，  th6:%f，  th7:%f \n',q(:));

end

    