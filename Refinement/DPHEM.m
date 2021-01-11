function gmr = DPHEM(gmr,gmh,I,numIter)
% gmr = DPHEM(gmr,gmh,I,numIter):
% INPUTS:
% - gmr, initial GM used as initialization of the algorithm,
% - gmh, reference Gaussian mixture,
% - I, number of virtual samples (scalar),
% - numIter, maximum number of allowed iterations (scalar).
% OUTPUTS:
% - gmr, the refined mixture according to the DPHEM algorithm.
% This function implements the Density-Preserving Hierarchical Expectation
% Maximization algoirthm presented in:
% L. Yu,  T. Yang,  and A. B. Chan.  Density-preserving hierarchical EM algorithm:
% Simplifying gaussian mixture models for approximate inference.IEEE  Transactions
% on  Pattern  Analysis  and  Machine  Intelligence,  vol.41(6), 2018.
if nargin < 3
    I = gmh.getSize;
    numIter = 100;
elseif nargin < 4
    numIter = 100;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixuters have to contain at least one element.');
assert(numIter>=0,'The number of iterations has to be non-negative.');
assert(I>0,'The sample number has to be greater than 0.');

d = size(gmh(1).mu,1);
Nh = numel(gmh);
Nr = numel(gmr);

wh = [gmh.w]';
muh = [gmh.mu];
Sigmah = cat(3,gmh.Sigma);

E = zeros(Nh,Nr);
Z = E;

L = Inf; %Variational Lower Bound value
L_prev = L;

for k=1:numIter
    
    %Expectation
    
    for i=1:Nh
        for j=1:Nr
            E(i,j) = funEij(gmh(i),gmr(j));
        end
    end
    
    expNE = exp(I*E);

    for i=1:Nh
        for j=1:Nr
            Z(i,j) = gmr(j).w*expNE(i,j);
        end
        Z(i,:) = Z(i,:)./sum(Z(i,:));
    end
    
    L = varLowerBoundDPHEM(gmh,gmr,E,Z,I);
    if abs(L-L_prev)<1e-15
        break;
    end
    
    %Maximization
    for j=1:Nr
        gmr(j).w =  Z(:,j)'*wh;
        newMean = zeros(d,1);
        for i=1:Nh
            newMean = newMean + Z(i,j)*wh(i)*muh(:,i);
        end
        newMean = (1/gmr(j).w)*newMean;
        gmr(j).mu = newMean;
        newCov = zeros(d,d);
        for i=1:Nh
            diff = muh(:,i) - newMean;
            newCov = newCov + Z(i,j)*wh(i)*(Sigmah(:,:,i) + diff*diff');
        end
        newCov = (1/gmr(j).w)*newCov;
        gmr(j).Sigma = newCov;
    end
    
    
    L_prev = L;
    
    
end


end

