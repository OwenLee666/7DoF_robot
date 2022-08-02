% ? Rahul Kala, IIIT Allahabad, Creative Commons Attribution-ShareAlike 4.0 International License. 
% The use of this code, its parts and all the materials in the text; creation of derivatives and their publication; and sharing the code publically is permitted without permission. 

% Please cite the work in all materials as: R. Kala (2014) Code for Robot Path Planning using Rapidly-exploring Random Trees, Indian Institute of Information Technology Allahabad, Available at: http://rkala.in/codes.html

function feasible=feasiblePoint()

global Link
global Sphr

feasible = true;

%% 判断连杆  
for i = 2:7
    for lamda = 0:0.2:1
        a = Link(i).A(1:3, 4);
        b = Link(i+1).A(1:3, 4);
        PointXYZ = a + lamda*(b - a);
%         fprintf('i:%d, lamda:%f, a:%f,%f,%f, b:%f,%f,%f, PointXYZ:%f,%f,%f\n', i, lamda, a(:), b(:), PointXYZ(:));

        % 判断连杆是否出界
%         if ~(PointXYZ(2) > 0 && PointXYZ(2) < 4000), feasible = false; break;end
        if ~(norm([PointXYZ(1),PointXYZ(3)]) < 1001 && PointXYZ(2) > 0 && PointXYZ(2) < 4000), feasible = false; break;end
        
        % 判断连杆是否与球发生碰撞
        for j = 2: size(Sphr, 2)
            SphrXYZ = Sphr(1:3, j);
            dist = Sphr(4, j) + 10;
            % check if collission-free spot and inside maps
            if ~(norm(PointXYZ - SphrXYZ) > dist)
                feasible = false;
                break;
            end
        end
        if feasible == false, break; end
    end
    if feasible == false, break; end
end

%% 只判断关节
% for i = 2:8
%     PointXYZ = Link(i).A(1:3, 4);
% 
%     % 判断连杆是否与球发生碰撞
%     for j = 2: size(Sphr, 2)
%         SphrXYZ = Sphr(1:3, j);
%         dist = Sphr(4, j) + 10;
%         % check if collission-free spot and inside maps
%         if ~(norm(PointXYZ - SphrXYZ) > dist)
%             feasible = false;
%             break;
%         end
%     end
%     if feasible == false, break; end
% end

end