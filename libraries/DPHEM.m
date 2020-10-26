function gmr = DPHEM(gmh,gm_init,I,numIter)
% gmr = DPHEM(gmh,gm_init,I,numIter):
% INPUTS:
% - gmh, a Gaussian mixture,
% - gm_init, initial GM used as initialization of the algorithm,
% - I, number of virtual samples,
% - numIter, maximum number of allowed iterations.
% OUTPUTS:
% - gmr, the refined mixture according to the DPHEM algorithm.
% This function implements the Density-Preserving Hierarchical Expectation
% Maximization algoirthm presented in:
% L. Yu,  T. Yang,  and A. B. Chan.  Density-preserving hierarchical EM algorithm:
% Simplifying gaussian mixture models for approximate inference.IEEE  Transactions
% on  Pattern  Analysis  and  Machine  Intelligence,  vol.41(6), 2018.
if nargin < 3
    I = length(gmh);
    numIter = 100;
elseif nargin < 4
    numIter = 100;
end
assert(~isempty(gmh) && ~isempty(gm_init),'The mixuters have to contain at least one element.');
assert(numIter>=0,'The number of iterations has to be non-negative.');
assert(I>0,'The sample number has to be greater than 0.');

gmr = gm_init;
d = size(gmh(1).mu,1);
Nh = length(gmh);
Nr = length(gmr);

E = zeros(Nh,Nr);
Z = E;

L = Inf; %Variational Lower Bound value
L_prev = L;
Sigmarinv = zeros(d,d,Nr);

for k=1:numIter
    
    %Expectation
    for j=1:Nr
        Sigmarinv(:,:,j) = inv(gmr(j).Sigma);
    end
    
    for i=1:Nh
        for j=1:Nr
            %E(i,j) = log(mvnpdf(gmh(i).mu,gmr(j).mu,gmr(j).Sigma)) - 0.5*trace(gmr(j).Sigma\gmh(i).Sigma);
            E(i,j) = -d/2*log(2*pi) - 0.5*log(det(gmr(j).Sigma)) - 0.5*(gmh(i).mu - gmr(j).mu)'*Sigmarinv(:,:,j)*(gmh(i).mu - gmr(j).mu) - 0.5*trace(gmr(j).Sigma\gmh(i).Sigma);
        end
    end
    
    %expNE = exp(I*E);

    Nk = zeros(Nh,1);
    for i=1:Nh
        %Z(i,:) = [gmr.w].*expNE(i,:);
        Z(i,:) = log([gmr.w]) + I*E(i,:);
        Nk(i) = log([gmr.w]*exp(I*E(i,:))');
       % if ~isinf(Nk(i))
            %Z(i,:) = Z(i,:)./Nk(i);
        Z(i,:) = Z(i,:) - Nk(i);
        %end
        
    end
    
    Z = exp(Z);
    L = varLowerBoundDPHEM(gmh,gmr,E,Z,I);
    if abs(L-L_prev)<1e-15
        break;
    end
    
    %Maximization
    for j=1:Nr
        gmr(j).w = Z(:,j)'*[gmh.w]';
        newMean = zeros(d,1);
        for i=1:Nh
            newMean = newMean + Z(i,j)*gmh(i).w*gmh(i).mu;
        end
        gmr(j).mu = (1/gmr(j).w)*newMean;
        newCov = zeros(d,d);
        for i=1:Nh
            newCov = newCov + Z(i,j)*gmh(i).w*(gmh(i).Sigma + (gmh(i).mu - gmr(j).mu)*(gmh(i).mu - gmr(j).mu)');
        end
        gmr(j).Sigma = (1/gmr(j).w)*newCov;
    end
    
    
    L_prev = L;
    
    
end


end

