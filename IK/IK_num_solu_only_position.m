function q=IK_num_solu_only_position(pref,q_start)%数值解函数

global Link
lamda=1;%范围（0,1） 0.5

q=q_start';

ilimit=2000;

for count=1:ilimit
%     DrawFrame(Rref,pref);     
 
    if count >= ilimit
        fprintf('iteration number %d final err %f \n',count,err);
        break
    end
    
    p=Link(8).A(1:3,4);
    perr=pref'-p;%计算位置误差perr

    err=norm(perr);


    if err<=1
       fprintf(' iteration number %d final err %f \n',count,err);
       fprintf('%f，%f，%f，%f，%f，%f，%f',q(:));
      break
    end

    J=Creat_Jacobian_only_position();
    deta_q=lamda*pinv(J)*perr;
    q=q+deta_q;

   draw_all(q,1);
end

q = q';
end

    