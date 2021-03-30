function gmr = ISEOptUnc(gmr,gmh,NOptSteps,optWeights,accThresh)
% gmr = ISEOptUnc(gmr,gmh,NOptSteps):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps
% - optWeights
% - accThresh.
% This function performs the ISE Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fminunc.

if nargin < 3
    NOptSteps = 1000;
    accThresh = 1e-18;
end

Nr = numel(gmr);
dr = size(gmr(1).mu,1);

[wr,mur,Sigmar] = paramsFromMixture(gmr);
q = sqrt(wr);
L = zeros(size(Sigmar));
for i=1:Nr
    L(:,:,i) = chol(Sigmar(:,:,i),'lower');
end

x0 = [q;reshape(mur,dr*Nr,1);reshape(L,dr*dr*Nr,1)];
[wh,muh,Sigmah] = paramsFromMixture(gmh);
f = @(x) funGradComp(x,wh,muh,Sigmah,Nr,optWeights);

options = optimoptions('fminunc','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','quasi-newton','SpecifyObjectiveGradient',true,'display','none');

x = fminunc(f,x0,options);


q = x(1:Nr);
muLen = dr*Nr;
mur = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

%Sigmar = zeros(dr,dr,Nr);
for i=1:Nr
    Sigmar(:,:,i) = L(:,:,i)*L(:,:,i)';
end

gmr = mixtureFromParams(q.^2,mur,Sigmar);

gmr = refine('weightISEOpt',gmr,gmh);

end

function [f,grad] = funGradComp(x,wh,muh,Sigmah,Nr,optWeights)
    dr = size(muh(:,1),1);
    
    q = x(1:Nr);
    muLen = dr*Nr;
    mur = reshape(x(Nr+1:Nr+muLen),dr,Nr);
    L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);
    
    Sigmar = zeros(dr,dr,Nr);
    for i=1:Nr
        Sigmar(:,:,i) = L(:,:,i)*L(:,:,i)';
    end
    
    f = ISEparams(wh,muh,Sigmah,q.^2,mur,Sigmar);
    
    [gfq,gfmu,gfL] = gradISEq(q,mur,L,wh,muh,Sigmah);
    if optWeights == 0
        gfq = zeros(Nr,1);
    end
    
    grad = [gfq; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end