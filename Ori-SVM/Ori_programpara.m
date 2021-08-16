function [ H,quad_f,Aeq,beq,lb,ub ] = Ori_programpara( data,GaussK,C )

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
e = ones(L,1);             %ȫΪl��������
D = diag(sampley);         %�Խ���Ϊsampley_(i)�ĶԽǾ���
H = D*GaussK*D + (10^-3)*eye(L); %����H����
H = (H+H')/2;
quad_f = -e;       %L*1��������,��ΪҪת��
Aeq = sampley'; beq = 0;
lb = zeros(L,1); ub = C*e;
end