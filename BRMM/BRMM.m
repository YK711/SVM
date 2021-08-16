clc;
clear;

load dealdata.mat

tic;
[ ACC,bestparams ] = BRCrossvalind( data,IDofdata,posL );
toc;

%mailTome('BRMM ok','������');