function [trainsamples,A,B] = scaletrain(trainsamples,lb,ub)
% normalize the training data in the interval [-1 1]��ÿһ�����Զ���׼�����������

if nargin < 2
    lb = 0;
    ub = 1;
end

n = size(trainsamples,2); % input dimension n=1
sca = zeros(1,n);
mina = zeros(1,n);
maxa = zeros(1,n);
A = zeros(1,n);
B = zeros(1,n);

for i = 1:n
    mina(i) = min(trainsamples(:,i));
    maxa(i) = max(trainsamples(:,i));
    sca(i) = maxa(i) - mina(i);
    if sca(i) == 0
        sca(i) = 1;
    end
end   

for i = 1:n
    A(i) = (ub - lb)/sca(i);
    B(i) = lb - A(i)*mina(i);
    trainsamples(:,i) = A(i)*trainsamples(:,i) + B(i);
end
end  