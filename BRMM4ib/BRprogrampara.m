function [ H,quad_f,A,b,Aeq,beq,lb ] = BRprogrampara( data,GaussK,C,R )

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
e = ones(L,1);             %ȫΪl��������
I_1 = [eye(L);-eye(L)];    %����λ���������Ǹ��ģ�����
I_2 = [eye(L) -eye(L)];    %����λ�����ұ��Ǹ��ģ�������
I_3 = [eye(L) eye(L)];     %����λ����
D = diag(sampley);         %�Խ���Ϊsampley_(i)�ĶԽǾ���
H = I_1*D*GaussK*D*I_2 + (10^-3)*eye(2*L); %����H����
H = (H+H')/2;
quad_f = [-e;R*e];       %2L*1��������,��������L����-1,����L����R,��ΪҪת��
A = [I_3;-I_3]; b = [C*e;0*e];
Aeq = (I_1*sampley)'; beq = 0;
lb = zeros(2*L,1);
end