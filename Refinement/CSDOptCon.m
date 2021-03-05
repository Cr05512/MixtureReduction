function gmr = CSDOptCon(gmr,gmh,NOptSteps,accThresh)
% gmr = CSDOptCon(gmr,gmh,NOptSteps,accThresh):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps, maximum number of optimization steps,
% - accThresh, accuracy threshold.
% This function performs the Cauchy-Schwarz Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fmincon.

if nargin < 3
    NOptSteps = 100;
    accThresh = 1e-18;
end

Nr = numel(gmr);
dr = size(gmr(1).mu,1);

[wr,mur,Sigmar] = paramsFromMixture(gmr);
L = zeros(size(Sigmar));
for i=1:Nr
    L(:,:,i) = chol(Sigmar(:,:,i));
end

x0 = [wr;reshape(mur,dr*Nr,1);reshape(L,dr*dr*Nr,1)];

f = @(x) funGradComp(x,gmh,Nr);

A = [-eye(Nr),zeros(Nr,Nr*dr + dr*dr*Nr);...
    zeros(Nr*dr + dr*dr*Nr,length(x0))];
B = zeros(length(x0),1);

Aeq = [ones(1,Nr),zeros(1,Nr*dr + dr*dr*Nr)];
Beq = sum([gmr.w]);

options = optimoptions('fmincon','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','interior-point','SpecifyObjectiveGradient',true,'display','none');

x = fmincon(f,x0,A,B,Aeq,Beq,[],[],[],options);


w = x(1:Nr);
muLen = dr*Nr;
mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

Sigma = zeros(dr,dr,Nr);
for i=1:Nr
    Sigma(:,:,i) = L(:,:,i)'*L(:,:,i);
end

gmr = mixtureFromParams(w,mu,Sigma);

end

function [f,grad] = funGradComp(x,gmh,Nr)
    %We rebuild back the gmr in order to evaluate the ISE
    dr = size(gmh(1).mu,1);
    
    w = x(1:Nr);
    muLen = dr*Nr;
    mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
    L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);
    
    Sigma = zeros(dr,dr,Nr);
    for i=1:Nr
        Sigma(:,:,i) = L(:,:,i)'*L(:,:,i);
    end
    
    gmr = mixtureFromParams(w,mu,Sigma);
    
    f = CSD(gmh,gmr);
    
    [wh,muh,Sigmah] = paramsFromMixture(gmh);
    
    [gfw,gfmu,gfL] = gradCSD(w,mu,L,wh,muh,Sigmah);
    
    grad = [gfw; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end