clc
clear 
close all

d = 2;
%data1 = [randn(2,50) 3*[1.5;1]+randn(2,50) 3*[-1;-4]+randn(2,50) 3*[1;-1]+randn(2,50) 3*[-5;1]+randn(2,50)];
data1 = load('testData.mat');

data1 = data1.data;

N1 = size(data1,2);
%%

Rnk = eye(N1);
Nr = 20;
w1 = 1/N1*ones(N1,1);



wTemp = 1/N1*ones(N1,1);
dataTemp = data1;
CTemp = Inf(N1,N1);

for i=1:N1
    for j=1:N1
        if i<j
            CTemp(i,j) = mergeCost(wTemp(i),dataTemp(:,i),wTemp(j),dataTemp(:,j));
        end
    end
end
for k=1:N1-Nr
    k
    [i,j] = find(CTemp == min(CTemp(CTemp<Inf)),1);
    [wTemp(i),dataTemp(:,i)] = mergeSamples(wTemp(i),dataTemp(:,i),wTemp(j),dataTemp(:,j));
    wTemp(j) = [];
    Rnk(:,i) = Rnk(:,i) + Rnk(:,j);
    Rnk(:,j) = [];
    dataTemp(:,j) = [];
    CTemp(:,j) = [];
    CTemp(j,:) = [];
    
    upd_ind = setdiff(1:size(dataTemp,2),i);
    for j=upd_ind
        newBound = mergeCost(wTemp(i),dataTemp(:,i),wTemp(j),dataTemp(:,j));
        if i<j
            CTemp(i,j) = newBound;
        else
            CTemp(j,i) = newBound;
        end
    end
    
    
end
%%
% NOptSteps = 5;
% 
%for i=1:NOptSteps
%     Rnk = zeros(N1,Nr);
%     C = CMatrix(data1,dataTemp);
%     [~,assignVector] = min(C,[],2);
%     for i=1:N1
%         Rnk(i,assignVector(i)) = 1;
%     end
%     dataTemp = computeDataClusterCenters(data1,Rnk);
%end

wTemp = sum(Rnk,1)./N1;

[~,perm] = sort(dataTemp(1,:),'descend');
dataTemp = dataTemp(:,perm);
%CEnd = CMatrix(data1,dataTemp);

%pi1Temp = computeOTP(CEnd,w1,wTemp);
%pi12 = computeOTP(C12,w1,w2);

%d1 = trace(pi1Temp'*CEnd)

%d2 = trace(pi12'*C12);
%%
for i=1:Nr
    idxs = logical(Rnk(:,i));
    scatter(data1(1,idxs),data1(2,idxs)); hold on
    
end

for i=1:Nr
    scatter(dataTemp(1,i),dataTemp(2,i),'r','LineWidth',6); hold on
end
grid minor



function [wcen,scen] = mergeSamples(w1,s1,w2,s2)
    wcen = w1+w2;
    scen = 1/(w1+w2) * (w1*s1 + w2*s2);

end

function c = mergeCost(w1,s1,w2,s2)
    %[~,scen] = mergeSamples(w1,s1,w2,s2);
    
    c = norm(s1-s2)^2;%w1*norm(s1-scen)^2 + w2*norm(s2-scen)^2;
    
end

function C = CMatrix(data1,data2)

    C = zeros(size(data1,2),size(data2,2));
    for i=1:size(data1,2)
        for j=1:size(data2,2)
            C(i,j) = norm(data1(:,i)-data2(:,j))^2;
        end
    end

end