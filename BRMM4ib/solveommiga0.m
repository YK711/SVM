function [ ommiga0 ] = solveommiga0( alpha,eta,posx,posn,negx,negn,data,sigma )
%���ommiga0

possum = ommigaxi(alpha,eta,data,posx,posn,sigma);   %��һ���<ommiga,x(i)>֮��
negsum = ommigaxi(alpha,eta,data,negx,negn,sigma);   %��һ���<ommiga,x(i)>֮��
ommiga0 = -(possum+negsum-posn+negn)/(posn+negn);           %���ommiga0
end