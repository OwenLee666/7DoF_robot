%%
%   ����˵��������DH��������ϵ�������һ������ϵ����α仯����
%   ���룺    �ޣ���ȫ�ֱ���Link���DH����
%   �����    ��, �����������ȫ�ֱ���Link
%   ע���������Щ�������Ϊ�ؽڡ�֮��Ĺ�ϵ����ã������Ǵ���ĳһ�ؽڣ���Ȼ���׸㲻����±���ؽڡ�
%   ToDo��    n��o��a��R����Ϣ�Ѿ��洢��A���ˣ��Ƿ��б�Ҫ�ٴδ洢��
%%

function create_matrixs_by_DH_table() 

global Link

for i = 1:8
    C=cosd(Link(i).th);  %��ùؽڵĲ���
    S=sind(Link(i).th);
    Ca=cosd(Link(i).alf);
    Sa=sind(Link(i).alf);
    dx=Link(i).dx;    %distance between zi and zi-1
    dz=Link(i).dz;    %distance between xi and xi-1

    n=[C,S,0,0]';   %������α任����
    o=[-1*S*Ca,C*Ca,Sa,0]';
    a=[S*Sa, -1*C*Sa,Ca,0]';
    p=[dx*C,dx*S,dz,1]';
    
    Link(i).A=[n, o, a, p];    %�洢λ��
end

end

%�����������ͽ���Ӧ����ϵ�������һ������ϵ��λ�ˣ���α任���󣩴洢����ȫ�ֱ�����

