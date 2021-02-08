function gmr = West(gmh,Nr,costMeas,algo,gamma)
% gmr = West(gmh, Nr, costMeas, algo, gamma):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar),
% - costMeas, cost measure used to find the nearest neighbor (char array),
% - algo, set it to 0 for West algorithm and to 1 for the Enhanced West (binary variable),
% - gamma, the maximum dissimilarity threshold. If left empty or set to Inf
%   all the components will be merged according to the algorithm principle.
%   Setting it to a lower value will prevent to merge nearest neighbors
%   which are too far (scalar).
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements both the West and Enhanced West algorithms
% presented respectively in:
% - Approximating Posterior Distributions by Mixture, M. West
% - Constrained optimized weight adaption for Gaussian mixture reduction, H.Chen, K. C. Chang, C. Smith
if nargin < 3
    costMeas = 'L2';
    algo = 0; %Classic West Algorithm
    gamma = Inf;
elseif nargin < 4 
    algo = 0;
    gamma = Inf;
elseif nargin < 5
    gamma = Inf;
end
assert(~isempty(gmh)>0,'The Gaussian Mixture has to be non-empty.');
assert(algo==0 || algo==1,'The algo parameter can take either 0 or 1 as value.');
assert(gamma>0,'gamma has to be greater than zero.');
assert(Nr>0,'The number of reduced components has to be greater than zero.');


if numel(gmh)<Nr
    gmr = gmh;
    return
end


Nh = numel(gmh);
gmr = gmh;
if(Nh==Nr)
    return
elseif(Nr==1)
    if strcmpi(costMeas,'W2')
        gmr = WassersteinBarycenter(gmh,100);
    else
        gmr = mpMerge(gmh);
    end
    return
end


detVec = zeros(numel(gmr),1);
dist = Inf(numel(gmr),1);

while numel(gmr)-Nr>0
    
    for i=1:numel(gmr)
        detVec(i) = det(gmr(i).Sigma);
    end
    
    w = [gmr.w]';

    if algo==1
        w = w./detVec;
    end
    
    [~,i] = min(w);
    
    for j=1:numel(gmr)
        if j~=i
            dist(j) = CostMatrix(gmr(i),gmr(j),costMeas);
        else
            dist(j) = Inf;
        end
    end
    dist_bar = dist(dist<gamma);
    if ~isempty(dist_bar)
        j = find(dist == min(dist_bar),1);
        pdf_merged = mpMerge(gmr([i,j]));
        gmr(i) = pdf_merged;
        gmr(j) = [];
    elseif isempty(dist_bar) && numel(gmr)>Nr
        disp('Reduction terminated before reaching the desired value.');
        break;
    end
    
    detVec = detVec(1:end-1);
    dist = dist(1:end-1);
    
    
end

