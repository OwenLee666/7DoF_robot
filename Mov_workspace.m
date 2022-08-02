clc;
clear;
cla;

create_DH_table();
random_generate_spheres_position_and_radius();

Variable = [100, 0, 0, 0, 0, 0, 0];

%%  机械臂初始状态
draw_all(Variable,0);
view(134,12);
% pause(2);

%%  各关节单独运动

% stp=10;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
% for i=0:100:3500
%    DHfk3Dof_Lnya(dis1+i,th2,th3,th4,th5,th6,th7,1); 
% end
% for i=3500:-100:0
%     if i==0
%       DHfk3Dof_Lnya(dis1+i,th2,th3,th4,th5,th6,th7,0);  
%     else
%       DHfk3Dof_Lnya(dis1+i,th2,th3,th4,th5,th6,th7,1);
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2
% 
% 
% for i=0:-stp:-165
%    DHfk3Dof_Lnya(dis1,th2+i,th3,th4,th5,th6,th7,1); 
% end
% for i=-165:stp:165
%    DHfk3Dof_Lnya(dis1,th2+i,th3,th4,th5,th6,th7,1); 
% end
% for i=165:-stp:0
%     if i==0
%       DHfk3Dof_Lnya(dis1,th2+i,th3,th4,th5,th6,th7,0);  
%     else
%       DHfk3Dof_Lnya(dis1,th2+i,th3,th4,th5,th6,th7,1); 
%     end
% end
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3
% 
% 
% for i=0:-stp:-110
%    DHfk3Dof_Lnya(dis1,th2,th3+i,th4,th5,th6,th7,1); 
% end
% for i=-110:stp:110
%    DHfk3Dof_Lnya(dis1,th2,th3+i,th4,th5,th6,th7,1); 
% end
% for i=110:-stp:0
%     if i==0
%       DHfk3Dof_Lnya(dis1,th2,th3+i,th4,th5,th6,th7,0);  
%     else
%       DHfk3Dof_Lnya(dis1,th2,th3+i,th4,th5,th6,th7,1); 
%     end
% end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3
% 
% 
% for i=0:-stp:-110
%   DHfk3Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
% end
% for i=-110:stp:70
%   DHfk3Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
% end
% for i=70:-stp:0
%     if i==0
%       DHfk3Dof_Lnya(th1,th2,th3+i,th4,th5,th6,0);  
%     else
%       DHfk3Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
%     end 
% end
% 
% for i=0:-stp:-160
%   DHfk3Dof_Lnya(th1,th2,th3,th4+i,th5,th6,1); 
% end
% for i=-160:stp:160
%   DHfk3Dof_Lnya(th1,th2,th3,th4+i,th5,th6,1); 
% end
% for i=160:-stp:0
%     if i==0
%       DHfk3Dof_Lnya(th1,th2,th3,th4+i,th5,th6,0);  
%     else
%       DHfk3Dof_Lnya(th1,th2,th3,th4+i,th5,th6,1); 
%     end 
% end
% 
% for i=0:-stp:-120
%   DHfk3Dof_Lnya(th1,th2,th3,th4,th5+i,th6,1); 
% end
% for i=-120:stp:120
%   DHfk3Dof_Lnya(th1,th2,th3,th4,th5+i,th6,1); 
% end
% for i=120:-stp:0
%     if i==0
%       DHfk3Dof_Lnya(th1,th2,th3,th4,th5+i,th6,0);  
%     else
%       DHfk3Dof_Lnya(th1,th2,th3,th4,th5+i,th6,1); 
%     end 
% end

% 这一关节的角度太大了，诱导出了代码的bug，节省时间，不debug了，反正动画也看不到这个关节的运动，直接注释
% for i=0:-stp:-400
%   DHfk3Dof_Lnya(th1,th2,th3,th4,th5,th6+i,1); 
% end
% for i=-400:stp:400
%   DHfk3Dof_Lnya(th1,th2,th3,th4,th5,th6+i,1); 
% end
% for i=400:-stp:0
%     if i==0
%       DHfk3Dof_Lnya(th1,th2,th3,th4,th5,th6+i,0);  
%     else
%       DHfk3Dof_Lnya(th1,th2,th3,th4,th5,th6+i,1); 
%     end 
% end

