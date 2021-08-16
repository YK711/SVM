function [ PNsum ] = ommigaxi( alpha,eta,data,PNx,PNn,sigma )  %PNx��posx��negx
%<ommiga,x(i)>֮��

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);
PNsum = 0;
PNk = zeros(L,PNn);

for i = 1:L
    for j = 1:PNn
        PNk(i,j) = exp(-sigma*(norm(data(i,1:N-1)-PNx(j,:)))^2); %�˾���ϵ����sigma��ʾ
    end
    PNk_i = sum(PNk(i,:)); %�˾���ÿһ�еĺ�            
    PNsum = PNsum+(alpha(i,1)-eta(i,1))*sampley(i,1)*PNk_i;
    %(alpha(i)-elta(i))*y(i)*K(i)�ĺͣ���<ommiga,x(i)>֮��
end
end