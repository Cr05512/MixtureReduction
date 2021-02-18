function gmr = ISEOptUnc(gmr,gmh,NOptSteps,optWeights,accThresh)
% gmr = ISEOptUnc(gmr,gmh,NOptSteps):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps
% - optWeights
% - accThresh.
% This function performs the ISE Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fminunc.

if nargin < 3
    NOptSteps = 50;
    accThresh = 1e-08;
end

Nr = numel(gmr);
dr = size(gmr(1).mu,1);

[wr,mur,Sigmar] = paramsFromMixture(gmr);
q = sqrt(wr);
L = zeros(size(Sigmar));
for i=1:Nr
    L(:,:,i) = chol(Sigmar(:,:,i));
end

x0 = [q;reshape(mur,dr*Nr,1);reshape(L,dr*dr*Nr,1)];

f = @(x) funGradComp(x,gmh,Nr,optWeights);

options = optimoptions('fminunc','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','trust-region','SpecifyObjectiveGradient',true,'display','none');

x = fminunc(f,x0,options);


q = x(1:Nr);
muLen = dr*Nr;
mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

Sigma = zeros(dr,dr,Nr);
for i=1:Nr
    Sigma(:,:,i) = L(:,:,i)'*L(:,:,i);
end

gmr = mixtureFromParams(q.^2,mu,Sigma);

gmr = refine('weightISEOpt',gmr,gmh);

end

function [f,grad] = funGradComp(x,gmh,Nr,optWeights)
    %We rebuild back the gmr in order to evaluate the ISE
    dr = size(gmh(1).mu,1);
    
    q = x(1:Nr);
    muLen = dr*Nr;
    mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
    L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);
    
    Sigma = zeros(dr,dr,Nr);
    for i=1:Nr
        Sigma(:,:,i) = L(:,:,i)'*L(:,:,i);
    end
    
    gmr = mixtureFromParams(q.^2,mu,Sigma);
    
    f = ISE(gmh,gmr);
    
    [wh,muh,Sigmah] = paramsFromMixture(gmh);
    
    [gfq,gfmu,gfL] = gradISEq(q,mu,L,wh,muh,Sigmah);
    if optWeights == 0
        gfq = zeros(Nr,1);
    end
    
    grad = [gfq; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end
