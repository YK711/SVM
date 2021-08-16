function [ ACC,bestparams ] = Ori_Crossvalind( data,IDofdata,posL )
%���۽�����֤,��ȷ��

[L,N] = size(data);   %LΪ����,��������,NΪ����
acc = zeros(1,5);  %Ԥ�����ڴ�,������
IDdata = [data IDofdata(:,1)];
%posdata = data(1:posL,:); posid = IDofdata(1:posL,:);
%negdata = data(posL:L,:); negid = IDofdata(posL:L,:);
posIDdata = IDdata(1:posL,:);
negIDdata = IDdata(posL+1:L,:);

ACC = 0; bestparams = [];
%chooseC = [ 2^-2 2^-1 2^0 2^1 2^2 2^3 2^4 2^5 2^6 2^7 ];%Ԥѡ�Ĳ���
%choosesigma = [2^-5 2^-4 2^-3 2^-2 2^-1 2^0 2^1 2^2 2^3 2^4 2^5];
chooseC = 1;
choosesigma = 1;

lenC = length(chooseC); lensigma = length(choosesigma);

for k1 = 1:lenC
    C = chooseC(k1);
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
            [ solveX,ommiga0 ] = Ori_SVMthrough( data,sigma,C );
            for j = 1:testL
                label = Ori_Judgef( testdata(j,1:(N-1)),traindata,solveX,sigma,ommiga0 );%����������ommiga0�ó��Ĳ��Լ���ÿ�������ı�ǩ
                testlabel(j,1) = label;  %���н���Щ��ǩ����
            end
            sameN = length(find(testlabel == testdata(:,N)));  %�ֶ���ĸ���
            acc(1,k) = sameN/testL;     %����
        end
        testacc0 = mean(acc);   %���ȵ�ƽ����
        params = [C sigma];
        s = std(acc);          %��׼��
        if testacc0 > ACC
            ACC = testacc0;  %ѡ���ߵľ���
            bestparams = params;  %��Ѳ������
        end
    end
end

save accdata_SPECTtest03.mat ACC bestparams s
end