clc;
clear;
dbstop if error

load Breast
[samples] = scaletrain(x);%���������Թ�һ��
data=[samples y];

tic;
[ ACC,bestparams] = TfindACC( data );
toc;
sound(y);