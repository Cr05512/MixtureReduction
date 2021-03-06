function gmr = COWA(gmh,Nr,costMeas,algo,gamma)
% gmr = COWA(gmh,Nr,costMeas,algo,gamma):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar),
% - costMeas, cost measure used to find the nearest neighbor (char array),
% - algo, set it to 0 for West algorithm and to 1 for the Enhanced West (binary variable),
% - gamma, the maximum dissimilarity threshold (scalar). If left empty or set to Inf
%   all the components will be merged according to the algorithm principle.
%   Setting it to a lower value will prevent to merge nearest neighbors
%   which are too far.
% OUTPUTS:
% - gmr, the reduced mixture according to the COWA algorithm.
% This function implements the COWA algorithm presented in
% Constrained optimized weight adaption for Gaussian mixture reduction, H.Chen, K. C. Chang, C. Smith
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
assert(~isempty(gmh),'The Gaussian Mixture has to be non-empty.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(algo==0 || algo==1,'The algo parameter can be either 0 (West) or 1 (enhanced West).');
if numel(gmh)<Nr
    gmr = gmh;
    return
end
Nh = numel(gmh);
if(Nh==Nr)
    gmr = gmh;
    return
elseif(Nr==1)
    gmr = KLDBarycenter(gmh);
    return
end


gmr = reduce('West',gmh,Nr,costMeas,algo,gamma);

gmr = refine('weightISEOpt',gmr, gmh);

end

