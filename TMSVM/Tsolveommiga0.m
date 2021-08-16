function [ ommiga0 ] = Tsolveommiga0( data,targetX,targetY,posn,negn,sigma,solveX )
%���ommiga0
%yi*alphai*GaussK��

[L,N] = size(data);   %LΪ����,��������,NΪ����
targetsum = posn+negn;
targetK = zeros(L,targetsum);

for i = 1:L
    for j = 1:targetsum
        targetK(i,j) = exp(-sigma*(norm(data(i,1:N-1)-targetX(j,:)))^2); %�˾���ϵ����sigma��ʾ
    end
end

totalsum = solveX'*targetK*targetY;
ommiga0 = (posn-negn-totalsum)/(posn+negn);           %���ommiga0
end