function [ label ] = Judgef( newx,data,alpha,eta,sigma,ommiga0 )
%newx��������,��f(x).

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
fval = ommiga0;                %f����...��ommiga0

for i = L:-1:1
    fval = fval+(alpha(i,1)-eta(i,1))*sampley(i,1)*exp(-sigma*(norm(data(i,1:N-1)-newx))^2);
                                    %f = (alpha(i)-elta(i))*y(i)*K<x(i),newx>)(���)+ommiga0
end

if(fval >= 0)
    label = 1;
else
    label = -1;
end
end
