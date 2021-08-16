function [ alpha,eta,ommiga0 ] = SVMthrough( data,sigma,C1,C2,R )
%��ѵ�������ommiga0,��С��������

[ GaussK ] = Gausskernel( data,sigma );
[ H,quad_f,A,b,Aeq,beq,lb ] = programpara( data,GaussK,C1,C2,R );
[ solveX ] = quadprog( H,quad_f,A,b,Aeq,beq,lb,[] );%���ι滮���⣬���δ֪��������������(ǰ��L����alpha������L����elta)
[ posx,negx,posn,negn,alpha,eta ] = solvequadprog( data,solveX,C1,C2 );
[ ommiga0 ] = solveommiga0( alpha,eta,posx,posn,negx,negn,data,sigma );
end