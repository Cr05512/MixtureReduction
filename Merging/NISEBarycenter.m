function NIB =  NISEBarycenter(gm,NOptSteps,accThresh)
%This function computes the ISE Barycenter through gradient descent

if nargin < 2
    NOptSteps = 1000;
    accThresh = 1e-18;
end


d = size(gm(1).mu,1);

NIB0 = KLDBarycenter(gm);


x0 = [NIB0.mu;reshape(chol(NIB0.Sigma,'lower'),d*d,1)];
f = @(x) barFunGradComp(x,gm);

options = optimoptions('fminunc','OptimalityTolerance',accThresh,...
                       'MaxFunctionEvaluations',NOptSteps,'MaxIterations',NOptSteps,...
                       'Algorithm','trust-region','SpecifyObjectiveGradient',true,'display','none');

x = fminunc(f,x0,options);


mu = x(1:d);
L = reshape(x(d+1:end),d,d);
Sigma = L*L';

NIB = struct('w',sum([gm.w]),'mu',mu,'Sigma',Sigma);
end


function [f,grad] = barFunGradComp(x,gm)
    d = size(gm(1).mu,1);
    mu = x(1:d);
    L = reshape(x(d+1:end),d,d);
    [wh,muh,Sigmah] = paramsFromMixture(gm);
    eta = struct('w',sum(wh),'mu',mu,'Sigma',L*L');
    
    f = evalBarycenterFun(eta,gm,'NL2ij');
    
    
    [~,Dfmu,DfL] = gradNISE(sum(wh),mu,L,wh,muh,Sigmah);
    
    grad = [Dfmu;reshape(DfL,d*d,1)];


end

