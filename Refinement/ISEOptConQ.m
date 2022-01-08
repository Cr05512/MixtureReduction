function gmr = ISEOptConQ(gmr,gmh,maxiter,tol)
% gmr = ISEOptConQ(gmr,gmh,NOptSteps,optWeights,accThresh):
% - gmr, gmh, two Gaussian Mixtures,
% - NOptSteps, maximum number of optimization steps,
% - accThresh, accuracy threshold.
% This function performs the ISE Optimization on the parameters of the
% reduced mixture by using the builtin Matlab function fmincon.

if nargin < 3
    maxiter = 1000;
    tol = 1e-12;
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
f = @(x) funGradComp(x,wh,muh,Sigmah,Nr);
g = @(x) weightCon(x,Nr);


options = optimoptions('fmincon','OptimalityTolerance',tol,...
                       'MaxFunctionEvaluations',maxiter,'MaxIterations',maxiter,...
                       'Algorithm','sqp','SpecifyObjectiveGradient',true,'display','none',...
                       'SpecifyConstraintGradient',true);

x = fmincon(f,x0,[],[],[],[],[],[],g,options);


wr = x(1:Nr).^2;
muLen = dr*Nr;
mur = reshape(x(Nr+1:Nr+muLen),dr,Nr);
L = reshape(x(Nr+muLen+1:end),[dr dr Nr]);

for i=1:Nr
    Sigmar(:,:,i) = L(:,:,i)*L(:,:,i)';
end

gmr = mixtureFromParams(wr,mur,Sigmar);


end

function [f,grad] = funGradComp(x,wh,muh,Sigmah,Nr)

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
    
    [gfw,gfmu,gfL] = gradISEq(q,mur,L,wh,muh,Sigmah);
    
    grad = [gfw; reshape(gfmu,dr*Nr,1); reshape(gfL,dr*dr*Nr,1)];


end

function [c, ceq, G, Geq] = weightCon(x,Nr)

c = [];
ceq = sum(x(1:Nr).^2) - 1;
G = [];
Geq = [2*x(1:Nr);zeros(length(x)-Nr,1)];

end
