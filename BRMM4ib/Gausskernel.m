function [ GaussK ] = Gausskernel( data,sigma )
%GaussK�����˾���

GaussK = [];
[L,N] = size(data);   %LΪ����,��������,NΪ����

for i = L:-1:1
    samplex(i,:) = data(i,1:N-1);     %xȡÿ�е�һ�е������ڶ���
    for j = L:-1:1
        samplex(j,:) = data(j,1:N-1);
        GaussK(i,j) = exp(-sigma*(norm(samplex(i,:)-samplex(j,:)))^2);  %�˾���ϵ����sigma��ʾ
    end
end
end