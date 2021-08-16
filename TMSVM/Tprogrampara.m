function [ H,quad_f,A,b,Aeq,beq,lb,ub ] = Tprogrampara( data,GaussK,C1,C2 )

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
e = ones(L,1);             %ȫΪl��������
D = diag(sampley);         %�Խ���Ϊsampley_(i)�ĶԽǾ���
H = D*GaussK*D + (10^-3)*eye(L); %����H����
H = (H+H')/2;
quad_f = -e;       
A = [];b = [];
Aeq = sampley';
beq = 0;
lb = C2*e;
ub = C1*e;
end