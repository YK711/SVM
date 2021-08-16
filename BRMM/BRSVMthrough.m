function [ alpha,eta,ommiga0 ] = BRSVMthrough( data,sigma,C,R )
%��ѵ�������ommiga0,��С��������

[ GaussK ] = Gausskernel( data,sigma );
[ H,quad_f,A,b,Aeq,beq,lb ] = BRprogrampara( data,GaussK,C,R );
[ solveX ] = quadprog( H,quad_f,A,b,Aeq,beq,lb,[] );%���ι滮���⣬���δ֪��������������(ǰ��L����alpha������L����elta)
[ posx,negx,posn,negn,alpha,eta ] = BRsolvequadprog( data,solveX,C );
[ ommiga0 ] = solveommiga0( alpha,eta,posx,posn,negx,negn,data,sigma );
end