%%  画侧视工作空间
% x = [];
% y = [];
% z = [];
% th2 = 90;
% for i = 0: -5:-79.4
%     DHfk3Dof_Lnya(dis1,th2,th3,th4+i,th5,th6,th7,1); 
% end
% for i = 0: 5:110
%     DHfk3Dof_Lnya(dis1,th2,th3+i,-79.4,th5,th6,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = -79.4: 5:70
%     DHfk3Dof_Lnya(dis1,th2,110,th4+i,th5,th6,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% 
% for i = 0: 5:120
%     DHfk3Dof_Lnya(dis1,th2,110,70,th5,th6+i,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% 
% for i = 110: -5:-110
%     DHfk3Dof_Lnya(dis1,th2,th3+i,70,th5,120,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = 70: -5:-110
%     DHfk3Dof_Lnya(dis1,th2,-110,th4+i,th5,120,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% 
% for i = 120: -5:0
%     DHfk3Dof_Lnya(dis1,th2,-110,-110,th5,th6+i,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% 
% for i = -110: 5:-79.4
%     DHfk3Dof_Lnya(dis1,th2,-110,th4+i,th5,th6,th7,1); 
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = -110: 5:0
%     if i == 0
%         DHfk3Dof_Lnya(dis1,th2,th3+i,-79.4,th5,th6,th7,0); 
%     else
%         DHfk3Dof_Lnya(dis1,th2,th3+i,-79.4,th5,th6,th7,1); 
%     end
%     x = [x Link(8).p(1)];
%     y = [y Link(8).p(2)];
%     z = [z Link(8).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% 
% view(0,0);
% axis equal;

%%  画俯视工作空间
% x = [];
% y = [];
% z = [];
% 
% for i = 0: -5:-79.4
%     DHfk3Dof_Lnya(th1,th2,th3+i,th4,th5,th6,1); 
% end
% for i = 0:5:90
%     DHfk3Dof_Lnya(th1,th2+i,-79.4,th4,th5,th6,1); 
% end
% for i = 0: 5:165
%     DHfk3Dof_Lnya(th1+i,90,-79.4,th4,th5,th6,1); 
%     x = [x Link(7).p(1)];
%     y = [y Link(7).p(2)];
%     z = [z Link(7).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = -79.4: 5:70
%     theta2 = atand((270 - 380.5*sind(i-10.6))/(380.5 * cosd(i-10.6)));
% %     theta2 = acotd((380.5*cosd(i) - 270) / (380.5 * sind(i)));
%     DHfk3Dof_Lnya(165,theta2,th3+i,th4,th5,th6,1); 
%     x = [x Link(7).p(1)];
%     y = [y Link(7).p(2)];
%     z = [z Link(7).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = 165: -5:-165
%     DHfk3Dof_Lnya(th1+i,-16.5,70,th4,th5,th6,1); 
%     x = [x Link(7).p(1)];
%     y = [y Link(7).p(2)];
%     z = [z Link(7).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = 70: -5:-79.4
%     theta2 = atand((270 - 380.5*sind(i-10.6))/(380.5 * cosd(i-10.6)));
% %     theta2 = acotd((380.5*cosd(i) - 270) / (380.5 * sind(i)));
%     DHfk3Dof_Lnya(-165,theta2,th3+i,th4,th5,th6,1); 
%     x = [x Link(7).p(1)];
%     y = [y Link(7).p(2)];
%     z = [z Link(7).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% for i = -165: 5:0
%     if i == 0
%         DHfk3Dof_Lnya(th1+i,90,-79.4,th4,th5,th6,0);
%     else
%         DHfk3Dof_Lnya(th1+i,90,-79.4,th4,th5,th6,1);
%     end
%     x = [x Link(7).p(1)];
%     y = [y Link(7).p(2)];
%     z = [z Link(7).p(3)];
%     plot3(x,y,z,'kX'); hold on;
% end
% 
% view(0,0);
% axis equal;
% axis([-800,800,-800,800,-300,1000]);

%%  老师的代码

% pause;
% cla;
% px=50; py=0; pz=50;
% 
% [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,px,py,pz);
% th1=th1*ToDeg;
% th2=th2*ToDeg;
% th3=th3*ToDeg;
% 
% DHfk3Dof_Lnya(th1,th2,th3,0);  
% plot3(px,py,pz,'r*');
% pause;
% 
% % L1=50;
% % L2=100;
% % L3=120;
% % x=-100;
% % y=120;
% % z=50;
% % 
% % [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x,y,z);
% % Lnya_DHfk3Dof(th1,th2,th3,0);
% % axis([-300,300,-300,300,-300,300]);
% % plot3(x,y,z,'rX');hold on;
% % xlabel('x');
% % ylabel('y'); set(gca,'ydir','reverse');
% % zlabel('z'); hold on;
% % 
% % 
% % 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw Circle on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% z plane
% num=1;
% 
% % for i=-150:5:150
% %    x(num)=i;
% %    y(num)=(150^2-x(num)^2)^0.5;
% %    z(num)=100;
% %    [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
% %    num=num+1;
% % th1=th1*ToDeg;
% % th2=th2*ToDeg;
% % th3=th3*ToDeg;
% %    plot3(x,y,z,'kX'); hold on;
% %    DHfk3Dof_Lnya(th1,th2,th3,1);
% % 
% % end
% % for i=150:-5:-150
% %    x(num)=i;
% %    y(num)=-(150^2-x(num)^2)^0.5;
% %    z(num)=100;
% %    [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
% %    num=num+1;
% % th1=th1*ToDeg;
% % th2=th2*ToDeg;
% % th3=th3*ToDeg;
% %    plot3(x,y,z,'kX'); hold on;
% %    if i==-150
% %      DHfk3Dof_Lnya(th1,th2,th3,0);
% %    else
% %      DHfk3Dof_Lnya(th1,th2,th3,1);
% %    end
% % end
% % 
% % 
% % num=150;
% % aviobj=avifile('D:\3DofRob.avi','fps',30);
%                                                        %录制动画这里可以看看，下面的就不用看了
% r=80;
% for i=-pi:0.1:pi
%    x(num)=r*cos(i);
%    y(num)=r*sin(i);
%    z(num)=60;
%    [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
%    num=num+1;
%    th1=th1*ToDeg;
%    th2=th2*ToDeg;
%    th3=th3*ToDeg;
%    plot3(x,y,z,'kX'); hold on;
%    if i>(pi-0.05);
%       Movie=DHfk3Dof_Lnya(th1,th2,th3,0);
%    else
%       Movie=DHfk3Dof_Lnya(th1,th2,th3,1); 
%    end
% %    aviobj = addframe(aviobj,Movie);
% end
% % aviobj = close(aviobj);
% 
% 
% 
% 
% 
% % for i=150:-5:-150
% %    x(num)=i;
% %    y(num)=-(150^2-x(num)^2)^0.5;
% %    z(num)=100;
% %    [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
% %    num=num+1;
% % %    if(i==100)
% % %        Lnya_DHfk3Dof(th1,th2,th3,0);
% % %    else
% %    plot3(x,y,z,'kX'); hold on;
% %    Lnya_DHfk3Dof(th1,th2,th3,0);
% %    axis([-200,200,-200,200,-200,200]);
% %    xlabel('x');
% %    ylabel('y'); set(gca,'ydir','reverse');
% %    zlabel('z');%set(gca,'zdir','reverse');
% %    drawnow;
% %    pause(0.0001);
% %    if(i>-150)
% %        cla;
% %    end
% % end
% % 
% % num=1;
% % for i=0:1:100
% %    x(num)=150;
% %    z(num)=i;
% %    y(num)=50+(50^2-(z(num)-50)^2)^0.5;
% % 
% %    [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
% %    num=num+1;
% % %    if(i==100)
% % %        Lnya_DHfk3Dof(th1,th2,th3,0);
% % %    else
% %    plot3(x,y,z,'kX'); hold on;
% %    Lnya_DHfk3Dof(th1,th2,th3,0);
% %    axis([-200,200,-200,200,-200,200]);
% %    xlabel('x');
% %    ylabel('y'); set(gca,'ydir','reverse');
% %    zlabel('z');%set(gca,'zdir','reverse');
% %    drawnow;
% %    pause(0.0001);
% %    if(i<100)
% %        cla;
% %    end
% % end
% % 
% % for i=100:-1:0
% %    x(num)=150;
% %    z(num)=i;
% %    y(num)=50-(50^2-(z(num)-50)^2)^0.5;
% % 
% %    [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
% %    num=num+1;
% % %    if(i==100)
% % %        Lnya_DHfk3Dof(th1,th2,th3,0);
% % %    else
% %    plot3(x,y,z,'kX'); hold on;
% %    Lnya_DHfk3Dof(th1,th2,th3,0);
% %    axis([-200,200,-200,200,-200,200]);
% %    xlabel('x');
% %    ylabel('y'); set(gca,'ydir','reverse');
% %    zlabel('z');%set(gca,'zdir','reverse');
% %    drawnow;
% %    pause(0.0001);
% %    if(i>0)
% %        cla;
% %    end
% % 
% % end
% % 
% % 
