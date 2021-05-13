function gmr = JR2DOptCon(gmr,gmh,NOptSteps,accThresh)
% gmr = NISEOptCon(gmr,gmh,NOptSteps,optWeights,accThresh):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps, maximum number of optimization steps,
% - accThresh, accuracy threshold.
% This function performs the NISE Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fmincon.

if nargin < 3
    NOptSteps = 1000;
    accThresh = 1e-12;
end

Nr = numel(gmr);
dr = size(gmr(1).mu,1);

[wr,mur,Sigmar] = paramsFromMixture(gmr);
L = zeros(size(Sigmar));
for i=1:Nr
    L(:,:,i) = chol(Sigmar(:,:,i),'lower');
end

x0 = [wr;reshape(mur,dr*Nr,1);reshape(L,dr*dr*Nr,1)];
[wh,muh,Sigmah] = paramsFromMixture(gmh);

f = @(x) funGradComp(x,wh,muh,Sigmah,Nr);

A = [-eye(Nr),zeros(Nr,Nr*dr + dr*dr*Nr);...
    zeros(Nr*dr + dr*dr*Nr,length(x0))];
B = zeros(length(x0),1);

Aeq = [ones(1,Nr),zeros(1,Nr*dr + dr*dr*Nr)];
Beq = sum([gmr.w]);

options = optimoptions('fmincon','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','sqp','SpecifyObjectiveGradient',true,'display','none');

x = fmincon(f,x0,A,B,Aeq,Beq,[],[],[],options);


w = x(1:Nr);
muLen = dr*Nr;
mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

Sigma = zeros(dr,dr,Nr);
for i=1:Nr
    Sigma(:,:,i) = L(:,:,i)*L(:,:,i)';
end

gmr = mixtureFromParams(w,mu,Sigma);

end

function [f,grad] = funGradComp(x,wh,muh,Sigmah,Nr)
    %We rebuild back the gmr in order to evaluate the ISE
    dr = size(muh(:,1),1);
    
    wr = x(1:Nr);
    muLen = dr*Nr;
    mur = reshape(x(Nr+1:Nr+muLen),dr,Nr);
    L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);
    
    Sigmar = zeros(dr,dr,Nr);
    for i=1:Nr
        Sigmar(:,:,i) = L(:,:,i)*L(:,:,i)';
    end
    gmh = mixtureFromParams(wh,muh,Sigmah);
    gmr = mixtureFromParams(wr,mur,Sigmar);
    
    f = JR2D(gmh,gmr);
    
    [gfw,gfmu,gfL] = gradJR2D(wr,mur,L,wh,muh,Sigmah);
    %gfL = zeros(dr,dr,Nr);
    grad = [gfw; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end