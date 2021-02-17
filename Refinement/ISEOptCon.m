function gmr = ISEOptCon(gmr,gmh,NOptSteps,accThresh)
% gmr = ISEOptCon(gmr,gmh,NOptSteps,optWeights,accThresh):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps, maximum number of optimization steps,
% - accThresh, accuracy threshold.
% This function performs the ISE Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fminunc.

if nargin < 3
    NOptSteps = 50;
    accThresh = 1e-08;
end

Nr = numel(gmr);
dr = size(gmr(1).mu,1);

wr = [gmr.w]';
mur = [gmr.mu];
Sigmar = cat(3,gmr.Sigma);
L = zeros(size(Sigmar));
for i=1:Nr
    L(:,:,i) = chol(gmr(i).Sigma);
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
                       'Algorithm','sqp','SpecifyObjectiveGradient',true,'display','none');

x = fmincon(f,x0,A,B,Aeq,Beq,[],[],[],options);


w = x(1:Nr);
muLen = dr*Nr;
mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

gmr(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);
for i=1:Nr
    gmr(i).w = w(i);
    gmr(i).mu = mu(:,i);
    gmr(i).Sigma = L(:,:,i)'*L(:,:,i);
end

end

function [f,grad] = funGradComp(x,gmh,Nr)
    %We rebuild back the gmr in order to evaluate the ISE
    dr = size(gmh(1).mu,1);
    
    w = x(1:Nr);
    muLen = dr*Nr;
    mu = reshape(x(Nr+1:Nr+muLen),dr,Nr);
    L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);
    
    gmr(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);
    for i=1:Nr
        gmr(i).w = w(i);
        gmr(i).mu = mu(:,i);
        gmr(i).Sigma = L(:,:,i)'*L(:,:,i);
    end
    
    f = ISE(gmh,gmr);
    
    wh = [gmh.w]';
    muh = [gmh.mu];
    Sigmah = cat(3,gmh.Sigma);
    
    [gfw,gfmu,gfL] = gradISECon(w,mu,L,wh,muh,Sigmah);
    
    grad = [gfw; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end
