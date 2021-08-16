function [ targetX,targetY,posn,negn ]=Tsolvequadprog( data,solveX,C1,C2 )
%������alpha,elta������solveX����(������)�Լ���Ӧ�ı�ǩ

[L,N] = size(data);   %LΪ����,��������,NΪ����
sampley = data(:,N);      %��ǩȡ���һ��
solveX = (round(solveX).*1000)./1000;
target = solveX(C2 < solveX&solveX < C1);  %��alpha����0��C1<alpha(i)+eta(i)<C1�е�Ԫ����ȡ������һ���µ�����
tN = length(target);    %target�ĸ���
posx = zeros(tN,N-1); negx=zeros(tN,N-1); %Ԥ�����ڴ�
posy = zeros(tN,1);negy=zeros(tN,1);
fromN = 0;      %fromN�Ƿ�������������Ӧ��λ��,��0��ʼ

for i = 1:tN      
    samepositions = (find(target(i,1) == solveX((fromN+1):L,1)));  %�ҳ�target��alpha�е�λ��
    fromN = samepositions(1)+fromN;      %Ѱ�ҵ�ʱ���п�������ͬ��,����Ҫ���ǵ�һ��,֮��Ļ�����Ѱ�ҵ�
    if sampley(fromN) == -1
        negx(i,:) = data(fromN,1:N-1);  %�����Ӧ�ı�ǩ��-1,����negx�����ǩ��
        negy(i) = data(fromN,N);
    elseif sampley(fromN) == 1
        posx(i,:) = data(fromN,1:N-1); 
        posy(i) = data(fromN,N);
    end
end

posx(all(posx == 0,2),:) = [];   %��ȥ����Ϊ��������
negx(all(negx == 0,2),:) = [];
posy(all(posy == 0,2),:) = [];
negy(all(negy == 0,2),:) = [];

if isempty(posx) == 0          %�ж��Ƿ�Ϊ������������
    posn = size(posx,1);     
else posn = 0;   
end

if isempty(negx) == 0        
    negn = size(negx,1);       %ͬ�ϣ�����
else negn = 0;
end

targetX = [posx;negx];
targetY = [posy;negy];
end