function [ ACC,bestparams] = TfindACC( data )
%���۽�����֤����󾫶�,�Լ����������

chooseC1 = [ 2^7 ];%Ԥѡ�Ĳ���
chooseC2 = [ 2^3 ];
choosesigma = 1;

lenC1 = length(chooseC1); lenC2 = length(chooseC2);
lensigma = length(choosesigma);%Ԥѡ�����ĸ���
Param = zeros(lenC1*lenC2*lensigma,4);%Ԥ�����ڴ�,��ÿ����������õľ��ȼ�����

for k1 = 1:lenC1
    C1 = chooseC1(k1);
    for k2 = 1:lenC2
        C2 = chooseC2(k2);
        for k3 = 1:lensigma
            sigma = choosesigma(k3);
            [ testacc ] = TCrossvalind( data,sigma,C1,C2 );%ÿ������������õľ���
            param_etc = [C1 C2 sigma testacc];
            Param((k1-1)*lenC2*lensigma+(k2-1)*lensigma+k3,:) = param_etc; %�Ž�ȥ
        end
    end
end

save Tparams.mat Param

[ACC,row] = max(Param(:,4));%�����Ĳ����������ڵ�����
bestparams = Param(row,1:3);  %��Ѳ������
end