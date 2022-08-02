function J=Creat_Jacobian_only_position()

global Link

J=zeros(3, 7);

a=Link(1).A(1:3, 3);  
J(:,1)=[a];

for i=2:7
     a=Link(i).A(1:3, 3);  
     J(:,i)=[cross(a,Link(8).A(1:3, 4) - Link(i).A(1:3, 4))];
end

end


    



