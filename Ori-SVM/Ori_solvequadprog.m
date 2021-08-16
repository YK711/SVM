function [ posx,negx,posn,negn,solveX ] = Ori_solvequadprog( data,solveX,C )
%���solveX(������)>0��Ӧ�ı�ǩ

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
solveX(solveX < (10^-4*ones(L,1))) = 0;
%solveX = round(solveX.*1000)./1000;
target = solveX(solveX>0 & solveX<C);  %��solveX����0��С��C��Ԫ����ȡ������һ���µ�����
tN = length(target);    %target�ĸ���
posx = zeros(tN,N-1); negx = zeros(tN,N-1);     %Ԥ�����ڴ�
fromN = 0;      %fromN�Ƿ�������������Ӧ��λ��,��0��ʼ

for i = 1:tN      
    samepositions = (find(target(i,1) == solveX((fromN+1):L,1)));  %�ҳ�target��alpha�е�λ��
    fromN = samepositions(1)+fromN;      %Ѱ�ҵ�ʱ���п�������ͬ��,����Ҫ���ǵ�һ��,֮��Ļ�����Ѱ�ҵ�
    if sampley(fromN) == -1
        negx(i,:) = data(fromN,1:N-1);  %�����Ӧ�ı�ǩ��-1,����negx�����ǩ��
    elseif sampley(fromN) == 1
        posx(i,:) = data(fromN,1:N-1); 
    end
end

posx(all(posx == 0,2),:) = [];   %��ȥ����Ϊ��������
negx(all(negx == 0,2),:) = [];

if isempty(posx) == 0          %�ж��Ƿ�Ϊ������������
    posn = size(posx,1);     
else posn = 0;   
end

if isempty(negx) == 0        
    negn = size(negx,1);       %ͬ�ϣ�����
else negn = 0;
end
end