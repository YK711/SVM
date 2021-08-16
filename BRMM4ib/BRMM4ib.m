clc;
clear;

load dealdata.mat

tic;
[ A,bestparams ] = BRCrossvalind4ib( data,IDofdata,posL );
toc;

%mailTome('BRMM4ib ok','������');
%�˳���Ϊ Ϊ�������±Ƚϵ�BRMM,ѡȡ�ı�׼��ͬ