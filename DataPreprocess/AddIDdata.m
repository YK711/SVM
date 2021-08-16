function [ data,IDofdata,posL ] = AddIDdata( data )
%�����ݷ�����,���ó����Ӧ���,�Լ����������ĸ���

[~,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
posdata = data(sampley == 1,:);     %�����ǩ��������ȡ����
negdata = data(sampley == -1,:);    %�����ǩ��������ȡ����
[posL,~] = size(posdata);         %�������������ĸ���
[ posid ] = ID( posdata );      %���������ı��
[ negid ] = ID( negdata );      %���������ı��
IDofdata = [posid;negid];         %�ܱ��
data = [posdata;negdata];         %��������(��������ǰ)
end