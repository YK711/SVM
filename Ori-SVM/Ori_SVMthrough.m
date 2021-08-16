function [ solveX,ommiga0 ] = Ori_SVMthrough( data,sigma,C )
%��ѵ�������ommiga0,��С��������

[ GaussK ] = Gausskernel( data,sigma );
[ H,quad_f,Aeq,beq,lb,ub ] = Ori_programpara( data,GaussK,C );
[ solveX ] = quadprog( H,quad_f,[],[],Aeq,beq,lb,ub );%���ι滮���⣬���δ֪��������������(ǰ��L����alpha������L����elta)
[ posx,negx,posn,negn,solveX ] = Ori_solvequadprog( data,solveX,C );
[ ommiga0 ] = Ori_solveommiga0( solveX,posx,posn,negx,negn,data,sigma );
end