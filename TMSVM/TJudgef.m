function [ label ] = TJudgef( newx,data,sigma,ommiga0,solveX )
%newx��������,��f(x).

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
GK = zeros(L,1);

for i = 1:L
    gk = exp(-sigma*(norm(data(i,1:N-1)-newx))^2);
    GK(i,:) = gk;
end
fval = solveX'*diag(sampley)*GK+ommiga0;

if(fval >= 0)
    label = 1;
else
    label = -1;
end
end
