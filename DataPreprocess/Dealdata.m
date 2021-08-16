clc;
clear;
dbstop if error

load SPECTtrain %�����ݸ�
[samples] = mapminmax(x',0,1);%���������Թ�һ��
data=[samples' y];
[ data,IDofdata,posL ] = AddIDdata( data );  %ͳһ�����ݴ���

save dealdata.mat data IDofdata posL
copyfile('dealdata.mat','C:\Users\Administrator\Desktop\all');
copyfile('dealdata.mat','dealdata_SPECTtrain.mat');%���»����ݸ�
mkdir('C:\Users\Administrator\Desktop\DEALDATA\����','SPECTtrain');%�������ļ��б�������
movefile('SPECTtrain.mat','C:\Users\Administrator\Desktop\DEALDATA\����\SPECTtrain');
movefile('dealdata_SPECTtrain.mat','C:\Users\Administrator\Desktop\DEALDATA\����\SPECTtrain');
mailTome('���ݴ�����ϣ�','SPECTtrain');
sound(y)
%dos('shutdown -s -t 300'); 