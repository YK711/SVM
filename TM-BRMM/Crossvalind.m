function [ ACC,bestparams ] = Crossvalind( data,IDofdata,posL )
%���۽�����֤,��ȷ��

[L,N] = size(data);   %LΪ����,��������,NΪ����
acc = zeros(1,5);  %Ԥ�����ڴ�,������
IDdata = [data IDofdata(:,1)];
%posdata = data(1:posL,:); posid = IDofdata(1:posL,:);
%negdata = data(posL:L,:); negid = IDofdata(posL:L,:);
posIDdata = IDdata(1:posL,:);
negIDdata = IDdata(posL+1:L,:);

ACC = 0; bestparams = [];
    %%Ԥѡ����
%chooseC1 = [ 2^-2 2^-1 2^0 2^1 2^2 2^3 2^4 2^5 2^6 2^7 ];%Ԥѡ�Ĳ���
%chooseC2 = [ 2^-6 2^-5 2^-4 2^-3 2^-2 2^-1 2^0 2^1 2^2 2^3 ];
%chooseR = [ 1 2 4 6 8 10 ];
%choosesigma = [ 2^-5 2^-4 2^-3 2^-2 2^-1 2^0 2^1 2^2 2^3 2^4 2^5 ];
chooseC1 = 2^4;
chooseC2 = 2^1;
chooseR = 8;
choosesigma = 0.5;

lenC1 = length(chooseC1); lenC2 = length(chooseC2);
lenR = length(chooseR); lensigma = length(choosesigma);%Ԥѡ�����ĸ���

for k1 = 1:lenC1
    C1 = chooseC1(k1);
    for k2 = 1:lenC2
        C2 = chooseC2(k2);
        for k3 = 1:lenR
            R = chooseR(k3);
            for k4 = 1:lensigma
                sigma = choosesigma(k4);
                for k = 1:5
                    postest = (posIDdata(:,N+1) == k);   %������Լ��ı��
                    negtest = (negIDdata(:,N+1) == k); %������Լ��ı��
                    postrain = ~postest;           %ѵ�������ǲ��Լ������
                    negtrain = ~negtest;
                    traindata = [posIDdata(postrain,:);negIDdata(negtrain,:)];  %�ֱ�����ѵ�����븺��ѵ������ȡ����������
                    testdata = [posIDdata(postest,:);negIDdata(negtest,:)];  %�ֱ�������Լ��븺����Լ���ȡ����������
                    traindata(:,N+1) = [];  %�����ȥ��
                    testdata(:,N+1) = [];
                    [testL,~] = size(testdata);       %���Լ�����������testL
                    testlabel = zeros(testL,1);       %Ԥ�����ڴ�,������
                    [ alpha,eta,ommiga0 ] = SVMthrough( traindata,sigma,C1,C2,R );  %�����ѵ���������ommiga0
                    for j = 1:testL
                        label = Judgef( testdata(j,1:(N-1)),traindata,alpha,eta,sigma,ommiga0 );%����������ommiga0�ó��Ĳ��Լ���ÿ�������ı�ǩ
                        testlabel(j,1) = label;  %���н���Щ��ǩ����
                    end
                    sameN = length(find(testlabel == testdata(:,N)));  %�ֶ���ĸ���
                    acc(1,k) = sameN/testL;     %����
                end
                testacc0 = mean(acc);   %���ȵ�ƽ����
                s = std(acc);          %��׼��
                %diary param.txt
                %param_etc = [C1 C2 R sigma testacc0 s];
                %Param((k1-1)*lenC2*lenR*lensigma+(k2-1)*lenR*lensigma+(k3-1)*lensigma+k4,:)=param_etc; %�Ž�ȥ
                %diary off
                params = [C1 C2 R sigma];
                if testacc0 > ACC
                    ACC = testacc0;  %ѡ���ߵľ���
                    bestparams = params;  %��Ѳ������
                end
            end
        end
    end
end

save accdata_CMC01.mat ACC bestparams s %�����ݸ�
end