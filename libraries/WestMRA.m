function gmr = WestMRA(gm,Nr,cost_meas,algo,gamma)
% gmr = WestMRA(gm, Nr, cost_meas, algo, gamma):
% INPUTS:
% - gm, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture,
% - cost_meas, cost measure used to find the nearest neighbor,
% - algo, set it to 0 for West algorithm and to 1 for the Enhanced West,
% - gamma, the maximum dissimilarity threshold. If left empty or set to Inf
%   all the components will be merged according to the algorithm principle.
%   Setting it to a lower value will prevent to merge nearest neighbors
%   which are too far.
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements both the West and Enhanced West algorithms
% presented respectively in:
% - Approximating Posterior Distributions by Mixture, M. West
% - Constrained optimized weight adaption for Gaussian mixture reduction, H.Chen, K. C. Chang, C. Smith
if nargin < 3
    cost_meas = 'L2';
    algo = 0; %Classic West Algorithm
    gamma = Inf;
elseif nargin < 4 
    algo = 0;
    gamma = Inf;
elseif nargin < 5
    gamma = Inf;
end
assert(algo==0 || algo==1,'The algo parameter can take either 0 or 1 as value.');
assert(gamma>0,'gamma has to be greater than zero.');


%n = size(gm(1).mu,1);
gmr = gm;

detVec = zeros(length(gmr),1);
dist = Inf(length(gmr),1);

while length(gmr)-Nr>0
    
    for i=1:length(gmr)
        detVec(i) = det(gmr(i).Sigma);
    end
    
    w = [gmr.w]';

    if algo==1
        w = w./detVec;
    end
    
    [~,i] = min(w);
    
    for j=1:length(gmr)
        if j~=i
            dist(j) = CostMatrix(gmr(i),gmr(j),cost_meas);
        else
            dist(j) = Inf;
        end
    end
    dist_bar = dist(dist<gamma);
    if ~isempty(dist_bar)
        j = find(dist == min(dist_bar),1);
        gmr(i) = mpMerge([gmr(i);gmr(j)]);
        gmr(j) = [];
    elseif isempty(dist_bar) && length(gmr)>Nr
        disp('Reduction terminated before reaching the desired value.');
        break;
    end
    
    detVec = detVec(1:end-1);
    dist = dist(1:end-1);
    
    
end

