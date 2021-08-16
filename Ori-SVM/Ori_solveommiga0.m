function [ ommiga0 ] = Ori_solveommiga0( solveX,posx,posn,negx,negn,data,sigma )
%���ommiga0

possum = Ori_ommigaxi(solveX,data,posx,posn,sigma);   %��һ���<ommiga,x(i)>֮��
negsum = Ori_ommigaxi(solveX,data,negx,negn,sigma);   %��һ���<ommiga,x(i)>֮��
ommiga0 = -(possum+negsum-posn+negn)/(posn+negn);           %���ommiga0
end