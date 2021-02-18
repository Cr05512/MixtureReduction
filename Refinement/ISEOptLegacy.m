function gmr_Opt = ISEOptLegacy(gmr,gmh,sk,NOptSteps,optWeights,accThresh)
% gmr_Opt = ISEOpt(gmr,gmh,sk,NOptSteps,optWeights,accThresh):
% INPUTS:
% - gmr, gmh, respectively the reduced and original mixtures,
% - sk, gradient step size (scalar),
% - NOptSteps, number of optimization iterations (scalar),
% - optWeights, binary parameter which accounts for the weight optimization. If
%   set to 1 the weights will be optimized, viceversa (binary variable).
% OUTPUTS:
% - gmr_Opt, optimized mixture,
% This function operates an iterative optimization over the reduced mixture
% parameters in order to get a better approximation.
if nargin < 3
    sk = 0.01;
    NOptSteps = 50;
    optWeights = 1;
    accThresh = 1e-12;
elseif nargin < 4
    NOptSteps = 50;
    optWeights = 1;
    accThresh = 1e-12;
elseif nargin < 5
    optWeights = 1;
    accThresh = 1e-12;
elseif nargin < 6
    accThresh = 1e-12;
end
assert(numel(gmh)>=numel(gmr) && ~isempty(gmr),'The mixtures have to contain at least on element and N must be greater or equal to R.');
assert(sk>0,'The gradient step has to be greater than zero.');
assert(NOptSteps>=0,'The number of optimization steps has to be non-negative.');
assert(optWeights==0 || optWeights==1,'The optWeights parameter can take values either 0 or 1.');

if numel(gmr)==1
    optWeights=0;
end

gmr_Opt = gmr;

dr = size(gmr_Opt(1).mu,1);
Nr = numel(gmr_Opt);

wh = [gmh.w]';
muh = [gmh.mu];
Sigmah = cat(3,gmh.Sigma);

q = sqrt([gmr_Opt.w]');
mu = [gmr_Opt.mu];
L = zeros(dr,dr,Nr);
for i=1:Nr
    L(:,:,i) = chol(gmr_Opt(i).Sigma);
end


J = Inf;
J_prev = J;

%The gradient formula is xk+1 = xk - sk*gf(xk)/||gf(xk)||, with sk the step
%and gf is the gradient of the cost function

%We are optimizing with respect to the reduced mixture parameters. Taking
%into account that J = Jhh -2*Jhr + Jrr, we find out that the term Jhh does
%not depend on the parameters of the reduced mixture, that is we can skip
%calculations over that term (it is always zero).

Jhh = selfLikeness(gmh);
for k=1:NOptSteps
    
    [gfq,gfmu,gfL] = gradISEq(q,mu,L,wh,muh,Sigmah);
   
    %Weights

    
    if optWeights == 1
%         normgfq = norm(gfq);
%         if normgfq>toll
%             gfq = gfq/normgfq;
            q = q - sk*gfq;
%         end
    end
    
    %Means
    
    
%     normgfmu = norm(reshape(gfmu,dr*Nr,1));
%     if normgfmu>0
%         gfmu = gfmu./normgfmu;
        mu = mu - sk*gfmu;
%     end
    
    
    %Covariances
    
    
%     normgfLTot = norm(reshape(gfL,dr*dr*Nr,1));
%     
%     if normgfLTot>0
%         for i=1:Nr
%             gfL(:,:,i) = gfL(:,:,i)./normgfLTot;
%         end
        L = L - sk*gfL;
%     end
    
    %sk = sk - sk*(k-1)/NOptSteps;
    
    if optWeights == 1
        p = q.^2;
    end

    for i=1:Nr
        if optWeights == 1
            gmr_Opt(i).w = p(i);
        end
        gmr_Opt(i).mu = mu(:,i);
        gmr_Opt(i).Sigma = L(:,:,i)'*L(:,:,i);
    end

    
    J = Jhh - 2*crossLikeness(gmh,gmr_Opt) + selfLikeness(gmr_Opt);
    if abs(J-J_prev)<accThresh
%          disp(strcat(['ISEOpt converged after',' ',num2str(k),' ','iterations.']));
        break
    end
    J_prev = J;
    
    
end

if optWeights==1
   gmr_Opt = refine('weightISEOpt',gmr_Opt,gmh);
end

    
end