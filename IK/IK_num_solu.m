%%
%   ����˵��������ֵ�������
%   ���룺    ���Ĺؽڱ����� Ŀ�����ֱ������ϵ�����꣨����Ҫ��̬��
%   �����    �����Ŀ���Ĺؽڱ���
%   ע��������ڼ�����ԣ���̬������Ҫ�����԰���ʡ�ԣ��������ô���1.��������С��2.ǿ�и�����̬���û����˵���̬���ѿ�����������ֵ�ⷨ�����Լ���һ�������ʵ���̬
%   ToDo��   
%%

function q = IK_num_solu(q_start, pref)

global Link
lamda = 1;%��Χ��0,1�� 0.5

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
    perr = pref'-p;%����λ�����perr
    err = norm(perr);

    if err <= 1
       fprintf(' iteration number: %d, final err: %f, duration:%f \n', count, err, toc);
       fprintf('d1:%f��  th2:%f��  th3:%f��  th4:%f��  th5:%f��  th6:%f��  th7:%f \n',q(:));
       break
    end

    J = Creat_Jacobian_only_position();
    deta_q = lamda*pinv(J)*perr;
    q = q + deta_q;

end

q = q';     % Ϊ��ֹ���ң��ӿڴ�ͳһ����������
q = adjust_variable(q);
fprintf('d1:%f��  th2:%f��  th3:%f��  th4:%f��  th5:%f��  th6:%f��  th7:%f \n',q(:));

end

    