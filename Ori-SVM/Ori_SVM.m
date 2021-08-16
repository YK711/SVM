clc;
clear;

load dealdata.mat

tic;
[ ACC ] = Ori_Crossvalind( data,IDofdata,posL );
toc;

%mailTome('Ori ok','���˺�!');