function CSDB =  CSDBarycenter(gm,NOptSteps,accThresh)
%This function computes the ISE Barycenter through gradient descent

if nargin < 2
    NOptSteps = 100;
    accThresh = 1e-25;
elseif nargin < 3
    accThresh = 1e-25;
end


d = size(gm(1).mu,1);

CSDB0 = KLDBarycenter(gm);
[wh,muh,Sigmah] = paramsFromMixture(gm);
L = chol(CSDB0.Sigma,'lower');
x0 = [CSDB0.mu;reshape(L,d*d,1)];
f = @(x) barFunGradComp(x,wh,muh,Sigmah);

options = optimoptions('fminunc','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','quasi-newton','SpecifyObjectiveGradient',true,'display','none');

x = fminunc(f,x0,options);


mu = x(1:d);
L = reshape(x(d+1:end),d,d);
Sigma = L*L';

CSDB = struct('w',sum([gm.w]),'mu',mu,'Sigma',Sigma);
end


function [f,grad] = barFunGradComp(x,wh,muh,Sigmah)
    d = size(muh(:,1),1);
    mu = x(1:d);
    L = reshape(x(d+1:end),d,d);
    gm = mixtureFromParams(wh,muh,Sigmah);
    eta = struct('w',sum(wh),'mu',mu,'Sigma',L*L');
    
    f = evalBarycenterFun(gm,eta,'CSDij');
    
    
    [Dfmu,DfL] = partialCSDBar(mu,L,wh,muh,Sigmah);
    
    grad = [Dfmu;reshape(DfL,d*d,1)];


end

