function [ testacc ] = TCrossvalind( data,sigma,C1,C2 )
%���۽�����֤,��ȷ��

[~,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
updata = data(sampley == 1,:);     %�����ǩ��������ȡ����
downdata = data(sampley == -1,:);  %�����ǩ��������ȡ����
upindices = crossvalind('Kfold',updata(:,N),5);%������������ְ�,5��
downindices = crossvalind('Kfold',downdata(:,N),5);%������������ְ�,5��
acc = zeros(1,5);  %Ԥ�����ڴ�,������

for k = 1:5
    uptest = (upindices == k);   %������Լ��ı��
    downtest = (downindices == k); %������Լ��ı��
    uptrain = ~uptest;           %ѵ�������ǲ��Լ������
    downtrain = ~downtest;
    traindata = [updata(uptrain,:);downdata(downtrain,:)];  %�ֱ�����ѵ�����븺��ѵ������ȡ����������
    testdata = [updata(uptest,:);downdata(downtest,:)];  %�ֱ�������Լ��븺����Լ���ȡ����������
    [testL,~] = size(testdata);       %���Լ�����������testL
    testlabel = zeros(testL,1);       %Ԥ�����ڴ�,������
    [ ommiga0,solveX ] = TSVMthrough( traindata,sigma,C1,C2 );  %�����ѵ���������ommiga0
    for j = 1:testL
        label = TJudgef( testdata(j,1:(N-1)),traindata,sigma,ommiga0,solveX );%����������ommiga0�ó��Ĳ��Լ���ÿ�������ı�ǩ
        testlabel(j,1) = label;  %���н���Щ��ǩ����
    end
    sameN = length(find(testlabel == testdata(:,N)));  %�ֶ���ĸ���
    acc_k = sameN/testL;     %����
    acc(1,k) = acc_k;        %�������ÿ�������ų�������
end

testacc = mean(acc);   %���ȵ�ƽ����
end