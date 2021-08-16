function [ ommiga0,solveX ] = TSVMthrough( data,sigma,C1,C2 )
%��ѵ�������ommiga0,��С��������

[ GaussK ] = Gausskernel( data,sigma );
[ H,quad_f,A,b,Aeq,beq,lb,ub ] = Tprogrampara( data,GaussK,C1,C2 );
[ solveX ] = quadprog( H,quad_f,A,b,Aeq,beq,lb,ub );%���ι滮���⣬���δ֪��������������(ǰ��L����alpha������L����elta)
[ targetX,targetY,posn,negn ] = Tsolvequadprog( data,solveX,C1,C2 );
[ ommiga0 ] = Tsolveommiga0( data,targetX,targetY,posn,negn,sigma,solveX );
end