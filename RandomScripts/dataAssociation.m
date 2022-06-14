clc
clear
close all

Nh = 5;
M = 10;
d = 2;
gamma = 5;
beta = 0.01;
gm = GMGen(Nh,d,gamma,beta);

wM = ones(M,1)/M;

[wi,mui,Sigmai] = paramsFromMixture(gm);

meas = -gamma*ones(2,M) + 2*gamma*rand(2,M);
C = Inf(Nh,M);
for i=1:Nh
    for j=1:M
        C(i,j) = sqrt((meas(:,j)-mui(:,i))'*(meas(:,j)-mui(:,i)));
    end
end

pi = relaxedOTP(wM,C');
%dCTD = trace(pi'*C);

clusters = cell(Nh,1);

figure(1)
for i=1:Nh
    color = rand(3,1);
    scatter(mui(1,i),mui(2,i),200,'Marker','*','MarkerEdgeColor',color); hold on
    idxs = find(pi(:,i)>0);
    clusters{i} = meas(:,idxs);
    scatter(clusters{i}(1,:),clusters{i}(2,:),150*i,'MarkerEdgeColor',color,'LineWidth',6); hold on
end
axis('square')
grid minor