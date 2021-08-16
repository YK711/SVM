function [ id ] = ID( data )
%Ϊÿ��x���׼������,�����id�Ƿ���ı��

[idl,~] = size(data);%��������
idk = ceil(idl/5);%��������Ϊ5�飬ceilΪȡ������idl/5���������
id = zeros(5,5*idk); idj = zeros(1,idk);
for i = 1:5
    for j = 1:idk
    idj(1,5*(j-1)+1:5*j) = randperm(5); %ȷ��ÿ��x�����Էֵ����
    end
    id(i,:) = idj;%�������,idΪ5*(idk*5)�ľ���
end
id = id(:,1:idl)'; %ֻȡ1��idl�еı��,��ת��,ȡ��ʱ��һ��һ��ȡ����
%iddata = [data id]; %��żӵ�data����
end
