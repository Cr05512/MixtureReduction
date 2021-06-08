function gmr = VKLRef(gmr,gmh,maxiter)
% gmr = VKLRef(gmr,gmh,maxiter):
% INPUTS:
% - gmr, initial GM used as initialization of the algorithm,
% - gmh, reference Gaussian mixture,
% - maxiter, maximum number of allowed iterations (scalar).
% OUTPUTS:
% - gmr, the refined mixture according to the DPHEM algorithm.
% This function implements the Variational KLD Refinement algorithm presented in:
% M.A. Brubaker, A. Geiger, R. Urtasun, "Map-Based Probabilistic Visual Self-Localization"

if nargin < 3
    maxiter = 100;
end

Nh = numel(gmh);
Nr = numel(gmr);

d = size(gmh(1).mu,1);
[wh,muh,Sigmah] = paramsFromMixture(gmh);
wr = [gmr.w]';

phi = wh*wr';
psi = phi;

L = Inf; %VKL upper-bound
L_prev = L;

for k=1:maxiter
    
    %Expectation
    
    wr = sum(phi,1);
    sumPhibarows = sum(phi,1);
    for i=1:Nh
        for j=1:Nr
            psi(i,j) = wr(j)*phi(i,j)/sumPhibarows(j);
        end
    end
    C = CostMatrix(gmh,gmr,'KLDij');
    expC = exp(-C);
    for i=1:Nh
        for j=1:Nr
            phi(i,j) = wh(i)*psi(i,j)*expC(i,j);
        end
        phi(i,:) = phi(i,:)./(psi(i,:)*expC(i,:)');
    end
    
    
    
    %Maximization
    for j=1:Nr
        newMean = zeros(d,1);
        for i=1:Nh
            newMean = newMean + phi(i,j)*muh(:,i);
        end
        newMean = newMean/wr(j);
        gmr(j).mu = newMean;
        newCov = zeros(d,d);
        for i=1:Nh
            diff = muh(:,i) - newMean;
            newCov = newCov + phi(i,j)*(Sigmah(:,:,i) + diff*diff');
        end
        newCov = newCov/wr(j);
        gmr(j).Sigma = newCov;
        
    end
    
    L = VKLDUB(gmh,gmr);
    if abs(L-L_prev)<1e-15
        
        break;
    end
    
    
    L_prev = L;
    
    
end


end

