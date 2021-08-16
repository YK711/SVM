clc;
clear;

load dealdata.mat

tic;
[ ACC,bestparams ] = Crossvalind( data,IDofdata,posL );
toc;

%mailTome('�ල����ok','Ү!');