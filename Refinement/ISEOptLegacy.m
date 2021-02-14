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
    accThresh = 1e-06;
elseif nargin < 4
    NOptSteps = 50;
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 5
    optWeights = 1;
    accThresh = 1e-06;
elseif nargin < 6
    accThresh = 1e-06;
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
Nh = numel(gmh);

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
    
    dJrrdq = zeros(length(q),1);
    dJhrdq = dJrrdq;
    dJhrdmu = zeros(dr,Nr);
    dJrrdmu = dJhrdmu;
    dJhrdL = zeros(dr,dr,Nr);
    dJrrdL = dJhrdL;
    
    
    LtL = zeros(dr,dr,Nr);
    for i=1:Nr
        LtL(:,:,i) = L(:,:,i)'*L(:,:,i);
    end
    
    SigmahLijinv = zeros(dr,dr,Nh,Nr);
    for i=1:Nh
        for j=1:Nr
            SigmahLijinv(:,:,i,j) = inv(Sigmah(:,:,i) + LtL(:,:,j));
        end
    end
    
   
    for j=1:Nr
        for i=1:Nh
            prodPDFhr = struct('w',1,'mu',mu(:,j),'Sigma',Sigmah(:,:,i) + LtL(:,:,j));
            %Weights
            dJhrdq(j) = dJhrdq(j) + wh(i)*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
            %Means
            dJhrdmu(:,j) = dJhrdmu(:,j) + wh(i)*SigmahLijinv(:,:,i,j)*...
                (mu(:,j)-muh(:,i))*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma);
            %Covariances
            dJhrdL(:,:,j) = dJhrdL(:,:,j) + wh(i)*q(j)^2*mvnpdf(muh(:,i), prodPDFhr.mu, prodPDFhr.Sigma)...
                *SigmahLijinv(:,:,i,j)*((muh(:,i)-mu(:,j))*...
                (muh(:,i)-mu(:,j))' - (Sigmah(:,:,i)+ LtL(:,:,j)))...
                *SigmahLijinv(:,:,i,j)*L(:,:,j);
        end
        %Weights
        dJhrdq(j) = 2*q(j)*dJhrdq(j);
        %Means
        dJhrdmu(:,j) = -(q(j)^2)*dJhrdmu(:,j);
        %Covariances
        %No need
    end
    
    LtLijinv = zeros(dr,dr,Nr,Nr);
    for i=1:Nr
        for j=1:Nr
            LtLijinv(:,:,i,j) = inv(LtL(:,:,i) + LtL(:,:,j));
        end
    end
    
    for j=1:Nr
        for i=1:Nr
            prodPDFrr = struct('w',1,'mu',mu(:,j),'Sigma',LtL(:,:,i) + LtL(:,:,j));
            %Weights
            dJrrdq(j) = dJrrdq(j) + (q(i)^2)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
            %Means
            dJrrdmu(:,j) = dJrrdmu(:,j) + (q(i)^2)*LtLijinv(:,:,i,j)*(mu(:,j)-mu(:,i))*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma);
            %Covariances
            dJrrdL(:,:,j) = dJrrdL(:,:,j) + (q(i)^2)*(q(j)^2)*mvnpdf(mu(:,i)', prodPDFrr.mu', prodPDFrr.Sigma)...
                *LtLijinv(:,:,i,j)*((mu(:,i)-mu(:,j))*(mu(:,i)-mu(:,j))'...
                -(LtL(:,:,i) + LtL(:,:,j)))*LtLijinv(:,:,i,j)*L(:,:,j);
        end
        %Weights
        dJrrdq(j) = 4*q(j)*dJrrdq(j);
        %Means
        dJrrdmu(:,j) = -2*(q(j)^2)*dJrrdmu(:,j);
        %Covariances
        dJrrdL(:,:,j) = 2*dJrrdL(:,:,j);
    end
   
    %Weights
    gfq = dJrrdq - 2*dJhrdq;
    if optWeights == 1
        if norm(gfq)>0
            gfq = gfq/norm(gfq);
            q = q - sk*gfq;
        end
    end
    
    %Means
    gfmu = dJrrdmu - 2*dJhrdmu;
    if norm(gfmu)>0
        gfmu = gfmu/norm(gfmu);
        mu = mu - sk*gfmu;
    end
    
    
    %Covariances
    gfL = dJrrdL - 2*dJhrdL;
    
    for i=1:size(gfL,3)
        gfL(:,:,i) = gfL(:,:,i)./norm(gfL(:,:,i));
    end
    L = L - sk*gfL;
    
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