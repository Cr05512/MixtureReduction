function CSDBar = CSDBarycenterGD(gmh,NOptSteps,accThresh)


if nargin < 3
    NOptSteps = 1000;
    accThresh = 1e-12;
end

d = size(gmh(1).mu,1);

gmr = KLDBarycenter(gmh);

[~,mur,Sigmar] = paramsFromMixture(gmr);
L = chol(Sigmar,'lower');

x0 = [mur;reshape(L,d*d,1)];
f = @(x) funGradComp(x,gmh);

options = optimoptions('fminunc','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','quasi-newton','SpecifyObjectiveGradient',true,'display','none');

x = fminunc(f,x0,options);


wr = sum([gmh.w]);
mur = x(1:d);
L = reshape(x(d+1:end),[d d]);
Sigmar = L*L';

CSDBar = mixtureFromParams(wr,mur,Sigmar);

end

function [f,grad] = funGradComp(x,gmh)
    dr = size(gmh(1).mu,1);
   
    mur = x(1:dr);
    L = reshape(x(dr+1:end),[dr dr]);
    
    Sigmar = L*L';
    
    gmr = mixtureFromParams(sum([gmh.w]),mur,Sigmar);
    f = evalBarycenterFun(gmh,gmr,'CSDij');
    
    [Dfmu,DfL] = partialCSDBar(mur,L,[gmh.w]',[gmh.mu],cat(3,gmh.Sigma));
    
    grad = [Dfmu; reshape(DfL,dr*dr,1)];


end